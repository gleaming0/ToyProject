Loveme's COOL BBS 기능안내 및 INSTALL 가이드 



웹 서핑을 한다 보면 어떤 사이트를 가던지 빠지지 않고 등장하는 것 중의 하나가 바로 게시판일 것이다. 인터넷에서 여러 종류 공개형 게
시판을 구할 수도 있고 상용 게시판도 있겠지만 이제부터 여러분의 사이트에 직접 사용할 수 있는 막강한 성능의 응답형 게시판을 살펴보
자. 아래 우리가 만들 게시판의 모습이 있다. 정식 명칭은 아니지만 이름하여 COOL BBS 이다. 

[그림] 필자의 홈페이지에서 사용중인 게시판 10-4-0.gif 


1) COOL BBS 의 특징 
WEB 상에서 게시판의 실시간 관리 : 관리 툴을 제공하므로, WEB 상에서 모든 게시판의 실시간 생성, 수정, 삭제가 가능하다. 
MySQL 과 연동된 뛰어난 성능 : 기존의 게시판이 단순 게시물을 단순 텍스트 파일로 저장, 수천 건 이상의 게시물에서 상당한 속도저하와 
파일 입출력 부하가 걸리는 단점을 개선, SQL 서버와 연동되어 수천만 건 이상의 게시물도 등록가능하며 입출력 속도저하가 거의 없다. 
2단계 관리자 구조 : 게시판 관리에 대한 권한이 2단계로 구분되어 있다. 가장 큰 권한을 가진 수퍼어드민은 모든 게시판의 생성, 설정변경, 
삭제가 가능하며 각 게시판의 관리자는 자신의 게시판만 관리할 수 있으며 각 게시판 관리자는 파일 첨부기능을 제외한 모든 기능을 관리 
툴에서 설정할 수 있다. 
게시물 삭제 : 각 게시판의 관리자는 관리자 암호로 모든 게시물의 삭제가 가능하다. 
파일 업로드 지원 : 파일 업로드 기능을 지원, 자료실로 사용 가능하다. 
응답형 게시판 : 질문에 대한 답변이 해당 게시물의 바로 아래에 올라가는 응답형 게시판이다. 응답형 게시판의 원리에 대해서는 뒤에서 
자세히 소개한다. 한건의 게시물 당 최대 1024 건의 응답글을 올릴 수 있다. 
cool 마크 : 특정 조회 수 이상 게시물에 cool 마크를 표시한다. 
new 마크 : 특정 시간 이내에 등록된 게시물에 new 마크를 표시한다. 
원문인용 기능 : 응답글 작성시 원문의 선택적 인용이 가능하다. 
HTML TAG 지원 : 게시물의 제목, 본문에 HTML TAG를 지원한다. 
게시물에 암호부여 : 게시물 작성시 반드시 암호를 입력하도록 요구한다.(삭제, 수정 시 필요) 
응답글 표시 : 게시물 내용보기 화면에서 관련 응답글을 모두 보여준다. 
게시물 검색 : 글쓴이, 제목, 내용, 조회수로 게시물 검색이 가능하다. 
머릿글, 꼬리글 지원 : 게시판의 머릿글과 꼬리글을 시용자가 마음대로 정할 수 있다. HTML 을 이용 원하는 모양의 게시판을 만들수 있다. 
게시물 알림 : 새로운 게시물이 등록된 경우 관리자에게 그 내용을 메일로 알려준다. 
페쇄그룹용으로 사용가능 : 사용자 인증기능을 이용 특정 사용자만이 이용가능하도록 폐쇄 그룹용 게시판을 만들 수 있다. 

2) 테이블 구조 
복수 게시판을 지원하기 위해 2종류의 테이블이 사용된다. 즉 모든 게시판의 정보를 가지고 있는 bbs_info 라는 이름의 테이블과 실제 게시
물이 저장되는 테이블이다. 나머지 하나의 테이블의 전체 게시판을 관리할 수퍼어드민용 암호를 저장할 테이블이다. 
bbs_info : 게시판 정보 테이블. 모든 게시판의 정보를 저장한다. 

