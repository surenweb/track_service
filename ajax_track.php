<?php
	include ("website.class.php");

	$task=isset($_POST['task'])? $_POST['task'] : "" ;

	if($task=='GetTrack')
	{
		$patrolID =isset($_POST['pid'])? $_POST['pid'] : "" ;
		$syncDate =isset($_POST['syncDate'])? $_POST['syncDate'] : "2010-10-10 10:10:10" ; // Else Get All 

		$website=new website; $db=$website->connect(); $website=null; 
		
		//Process Dump Patrols 
		$sql = "select RID,Lat,Lon,GpsDate,UploadTime from patrol_track 
				where PatrolID =$patrolID and UploadTime>'$syncDate' order by UploadTime ";
		
		//$sql = $sql. " LIMIT 3 ";
		$stmt=$db->prepare($sql);
		$data = $stmt->execute();
		$result=$stmt->fetchAll();
			
		$latLonStr ="";	
		foreach ($result as $row)
		{
			$syncDate = $row['UploadTime']; // For Sync Date 		
			$latLonStr .= ";".$row['Lat'].",".$row['Lon'].",".$row['GpsDate'];
		}
		echo $syncDate.$latLonStr;
	}


	function GetPatrol()
	{
		$website=new website; $db=$website->connect(); $website=null; 
		$sql = "select * from Patrol order by StartDate DESC";		
		
		$stmt=$db->prepare($sql);
		$data = $stmt->execute();
		$result=$stmt->fetchAll();
		
		return $result ;
		
	}
	function GetDefaultPoint ($pid)
	{
		$website=new website; $db=$website->connect(); $website=null; 
		$sql = "select * from Patrol_track where PatrolID =$pid LIMIT 1 ";		
		
		$stmt=$db->prepare($sql);
		$data = $stmt->execute();
		$row=$stmt->fetch(PDO::FETCH_ASSOC);
		
		$lat_lon="27.710257, 85.290433";
		
		if($row !=null )
		{
			$lat_lon = $row['Lat'].",".$row['Lon'] ;
		}
		return $lat_lon;
	}
?>