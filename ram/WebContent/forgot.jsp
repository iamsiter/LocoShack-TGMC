<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LocoShack-Forgot Password</title>
<style>
html, body,table
{
  height: 100%;
}

</style>

<!-- SCRIPTS GO HERE -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

<script type="text/javascript" language="javascript">
var user=document.getElementById("un");
function check()
{
	if((document.myform.un.value.length==0)||(document.myform.textar.value.length==0)||(document.myform.ans.value.length==0))	

	{
	alert("ALL * FIELDS ARE MANDATORY");
	return false;
	}

	
	}
	</script>
<script type="text/javascript" language="javascript">
var user=document.getElementById("un");
function digq()
{
	
	$.post("Digques.jsp",user,function(data){
		$('textarea').html(data).show();
	});
		
	
}
</script>
</head>


<body  style="margin-left:0px;margin-right:0px;margin-top:0px;" >
<table width="100%" cellpadding="0px" cellspacing="0px" >
<form   action="xyz.jsp" method="post" name="myform" onsubmit="return check();" >
<tr height="50px"><td><jsp:include page="header.jsp"></jsp:include></td></tr>
<tr height="100%" style=" background-image:url(images/Green-cloth-texture.jpg)"><td>
<center><b><h2>Forgot Password</h2></b></center><br/>
In case you forgot your password fill in this form and press 'submit'.We will revert back to your email address as soon as possible<br/>
If you face any problem ,then we are just an email away.Write to <a href="mailto:sahilsachdeva2005@gmail.com.">custcare@locoshack.com</a>
<br/><br/><br/>


&nbsp;&nbsp;&nbsp;<b>Username:</b><input type="text" id="un" name="un"><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="digq()" href="#"><font color="black">Retrieve your security question<font></font></a><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="5" cols="20"  id="textar" name="textar"></textarea><br/><br/><br/>
&nbsp;&nbsp;&nbsp;<b>Answer:&nbsp;&nbsp;&nbsp;&nbsp;</b><input type="text" id="ans" name="ans"><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="SUBMIT"  >





</td></tr>
<tr height="80px"><td><jsp:include page="footer.jsp"></jsp:include></td></tr>
</form>
</table>

</body>
</html>
<!-- DATABASE CONNECTIVITY AND REDIRECT TO LOGIN PAGE STILL REMAINS,alert also on new page,form action new page -->