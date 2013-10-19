<html>

<?php
include_once 'functions/functions.php';
include_once 'queries/queries.php';
include_once 'config/config.php';
?>

<head>
<title>title</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<meta charset="UTF-8">
<link href="css.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body background="images/background.jpeg">

<div id="wrapper">
<div id="menu">
	<ul>
		<li><a href="#">Forum</a></li>
		<li><a href="ladder.php">Ladder</a></li>
		<li><a href="donate.php">Donate</a></li>
		<li><a href="vote.php">Vote</a></li>
		<li><a href="register.php">Register</a></li>
		<li><a href="login.php">Login</a></li>
		<li><a href="index.php">Home</a></li>
	</ul>
</div>
<!-- end menu -->
<!-- start page -->
<div id="page">
	<!-- start content -->
	<div id="content">
		<div class="post">
			<div class="title">
				<h2>Lorem ipsum dolor sit amet.</h2>
				<p><small>Posted On October 10th, 2013 by Hezekiah.</small></p>
			</div>
			<div class="entry">
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus est eu magna imperdiet volutpat. Donec placerat pretium ligula, ac volutpat massa interdum et. Donec.</p>
			</div>
			<p class="links">Possibly add comment and read more section here.</p>
		</div>
		<div class="post">
			<div class="title">
				<h2>Lorem ipsum dolor sit amet.</h2>
				<p><small>Posted On October 10th, 2013 by Hezekiah.</small></p>
			</div>
			<div class="entry">
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus est eu magna imperdiet volutpat. Donec placerat pretium ligula, ac volutpat massa interdum et. Donec.</p>
			</div>
			<p class="links">Possibly add comment and read more section here.</p>
		</div>
		
	</div>
	<!-- end content -->
	<!-- start sidebar -->
	<div id="sidebar">
		<ul>
			<li id="categories">
			<h2>Account Information.</h2>
			<ul>
			<form name="form1" method="post" action="login.php">
			<input name="username"; type="text" id="username" placeholder="Username" autocomplete="off"/>
			<input name="password" type="password" id="password" placeholder="Password" autocomplete="off"/>
			<input type="submit" name="Submit" value="Login" /></form>
				</ul>
			</li>
		</ul>
	</div>
	<div id="sidebar">
		<ul>
			<li id="categories">
				<h2>Server Information.</h2>
				<ul>
				Server Location: Germany, Frankfurt.<br>
				Patch: Wrath of the Lich King 3.3.5a.<br>
				Online: 1, of which 1 are Staff Members.<br><br>
				<center><a href="guide.php">Connection Guide.</a></center>
				<center><a href="staff.php">Staff List.</a></center><br>
				<center><b>set realmlist logon.shitbag.com</b></center>
				</ul>
			</li>
		</ul>
	</div>
	
</div>
<div id="footer">
	<p class="legal">
	<img src=./images/divider.jpeg><br>

<br>
		Copyright &copy; Hezekiah 2013.<br>
		All Rights Reserved.


</div>
</div>
</body>
</html>