<?php
/**
 * XOOPS checksum handler
 *
 * You may not change or alter any portion of this comment or credits
 * of supporting developers from this source code or any supporting source code
 * which is considered copyrighted (c) material of the original comment or credit authors.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * @copyright       The XOOPS Project http://sourceforge.net/projects/xoops/
 * @license         GNU GPL 2 (http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)
 * @package         kernel
 * @since           2.5.5
 * @author          Simon Roberts (AKA wishcraft) http://www.chronolabs.com.au/
 * @version         $Id: xoopshash.php 8066 2012-09-08 12:19:00Z wishcraft $
 */

/**
 * A checksum Class for hashing data.
 *
 * @abstract
 */
class XFriendicaCiphers {
	
	// Child Checksum/Ciphers Storage
	var $_class = array();
	
	// Errors Storage Mechanism
	var $_errors = array();
	
	// Last Checksum Calculated
	var $_data = '';
	
	// Last Type Cipherses/Checksums Used
	var $_type = 'php';
	
	// Default Options for the Preset Cipherses/Checksums
	var $_options = array(	'php'		=>	array('algorithm'=>'aes'),
							'mcrypt'	=>	array('algorithm'=>'tripledes'),
							'openssl'	=>	array()
					);
		
	private static $_vars = array(	'class' 	=>		array(),
									'data'		=>		'',
									'type'		=>		'php',
									'options'	=>		array(	'php'		=>	array('algorithm'=>'aes'),
																'mcrypt'	=>	array('algorithm'=>'tripledes'),
																'openssl'	=>	array())
							);
	
    /**
     * Constructor
     *
     * @param string $data
     * @param string $type
     * @param array $options
     */
     function __construct() {
		foreach($this->_options as $package => $options) {
			$this->setType($package);
		}
	}

	/**
	 * function __call
	 * magic method for calling checksum types as a function
	 *
	 * ie.
	 * 		$objsCiphers = new XFriendicaCiphers();	// Instanciate the Object
	 * 		$objsCiphers->md5($data); 		// Returns MD5 Checksum
	 * 		$objsCiphers->sha1($data); 		// Returns SHA1 Checksum
	 *  	$objsCiphers->xoopscrc($data); 	// Returns XoopsCrc Checksum
	 *   	$objsCiphers->password($data); 	// Returns Password Checksum
	 *   
	 * @param string $type
	 * @param array $args
	 */
	function __call($type, $args) {
		$parts = array();
		foreach($this->_class as $type => $handler) {
			if (substr($type, 0, strlen('encrypt_'))=='encrypt_') {
				$parts = explode('_', $type);
			} elseif (substr($type, 0, strlen('decrypt_'))=='decrypt_') {
				$parts = explode('_', $type);
			}
			if (count($parts)==2 && method_exists($handler, $type)) {
				return $handler->{$type}($args[0], $args[1]);
			}
		};
	}
	
	/**
	 * function __callStatic
	 * magic method for calling checksum statically as types in function
	 *
	 * ie.
	 * 		XFriendicaCiphers::md5($data); 			// Returns MD5 Checksum
	 * 		XFriendicaCiphers::sha1($data); 		// Returns SHA1 Checksum
	 *  	XFriendicaCiphers::xoopscrc($data); 	// Returns XoopsCrc Checksum
	 *   	XFriendicaCiphers::password($data); 	// Returns Password Checksum
	 *
	 * @param string $type
	 * @param array $args
	 */
	function __callStatic($type, $args) {
		if (empty($args[1])&&isset(self::$_vars['options'][$type]))
			$args[1] = self::$_vars['options'][$type];
		return self::calcStatic($args[0], $type, $args[1]);
	}
	
	/**
	 * function calc 
	 * For calculating a hash/checksum after class is instanciated
	 *
     * @param string $data
     * @param string $type
     * @param array $options
 	 */
	function encrypt($data, $salt = '', $type = 'php') {
		if (isset($this->_class[$type])) {
			$this->_type = $type;
		} elseif ($this->setType($type)) {
			$this->_type = $type;
		}
		if (is_object($this->_class[$type]))
			return $this->_class[$type]->encrypt($data, $salt);
		else
			$this->_errors[] = 'Error: XFriendicaCiphers Class Not Set';
		return false;
	}

	/**
	 * function calc 
	 * For calculating a hash/checksum after class is instanciated
	 *
     * @param string $data
     * @param string $type
     * @param array $options
 	 */
	function decrypt($data, $salt = '', $type = 'php') {
		if (isset($this->_class[$type])) {
			$this->_type = $type;
		} elseif ($this->setType($type)) {
			$this->_type = $type;
		}
		if (is_object($this->_class[$type]))
			return $this->_class[$type]->decrypt($data, $salt);
		else
			$this->_errors[] = 'Error: XFriendicaCiphers Class Not Set';
		return false;
	}
	
	/**
	 * private function setType
	 * For load a child Class and instaniating it
	 *
	 * @param string $type
	 * @param string $data
	 * @param array $options
	 */	
	private function setType($type) {
		if (file_exists(dirname(__FILE__).DS.$type.DS.$type.'.php')) {
			if (!class_exists('XFriendicaCiphers'.ucfirst($type)))
				include_once(dirname(__FILE__).DS.$type.DS.$type.'.php');
			$class = 'XFriendicaCiphers'.ucfirst($type);
			if (class_exists($class)) {
				$this->_type = $type;
				$this->_class[$type] = new $class($this);
				return true;
			} else {
				$this->_errors[] = 'Error: XFriendicaCiphers Child Class Does not Exist - '.$class.' missing.';
			}
		} else {
			$this->_errors[] = 'Error: XFriendicaCiphers Child Class Definition File Does not Exist - '.DS.$type.DS.$type.'.php missing.';
		}
		return false;
	}
	
	/**
	 * private function setTypeStatic
	 * For using child class statically
	 *
	 * @param string $type
	 * @param string $data
	 * @param array $options
	 */
	private function setTypeStatic($type, $data, $options) {
		if (file_exists(dirname(__FILE__).DS.$type.DS.$type.'.php')) {
			include_once(dirname(__FILE__).DS.$type.DS.$type.'.php');
			$class = 'XFriendicaCiphers'.ucfirst($type).'Static';
			if (class_exists($class)) {
				return new $class(null, 'static');
			} 
		}
		return false;
	}
	
	/**
	 * function getErrorsHtml
	 * Gets the Errors as HTML for xoops_error() Function
	 *
	 */
	function getErrorsHtml() {
		return implode('<br/>', $this->_errors);
	}
}