<?php 
session_start();
include_once 'admin/includes/conn.php';
$sesssionid = session_id();

$siteurl=SITE_URL;
session_destroy();

header("location: $siteurl");
?>