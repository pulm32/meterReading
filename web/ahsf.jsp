<%--
  Created by IntelliJ IDEA.
  User: lmy
  Date: 2019/8/25
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String building=(String)request.getParameter("building");
  String door=(String)request.getParameter("door");

%>
<script language="javascript">
  var XMLHttpReq;
  //创建XMLHttpRequest对象
  var b1=<%=building%>;
  //alert(b1);
  var b2=<%=door%>;
  //alert(b2);


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
  //  var m=document.getElementsByTagName("building")[0];
    //var n=document.getElementsByTagName("door").value;
    var url = "ajax.jsp?building1="+b1+"&door1="+b2;
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

<html>
<head>
    <title></title>
</head>
<body onload=sendRequest()>
<table style="BORDER-COLLAPSE: collapse" borderColor=#111111 cellSpacing=0 cellPadding=0
       width=200 bgColor=#f5efe7 border=0>

  <TR>
    <TD align=middle bgColor=#dbc2b0 height=19 colspan="2"><B>无线传感网</B></TD>
  </TR>
  <tr>
    <td height="20"> 传感器：</td>
    <td height="20" id="product"></td>
    <td height="20" id="product1"></td>
  </tr>
  <tr>
    <td height="20">传感器个数：</td>
    <td height="20" id="co"></td>
    <td height="20" id="co1"></td>
  </tr>
</table>
</body>
</html>
