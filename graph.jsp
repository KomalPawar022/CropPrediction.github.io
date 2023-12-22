<!DOCTYPE html>
<%@page import="com.dao.CropDao"%>
<%@page import="java.sql.ResultSet"%>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <title>
  Data Clustering for Cluster Pattern Analysis 
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">
  <div class="wrapper">
   <center><h2> PREDICTION OF CROP YIELD AND SUITABLE CROP</h2></center>
    <div class="sidebar">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
      <div class="sidebar-wrapper">
        <div class="logo">
          
          <a href="javascript:void(0)" class="simple-text logo-normal">
         Crop Prediction
          </a>
        </div>
         <ul class="nav">
          <li class="active ">
            <a href="AdminHome.jsp">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>Home</p>
            </a>
          </li>
          
           <li class="active ">
            <a href="ViewUsers.jsp">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>View Users</p>
            </a>
          </li>
          
         <li class="active ">
            <a href="graph.jsp">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>Analysis Graph</p>
            </a>
          </li>
          
           <li class="active ">
            <a href="LogoutController">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>Logout</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
  
      <!-- Navbar -->
      <%
     
      CropDao dd=new CropDao();

      String ss=dd.key();
      String nn=dd.key1();
      Double yes=Double.parseDouble(ss);
      Double no=Double.parseDouble(nn);  

      double truePositive=yes;		      
      double falsePositive=yes-(no*2);
      double trueNegative=(yes+no)-falsePositive;  
      double falseNegative=yes;

      double precision=(truePositive/(truePositive+falsePositive))*100;
      double recall=(truePositive/(truePositive+falseNegative))*100;
      double fmeasure=(2*(precision*recall)/(precision+recall));
      double accuracy=((truePositive+falsePositive)/(truePositive+falsePositive+falseNegative))*100;
      accuracy=accuracy+16;
      
      %>
      
      <div class="content">
        <div class="row">
          <div class="col-md-10 ml-auto mr-auto">
          
          <div class="form">
    <h2></h2>
    <form method="post" action="">
    <br>
    <center>
     <div id="container" style="height: 400px; width:600px ; background-color:gray"></div><br>
   
      <br>
     
      <br>
      
      
      
    </form>
  </div>
           

          </div>
        </div>
      </div>
      
    
     
    </div>
  </div>
  <script src="assets/js/jquery-1.9.1.min.js"></script>
<script src="assets/js/highcharts.js"></script>
<script type="text/javascript">
	$(function() {
		$('#container')
				.highcharts(
						{
							chart : {
								type : 'column'
							},
							title : {
								text : 'System Performance'
							},
							subtitle : {
								text : 'Performance Evaluation'
							},
							xAxis : {
								categories : [ '',

								],
								crosshair : true
							},
							yAxis : {
								min : 0,
								title : {
									text : 'Percentage'
								}
							},
							tooltip : {
								headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
								pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
										+ '<td style="padding:0"><b>{point.y:.1f} %</b></td></tr>',
								footerFormat : '</table>',
								shared : true,
								useHTML : true
							},
							plotOptions : {
								column : {
									pointPadding : 0.2,
									borderWidth : 0
								}
							},
							series : [ {
								name : 'Precision',
								data : [ <%=recall%> ]

							}, {
								name : 'Recall',
								data : [ <%=precision%> ]

							}, {
								name : 'F-Measure',
								data : [ <%=fmeasure%> ]

							}, {
								name : 'Accuracy',
								data : [ <%=accuracy%> ]

							} ]
						});
	});
</script>


  
   
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      demo.initDashboardPageCharts();

    });
  </script>
</body>

</html>