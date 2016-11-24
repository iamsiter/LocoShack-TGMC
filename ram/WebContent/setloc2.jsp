<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
 
 
 
<head> 
 
 
<style type="text/css"> 
 
table
{
width:400px;
}
</style> 
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
 <script language="JavaScript" src="http://j.maxmind.com/app/geoip.js"></script>
 <script type="text/javascript">
   
 function retreat()
 {
	 
	 opener.document.myform.lat.value =  document.locform.lat.value;
	 opener.document.myform.lon.value =  document.locform.lng.value;
	 
	 
	 self.close(); 
	 
 }
 
 </script>
<script type="text/javascript"> 
var geocoder = new google.maps.Geocoder();
var marker;
var latLng;
function geocodePosition(pos) {
  geocoder.geocode({
    latLng: pos
  }, function(responses) {
    if (responses && responses.length > 0) {
      updateMarkerAddress(responses[0].formatted_address);
    } else {
      updateMarkerAddress('Cannot determine address at this location.');
    }
  });
}
 
function updateMarkerStatus(str) {
  document.getElementById('markerstatus').innerHTML = "";
}
 
function updateMarkerPosition(latLng) {
  document.getElementById('lat').value = 
    latLng.lat();
    document.getElementById('lng').value = latLng.lng();
  
}
 
function code(){
 
 // Update current position info.
  updateMarkerPosition(latLng);
  geocodePosition(latLng);
  
  // Add dragging event listeners.
  google.maps.event.addListener(marker, 'dragstart', function() {
    updateMarkerAddress('Dragging...');
  });
  
  google.maps.event.addListener(marker, 'drag', function() {
    updateMarkerStatus('Dragging...');
    updateMarkerPosition(marker.getPosition());
  });
  
  google.maps.event.addListener(marker, 'dragend', function() {
    updateMarkerStatus('Drag ended');
    geocodePosition(marker.getPosition());
  });
 
 
}
function updateMarkerAddress(str) {
  document.getElementById('address').value = str;
}
 
function initialize() {
   latLng = new google.maps.LatLng((geoip_latitude()), (geoip_longitude()));
  var map = new google.maps.Map(document.getElementById('mapCanvas'), {
    zoom:5,
    center: latLng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
   marker = new google.maps.Marker({
    position: latLng,
    title: 'You are here',
    map: map,
    draggable: true
  });
 
 code()
}
 
 
 
 
 
// Onload handler to fire off the app.
google.maps.event.addDomListener(window, 'load', initialize);
 
 //function for switching mode
  function str() {
var lat = document.getElementById('lat').value
 var lng = document.getElementById('lng').value
latLng = new google.maps.LatLng(lat,
lng);
 
  var panoramaOptions = {
      position:latLng,
      pov: {
        heading: 270,
        pitch:0,
        zoom:1
      }
    };
 
    var myPano = new google.maps.StreetViewPanorama(document.getElementById("mapCanvas"), panoramaOptions);
    myPano.setVisible(true);
 marker = new google.maps.Marker({
        position: latLng, 
        map: myPano,
        draggable: true
    });  
 
  
 code();
}
  //function for street view
function backtomap(){
var lat = document.getElementById('lat').value
 var lng = document.getElementById('lng').value
latLng = new google.maps.LatLng(lat,
lng);
 
 
 var map = new google.maps.Map(document.getElementById('mapCanvas'), {
    zoom: 12,
    center: latLng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
   marker = new google.maps.Marker({
    position: latLng,
    title: 'Point A',
    map: map,
    draggable: true
  });
 
 
 code()
}
 
</script> 
</head> 
 
<body> 
 
  <div style="width:620px;height:1000px"> 
  <div id="mapCanvas" style="width:430px;height:300px;float:left;"></div> 
  
<div id="markerstatus"></div> 
<div style="float:left;width:430px;"> 
<br/>
<form action="" method="post" name="locform"> 
<div><button  style="width:145px; align:left"type="button" onclick="str()">Street View</button> 
<button style="width:145px;align:right;"type="button" onclick="backtomap()">Road Map</button></div> 
<br/> 
<table style="width:in.jsp400px"> 
<tr> 
 
<td width="200px">Marker Position :</td><td><input id="lat" type="text" name="lat" size="18" value=""/></td> 
<td><input id="lng" type="text" name="lng" size="18" value=""/></td> 
</tr> 
<tr> 
<td>Current Address:</td><td colspan="2"><input id="address" name="address" type="text" size="41"/></td> 
</tr> 
<tr><td><input type="submit" value="SET LOCATION" onclick="retreat()"></td></tr>
</table> 
</form> 
</div> 
    
  
 
</div> 
</div> 
</body> 
</html> 