이름
컬럼명
자료형
비고
게시판 코드
code
varchar(10)
NOT NULL 
PRIMARY KEY
게시판 이름
name
varchar(20)

타이틀
title 
varchar(100)

머리글
head 
text 

꼬리글
foot 
text 

파일업로드 가능
use_file 
char(1) 

페이지당 게시물수
scale 
smallint(6) 

페이지 링크 수
page_scale 
smallint(6) 

new 마크 사용
use_new 
char(1) 

new 마크 표시시간
new_time 
smallint(6) 

cool 마크 사용
use_cool 
char(1) 

cool 마크 표시 횟수
no_cool 
smallint(6) 

관리자 아이디
admin_id 
varchar(10) 

관리자 패스워드
admin_pw 
varchar(8) 

메일알림 기능 사용
mail_notice 
char(1) 

관리자 이메일 주소
admin_mail 
varchar(40) 

등록일
reg_date 
datetime 

인증 사용
use_auth 
char(1) 

인증용 아이디
auth_id 
varchar(10) 

인증용 패스워드 
auth_pw 
varchar(8) 



게시판 코드 : 각 게시판을 구분하는 고유한 코드이며 영문,숫자 10자 이내로 반드시 영문으로 시작해야 한다. 브라우저에서 다음과 같이 
사용된다 
http://203.226.100.23/bbs/board.html?code=news 
http://203.226.100.23/bbs/board.html?code=customer 
게시판 이름 : 관리 툴에서 사용되는 게시판 이름 
타이틀 : 게시판의 메인 화면에서 게시물 목록 바로 위에 나타나는 내용 
File업로드 : 파일첨부기능 설정, 수퍼어드민이 변경 가능하다. 이 기능을 체크하면 게시판 code 와 같은 이름의 디렉토리가 생성되고 이곳
에 첨부파일이 저장된다. 게시판 삭제 시 게시판 코드와 같은 이름의 디렉토리까지 삭제된다. 
줄수/화면 : 한 화면에 출력되는 게시물 수 
Page/화면 : 게시물 목록 하단에 나타나는 페이지 표시 수. 
10일 경우: [1][2]…..[9][10] 
New 사용 / New 시간 : 게시된 후 설정 시간이 지나지 않은 게시물에 ‘New’ 표시를 한다 
Cool 사용 / Cool 표시 : 조회수가 설정된 숫자 보다 크면 게시물에 ‘Cool ’ 표시를 한다 
새글 알림 : 새로운 게시물이 올라오면 정해진 이메일로 제목,내용,글쓴이를 알려준다. 
Admin ID /Admin 암호 : 각 게시판 관리자의 아이디,암호. 이곳에 사용된 암호로 게시물이 삭제될 수 있다. 삭제 시 게시물에 포함된 암호
와 관리자 암호 중 하나라도 맞으면 삭제된다. 
Header / Footer : 게시물 목록을 제외한 글머리, 글꼬리를 HTML TAG를 써서 나타낼 수 있다. 

특히 Header / Footer 부분을 잘 활용하면 다음괴 같이 여러가지 모양의 게시판을 만들 수 있다. 
[그림] 머리글 / 꼬리글을 이용한 여러 모양의 게시판 01-4-01~-10-4-.04.gif 


테이블 생성 SQL 
CREATE TABLE bbs_info ( 
code varchar(10) DEFAULT '' NOT NULL, 
name varchar(20), 
title varchar(100), 
head text, 
foot text, 
use_file char(1), 
scale smallint(6), 
page_scale smallint(6), 
use_new char(1), 
new_time smallint(6), 
use_cool char(1), 
no_cool smallint(6), 
admin_id varchar(10), 
admin_pw varchar(8), 
mail_notice char(1), 
admin_mail varchar(40), 
reg_date datetime, 
use_auth char(1), 
auth_id varchar(10), 
auth_pw varchar(8), 
PRIMARY KEY (code) 
); 

