<?php
   @session_start();
   header("Content-Type: text/html; charset=UTF-8");
   include ( './common.php' );

   $mode = $_REQUEST["mode"];
   $db_conn = mysql_conn();
   
   if($mode == "write") {
      $title = $_POST["title"];
      $id = $_SESSION["id"];
      $writer = $_SESSION["name"];
      $password = $_POST["password"];
      $content = $_POST["content"];
      $secret = $_POST["secret"];
      $uploadFile = "";
      /*   
      echo $title."<br>";
      echo $id."<br>";
      echo $writer."<br>";
      echo $password."<br>";
      echo $content."<br>";
      echo $secret."<br>";
      exit;
      */
      

      if(empty($title) || empty($password) || empty($content)) {
         echo "<script>alert('빈칸이 존재합니다.');history.back(-1);</script>";
         exit();
      }
      
      if(!empty($_FILES["userfile"]["name"])) {
        $uploadFile = $_FILES["userfile"]["name"];
        $uploadPath = "{$upload_path}/{$uploadFile}";
      
				
        #. medium단계(단순 확장자로만 파일 필터링)
        $userfile_name = $_FILES[ 'userfile' ][ 'name' ];
        $userfile_type = $_FILES[ 'userfile' ][ 'type' ];
        $userfile_size = $_FILES[ 'userfile' ][ 'size' ];   
         
        if( ( $userfile_type == "image/jpeg" || $userfile_type == "image/png" ) && ( $userfile_size < 100000 ) ) {
					// Can we move the file to the upload folder?
					$uploadFile = $_FILES["userfile"]["name"];
					$uploadPath = "{$upload_path}/{$uploadFile}";
					
					if(!(@move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadPath))) {
						echo("<script>alert('파일 업로드를 실패 하셨습니다.');history.back(-1);</script>");
						exit;
					} else {
						if($secret == "on") {
							$secret = "y";
						} else {
							$secret = "n";
						}

						$content = str_replace("\r\n", "<br>", $content);
						 
						$query = "insert into {$tb_name}(title, id, writer, password, content, file, secret, regdate) values('{$title}', '{$id}', '{$writer}', '{$password}', '{$content}', '{$uploadFile}', '{$secret}', now())";
						$db_conn->query($query);
						echo ("<script>alert('파일 업로드 성공');</script>");
          }
        } else {
          // Invalid file
          $html .= '<pre>Your image was not uploaded. We can only accept JPEG or PNG images.</pre>';
          echo $html;
        }
      }
			
				
				/*
        #. high
				$userfile_name = $_FILES[ 'userfile' ][ 'name' ];
        $userfile_size = $_FILES[ 'userfile' ][ 'size' ];
				$userfile_tmp  = $_FILES[ 'userfile' ][ 'tmp_name' ];
				$userfile_ext  = substr( $userfile_name, strrpos( $userfile_name, '.' ) + 1);

				$tmp = strtolower( $userfile_ext ); ///jpg

				if( ( strtolower( $userfile_ext ) == "jpg" || strtolower( $userfile_ext ) == "jpeg" || strtolower( $userfile_ext ) == "png" ) && ( $userfile_size < 100000 ) && getimagesize( $userfile_tmp ) ) {

					// Can we move the file to the upload folder?
					if(!(@move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadPath))) {
						// No
						echo("<script>alert('파일 업로드를 실패 하셨습니다.');history.back(-1);</script>");
					}
					else {
						// Yes!
						if($secret == "on") {
							$secret = "y";
						} else {
							$secret = "n";
						}

						$content = str_replace("\r\n", "<br>", $content);
						$query = "insert into {$tb_name}(title, id, writer, password, content, file, secret, regdate) values('{$title}', '{$id}', '{$writer}', '{$password}', '{$content}', '{$uploadFile}', '{$secret}', now())";
						$db_conn->query($query);

						echo("<script>alert('파일 업로드를 성공 하셨습니다.');location.href='index.php';</script>");
					}
				}
				else {
					echo("<script>alert('파일 업로드를 실패 하셨습니다. JPEG 혹은 PNG 이미지만 업로드할 수 있습니다.');history.back(-1);</script>");
				}				
			}
			*/

				/*
				#. impossible
				// File information
				$userfile_name = $_FILES[ 'userfile' ][ 'name' ];
        $userfile_size = $_FILES[ 'userfile' ][ 'size' ];
				$userfile_tmp  = $_FILES[ 'userfile' ][ 'tmp_name' ];
				$userfile_ext  = substr( $userfile_name, strrpos( $userfile_name, '.' ) + 1);
				$userfile_type = $_FILES[ 'userfile' ][ 'type' ];

				# target_path == uploadPath, uploaded_tmp ==$_FILES['userfile']['tmp_name']
				# DIRECTORY_SEPARATOR : /
				
				$target_file   =  md5( uniqid() . $userfile_name ) . '.' . $userfile_ext;
				$temp_file     = ( ( ini_get( 'upload_tmp_dir' ) == '' ) ? ( sys_get_temp_dir() ) : ( ini_get( 'upload_tmp_dir' ) ) ); # : /tmp
				$temp_file    .= DIRECTORY_SEPARATOR . $target_file;

				if( ( strtolower( $userfile_ext ) == 'jpg' || strtolower( $userfile_ext ) == 'jpeg' || strtolower( $userfile_ext ) == 'png' ) && ( $userfile_size < 100000 ) && ( $userfile_type == 'image/jpeg' || $userfile_type == 'image/png' ) && getimagesize( $userfile_tmp ) ) {
					
					/*
					// Strip any metadata, by re-encoding image (Note, using php-Imagick is recommended over php-GD)
					if( $uploaded_type == 'image/jpeg' ) {
						echo("<script>alert('111111');</script>");
						$img = imagecreatefromjpeg( $userfile_tmp );
						imagejpeg( $img, $temp_file, 100);
					}
					else {
						echo("<script>alert('222222');</script>");
						$img = imagecreatefrompng( $userfile_tmp );
						echo("<script>alert('{$img}');</script>");
						imagepng( $img, $temp_file, 9);
					}
					echo $img."<br>";
					imagedestroy( $img );
					echo("<script>alert('444444');</script>");
					

					// Can we move the file to the web root from the temp folder?
					// 여기서 실패가 나옴 ,,!

					if( rename( $temp_file, ( getcwd() . DIRECTORY_SEPARATOR . $uploadPath . $target_file ) ) ) {
						// Yes!
						echo("<script>alert('파일 업로드를 성공 하셨습니다.');</script>");
					}
					else {
						// No
						echo("<script>alert('파일 업로드를 실패 하셨습니다.');history.back(-1);</script>");
					}

					// Delete any temp files
					if( file_exists( $temp_file ) )
						unlink( $temp_file );

				}
				

				else {
					// Invalid file
					echo("<script>alert('파일 업로드를 실패 하셨습니다. JPEG 혹은 PNG 이미지만 업로드할 수 있습니다.');history.back(-1);</script>");
				}
			
			}*/
      

   } else if($mode == "modify") {
      $idx = $_POST["idx"];
      $title = $_POST["title"];
      $password = $_POST["password"];
      $content = $_POST["content"];
      $secret = $_POST["secret"];
      $uploadFile = $_POST["oldfile"];

      if(empty($idx) || empty($title) || empty($password) || empty($content)) {
         echo "<script>alert('빈칸이 존재합니다.');history.back(-1);</script>";
         exit();
      }

      # Password Check Logic
      $query = "select * from {$tb_name} where idx={$idx} and password='{$password}'";
      $result = $db_conn->query($query);
      $num = $result->num_rows;

      if($num == 0) {
         echo "<script>alert('패스워드가 일치하지 않습니다.');history.back(-1);</script>";
         exit();
      }

      if(!empty($_FILES["userfile"]["name"])) {

				
        #. medium단계(단순 확장자로만 파일 필터링)
        $userfile_name = $_FILES[ 'userfile' ][ 'name' ];
        $userfile_type = $_FILES[ 'userfile' ][ 'type' ];
        $userfile_size = $_FILES[ 'userfile' ][ 'size' ];   

        if( ( $uploaded_type == "image/jpeg" || $uploaded_type == "image/png" ) && ( $uploaded_size < 100000 ) ) {
					// Can we move the file to the upload folder?
					$uploadFile = $_FILES["userfile"]["name"];
					$uploadPath = "{$upload_path}/{$uploadFile}";
					echo("<script>alert('파일 업로드를 실패 하셨습니다.');history.back(-1);</script>");
					
					if(!(@move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadPath))) {
						echo("<script>alert('파일 업로드를 실패 하셨습니다.');history.back(-1);</script>");
						exit;
					} else {
						echo ("<script>alert('파일 업로드 성공');</script>");
					}
        }
        else {
          // Invalid file
          $html .= '<pre>Your image was not uploaded. We can only accept JPEG or PNG images.</pre>';
        }
				


        #. high단계
				/*
				$userfile_name = $_FILES[ 'userfile' ][ 'name' ];
        $userfile_size = $_FILES[ 'userfile' ][ 'size' ];
				$userfile_tmp  = $_FILES[ 'userfile' ][ 'tmp_name' ];
				$userfile_ext  = substr( $userfile_name, strrpos( $userfile_name, '.' ) + 1);

				$tmp = strtolower( $userfile_ext ); ///jpg

				if( ( strtolower( $userfile_ext ) == "jpg" || strtolower( $userfile_ext ) == "jpeg" || strtolower( $userfile_ext ) == "png" ) && ( $userfile_size < 100000 ) && getimagesize( $userfile_tmp ) ) {

					// Can we move the file to the upload folder?
					if(!(@move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadPath))) {
						// No
						echo("<script>alert('파일 업로드를 실패 하셨습니다.');history.back(-1);</script>");
					}
					else {
						// Yes!
						if($secret == "on") {
							$secret = "y";
						} else {
							$secret = "n";
						}

						$content = str_replace("\r\n", "<br>", $content);
						$query = "insert into {$tb_name}(title, id, writer, password, content, file, secret, regdate) values('{$title}', '{$id}', '{$writer}', '{$password}', '{$content}', '{$uploadFile}', '{$secret}', now())";
						$db_conn->query($query);

						echo("<script>alert('파일 업로드를 성공 하셨습니다.');</script>");
					}
				}
				else {
					echo("<script>alert('파일 업로드를 실패 하셨습니다. JPEG 혹은 PNG 이미지만 업로드할 수 있습니다.');history.back(-1);</script>");
				}	
*/


         #. impossible 단계
         /*
         $uploadFile = $_FILES["userfile"]["name"];
         $uploadPath = "{$upload_path}/{$uploadFile}";
         
         if(!(@move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadPath))) {
            echo("<script>alert('파일 업로드를 실패 하셨습니다.');history.back(-1);</script>");
            exit;
         }
         */
      }
      
      if($secret == "on") {
         $secret = "y";
      } else {
         $secret = "n";
      }
      
      $content = str_replace("\r\n", "<br>", $content);
      
      $query = "update {$tb_name} set title='{$title}', content='{$content}', file='{$uploadFile}', secret='{$secret}', regdate=now() where idx={$idx}";
      $db_conn->query($query);
   } else if($mode == "delete") {
      $idx = $_POST["idx"];
      $password = $_POST["password"];
      
      # Password Check Logic
      $query = "select * from {$tb_name} where idx={$idx} and password='{$password}'";
      $result = $db_conn->query($query);
      $num = $result->num_rows;

      if($num == 0) {
         echo "<script>alert('패스워드가 일치하지 않습니다.');history.back(-1);</script>";
         exit();
      }
      
      $query = "delete from {$tb_name} where idx={$idx}";
      $db_conn->query($query);
   }

   //echo "<script>location.href='index.php';</script>";
   $db_conn->close();
?>