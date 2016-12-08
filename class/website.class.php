<?php
  class website {
    //Template Configuration
    private $templates= array("2070", "redbull");
    public $template;
    
    //Database Configuration
    private $host;                 //Database host to connect to fetch events
    private $user;                 //Database user to connect to fetch events
    private $password;             //Database password to connect to fetch events
    private $db;                   //Database password to connect to fetch events
    private $engine;
	
    function website() {	
	 
	  $this->host = "localhost";
      $this->user = "root";
      $this->password = "";
      $this->db = "db_track";
      $this->engine = "mysql"; 

	 
    }
   
   function connect(){
        try { // Connecting with MySQL
            $dbHandler = new PDO("mysql:dbname={$this->db};" .
                "host={$this->host}", $this->user, $this->password);
        } catch (PDOException $e) {
            throw new Exception("Connection to MySQL failed with message: " .
                $e->getMessage(), 3);
				//die();
        }
        $dbHandler->exec("SET NAMES utf8"); // Fix for always-unicode output
        $dbHandler->setAttribute(PDO::ATTR_ORACLE_NULLS, PDO::NULL_NATURAL);
        return $dbHandler;
    }
  }
?>