$code 게시판 테이블 
실제 게시물들을 저장하는 테이블로 이름은 사용자가 등록하는 게시판 코드를 따라 만들어진다. 

이름
컬럼명
자료형
비고
게시판 코드
code
varchar(10)
NOT NULL 
PRIMARY KEY
게시물 고유번호
id 
int(11) 
NOT NULL 
PRIMARY KEY 
AUTO_INCREMENT
글쓴이
name 
varchar(30) 

이메일
mail 
varchar(40) 

홈페이지
home 
varchar(40) 

제목 
title 
varchar(80) 

내용
body 
text 

등록일
reg_date 
datetime 

조회수
count 
int(11) 

쓰레드
thread 
int(11) 

응답깊이
depth 
smallint(6) 

게시물 위치
pos 
int(11) 

암호
passwd 
varchar(8) 

첨부파일
user_file 
varchar(50) 

글쓴이 IP주소
user_ip 
varchar(20) 



특별한 부분은 응답글 처리를 위한 3가지 값 쓰레드 , 응답깊이 , 게시물 위치 등인데 
이값을 이용한 응답형 게시판의 구현 원리는 뒷분에서 자세히 설명한다. 실제 테이블의 생성은 관리도구에 의해 이루어진다. 
테이블 생성 SQL 
create table $code( 
id int auto_increment primary key, 
name char(30), 
mail varchar(40), 
home varchar(40), 
title varchar(80), 
body text, 
reg_date datetime, 
count int, 
thread int, 
depth smallint, 
pos int, 
passwd char(8), 
user_file varchar(50), 
user_ip char(20) 
) 

passwd 수퍼어드민용 암호 테이블 
전체 게시판의 통합적으로 관리하는 관리자 일명 수퍼어드민의 인증을 위한 암호를 저장하는 부분이다. 각각의 게시판에 대한 관리자 아이
디 및 암호는 게시판 정보 테이블에 저장되는 것돠는 달리 전체 게시판 관리 권한을 가진 관리자는 따로 테이블을 만들어 인증을 거치게 
된다. 이부분의 앞의 설문조사의 관리자 인증 부분과 같다. 

이름
컬럼명
자료형
비고
코드
code 
char(8)
NOT NULL 
PRIMARY KEY
아이디
id 
char(10)

암호
passwd
char(10)




테이블 생성 SQL 
CREATE TABLE passwd ( 
code char(8) DEFAULT '' NOT NULL, 
id char(10), 
passwd char(10), 
PRIMARY KEY (code) 
); 
관리자 정보 입력 
INSERT INTO passwd VALUES ('root','admin','1111'); 
코드는 같은 데이터 베이스 내의 다른 프로그램에서도 관리자 인증을 할 수 있도록 하기 위해 미리 만들어 두었다. 게시판의 관리자를 위
한 코드는 root 로 정해져 있다. 
따라서 관리자 인증을 위한 인증창이 실행하는 SQL은 다음과 같이 될 것이다. 
select * from passwd 
where userid='$PHP_AUTH_USER' 
and passwd='$PHP_AUTH_PW' 
and code='root' 
$PHP_AUTH_USER 와 $PHP_AUTH_PW 는 사용자가 인증창에 입력한 아이디와 패스워드이다. 

