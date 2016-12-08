<?php
	include ("../../class/website.class.php"); // Parent Database Connection Class 
	include ("common.php"); // Has Common Functions 

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
		
	$website=new website; $db=$website->connect(); $website=null; 	
	//Upload Image 
	if($task=="upload")
	{			
		$file_name = isset($_POST['file_name'])? $_POST['file_name'] : date("Y_m_d_His");
		
		try {
			$binary=base64_decode($value);
			header('Content-Type: bitmap; charset=utf-8');
			$file = fopen("../../uploads/"+$file_name, 'wb');
			fwrite($file, $binary);
			fclose($file);
			$status=1;			
		}		
		catch(Exception $e) {
			$message= "Error writing image :" .$e->getMessage();
		}		
		
	}
	
	//Return JSON object
	ReturnJSON($message,$data,$status);
	
?>