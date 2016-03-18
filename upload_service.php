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
	
	if($task=="register")
	{			
		$staffID = isset($_POST['staffID'])? $_POST['staffID'] : "";
		$phoneNo = isset($_POST['phoneNo'])? $_POST['phoneNo'] : "";
		$eMail = isset($_POST['eMail'])? $_POST['eMail'] : "";
		
		if(!($staffID>0) || strlen($phoneNo)<5 || strlen($eMail)<4 )
				die("0:invalid data");
		
		
		
		$sql = " INSERT INTO mobile (StaffID,PhoneNo,Email) ".
				" VALUES (".$staffID.",'".$phoneNo."','".$eMail."')";
				
		$stmt=$db->prepare($sql);
		$op = $stmt->execute();		
		if($op)
		{	
			$sql = " Select ID FROM mobile WHERE StaffID= '".$staffID."' ORDER BY ID DESC LIMIT 1 ";				
			$stmt=$db->prepare($sql);
			$data = $stmt->execute();
			$row=$stmt->fetch(PDO::FETCH_ASSOC);
			if($row[0]>0)
			{	
				echo $row[0].": Mobile ID Created ."; 
			}
			else
			{	
				echo "0: Mobile Id can't fetch from server (created).";				
			}	
						
		}
		else
		{	
			echo "0: Unable to insert data.";
			KeepLog($sql);			
		}	
		
		
	}
	
	if($task=="register_verify")
	{			
		$staffID = isset($_POST['staffID'])? $_POST['staffID'] : "";
		$mobileID = isset($_POST['mobileID'])? $_POST['mobileID'] : "";
				
		if(!($staffID>0) || !($mobileID>0)  )
				die("0:invalid data");
		
		$sql = " Select IsActive FROM mobile WHERE ID= '".$mobileID."')";
				
		$stmt=$db->prepare($sql);
		$data = $stmt->execute();
		$row=$stmt->fetch(PDO::FETCH_ASSOC);
		
		if($row[0]==1)
		{	echo "1: Verified in database ."; 
		}
		else
		{	
			echo "0: mobile not verified .";				
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