3) 설치 및 테이블 생성 
자세한 소스를 분석해 보기 전에 일단 게시판을 설치 해 보자. 
테이블 생성 
먼저 게시판이 사용할 데이터 베이스를 생성한다. 데이터 베이스의 이름은 COOLBBS로 하겠다. 
[root@linuxer /root]# cd /usr/local/mysql/ 
[root@linuxer mysql]# ./bin/mysqladmin -uroot -p create COOLBBS 
Enter password: 
Database "COOLBBS" created. 
다음은 웹에서 접속에 사용할 MySQL사용자 wwwuser 에게 COOLBBS 데이터 베이스에 대한 모든 권한을 준다 등록시칸다. wwwuser 라
는 사용자는 앞부분의 검색엔진에서 등록한 사용자 이며 만일 등록되어 있지 않다면 앞서나온 검색엔진의 사용자등록 부분을 참고해서 
wwwuser 를 등록하도록 한다. 여기서는 이미 wwwuser 가 등록되어 있다는 가정하에 wwwuser 에게 COOLBBS 의 모든권한을 주는 부분을 
예로 들겠다. 
[root@linuxer mysql]# ./bin/mysql -uroot -p mysql 
Enter password: 
Reading table information for completion of table and column names 
You can turn off this feature to get a quicker startup with -A 
Welcome to the MySQL monitor. Commands end with ; or \g. 
Your MySQL connection id is 121251 to server version: 3.22.23b 
Type 'help' for help. 
mysql> insert into db values('localhost','COOLBBS','wwwuser','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'); 
Query OK, 1 row affected (0.02 sec) 
mysql> FLUSH PRIVILEGES ; 
Query OK, 0 rows affected (0.03 sec) 
mysql>\q 
이제 테이블을 생성할 차례다. 두 가지 방법이 있는데 다음과 같이 스크립트를 이용하는 방법이다. 소스와 함께 포함된 COOLBBS.sql 을 
적당한 디렉토리에 복사해 놓고 다음과 같이 실행하면 된다. 실행 전에 스크립트를 열어 수퍼어드민용 암호를 변경하기 바란다. 
[root@linuxer mysql]# ./bin/mysql -uwwwuser -pwwwuser COOLBBS < /tmp/COOLBBS.sql 
아니면 다음과 같이 직접 만들 수도 있다. 
[root@linuxer mysql]# ./bin/mysql -uwwwuser -pwwwuser COOLBBS 
Welcome to the MySQL monitor. Commands end with ; or \g. 
Your MySQL connection id is 121265 to server version: 3.22.23b 
Type 'help' for help. 
mysql> CREATE TABLE passwd ( 
-> code char(8) DEFAULT '' NOT NULL, 
-> userid char(10), 
-> passwd char(10), 
-> PRIMARY KEY (code) 
-> ); 
Query OK, 0 rows affected (0.00 sec) 
mysql> INSERT INTO passwd VALUES ('root','admin','1111'); 
Query OK, 1 row affected (0.01 sec) 
mysql> CREATE TABLE bbs_info ( 
-> code varchar(10) DEFAULT '' NOT NULL, 
-> name varchar(20), 
-> title varchar(100), 
-> head text, 
-> foot text, 
-> use_file char(1), 
-> scale smallint(6), 
-> page_scale smallint(6), 
-> use_new char(1), 
-> new_time smallint(6), 
-> use_cool char(1), 
-> no_cool smallint(6), 
-> admin_id varchar(10), 
-> admin_pw varchar(8), 
-> mail_notice char(1), 
-> admin_mail varchar(40), 
-> reg_date datetime, 
-> use_auth char(1), 
-> auth_id varchar(10), 
-> auth_pw varchar(8), 
-> PRIMARY KEY (code) 
-> ); 
Query OK, 0 rows affected (0.00 sec) 
mysql> 
mysql> \q 
Bye 
이제 CD-ROM/source/bbs 에 있는 소스를 /usr/local/apache/htdocs/bbs 등과 같이 적당한 디렉토리에 복사한다. 이로서 설치는 모두 끝났다. 
4) 게시판 관리 도구 맛보기 
이제 화면과 설명을 통해 COOLBBS를 간단히 살펴보도록 하자 
아직까지 등록된 게시판이 없을 테니 새로 하나 만들어 보자 . 게시판을 설치한 디렉토리가 
/usr/local/apache/htdocs/COOLBBS 라면 게시판 관리도구의 URL 은 
http://www.yourserver.com/COOLBBS/admin/ 이 된다. 
먼저 다음과 같은 인증 창이 뜰것이다. 
[그림] 수퍼어드민 인증창 10-4-30.gif 
10-4-30.gif 
앞서 수퍼어드민용으로 입력한 아이디와 암호를 입력한다. COOLBBS.sql 스크립트를 그대로 이용했다면 admin / 1111 이다. 
로그인에 성공했다면 아직까지 등록된 게시판이 없으므로 다음과 같은 썰렁한 관리자 화면이 뜰 것이다. 
잠깐! 
참고로 DB접속이 제대로 되지 않을 경우나 로그인에 실패한다면 
다음의 페이지에서 MySQL 접속 스크립트를 확인해 보도록 한다. 
auth.inc 
connect.inc 
admin/index.html 
[그림] 처음 들어온 관리자 화면 10-4-31.gif 

