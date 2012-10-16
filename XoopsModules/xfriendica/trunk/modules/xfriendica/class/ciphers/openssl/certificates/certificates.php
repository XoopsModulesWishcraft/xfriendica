<?php

	class XFriendicaOpensslCertificatesHandler {
		
		static function serviceSigned() {
			if (	!file_exists(XOOPS_VAR_PATH.DS.'xfriendica'.DS.'pki'.DS.'public'.DS."server.crt")	||
					!file_exists(XOOPS_VAR_PATH.DS.'xfriendica'.DS.'pki'.DS.'private'.DS."server.key")) {
					return false;
			}
			return true;
		}
		
		static function loadServiceCertificate() {
			static $_server = null;
			if (XFriendicaOpensslCertificatesHandler::serviceSigned()) {
				if (!is_object($_server)) {
					$_server = new XFriendicaOpensslCertificates();
					$_server->server_public_key();
				}
				return $_server;
			}
		}
	}
	
	class XFriendicaOpensslCertificates {
		
		// SSL Certificates Variables
		var $_countryName = 'XX';
		var $_stateOrProvinceName = 'State';
		var $_localityName = 'SomewhereCity';
		var $_organizationName ='MySelf';
		var $_organizationalUnitName = 'Whatever';
		var $_commonName = 'mySelf';
		var $_emailAddress = 'user@example.com';
		var $_guid = '';
		var $_salt = '';
		
		// Settings
		var $_numberofdays = 1800;
		var $_passphrase = '';
		var $_private_key_bits = 1024;
		var $_private_key_type = OPENSSL_KEYTYPE_RSA;
		
		// Variables
		var $_handlers 		= 	array();
		var $_modeler 		= 	array(	'generate'		=> 		'generate',
										'mount'			=> 		'mount',
										'private'		=> 		'private',
										'public'		=> 		'public'	);
		
		
		// Certificatess
		var $_key 			=	'';
		var $_public_key 	= 	'';
		var $_private_key 	= 	'';
		
		function __construct() {
			foreach($this->_modeler as $id => $handler)	 {
				include_once (dirname(__FILE__).DS.$handler.'.php');
				$class = __CLASS__ . ucfirst($handler);
				if (class_exists($class)) {
					$this->_handlers[$handler] = new $class($this);
				}
			}
		}
		
		
		function getToken() {
			return md5($this->_salt.$this->_countryName.$this->_stateOrProvinceName.$this->_localityName.$this->_organizationName.$this->_organizationalUnitName.$this->_commonName.$this->_emailAddress.$this->_guid);
		}
		
		private function set_variable($variable, $var) {
			$this->$variable = $var;
		}
		
		private function get_variable($variable) {
			return $this->$variable;
		}
		
		function __call($type, $args) {
			if (substr($type, 0, 3)=='set'||substr($type, 0, 3)=='get') {
				$method = substr($type, 0, 3);
				$variable = substr($type, 4);
				if (isset($this->$variable)) {
					switch ($method) {
						case 'set':
							$this->set_variable($variable, $args[0]);
							break;
						case 'get':
							return $this->get_variable($variable);
							break;
					}
				} else {
					return false;
				}
			} else {
				foreach($this->_handlers as $id => $handler) {
					if (method_exists($handler, $type)) {
						if (empty($args)) {
							return $this->_handlers[$id]->$type();
						} elseif (count($args)==1) {
							return $this->_handlers[$id]->$type($args[0]);
						} elseif (count($args)==2) {
							return $this->_handlers[$id]->$type($args[0], $args[1]);
						} elseif (count($args)==3) {
							return $this->_handlers[$id]->$type($args[0], $args[1], $args[2]);
						} elseif (count($args)==4) {
							return $this->_handlers[$id]->$type($args[0], $args[1], $args[2], $args[3]);
						} elseif (count($args)==5) {
							return $this->_handlers[$id]->$type($args[0], $args[1], $args[2], $args[3], $args[4]);
						} elseif (count($args)==6) {
							return $this->_handlers[$id]->$type($args[0], $args[1], $args[2], $args[3], $args[4], $args[5]);
						} elseif (count($args)==7) {
							return $this->_handlers[$id]->$type($args[0], $args[1], $args[2], $args[3], $args[4], $args[5], $args[6]);
						} elseif (count($args)==8) {
							return $this->_handlers[$id]->$type($args[0], $args[1], $args[2], $args[3], $args[4], $args[5], $args[6], $args[7]);
						} elseif (count($args)==9) {
							return $this->_handlers[$id]->$type($args[0], $args[1], $args[2], $args[3], $args[4], $args[5], $args[6], $args[7], $args[8]);
						}
					}
				}
			}
		} 
	}