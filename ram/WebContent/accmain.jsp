<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LocoShack-Welcome</title>
<style>
html, body,table
{
  height: 100%;
  width:100%;
}
img#prof{
width:159px;
height:180px;
}


body {margin: 0; padding: 0; background: #ccc;}
.layout {width: 100%; border: none; background: #e6e6e6;}
.layout td {vertical-align: top;}


</style>






</head>
<body style="margin-top:0px;margin-left:0px;margin-right:0px">
<table  width="100%" cellpadding="0" cellspacing="0"   style="background-color:#FFFFCC">
<tr height="60px"><td colspan="4"><jsp:include page="accheader.jsp"></jsp:include></td></tr>
<tr height="40px"><td colspan="3">&nbsp;</td></tr>
<%

String un=(String)session.getAttribute("id");
String pwd=(String)session.getAttribute("pass");
try{
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/GEO","db2admin","tgmc");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from db2admin.userdata where un='"+un+"' and pwd='"+pwd+"'");
    while (rs.next()) {
        String srcstr;       
        String fn = (rs.getString("fn")).toUpperCase();
        String ln = (rs.getString("ln")).toUpperCase();
        String sex = (rs.getString("sex")).toUpperCase();
        String dob = rs.getString("dob");
        String city = (rs.getString("city")).toUpperCase();
        String cont = (rs.getString("cont")).toUpperCase();
 
        
        %>   
 
<tr>
<td class="column" width="20%" style="padding-top:2px;padding-left:30px;">
<!--left column here-->


<img id="prof" src="images/dp.jpg">



<br/><br/><br/><div><a href="editprof.jsp">+Edit Profile</a></div>
</td>
<td valign="top" class="content" style="padding-top:0px;">
<center><b>WELCOME TO LocoShack</b></center><br/><br/>
<b>Name:</b><%=fn%>&nbsp;<%=ln %><br/>
<b>Username:</b><%=un %><br/>
<b>Sex:</b><%=sex%><br/>
<b>Dob:</b><%=dob %><br/>
<b>City:</b><%=city %><br/>
<b>Country:</b><%=cont %><br/><br/>
<div align="center"><input id="but" type="button" value="Upload photo" onclick="window.location='uploadphoto.jsp'">&nbsp;<input type="button" id="but" value="Take survey" onclick="window.location='takesurvey.jsp'">&nbsp;<input type="button" id="but" value="Show credits" onclick="window.location='showcredits.jsp'">&nbsp;<input type="button" id="but" value="Create survey" onclick="window.location='createsurvey.jsp'">&nbsp;<input type="button" id="but" value="Survey results" onclick="window.location='surveyresults.jsp'"></div>
</td>
</tr>
<tr height="40px"><td colspan="3">&nbsp;</td></tr>
<tr height="50px"><td colspan="4"><jsp:include page="footer.jsp"></jsp:include></td></tr>

<%      
    }
	
}


catch(Exception e)
{
out.println("FATAL ERROR");
out.println(e);
}


%>


</table>
</body>
</html>