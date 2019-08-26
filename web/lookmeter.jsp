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
     response.setCharacterEncoding("UTF-8");

%>

<!DOCTYPE HTML>
<html>
<head>
    <title>小区抄表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Gretong Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- Bootstrap Core CSS -->
    <link href="lib/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <!-- Custom CSS -->
    <link href="lib/css/style.css" rel='stylesheet' type='text/css'/>
    <!-- Graph CSS -->
    <link href="lib/css/font-awesome.css" rel="stylesheet">
    <!-- jQuery -->
    <link href='https://fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet'
          type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <!-- lined-icons -->
    <link rel="stylesheet" href="lib/css/icon-font.min.css" type='text/css'/>
    <script src="lib/js/simpleCart.min.js"></script>
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
<script>
   // var oMyForm = new FormData();    // 创建一个空的FormData对象
 //oMyForm.append("building1","123");   // 数字123456立即被转换成字符串“123456”
 //oMyForm.append("door1","456");</script>
    <script language="javascript">
        var XMLHttpReq;
        //创建XMLHttpRequest对象
        function createXMLHttpRequest() {
            if (window.XMLHttpRequest) {   //Mozilla 浏览器
                XMLHttpReq = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) { // IE浏览器
                try {
                    XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {
                    }
                }
            }
        }
        //发送请求函数
        function sendRequest() {
            createXMLHttpRequest();
       //     var m=document.getElementsByTagName("building")[0];
         //   var n=document.getElementsByTagName("door").value;
           // var url = "ajax.jsp?building1="+m+"&door1="+n;
            //var building1=request.getParameter("building");
            //var door1=request.getParameter("door");
            XMLHttpReq.open("GET",url,true);
            XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
            XMLHttpReq.send(null);   // 使用XMLHttpRequest的send()把数据发送出去

            //XMLHttpReq.open("GET", url+"?building1="+building1+"&door1="+door1, true);

            //XMLHttpReq.send(null);  // 发送请求
        }
        // 处理返回信息函数
        function processResponse() {
            if (XMLHttpReq.readyState == 4) { // 判断对象状态
                if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                    DisplayHot();
                    setTimeout("sendRequest()", 1000);
                } else { //页面不正常
                    window.alert("您所请求的页面有异常。");
                }
            }
        }
        function DisplayHot() {
           var name = XMLHttpReq.responseXML.getElementsByTagName("na")[0].firstChild.nodeValue;
           var count = XMLHttpReq.responseXML.getElementsByTagName("co")[0].firstChild.nodeValue;
            var name1 = XMLHttpReq.responseXML.getElementsByTagName("na1")[0].firstChild.nodeValue;
            var count1 = XMLHttpReq.responseXML.getElementsByTagName("co1")[0].firstChild.nodeValue;
            document.getElementById("product1").innerHTML = name1;
            document.getElementById("co1").innerHTML = count1;
            document.getElementById("product").innerHTML = name;
            document.getElementById("co").innerHTML = count;
        }


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

                        </div>
                        <div class="clearfix"></div>
                    </div>

                </div>
                <div class="clearfix"></div>
                <!-- /top_bg -->
            </div>
            <div class="header_bg">
                <div class="header">
                    <div class="head-t">
                        <div class="logo">
                            <a href="index.jsp"><h2>小区抄表及其管理系统</h2></a>
                        </div>
                        <!-- start header_right -->
                        <div class="header_right"><img src="lib/images/logo.png">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <!-- //header-ends -->

            <!--content-->
            <div class="content">
                <div class="women_main">
                    <!-- start content -->
                    <div class="middle-content">
                        <div>
                            <h3>三表数据：</h3>
                            <form action="new.jsp" method="post">
                                <tr>
                                    <td>楼号：</td>
                                    <td>
                                        <select name="building" id="building">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>门牌号：</td>
                                    <td><select name="door" id="door">
                                        <option value="1001">1001</option>
                                        <option value="1002">1002</option>
                                        <option value="2001">2001</option>
                                        <option value="2002">2002</option>
                                        <option value="3001">3001</option>
                                        <option value="3002">3002</option>
                                    </select>
                                    </td><td><input type="submit"  value="查询"/></td>
                                </tr>
                            </form>

                        </div>
                    </div>
                    <!--//sreen-gallery-cursual---->
                    <!-- requried-jsfiles-for owl -->
                    <link href="lib/css/owl.carousel.css" rel="stylesheet">
                    <script src="lib/js/owl.carousel.js"></script>
                    <script>
                        $(document).ready(function () {
                            $("#owl-demo").owlCarousel({
                                items: 3,
                                lazyLoad: true,
                                autoPlay: true,
                                pagination: true,
                                nav: true,
                            });
                        });
                    </script>
                    <!-- //requried-jsfiles-for owl -->
                    <div class="clearfix"></div>


                    <!-- end content -->

                    <div class="footer">
                        <div class="clearfix"></div>
                        <p>Copyright &copy; 2019 蒲立明 彭玮航 赵凌波 李梦依 刘磊 All rights reserved.</p>
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
            <ul id="menu">
                <li><a href="lookuser.jsp"><i class="fa fa-user"></i> <span>查看用户</span></a></li>
                <li><a href="lookmeter.jsp"><i class="fa fa-dashboard"></i> <span>实时示数</span></a></li>
                <li><a href="collect.jsp"><i class="fa fa-table"></i> <span>示数汇总</span></a></li>
                <li><a href="updateuser.jsp"><i class="fa fa-pencil"></i> <span>编辑用户</span></a></li>
                <li><a href="erroruser.jsp"><i class="fa fa-warning"></i> <span>异常用户</span></a></li>

            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<script>
    var toggle = true;

    $(".sidebar-icon").click(function () {
        if (toggle) {
            $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
            $("#menu span").css({"position": "absolute"});
        }
        else {
            $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
            setTimeout(function () {
                $("#menu span").css({"position": "relative"});
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

    $(function () {

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

        var plot = $.plot("#placeholder", [getRandomData()], {
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

    $(function () {

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
            }, {
                name: " ",
                desc: "Scoping",
                values: [{
                    from: "/Date(1322611200000)/",
                    to: "/Date(1323302400000)/",
                    label: "Scoping",
                    customClass: "ganttRed"
                }]
            }, {
                name: "Sprint 1",
                desc: "Development",
                values: [{
                    from: "/Date(1323802400000)/",
                    to: "/Date(1325685200000)/",
                    label: "Development",
                    customClass: "ganttGreen"
                }]
            }, {
                name: " ",
                desc: "Showcasing",
                values: [{
                    from: "/Date(1325685200000)/",
                    to: "/Date(1325695200000)/",
                    label: "Showcasing",
                    customClass: "ganttBlue"
                }]
            }, {
                name: "Sprint 2",
                desc: "Development",
                values: [{
                    from: "/Date(1326785200000)/",
                    to: "/Date(1325785200000)/",
                    label: "Development",
                    customClass: "ganttGreen"
                }]
            }, {
                name: " ",
                desc: "Showcasing",
                values: [{
                    from: "/Date(1328785200000)/",
                    to: "/Date(1328905200000)/",
                    label: "Showcasing",
                    customClass: "ganttBlue"
                }]
            }, {
                name: "Release Stage",
                desc: "Training",
                values: [{
                    from: "/Date(1330011200000)/",
                    to: "/Date(1336611200000)/",
                    label: "Training",
                    customClass: "ganttOrange"
                }]
            }, {
                name: " ",
                desc: "Deployment",
                values: [{
                    from: "/Date(1336611200000)/",
                    to: "/Date(1338711200000)/",
                    label: "Deployment",
                    customClass: "ganttOrange"
                }]
            }, {
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
            onItemClick: function (data) {
                alert("Item clicked - show some details");
            },
            onAddClick: function (dt, rowId) {
                alert("Empty space clicked - add an item!");
            },
            onRender: function () {
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