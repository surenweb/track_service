<?php
	include ("website.class.php");

	$task=isset($_POST['task'])? $_POST['task'] : "" ;
	$data=isset($_POST['data'])? $_POST['data'] : "" ;

	if($task=="" || $data=="")
	{
		die("0: No data received at server ");
	}
	$website=new website; $db=$website->connect(); $website=null; 
	
	
	//## Upload Patrol 
	if($task=="patrol")
	{		
		$sql = " INSERT INTO patrol (RID,MobileID,CaseTitle,PatrolType,PatrolOn,TotalNafri,StartDate,EndDate) 
					VALUES ".$data ;					
		$stmt=$db->prepare($sql);
		$op = $stmt->execute();
		
		if($op)
		{	echo "1: inserted in database ."; 
		}
		else
		{	
			echo "0: Unable to insert data.";
			KeepLog($sql);
		}	
	}
	
	//Upload Track 
	if($task=="track")
	{	 
		$sql = " INSERT INTO patrol_track (RID,MobileID,PatrolID,Lat,Lon,GpsDate,Accuracy) VALUES ".$data ;			
		$stmt=$db->prepare($sql);
		$op = $stmt->execute();		
		if($op)
		{	echo "1: inserted in database ."; 
		}
		else
		{	
			echo "0: Unable to insert data.";
			KeepLog($sql);			
		}	
	}
	
	//Upload event 
	if($task=="event")
	{	
		$sql = " INSERT INTO event (RID,MobileID,Event,EventDetail,EventImage,Lat, Lon, Accuracy,CreatedDate)".
				" VALUES ".$data ;			
		$stmt=$db->prepare($sql);
		$op = $stmt->execute();		
		if($op)
		{	echo "1: inserted in database ."; 
		}
		else
		{	
			echo "0: Unable to insert data.";
			KeepLog($sql);			
		}	
	}
	
	//Upload Image 
	if($task=="image")
	{			
		$file_name = isset($_POST['file_name'])? $_POST['file_name'] : date("Y_m_d_His");
		
		try {
			$binary=base64_decode($data);
			header('Content-Type: bitmap; charset=utf-8');
			$file = fopen('uploads/'.$file_name.'.jpg', 'wb');
			fwrite($file, $binary);
			fclose($file);
			echo '1:Image upload complete!! ';
		}		
		catch(Exception $e) {
			echo '0: Error writing image :' .$e->getMessage();
		}		
		
	}
	
	//KEEP Un-Successful Queries in log 
	function KeepLog($strQuery)
	{
		//Create Log With Query 
		$website=new website; $db=$website->connect(); $website=null; 
		$errSql = str_replace("'","#Q#",$strQuery);		
		$logSql = "insert into v_error_log (ErrorSql) values ('".$errSql."')";
		$stmt=$db->prepare($logSql);
		$data = $stmt->execute();	
	}
	
?>