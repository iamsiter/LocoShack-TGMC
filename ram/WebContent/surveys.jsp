<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LocoSchack-Surveys!</title>
<style>
html, body,table
{
  height: 100%;
}
</style>
</head>
<body>
<table width="100%" cellpadding="0px" cellspacing="0px">
<tr height="80px"><td><jsp:include page="header.jsp" ></jsp:include></td></tr>

<tr height="100%" style=" background-image:url(images/Green-cloth-texture.jpg)"><td>
<b><center><h2>Surveys @ LocoShack</h2></center></b><br/><br/>
Surveys is  yet another functionality that LocoShack offers to the people to conduct survey for their places and know how much users are acquainted about their place and what knowledge they have about that place.
It is a free service which returns results in graphical format,excel format(record of results).<br/><br/>
You need to be registered at LocoShack.If you are not a member then <a href="signup.jsp">SIGN UP</a><br/>
If yes then <a href="login.jsp">LOGIN</a> and check the results if you have created a survey.

<br/>
<h4><b>How to create a survey?</b></h4><br/>
Survey can be easily created on any image that you want.Just upload the image on which you want the survey to be conducted<br/>
Add some description about the image and write some question(maximum/minimum limit is 5)<br/>
The answers are fixed as POOR,AVERAGE,GOOD,EXCELLENT,OUTSTANDING.
<br/>
User selects one of the answers for each question and submits the survey!!




</td></tr>
<tr height="50px"><td><jsp:include page="footer.jsp"></jsp:include></td></tr>
</table>

</body>
</html>