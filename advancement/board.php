<?php
	include "./connect.inc" ;
	$code = $_GET['code']; //test
	//echo $code."<br>";
	//echo "<br>test.php<br>";

	$mode = $_POST['mode'];
	$field = $_POST['field'];



	//  존재하는 게시판인가?
	//echo "<br>que2<br>";
	$que2 = "select code from bbs_info where code='$code'";
	$result2 = mysqli_query($connect, $que2);
	$bbs_ok = mysqli_fetch_assoc($result2);
	//echo "bbs_ok is ".$bbs_ok["code"]."<br>";


	//=============  BBS 정보를 가져온다 =================

	$que_bbs = "select * from bbs_info where code='$code'" ;
	$result = mysqli_query($connect, $que_bbs);
	$bbs = mysqli_fetch_assoc($result);
	//echo "bbs is ".$bbs["code"]."<br>";

	if($bbs["use_auth"] && !isset($PHP_AUTH_USER)) // 유저인증을 사용하는 BBS 며 인증이 안된 경우
	{ 
		echo("  <meta http-equiv='Refresh' content='0; URL=./auboard.html?code=$code'>  ");
		exit;
	}

	$bbs["head"] = stripslashes($bbs["head"]);
	$bbs["foot"] = stripslashes($bbs["foot"]);
	echo("{$bbs["head"]} <br>"); // 끝에 <center>

	$scale = $bbs["scale"]; // 1페이지당 자료수
	$page_scale = $bbs["page_scale"]; // 1화면당 페이지수

	if(!$start){ $start = 0; }

	$page = floor($start/($scale*$page_scale));


	//==============오늘의 게시물 ==============

	$que2 = "select count(id) from $code where DATE_FORMAT(reg_date,'%Y-%m-%d')=curdate()" ;
	$result2 = mysqli_query($connect, $que2);

	$today_no = mysqli_fetch_assoc($result2);
	$today_no = $today_no["count(id)"];
	//echo "today_no is ".$today_no["count(id)"]."<br>"; // 오늘 업로드 된 게시물 수


	//==============전체 게시물 ==============
	// 뭔지 모르겠는 $s_que

	if($mode=='search')  //검색모드
	{
		if($field=='count')  //카운터 검색 모드
		{
			$que1 = "select id, title, name, DATE_FORMAT(reg_date,'%Y.%m.%d'), (UNIX_TIMESTAMP(now())-UNIX_TIMESTAMP(reg_date))/3600, count, mail, depth, user_file from $code where $field >= $s_que order by pos ";
		}
		else
		{
			$que1 = "select id, replace(title, '$s_que', '<b><FONT SIZE=2 COLOR=#F7E671>$s_que</FONT></b>') as title, name, DATE_FORMAT(reg_date, '%Y.%m.%d'), (UNIX_TIMESTAMP(now())-UNIX_TIMESTAMP(reg_date))/3600, count, mail, depth, user_file from $code where $field like '%$s_que%' order by pos "; 
		}
	}
	else
	{
		$que1 = "select id, title, name, DATE_FORMAT(reg_date,'%Y.%m.%d'), (UNIX_TIMESTAMP(now())-UNIX_TIMESTAMP(reg_date))/3600, count, mail, depth, user_file from $code order by pos " ;
	}

	$result = mysqli_query($connect, $que1);
	$total = mysqli_affected_rows($connect);
	$last=floor($total/$scale);  // 화면하단 [1] [2] ..  마지막번호


	//============= 게시물 목록 테이블  머리글 표시 ======================

	echo(" 
	<TABLE border='0' cellpadding='2' cellspacing='1' width=90%>
	<tr>
	<td>");

	echo("&nbsp;</td>
	<td colspan=2 align=center></td> <td colspan=2 align=right><font size=-1> ");

	if($mode=='search')
	{ echo(" 검색결과 : $total 건 "); }
	else
	{ echo("오늘 <b>$today_no</b> / 전체 $total"); }

	echo("</font> </td></tr>

	<TR bgcolor='#5485B6'>
	<TD width='39' ><P align='center'><FONT face='굴림' size='2'    color='#DCE8F3'>No</FONT></TD>
	<TD width='408'><P align='center'><FONT face='굴림' size='2' color='#DCE8F3'>TITLE</FONT></TD>
	<TD width='46' ><P align='center'><FONT face='굴림'   size='2' color='#DCE8F3'>Count</FONT></TD>
	<TD width='74' ><P align='center'><FONT face='굴림' size='2' color='#DCE8F3'>Date</FONT></TD>
	<TD width='76' ><P align='center'><FONT face='굴림' size='2' color='#DCE8F3'>Name</FONT></TD>
	</TR>
	");

	if($start)
	{ $n = $total-$start; }
	else
	{ $n = $total; }

	for($i=$start; $i<$start+$scale; $i++)  //  start 에서 scale 까지 만
	{
		if($i<$total) // 전체 자료 개수까지만 출력 
		{ 
			mysqli_data_seek($result, $i);
			$row = mysqli_fetch_array($result);
			//echo "i is ".$i."<br>";
			echo("
	<TR>
	<TD height='20'><P align='center'><FONT size='2' color='#C6DCF2'>".$n."</FONT></TD>
	<TD align='left' height='20'><P>");
			$n--;
		}
		else
		{
			echo "else !<br>";
		}


		// ======= 화일 표시 =======================================================

		if($row["user_file"])
		{ echo("<img src='./img/s_file.gif' border=0>"); }
		else
		{ echo("<img src='./img/blank.gif' width=5 height=5 border=0>"); }


		// ---------  응답의 인덴트 -----------------
		if($row["depth"]>1)
		{
			for($j=2; $j<$row["depth"]; $j++)
			{ echo("&nbsp; &nbsp;"); }
			
			echo("<img src='./img/re.gif'  border=0>");
		}


		// ------------------------------------------
		$row = mysqli_fetch_array($result);
		$title_sta = htmlspecialchars($row["title"]);
		//$title_sta = preg_replace("\'", "＇", $title_sta);
		//echo "title_sta1 ".$title_sta."<br>";


		//echo ("title is".$row['title']);
		//echo("<a href=\"./view.html?id=$row['id']&code=$code&start=$start\">$row['title'] </a>");

		echo("<a href=\"./view.html?id=".$row['id']."&code=$code&start=$start\"><FONT size='2' color='#E3F9F8'>".$row['title']."</a>");

		//echo("<A href=\"./view.html?id=$row['id']&code=$code&start=$start\" ><FONT size='2' color='#E3F9F8'>$row['title']");



		// ======  NEW, COOL  마크 첨가 ============

		if($bbs["use_new"] && ($row[4] <= $bbs["new_time"]) ) 
		{ echo("<img src='./img/new_tip.gif' HEIGHT=13 WIDTH=27  VSPACE=0 HSPACE=0  BORDER=0>"); }

		if($bbs["use_cool"] && ($row["count"] >= $bbs["no_cool"])) 
		{ echo("<img src='./img/cool.gif'  border=0>"); }


		// ------------------------------------------
		
		// $row[3] : date
		echo("</FONT></A></TD>
			<TD align='center'><P><FONT size='2' >".$row["count"]."</FONT></TD>
			<TD align='center'><P><FONT size='2'>".$row[3]."</FONT></TD>
			<TD align='center'><P><FONT size='2'>".$row["name"]."</FONT></TD>");
	}
	echo("</TABLE>");


	//  검색 결과가 페이지 당 출력수 보다 크면 
	if($total > $scale)
	{ 

		if($start+1 > $scale*$page_scale)
		{ $pre_start = $start-$scale ;
			echo("<a href='".$PHP_SELF."?start=".$pre_start."&code=".$code."&mode=".$mode."&field=".$field."&s_que=".$s_que."'>◀</a>");
		}

    for($vj=0; $vj<$page_scale; $vj++)
    {
			$ln = ($page * $page_scale + $vj)*$scale;
			$vk = $page * $page_scale + $vj+1;

			if($ln<$total)
			{
				if($ln!=$start)
				{
					echo("<a href='".$PHP_SELF."?start=".$ln."&mode=".$mode."&field=".$field."&s_que=".$s_que."&code=".$code."'><font size=2 color=#DCF2FA>[".$vk."]</a></font>");
				}
				else
				{ 
					echo("<font size=2 color=#FDFFEE>&nbsp;<b>".$vk."</b>&nbsp;</font>");
				}
			}
		}
      
		if($total > (($page+1)*$scale*$page_scale) )
		{ $n_start=($page+1)*$scale*$page_scale ;
			echo("<a href='".$PHP_SELF."?start=".$n_start."&code=".$code."&mode=".$mode."&field=".$field."&s_que=".$s_que."'>▶</a>");
		}
	}


	echo("<br>
<table border=0 wifth=80%>
<tr valign=center>
<td align=center VALIGN=middle >    
<form action='$PHP_SELF' method=post>
<input type=hidden name=mode value=search>
<input type=hidden name=code value=$code>

<select name=field>
      <option value=body>내 용</option>   
      <option value=title>제 목</option>   
      <option value=name>글쓴이</option>   
      <option value=count>조회수</option>   
    </select>

<font size=2>검색어</font><input type=text size=10 name=s_que>
<input type=image src='./img/search.gif' border=0 ALIGN=absmiddle>
</td>
</tr>
</form>
</table>");
	
?>
