<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*" %>
<%@ page import="org.omg.CORBA.Request" %>
<%@ page import="meterReading.entity.MeterLog" %>
<%@ page import="meterReading.biz.MeterBiz" %>
<%@ page import="meterReading.util.Tool" %>
<%
  String building=(String)request.getParameter("building1");
  String door=(String)request.getParameter("door1");
  MeterBiz meterBiz=new MeterBiz();
  List<MeterLog> meterLog1=meterBiz.getMeterByBuildingandDoor(Integer.parseInt(building),door,1);
  List<MeterLog> meterLog2=meterBiz.getMeterByBuildingandDoor(Integer.parseInt(building),door,2);
  List<MeterLog> meterLog3=meterBiz.getMeterByBuildingandDoor(Integer.parseInt(building),door,3);
%>

<%
  //设置输出信息的格式及字符集


  response.setContentType("text/xml; charset=UTF-8");
  response.setHeader("Cache-Control","no-cache");
  out.println("<response>");

  for(int i=0;i<6;i++){  out.println("<na>" + meterLog1.get(0).getDisplay() +
          "</na>");
    out.println("<co>" + Tool.Date2Str(meterLog1.get(0).getDate(),"yyyy-MM-dd HH:mm:ss")+ "</co>");
    out.println("<na1>"+meterLog2.get(0).getDisplay()+
          "</na1>");
    out.println("<co1>" + Tool.Date2Str(meterLog2.get(0).getDate(),"yyyy-MM-dd HH:mm:ss")+ "</co1>");
    out.println("<na2>"+meterLog3.get(0).getDisplay()+
            "</na2>");
    out.println("<co2>" + Tool.Date2Str(meterLog3.get(0).getDate(),"yyyy-MM-dd HH:mm:ss")+ "</co2>");

  }


  out.println("</response>");
  out.close();
%>