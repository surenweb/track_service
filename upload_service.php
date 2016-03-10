<?php
include ("website.class.php");

$task=isset($_POST['task'])? $_POST['task'] : "" ;
$data=isset($_POST['data'])? $_POST['data'] : "" ;

if($task!='')
{
	$website=new website; $db=$website->connect(); $website=null; 	
	$sql = "";
	if($task=="patrol")		
		$sql = " INSERT INTO patrol (RID,MobileID,CaseTitle,PatrolType,PatrolOn,TotalNafri,StartDate,EndDate) VALUES ".$data ;
	else if ($task=="track")	
		$sql = " INSERT INTO patrol_track (RID,PatrolID,Lat,Lon,GpsDate,Accuracy) VALUES ".$data ;
		
	$stmt=$db->prepare($sql);
	$data = $stmt->execute();
	if($data)
	{	echo "1"; 
	}
	else
	{	
		echo "0";
		//Create Log With Query 
		$errSql = str_replace("'","#Q#",$sql);		
		$logSql = "insert into v_error_log (ErrorSql) values ('".$errSql."')";
		$stmt=$db->prepare($logSql);
		$data = $stmt->execute();	
	}
	
	
	
}
?>