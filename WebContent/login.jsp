<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>AirTicket</title> 
    <script src="animation.js" type="text/javascript"></script>
    <script src="login.js"></script>
    <link rel="stylesheet" type="text/css" href="login.css">
    <style>
		.button {
		    background-color: #900C3F; /* Green */
		    border: none;
		    color: white;
		    padding: 15px 32px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 16px;
		    margin: 4px 2px;
		    cursor: pointer;
		    -webkit-transition-duration: 0.4s; /* Safari */
		    transition-duration: 0.4s;
		    border-radius:9px 9px 0 0;
		}
		
		
		
		.button2:hover {
		    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
		}
	</style>
	</head>
	<body>
		<div class="header">
			<div class="sub_h1">
				air<div style="background-color:white;color:#900C3F;display:inline;border-radius:4px;">T</div>icket
				<div class="subsub_h1">
				<form name="login" action="login_conf.jsp" method="POST">
					<i>Email</i>
					<input type="text" placeholder=" Email address" name="femail" required>
					<i>Password</i>
					<input type="password" placeholder=" Password" name="fpass" required>
					<input type="submit" value="login">		
				</form>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="sub_c1">
				<h1> Creat an account:</h1>
				<hr>
				<form name="Registration" action="reg.jsp" method="POST" >
					First Name:
					<input type="text" placeholder=" First Name" name="fname" required="required"><br>
					Last Name:
					<input type="text" placeholder=" Last Name" name="flname" required><br>
					Email:
					<input type="text" placeholder=" Email Address" name="femail" required><br>
					Password:
					<input type="password" placeholder=" Password" name="fpass" required><br>
					Re-Enter Password:
					<input type="password" placeholder=" Re-Enter Password" name="fcpass" required>
					<input type="submit" name="submit" value="submit" >
				</form>
			</div>
			<div class="sub_c2">
				<div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:600px;height:500px;overflow:hidden;visibility:hidden;">
					<!-- Loading Screen -->
					<div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
						<div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
						<div style="position:absolute;display:block;background:url('img/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
					</div>
					<div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:600px;height:500px;overflow:hidden;">
						<div>
							<img data-u="image" src="http://www.vacationexpress.com/images/flight-schedule-banner.jpg" />
						</div>
						<a data-u="any" href="http://www.jssor.com" style="display:none">Different Size Photo Sldier</a>
						<div>
							<img data-u="image" src="http://www.hdwallpapers.in/walls/flight-wide.jpg" />
						</div>
						<div>
							<img data-u="image" src="http://previews.123rf.com/images/ivantagan/ivantagan1203/ivantagan120300049/12989481-Modern-airplane-in-Airport-Take-off-on-runway--Stock-Photo.jpg" />
						</div>
						<div>
							<img data-u="image" src="http://images.askmen.com/1080x540/2016/02/12-052049-the_points_guy_on_air_miles.jpg" />
						</div>
						<div>
							<img data-u="image" src="http://icdn3.digitaltrends.com/image/etihad_777-200lr_-_abu_dhabi_auh_to_los_angeles_lax-2-970x546-c.jpg" />
						</div>
						<div>
							<img data-u="image" src="http://blog.bigstep.com/wp-content/uploads/2014/09/bg2.jpg" />
						</div>
						<div>
							<img data-u="image" src="http://www.masmovilfibra.es/noticias/img/promos/noticia35/masmovil-descuento-norwegien.jpeg" />
						</div>
						<div>
							<img data-u="image" src="http://cdn-media-1.lifehack.org/wp-content/files/2014/06/romance_library_re.jpg" />
						</div>
						<div>
							<img data-u="image" src="http://il3.picdn.net/shutterstock/videos/5810312/thumb/1.jpg" />
						</div>
						<div>
							<img data-u="image" src="https://media.ldscdn.org/images/media-library/scriptures/peru-studying-siblings-1192063-wallpaper.jpg?download=true" />
						</div>
						<div>
							<img data-u="image" src="http://media.gettyimages.com/videos/classmates-studying-in-school-library-video-id454438020?s=640x640" />
						</div>
					</div>
					<!-- Bullet Navigator -->
					<div data-u="navigator" class="jssorb13" style="bottom:16px;right:16px;" data-autocenter="1">
						<!-- bullet navigator item prototype -->
						<div data-u="prototype" style="width:21px;height:21px;"></div>
					</div>
				</div>
				<script type="text/javascript">jssor_1_slider_init();</script>
				<!-- #endregion Jssor Slider End -->


			</div>
		</div>
		<div class="footer">
			<hr>
			<div class="f_b">
				www.airticket.com <div style="display:inline;">&copy </div> 2017
				
			</div>
			<div style="text-align:center;">
				<a href="about.jsp"><button class="button button2">About us</button></a>
				<a href="#00"><button class="button button2">Wiki</button></a>
				<a href="admin_login.jsp"><button class="button button2">Admin</button></a>
			</div>
			<br>
			<br>
		</div>
	</body>
</html>
