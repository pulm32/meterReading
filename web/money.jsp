
<%@ page import="java.util.List" %>

<%--
  Created by IntelliJ IDEA.
  User: 蒲立明
  Date: 2018/8/28
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%
  /* response.setCharacterEncoding("UTF-8");
   Users user = (Users) session.getAttribute("User");             // 从session中获得登录用户
   CartBiz cartBiz=new CartBiz();
   BooksBiz booksBiz= new BooksBiz();
   List<Books> booksList =booksBiz.getHotList();*/
%>

<!DOCTYPE HTML>
<html>
<head>
  <title>小区抄表</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="keywords" content="Gretong Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <!-- Bootstrap Core CSS -->
  <link href="lib/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
  <!-- Custom CSS -->
  <link href="lib/css/style.css" rel='stylesheet' type='text/css' />
  <!-- Graph CSS -->
  <link href="lib/css/font-awesome.css" rel="stylesheet">
  <!-- jQuery -->
  <link href='https://fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
  <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
  <!-- lined-icons -->
  <link rel="stylesheet" href="lib/css/icon-font.min.css" type='text/css' />
  <script src="lib/js/simpleCart.min.js"> </script>
  <script src="lib/js/amcharts.js"></script>
  <script src="lib/js/serial.js"></script>
  <script src="lib/js/light.js"></script>
  <!-- //lined-icons -->
  <script src="lib/js/jquery-1.10.2.min.js"></script>
  <!--pie-chart--->
  <script src="lib/js/pie-chart.js" type="text/javascript"></script>
  <script type="text/javascript">

    $(document).ready(function () {
      $('#demo-pie-1').pieChart({
        barColor: '#3bb2d0',
        trackColor: '#eee',
        lineCap: 'round',
        lineWidth: 8,
        onStep: function (from, to, percent) {
          $(this.element).find('.pie-value').text(Math.round(percent) + '%');
        }
      });

      $('#demo-pie-2').pieChart({
        barColor: '#fbb03b',
        trackColor: '#eee',
        lineCap: 'butt',
        lineWidth: 8,
        onStep: function (from, to, percent) {
          $(this.element).find('.pie-value').text(Math.round(percent) + '%');
        }
      });

      $('#demo-pie-3').pieChart({
        barColor: '#ed6498',
        trackColor: '#eee',
        lineCap: 'square',
        lineWidth: 8,
        onStep: function (from, to, percent) {
          $(this.element).find('.pie-value').text(Math.round(percent) + '%');
        }
      });


    });

  </script>
