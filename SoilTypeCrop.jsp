<!DOCTYPE html>
<%@page import="com.bean.TypeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.UserDao"%>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="assets/img/favicon.png">
<title>Crop Prediction</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800"
	rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- Nucleo Icons -->
<link href="assets/css/nucleo-icons.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">

	<div class="wrapper">
		<center>
			<h2>PREDICTION OF CROP YIELD AND SUITABLE CROP</h2>
		</center>
		<div class="sidebar">
			<div class="sidebar-wrapper">
				<div class="logo">

					<a href="javascript:void(0)" class="simple-text logo-normal">
						Crop Prediction </a>
				</div>
				<ul class="nav">
					<li class="active "><a href="UserHome.jsp"> <i
							class="tim-icons icon-chart-pie-36"></i>
							<p>Home</p>
					</a></li>

					<li class="active "><a href="Crop.jsp"> <i
							class="tim-icons icon-chart-pie-36"></i>
							<p>Crop Selection</p>
					</a></li>
 <li class="active ">
            <a href="Soil.jsp">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>Soil Selection</p>
            </a>
          </li>
					<li class="active "><a href="LogoutController"> <i
							class="tim-icons icon-chart-pie-36"></i>
							<p>Logout</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">

			<!-- Navbar -->

			<div class="content">
				<div class="row">
					<div class="col-md-8">
						<div class="card">
							<div class="card-header">

								<h2 class="title">Select Crop</h2>
							</div>
							<div class="card-body">
								<form action="SoilType.jsp" method="post">
										<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>Available Crops</label>
												<select name="crop" class="form-control">
                     
                      <%
                      String type=request.getParameter("type");
                      UserDao dao=new UserDao();
                      
                      ArrayList<TypeBean> titlelist=dao.getCategory2(type);
                      
                      for(int i=0;i<titlelist.size();i++)
                      {
                      %>
                      
                      <option style="background-color: black" value="<%=titlelist.get(i).getCrop()%>"><%=titlelist.get(i).getCrop()%></option> 
                      
                      <%} %>
                      </select>	 
                      <input type="hidden" name="type" value="<%=type %>">
											
									<div class="card-footer">
                <button type="submit" class="btn btn-fill btn-primary">Submit</button>
              </div>
								</form>
							</div>

						</div>
					</div>

				</div>
			</div>



		</div>
	</div>

	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<!-- Place this tag in your head or just before your close body tag. -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chart JS -->
	<script src="assets/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="assets/js/black-dashboard.min.js?v=1.0.0"></script>
	<!-- Black Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/demo/demo.js"></script>
	
</body>

</html>