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
		$sql = " INSERT INTO patrol_track (RID,PatrolID,Lat,Lon,GpsDate,Accuracy) VALUES ".$data ;			
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
	
	
	//KEEP Un-Successful Queries in log 
	function KeepLog($strQuery)
	{
		//Create Log With Query 
		$errSql = str_replace("'","#Q#",$strQuery);		
		$logSql = "insert into v_error_log (ErrorSql) values ('".$errSql."')";
		$stmt=$db->prepare($logSql);
		$data = $stmt->execute();	
	}
	
?>