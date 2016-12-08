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
	
	//## Upload Patrol 
	if($task=="upload")
	{		
		$sql = " INSERT INTO patrol (RID,MobileID,CaseTitle,PatrolType,PatrolOn,TotalNafri,StartDate,EndDate) 
					VALUES ".$value ;					
		$stmt=$db->prepare($sql);
		$op = $stmt->execute();
		
		if($op)
		{	
			$status= 1; 
		}
		else
		{	
			$message= "Unable to insert data.";
			KeepLog($sql);
		}	
	}
	
	//Return JSON object
	ReturnJSON($message,$data,$status);
	?>