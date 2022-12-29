# MYSHELL
File Upload 공격 등으로 타겟의 서버에 악성 스크립트 파일을 업로드하면, 해당 스크립트를 통해 시스템 내부명령어를 실행하거나 데이터를 탈취할 수 있다. 이 프로젝트는 **웹쉘 파일에 다양한 기능을 추가하여 홈페이지 상에서 시스템의 정보를 편리하게 수집**하려 하였다.


## 🙋🏻‍♀️ Login / Logout
설정된 비밀번호를 입력해야 웹쉘 사용 가능
![login](https://user-images.githubusercontent.com/76648555/209911922-16540d3a-fccc-4653-8562-2facccb42522.png)


## 🔎 File Browser
원하는 경로에 존재하는 파일 및 디렉토리 확인 (수정 중)
![file_browser](https://user-images.githubusercontent.com/76648555/209912034-4f183514-8f51-45b4-9a44-6aa1290a1cbc.png)


## 📤 File Upload
원하는 경로에 파일 업로드
![file_upload](https://user-images.githubusercontent.com/76648555/209912372-4d5408f0-731a-4d12-be10-972b5c324cc3.png)
![file_upload_success](https://user-images.githubusercontent.com/76648555/209912381-ac004489-fae2-46c1-b11a-34639592a2c8.png)


## 👩🏻‍💻 Command Injection
타겟의 서버에 Code Injection 수행
![command_execution](https://user-images.githubusercontent.com/76648555/209912481-bb471fa6-9a98-4985-99f3-18a6fa014ca4.png)


## 🗃 DB Connector
타겟 서버의 DB에 연결 후 SQL 쿼리문 수행
![db_connector](https://user-images.githubusercontent.com/76648555/209913599-2b528d81-b8ac-4d95-9b68-ac151cda4469.png)
![db_connector_success](https://user-images.githubusercontent.com/76648555/209913606-fd3c3872-6498-4993-831d-baf44d67000b.png)
