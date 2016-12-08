<?php
	include ("../../class/website.class.php"); // Parent Database Connection Class 
	include ("common.php"); // Has Common Functions 
	$website=new website; $db=$website->connect(); $website=null; 	

	$task=isset($_POST['task'])? $_POST['task'] : "";;	

	$message="";
	$data=null;
	$status=0;
	
	if($task=="")
	{		
		$message="No data received at server";
		ReturnJSON($message,$data,$status); die();		
	}
	
	if($task=="register")
	{			
		$staffID = isset($_POST['staffID'])? $_POST['staffID'] : "";
		$passCode = isset($_POST['passCode'])? $_POST['passCode'] : "";
		$phoneNo = isset($_POST['phoneNo'])? $_POST['phoneNo'] : "";
		$email = isset($_POST['email'])? $_POST['email'] : "";
		
		if(!($staffID>0) || strlen($phoneNo)<5 || strlen($email)<4 )
		{
			$message="Invalid Data";
			ReturnJSON($message,$data,$status); die();	
		}	
		
		//IS Already Registered ??
		$sql = " SELECT ID,PhoneNo,Email,IsActive FROM mobile where ".
				" StaffID='".$staffID."'";
				
		$stmt=$db->prepare($sql);
		$op = $stmt->execute();	
		$row=$stmt->fetch(PDO::FETCH_ASSOC);
		
		if($row!=null)  // RETURN 
		{
			$data = $row;
			$message= "Mobile Already registered.";	
			$status = 1;
			ReturnJSON($message,$data,$status); die();	
		}
		//INSERT AND RETURN 
		$sql = " INSERT INTO mobile (StaffID,PassCode,PhoneNo,Email) ".
				" VALUES (".$staffID.",'".$passCode."','".$phoneNo."','".$email."')";
		$stmt=$db->prepare($sql);
		$op = $stmt->execute();		
		if($op)
		{	
			$sql = " Select ID,PhoneNo,Email,IsActive FROM mobile ". 
						" WHERE StaffID= '".$staffID."' ORDER BY ID DESC LIMIT 1 ";						
			$stmt=$db->prepare($sql);
			$op = $stmt->execute();
			$row=$stmt->fetch(PDO::FETCH_ASSOC);
			if($row["ID"]>0)
			{	
				$status = 1; 
				$data = $row;				
			}
			else
			{	
				$message= "Mobile Id can't fetched from server (created).SQL : ".$sql ;				
			}	
						
		}
		else
		{	
			$message= "Unable to insert ' 'data in server database.SQL:".$sql;
			KeepLog($sql);			
		}	
				
	}	
	else if($task=="register_verify")
	{			
		$staffID = isset($_POST['staffID'])? $_POST['staffID'] : "";
		$mobileID = isset($_POST['mobileID'])? $_POST['mobileID'] : "";
				
		if(!($staffID>0) || !($mobileID>0)  )
		{	$message="Invalid Data";
			ReturnJSON($message,$data,$status); die();	
		}
		
		$sql = " Select ID,PhoneNo,Email,IsActive FROM mobile WHERE StaffID= '".$staffID."' ";
				
		$stmt=$db->prepare($sql);
		$op = $stmt->execute();
		$row=$stmt->fetch(PDO::FETCH_ASSOC);		
		if($op)
		{	
			$data= $row;
			$status= 1;
			
		}
		else
		{
			$message= "Unable to execute query. SQL:".$sql;
		}
		
	}
	else if($task=="login")
	{
		$staffID = isset($_POST['staffID'])? $_POST['staffID'] : "";
		$passCode = isset($_POST['passCode'])? $_POST['passCode'] : "";
		
		if(!($staffID>0) || strlen($passCode)<4 )
		{
			$message="Invalid Data";
			ReturnJSON($message,$data,$status); die();	
		}	
		$sql = " SELECT ID,PhoneNo,Email,IsActive FROM mobile where ".
				" StaffID='".$staffID."' AND PassCode='".$passCode."'";
				
		$stmt=$db->prepare($sql);
		$op = $stmt->execute();	
		$rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
		if($op)
		{
			$status= 1;
			if(sizeof($rows)>0)
			{
				$data = $rows[0];				
			}
			else
			{			
				$message= "staff ID or password didn't matched";		
			}	
		}
		else
		{
			$message= "Unable to execute query. SQL:".$sql;
		}
		
		
	}
	
	// Return JSON object
	ReturnJSON($message,$data,$status); 
	
?>