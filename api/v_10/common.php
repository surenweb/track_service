<?php
	
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
	
	//ReturnJSON 
	function ReturnJSON($argMessage,$argValue,$argStatus)
	{
		header('Content-Type: application/json');
		$objReturn =(object)["Message"=>$argMessage,"Data"=>$argValue,"Status"=>$argStatus];
		echo json_encode($objReturn);
		
	}
	//Escape String 
	function SQ($argStr){
		$argStr = str_replace("'","\'",$argStr);
		$argStr = str_replace('"','\"',$argStr);
		return $argStr;
	}
	
?>