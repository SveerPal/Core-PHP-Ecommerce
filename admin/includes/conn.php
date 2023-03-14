<?php

Class Database{
 
	private $server = "mysql:host=localhost;dbname=al-pasban";
	private $username = "alpasbanroot";
	private $password = "zkMFTV[(f[_k";
	private $options  = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,);
	protected $conn;
 	
	public function open(){
 		try{
 			$this->conn = new PDO($this->server, $this->username, $this->password, $this->options);
 			return $this->conn;
 		}
 		catch (PDOException $e){
 			echo "There is some problem in connection: " . $e->getMessage();
 		}
 
    }
 
	public function close(){
   		$this->conn = null;
 	}
 
}

$pdo = new Database();

define('CURRENCY','₹'); 
define('SITE_URL','https://www.alpasban.com/'); 
define('ADMIN_URL','https://www.alpasban.com/admin/'); 
define('UPLOADS','https://www.alpasban.com/admin/uploaded_files/');
define('GST',12); 
?>