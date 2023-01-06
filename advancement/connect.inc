<?php

//=============DB 접속 ========================
  $connect=mysql_connect( "localhost", "root", "fnxm") or  die( "  SQL server에 연결할 수 없습니다."); 
  mysql_select_db("COOLBBS",$connect);

?>


