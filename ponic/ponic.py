# !/usr/bin/env python3
# -*- coding: utf-8 -*-

from datetime import datetime
import queue
import threading
import socket
import os
import time


class PortAttack:
  def __init__(self):
    self.target = "192.168.0.34"
    self.target_ports = []

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


  def ftpAttack():
    pass

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
  

if __name__ == "__main__":
  main()