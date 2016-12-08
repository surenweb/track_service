<?php
	include ("../../class/website.class.php"); // Parent Database Connection Class 
	include ("common.php"); // Has Common Functions 
	$website=new website; $db=$website->connect(); $website=null; 

	$task=isset($_POST['task'])? $_POST['task'] : "" ;
	$value=isset($_POST['value'])? $_POST['value'] : "" ;

	$message="";
	$data=null;
	$status=0;
	
	if($task=="" || $value=="")
	{		
		$message="No data received at server";
		ReturnJSON($message,$data,$status); die();		
	}

	//Upload event 
	if($task=="upload")
	{	
		$sql = " INSERT INTO event (RID,MobileID,Event,EventDetail,EventImage,Lat, Lon, Accuracy,CreatedDate)".
				" VALUES ".$value ;			
		$stmt=$db->prepare($sql);
		$op = $stmt->execute();		
		if($op)
		{				
			$status=1;
		}
		else
		{	
			$message = "unable to insert in server database."; 			
			KeepLog($sql);			
		}	
	}

	//Return JSON object
	ReturnJSON($message,$data,$status);	
?>