비록 좀 썰렁해도 실망하지 말고 필자가 사용하는 관리자 화면을 한번 참고 삼아 보기 바란다. 현재 필자의 홈페이지 phpschoool.com 에서
는 6개의 게시판을 이용하고 있다 
[그림] 필자의 게시판 관리 화면 10-4-32.gif 

또 다른 게시판 관리 화면을 보자. 필자가 근무하는 회사에서 전사원의 홈페이지를 올리도록 만든 서버로 펜티엄 166MHz 의 PC 서버를 사
용중임에도 불구하고 잘 돌고 있다. 좀 구 버전의 관리화면이라 세련되지 못한 느낌이 나지만 기능은 거의 같다. 오른쪽 위에 BBS : 299 개 
가 보일 것이다. 성능만큼은 정말 믿어 의심치 않는다. 
[그림] 의 게시판 관리화면 10-4-33.gif 


이제 새로운 게시판을 등록해 보자 
아래쪽의 두개 아이콘 중 별(*) 표시가 붙은 폴더모양이 게시판을 만드는 기능을 한다. 
다음과 같은 화면이 나올 것이다. 
[그림] 새로운 게시판의 등록 10-4-34.gif 

========= 
잠깐!MkDIR failed (Permission denied …) 오류 
옵션 중에 File 업로드 옵션을 선택한 경우 
Warning : MkDIR failed (Permission denied …) 과 같은 오류가 발생 할 수 있다. 
이것은 아파치 데몬이 게시판이 설치된 디렉토리에 게시판의 파일업로드를 위해 코드와 같은 이름의 디렉토리를 생성하지 못해 발생한
다. 
따라서 게시판이 설치된 디렉토리에 쓰기 권한을 아파치 데몬에게 주어야만 한다. 
만일 아파치가 nobody로 실행 중이고 게시판이 /usr/local/apache/htdocs/COOLBBS 에 설치되었다면 다음처럼 소유권을 바꿔주면 된다. 
#chown nobody /usr/local/apache/htdocs/COOLBBS 
========== 
게시판이 성공적으로 되었다면 다시 게시판 목록 화면으로 돌아간다. 
[그림] 새로이 등록된 게시판 10-4-35.gif 

방금등록한 게시판의 URL은 다음과 같다. 
즉 각각의 게시판은 code 를 이용해 구분하게 된다. BBS 이름인 ‘test 게시판’을 클릭해 해당 게시판으로 이동해 보자. 
[그림 ]test 게시판의 화면 10-4-36.gif 
제목을 선택하면 내용을 볼 수 있을 것이다. 
[그림] 내용보기 화면 10-4-37.gif 

아래쪽의 화살표가 그려진 응답글 쓰기 아이콘을 이용해 응답글을 쓰는 테스트를 해보기 바란다. 모든 것이 제대로 작동한다면 다시 관리 
페이지로 돌아온다 이제 테스트 게시판을 삭제 해 보자. 게시판의 코드를 클릭하면 다음의 화면이 나 올 것이다. 
[그림] 게시판 정보보기 10-4-48.gif 

아래쪽의 X 표시가 있는 폴더모양의 아이콘을 누르면 다음과 같은 확인창이 나온다. 
확인을 선택하면 게시판 삭제되고 같은 이름의 디렉토리 역시 모두 지원진다. 
[그림] 게시판의 삭제 확인 10-4-39.gif 

이상으로 간단히 관리도구의 사용법을 살펴 보았다. 게시판의 사용법은 자세히 설명하지 않아도 잘 알 것이므로 생략하겠다. 