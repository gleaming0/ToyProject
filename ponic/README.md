# PONIC
특정 타겟의 서버에 접근하여 여러 정보를 수집하는 스크립트를 작성하였다.
* Scan open ports
* FTP password cracking
* Print files and directories
* File upload and download
* SSH password cracking
* Code Injection


## Input Target Information
정보수집에 앞서 타겟 서버의 기본 정보 입력
![target info](https://user-images.githubusercontent.com/76648555/219275197-bd00ec46-cf65-4e4f-9f25-cf571e62bc9c.png)


## 🔎 Scan Open Ports
ping을 한 뒤, 열려있는 well-known port 스캔
![scan ports](https://user-images.githubusercontent.com/76648555/219275458-7b806b44-bb9b-49c7-b82e-41d8c5c5ca6a.png)


## 🔑 Crack ftp password
사전 대입 공격으로 특정 ftp 계정의 비밀번호 크래킹
![crack ftp](https://user-images.githubusercontent.com/76648555/219276111-e2ff5abf-e023-43ba-9ec1-bf3187e0e420.png)


## 🗃 Print files and directories
지정한 경로의 파일 및 디렉터리 확인
![ls](https://user-images.githubusercontent.com/76648555/219276217-e345836e-90e9-427e-abde-b55af3c167ba.png)


## 📤 File upload and download
지정한 경로에 특정 파일 파일 업로드 및 다운로드
![upload](https://user-images.githubusercontent.com/76648555/219276317-741b7855-1309-4f3c-86f3-9f9abee6701a.png)
<br>파일 업로드 실행 결과
![실행결과2](https://user-images.githubusercontent.com/76648555/219277143-912030f7-21c1-40b3-93bf-8c2341050274.png)


## 🔐 Crack ssh password
사전 대입 공격으로 특정 ssh 계정의 비밀번호 크래킹
![crack ssh](https://user-images.githubusercontent.com/76648555/219276489-9740d287-e502-4d9e-8ffd-904fb1aa375f.png)


## 👩🏻‍💻 Code Injection
획득한 ssh 유저 정보로 code injection 수행
![code injection](https://user-images.githubusercontent.com/76648555/219276667-e5bdede0-bb41-46b3-89ef-e9ead3330f33.png)