</head>
<body>
<div class="page-container">
  <!--/content-inner-->
  <div class="left-content">
    <div class="inner-content">
      <!-- header-starts -->
      <div class="header-section">
        <!-- top_bg -->
        <div class="top_bg">

          <div class="header_top">
            <div class="top_right">
              <ul>
                <li><a href="backstage/back_login.jsp">管理员登录</a></li>
              </ul>
            </div>
            <div class="top_left">
              <%
                // if(user!=null){
              %>
              <li >欢迎您，<a href="user.jsp?id=<%//=user.getId()%>"><%//=user.getLoginId()%></a></li>
              <%
                // }
              %>
            </div>
            <div class="clearfix"> </div>
          </div>

        </div>
        <div class="clearfix"></div>
        <!-- /top_bg -->
      </div>
      <div class="header_bg">
        <div class="header">
          <div class="head-t">
            <div class="logo">
              <a href="index.jsp"><h2>小区抄表及其管理系统</h2> </a>
            </div>
            <!-- start header_right -->
            <div class="header_right"><img src="lib/images/logo.png">
            </div>
            <div class="clearfix"> </div>
          </div>
        </div>
      </div>
      <!-- //header-ends -->

      <!--content-->
      <div class="content">
        <div class="women_main">
          <!-- start content -->
          <div class="middle-content">
            <h3>热门图书</h3>
            <!-- start content_slider -->
            <div id="owl-demo" class="owl-carousel text-center">
              <%
                // for(int i=0;i<booksList.size();i++){
                //  Books book=booksList.get(i);
              %>
              <div class="item"><a href="bookdetail.jsp?id=<%//=book.getId()%>">
                <img class="lazyOwl img-responsive" data-src="lib/images/BookCovers/<%//=book.getISBN()%>.jpg" alt="<%//=book.getTitle()%>">
              </a>
              </div>
              <%
                // }
              %>

            </div>
            <div>
              <h3>大家都在搜：</h3>
              <%
                //SearchBiz searchBiz = new SearchBiz();
                // List<String> list = searchBiz.getRank();
                //for (int i=0;i<list.size();i++){
                //String str=list.get(i);
              %>
              <h5><a href="search.jsp?word=<%//=java.net.URLEncoder.encode(str, "UTF-8")%>"><%//=str%></a>&nbsp;</h5>
              <%
                // }
              %>
            </div>
          </div>
          <!--//sreen-gallery-cursual---->
          <!-- requried-jsfiles-for owl -->
          <link href="lib/css/owl.carousel.css" rel="stylesheet">
          <script src="lib/js/owl.carousel.js"></script>
          <script>
            $(document).ready(function() {
              $("#owl-demo").owlCarousel({
                items : 3,
                lazyLoad : true,
                autoPlay : true,
                pagination : true,
                nav:true,
              });
            });
          </script>
          <!-- //requried-jsfiles-for owl -->
          <div class="clearfix"></div>


          <!-- end content -->

          <div class="footer">
            <div class="clearfix"> </div>
            <p>Copyright &copy; 2018.蒲立明 赵凌波 吴锐 All rights reserved.</p>
          </div>
        </div>
      </div>
      <!--content-->
    </div>
  </div>
  <!--//content-inner-->
  <!--/sidebar-menu-->
  <div class="sidebar-menu">
    <header class="logo1">
      <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a>
    </header>
    <div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
    <div class="menu">
      <ul id="menu" >
        <li><a href="lookuser.jsp"><i class="fa fa-home"></i> <span>查看用户</span></a></li>
        <li><a href="adduser.jsp"><i class="fa fa-book"></i> <span>添加用户</span></a></li>
        <!--   <li><a href="#"><i class="fa fa-user"></i> <span> 个人</span> <span class="fa fa-angle-right" style="float: right"></span></a>
        <ul >
              <li><a href="user.jsp">个人信息</a></li>
              <li><a href="orders.jsp?id=">我的订单</a></li>
              <li><a href="dologout.jsp">退出登录</a></li>
            </ul>
        </li>-->
        <li><a href="lookmeter.jsp"><i class="fa fa-shopping-cart"></i> <span>查看表</span></a></li>
        <li><a href="updateuser.jsp"><i class="fa fa-inbox"></i> <span>编辑用户</span></a></li>
        <li><a href="erroruser.jsp"><i class="fa fa-bookmark"></i> <span>异常用户</span></a></li>

      </ul>
    </div>
  </div>
  <div class="clearfix"></div>
</div>
<script>
  var toggle = true;

  $(".sidebar-icon").click(function() {
    if (toggle)
    {
      $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
      $("#menu span").css({"position":"absolute"});
    }
    else
    {
      $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
      setTimeout(function() {
        $("#menu span").css({"position":"relative"});
      }, 400);
    }

    toggle = !toggle;
  });
