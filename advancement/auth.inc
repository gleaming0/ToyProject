<?php
    cfunction authenticate() {
      Header("WWW-authenticate: basic realm=\"BBS ADMIN영역\" ");
      Header("HTTP/1.0 401 Unauthorized");
        $title="Invalid Login";
       ?>
        이곳에 들어오려면 아이디와 암호가 필요합니다!
        <?php
        exit;
    }

    if(!isset($PHP_AUTH_USER)) {
        authenticate();
    } else {
        mysql_pconnect('localhost','root','fnxm') 
            or die("Unable to connect to SQL server");
        mysql_select_db("COOLBBS") or die("Unable to select database");
        $id=$PHP_AUTH_USER;
        $query = mysql_query("select * from passwd where userid='$id' and passwd='$PHP_AUTH_PW' and  bbsid='admin'");
        if(!mysql_num_rows($query))
           { 
            authenticate();
           }
        }
?>
