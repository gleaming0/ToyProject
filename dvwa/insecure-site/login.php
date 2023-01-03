<?php
	// Default values
	$total_failed_login = 3;
	$lockout_time       = 1;
	$account_locked     = false;

  $db_conn = mysql_conn();
  
  if(!empty($_SESSION["id"])) {
    echo "<script>alert('ID를 입력해주세요.');location.href='index.php';</script>";
    exit();
  }

  $id = $_POST["id"];
  $password = $_POST["password"];
  
  if(!empty($id) && !empty($password)) {
		$query = "select last_login, failed_login from members where id='{$id}';";
    $result = $db_conn->query($query);
    $row = $result->fetch_assoc();
    $num = $result->num_rows;

		// lock 여부 확인
		// 계정이 있고, failed_login이 3 이상이면 LOCK !!
		if( ( $num != 0 ) && ( $row[ 'failed_login' ] >= $total_failed_login ) )  {
			$last_login = strtotime( $row[ 'last_login' ] );
			$timeout    = $last_login + ($lockout_time * 60);
			$timenow    = time();

			// 여전히 1분이 지나지 않았으면 lock !
			if( $timenow < $timeout ) {
				$account_locked = true;
			}
		}

		// Database 확인 (id-password 일치 여부)
    $password = md5($password);
    $query = "select * from members where id='{$id}' and password='{$password}'";
    $result = $db_conn->query($query);
    $num = $result->num_rows;

		// 로그인 성공
		// 계정 정보가 일치하고 lock이 걸려있지 않다면
    if( ( $num != 0 ) && ( $account_locked == false )) {
      $row = $result->fetch_assoc();
      $_SESSION["id"] = $row["id"];
      $_SESSION["name"] = $row["name"];

			// failed_login=0 초기화
			$query ="UPDATE members SET failed_login = 0 WHERE id='{$id}';";
			$result = $db_conn->query($query);

      echo "<script>alert('로그인 되었습니다.');location.href='index.php';</script>";
    }
		// 계정 정보가 틀렸지만 lock이 걸려있지 않다면
		else if ($account_locked == false) {
			sleep( rand( 0, 3 ) ); // rand 함수 추가!
			$query ="UPDATE members SET failed_login = (failed_login + 1) WHERE id='{$id}';";
			$result = $db_conn->query($query);
		
			echo "<script>alert('아이디 혹은 패스워드가 틀렸습니다.');location.href='index.php?page=login';</script>";
			exit();
		}
		// lock이 걸려있다면
		else if($account_locked == true){
			$query ="UPDATE members SET failed_login = (failed_login + 1) WHERE id='{$id}';";
			$result = $db_conn->query($query);
			echo "<script>alert('3회 이상 로그인 실패로 1분간 로그인이 제한됩니다.');location.href='index.php?page=login';</script>";
			exit();
		}

		// Set the last login time
		$query = "UPDATE members SET last_login = now() WHERE user = {$id} LIMIT 1;";
		$result = $db_conn->query($query);
	}
?>
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
		<h1 class="display-4">Login Page</h1>
    	<hr>
    </div>

      <div class="row">
        <div class="col-md">
          <form class="needs-validation" action="index.php?page=login" method="POST" novalidate>
            <div class="mb-3">
              <label for="username">ID</label>
              <div class="input-group">
                <input type="text" class="form-control" name="id" id="username" placeholder="Username" required>
              </div>
            </div>
            <div class="mb-3">
              <label>Password</label>
              <input type="password" class="form-control" name="password" placeholder="Password" required>
              <div class="invalid-feedback">
                (필수) 패스워드를 입력하세요.
              </div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-info btn-sm btn-block" type="submit">LOGIN</button>
          </form>
        </div>
      </div>
    </div>
