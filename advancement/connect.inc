<?php

// DB connect
/* legacy
  $connect=mysql_connect( "localhost", "root", "fnxm") or  die( "  SQL server�� ������ �� �����ϴ�."); 
  mysql_select_db("COOLBBS",$connect);
*/

	//mysql ���� ���� ���� ����
	$mysql_host = 'localhost';
	$mysql_user = 'root';
	$mysql_password = '[PASSWORD]';
	$mysql_db = 'COOLBBS';

	//connetc ����(host,user,password)
	$connect = mysqli_connect($mysql_host, $mysql_user, $mysql_password, $mysql_db);
	if(!$connect) {
		echo "mysql connect fail!!", "<br>";
		}
	//echo "mysql connect success!!";
?>