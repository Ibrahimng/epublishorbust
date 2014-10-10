<?php
if( $_POST )
{
  $con = mysql_connect("localhost","epubpxno_preview","Vq8MXKY7GaXYCDJL");

  if (!$con)
  {
    $str = die('Oops!  We did not get your e-mail address.  Please try again.');
  }

  mysql_select_db("epubpxno_preview", $con);

  $users_name = $_POST['username'];
  $users_email = $_POST['email'];

  $users_name = mysql_real_escape_string($users_name);
  $users_email = mysql_real_escape_string($users_email);

  $query = "
  INSERT INTO `epubpxno_preview`.`email` (`username`,`email`,`timestamp`) VALUES ('$users_name','$users_email', CURRENT_TIMESTAMP);";

  mysql_query($query);

  $str = "<h2>Thank you!</h2><p>You will receive an email as soon as we go live.</p><p><i>Please make sure qwerty@epublishorbust.com is in your e-mail safe sender list.</i></p>";

  mysql_close($con);
}
?>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	
	<title>ePublish or BUST!</title>
	
	<style>
		
		#bg {
			position:fixed; 
			top:-50%; 
			left:-50%; 
			width:200%; 
			height:200%;
		}
		#bg img {
			position:absolute; 
			top:0; 
			left:0; 
			right:0; 
			bottom:0; 
			margin:auto; 
			min-width:50%;
			min-height:50%;
		}
		
		#page-wrap { position: relative; z-index: 2; width: 500px; margin: 50px auto; padding: 20px; background: transparent; -moz-box-shadow: 0 0 20px black; -webkit-box-shadow: 0 0 20px black; box-shadow: 0 0 20px black; }
		p { font: 15px/2 Georgia, Serif; margin: 0 0 30px 0; }
	</style>
</head>

<body>
	
	<div id="page-wrap">
<?php echo $str; ?>
	</div>
	
	<!-- At bottom, 'cause it's not really content -->
	<div id="bg">
		<img src="img/qwerty.png" alt="">
	</div>
	
</body>

</html>