</script>
<!--js -->
<script src="lib/js/jquery.nicescroll.js"></script>
<script src="lib/js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="lib/js/bootstrap.min.js"></script>
<!-- /Bootstrap Core JavaScript -->
<!-- real-time -->
<script language="javascript" type="text/javascript" src="lib/js/jquery.flot.js"></script>
<script type="text/javascript">

  $(function() {

    // We use an inline data source in the example, usually data would
    // be fetched from a server

    var data = [],
            totalPoints = 300;

    function getRandomData() {

      if (data.length > 0)
        data = data.slice(1);

      // Do a random walk

      while (data.length < totalPoints) {

        var prev = data.length > 0 ? data[data.length - 1] : 50,
                y = prev + Math.random() * 10 - 5;

        if (y < 0) {
          y = 0;
        } else if (y > 100) {
          y = 100;
        }

        data.push(y);
      }

      // Zip the generated y values with the x values

      var res = [];
      for (var i = 0; i < data.length; ++i) {
        res.push([i, data[i]])
      }

      return res;
    }

    // Set up the control widget

    var updateInterval = 30;
    $("#updateInterval").val(updateInterval).change(function () {
      var v = $(this).val();
      if (v && !isNaN(+v)) {
        updateInterval = +v;
        if (updateInterval < 1) {
          updateInterval = 1;
        } else if (updateInterval > 2000) {
          updateInterval = 2000;
        }
        $(this).val("" + updateInterval);
      }
    });

    var plot = $.plot("#placeholder", [ getRandomData() ], {
      series: {
        shadowSize: 0	// Drawing is faster without shadows
      },
      yaxis: {
        min: 0,
        max: 100
      },
      xaxis: {
        show: false
      }
    });

    function update() {

      plot.setData([getRandomData()]);

      // Since the axes don't change, we don't need to call plot.setupGrid()

      plot.draw();
      setTimeout(update, updateInterval);
    }

    update();

    // Add the Flot version string to the footer

    $("#footer").prepend("Flot " + $.plot.version + " &ndash; ");
  });

</script>
<!-- /real-time -->
<script src="lib/js/jquery.fn.gantt.js"></script>
<script>

  $(function() {

    "use strict";

    $(".gantt").gantt({
      source: [{
        name: "Sprint 0",
        desc: "Analysis",
        values: [{
          from: "/Date(1320192000000)/",
          to: "/Date(1322401600000)/",
          label: "Requirement Gathering",
          customClass: "ganttRed"
        }]
      },{
        name: " ",
        desc: "Scoping",
        values: [{
          from: "/Date(1322611200000)/",
          to: "/Date(1323302400000)/",
          label: "Scoping",
          customClass: "ganttRed"
        }]
      },{
        name: "Sprint 1",
        desc: "Development",
        values: [{
          from: "/Date(1323802400000)/",
          to: "/Date(1325685200000)/",
          label: "Development",
          customClass: "ganttGreen"
        }]
      },{
        name: " ",
        desc: "Showcasing",
        values: [{
          from: "/Date(1325685200000)/",
          to: "/Date(1325695200000)/",
          label: "Showcasing",
          customClass: "ganttBlue"
        }]
      },{
        name: "Sprint 2",
        desc: "Development",
        values: [{
          from: "/Date(1326785200000)/",
          to: "/Date(1325785200000)/",
          label: "Development",
          customClass: "ganttGreen"
        }]
      },{
        name: " ",
        desc: "Showcasing",
        values: [{
          from: "/Date(1328785200000)/",
          to: "/Date(1328905200000)/",
          label: "Showcasing",
          customClass: "ganttBlue"
        }]
      },{
        name: "Release Stage",
        desc: "Training",
        values: [{
          from: "/Date(1330011200000)/",
          to: "/Date(1336611200000)/",
          label: "Training",
          customClass: "ganttOrange"
        }]
      },{
        name: " ",
        desc: "Deployment",
        values: [{
          from: "/Date(1336611200000)/",
          to: "/Date(1338711200000)/",
          label: "Deployment",
          customClass: "ganttOrange"
        }]
      },{
        name: " ",
        desc: "Warranty Period",
        values: [{
          from: "/Date(1336611200000)/",
          to: "/Date(1349711200000)/",
          label: "Warranty Period",
          customClass: "ganttOrange"
        }]
      }],
      navigate: "scroll",
      scale: "weeks",
      maxScale: "months",
      minScale: "days",
      itemsPerPage: 10,
      onItemClick: function(data) {
        alert("Item clicked - show some details");
      },
      onAddClick: function(dt, rowId) {
        alert("Empty space clicked - add an item!");
      },
      onRender: function() {
        if (window.console && typeof console.log === "function") {
          console.log("chart rendered");
        }
      }
    });

    $(".gantt").popover({
      selector: ".bar",
      title: "I'm a popover",
      content: "And I'm the content of said popover.",
      trigger: "hover"
    });

    prettyPrint();

  });

</script>
<script src="lib/js/menu_jquery.js"></script>
</body>
</html>