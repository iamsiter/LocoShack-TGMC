<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
html, body,table
{
  height: 100%;
  width:100%;
}
</style>
</head>
<body style="margin-top:0px;margin-left:0px;margin-right:0px">
<table width="100%" cellpadding="0" cellspacing="0"   style="background-color:#FFFFCC">

<tr height="60px"><td><jsp:include page="accheader.jsp"></jsp:include></td></tr>
<tr><td>
<%

String q1=request.getParameter("q1");
String q2=request.getParameter("q2");
String q3=request.getParameter("q3");
String q4=request.getParameter("q4");
String q5=request.getParameter("q5");

String surdes=request.getParameter("surdes");
String city=(request.getParameter("city")).toUpperCase();
StringBuffer sb = new StringBuffer();  
for (int x = 0; x <8; x++)  
{  
  sb.append((char)((int)(Math.random()*26)+97));  
}  
String surveyid=sb.toString(); 
String imgid=(String)session.getAttribute("imgid");
String userid=(String)session.getAttribute("userid");
try{
Connection con;
Statement st;
Class.forName("com.ibm.db2.jcc.DB2Driver");
con = DriverManager.getConnection("jdbc:db2://localhost:50000/GEO","db2admin","tgmc");
st=con.createStatement();
int i=st.executeUpdate("insert into db2admin.surveymap values('"+surveyid+"','"+imgid+"','"+userid+"','"+city+"')");
st.close();
Statement st1=con.createStatement();
int j=st1.executeUpdate("insert into db2admin.survey_que values('"+surveyid+"','"+surdes+"','"+city+"','"+q1+"','"+q2+"','"+q3+"','"+q4+"','"+q5+"')");
if((i==1)&&(j==1))
{
%>

<center><b>Survey has been created and is now open!!</b></center><br/>
<center>Your survey id is:<%=surveyid %></center><br/>
<center>Remember it for future reference and to check results</center>	
<%
}
}
catch(Exception e)
{
out.println(e);	
}

%>
</td></tr>
<tr height="80px"><td><jsp:include page="footer.jsp"></jsp:include></td></tr>
</table>
</body>
</html>