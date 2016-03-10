<?php 
	$patrolID = isset($_GET['pid'] )? $_GET['pid'] : 0 ;
	include ("ajax_track.php");
	$lat_lon = GetDefaultPoint($patrolID);
	
	//Server Changes 
	
	//local changes 
	
?>
<html>
<head>

	<style>
		html,
		body,
		.map-wrapper {
			margin: 10px auto;		
		}
		.side-bar {
			width:25%;
			float:left;	
		}
		#map-canvas {
			height: 600px;		
			padding: 0;
			width: 70%;
		}
	</style>



	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

</head>

	<script>

	var marker_dot = new google.maps.MarkerImage('images/marker_dot.png', new google.maps.Size(38, 38),
					new google.maps.Point(0, 0),new google.maps.Point(19, 19));
				
	var marker_start = new google.maps.MarkerImage('images/marker_start.png', new google.maps.Size(38, 38),
					new google.maps.Point(0, 0), new google.maps.Point(19, 19));
					
	var marker_end = new google.maps.MarkerImage('images/marker_end.png', new google.maps.Size(38, 38),
						new google.maps.Point(0, 0),new google.maps.Point(19, 19));
						
	var map; 
	var markerArray = new Array();
	var path = [];
	var line ;



	$(document).ready (function () {
		 LoadMap (<?php echo $lat_lon ; ?>); //## SET MAP ON DEFAULT LAT-LON
		 markerArray = new Array();
	});

		function LoadMap(lat,lon)
		{
			var myLatlng = new google.maps.LatLng(lat,lon);
			var mapOptions = {
				zoom: 16,
				center: myLatlng
			}
			map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);   
		}	
		
		function addMarker(title, x, y,gpsDate,use_marker) {
						
			var m_image ;
			if(use_marker=="S")
				m_image = marker_start;
			else if (use_marker=="E")
				m_image = marker_end;
			else
				m_image = marker_dot;
			
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(x, y),
				map: map,
				icon: m_image,
				title: title
			});
			
			
			//##Previous Marker 
			if(markerArray.length==1)
				markerArray[0].setIcon(marker_start);
			else if(markerArray.length>1) 
				markerArray[markerArray.length-1].setIcon(marker_dot);
			
			var infowindow = new google.maps.InfoWindow({
				content: gpsDate
			});

			marker.addListener('click', function() {
				infowindow.open(map, marker);
			});
			
			return marker;
		}
		
		function DrawLine()
		{
			line = new google.maps.Polyline({
					path: path,
					strokeColor: "#FF0000",
					strokeOpacity: 1.0,
					strokeWeight: 1,
					geodesic: true,
					map: map
			});
		}

		(function worker() {	 
			var strSyncDate = $('#txtSyncDate').val();
			
			$.ajax({
				url: "ajax_track.php",
				async: true,
				type: "POST",
				data: { task: "GetTrack", pid: <?php echo $patrolID ;?>,syncDate: strSyncDate },
				success: function (resData) {
				   
					var arrPoint = resData.split(";");
					var stime = arrPoint[0];
					if(stime.length > 2 )
							$("#txtSyncDate").val(stime);
					for( i=1; i< arrPoint.length ; i++ ) {
						
						var arrLatLon = arrPoint[i].split(",");
						var latitude =  arrLatLon[0];
						var longitude = arrLatLon[1];
						var gpsDate = arrLatLon[2];
						
						var use_marker ;
						if(i==1)
							use_marker ="S";
						else if (i== arrPoint.length-1)
							use_marker = "E";
						else 
							use_marker = "D";
						
						markerArray[markerArray.length] = addMarker('marker',latitude,longitude,gpsDate,use_marker );
						path.push(new google.maps.LatLng(parseFloat(latitude), parseFloat(longitude)));
						// alert ("marker length: "+markerArray.length);
					}				
				},       
				complete: function() {
				  // Schedule the next request when the current one's complete
				  DrawLine();
				  setTimeout(worker, 5000);  //5000=5sec 
				}
			});
		})();
	</script>

<body>

	<div class ="map-wrapper">
	<div class="side-bar">
		<h3> Patrol </h3>
		<ul>
		<li>&nbsp; </li>
			<?php 
			$result = GetPatrol(); 
			foreach ($result as $row)
			{				
				echo '<li><a href="index.php?pid='.$row['RID'].'" > '. $row['CaseTitle']. '</a> </li>';
			}
			?>
		</ul>
	</div>
	<div id="map-canvas" style="border: 2px solid #3872ac;"></div>
	<input type ="text" id="txtSyncDate" readonly />
</body>

</html>
