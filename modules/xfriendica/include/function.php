<?php

	include_once dirname(dirname(__FILE__)).'/class/hash/hash.php';
	
	if (!function_exists('hash')) {
		function hash($data, $length = 64, $type='xoopscrc') {
			$objsHash = new FriendicaHash();
			return $objsHash->$type($data, array('length'=>$length));
		}
	}
	
?>