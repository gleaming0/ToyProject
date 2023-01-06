<?php

// DB connect
/* legacy
  $connect=mysql_connect( "localhost", "root", "fnxm") or  die( "  SQL server에 연결할 수 없습니다."); 
  mysql_select_db("COOLBBS",$connect);
*/

	//mysql 접속 계정 정보 설정
	$mysql_host = 'localhost';
	$mysql_user = 'root';
	$mysql_password = '[PASSWORD]';
	$mysql_db = 'COOLBBS';

	//connetc 설정(host,user,password)
	$connect = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_db);
	if(!$connect) {
		echo "mysql connect fail!!", "<br>";
		}
	//echo "mysql connect success!!";
?>