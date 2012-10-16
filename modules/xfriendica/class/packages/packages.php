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
class XFriendicaPackages {
	
	// Child Checksum/Packages Storage
	var $_class = array();
	
	// Errors Storage Mechanism
	var $_errors = array();
	
	// Last Checksum Calculated
	var $_data = '';
	
	// Last Type Packageses/Checksums Used
	var $_type = 'json';
	
	// Default Options for the Preset Packageses/Checksums
	var $_options = array(	'base64'		=>	array(),
							'json'			=>	array(),
							'serial'		=>	array(),
							'url'			=>	array(),
							'xml'			=>	array()
					);
		
	private static $_vars = array(	'class' 	=>		array(),
									'data'		=>		'',
									'type'		=>		'php',
									'options'	=>		array(	'base64'		=>	array(),
																'json'			=>	array(),
																'serial'		=>	array(),
																'url'			=>	array(),
																'xml'			=>	array())
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
	 * 		$objsHash = new XFriendicaHash();	// Instanciate the Object
	 * 		$objsHash->md5($data); 		// Returns MD5 Checksum
	 * 		$objsHash->sha1($data); 		// Returns SHA1 Checksum
	 *  	$objsHash->xoopscrc($data); 	// Returns XoopsCrc Checksum
	 *   	$objsHash->password($data); 	// Returns Password Checksum
	 *   
	 * @param string $type
	 * @param array $args
	 */
	function __call($type, $args) {
		if (substr($type, 0, strlen('decode_'))=='decode_') {
			$parts = explode('_', $type);
			return $this->decode($args[0], $parts[1]);
		}
		return $this->encode($args[0], $type);
	}
	
	/**
	 * function __callStatic
	 * magic method for calling checksum statically as types in function
	 *
	 * ie.
	 * 		XFriendicaPackages::md5($data); 			// Returns MD5 Checksum
	 * 		XFriendicaPackages::sha1($data); 		// Returns SHA1 Checksum
	 *  	XFriendicaPackages::xoopscrc($data); 	// Returns XoopsCrc Checksum
	 *   	XFriendicaPackages::password($data); 	// Returns Password Checksum
	 *
	 * @param string $type
	 * @param array $args
	 */
	function __callStatic($type, $args) {
		if (substr($type, 0, strlen('decode_'))=='decode_') {
			$parts = explode('_', $type);
			return self::decodeStatic($args[0], $parts[1]);
		}
		return self::encodeStatic($args[0], $type);
	}
	
	/**
	 * function encode
	 * For calculating a hash/checksum after class is instanciated
	 *
     * @param string $data
     * @param string $type
     * @param array $options
 	 */
	function encode($data, $type = 'json') {
		if (isset($this->_class[$type])) {
			$this->_type = $type;
		} elseif ($this->setType($type)) {
			$this->_type = $type;
		}
		if (is_object($this->_class[$type]))
			return $this->_class[$type]->encode($data);
		else
			$this->_errors[] = 'Error: XFriendicaPackages Class Not Set';
		return false;
	}

	/**
	 * function decode
	 * For calculating a hash/checksum after class is instanciated
	 *
     * @param string $data
     * @param string $type
     * @param array $options
 	 */
	function decode($data, $type = 'json') {
		if (isset($this->_class[$type])) {
			$this->_type = $type;
		} elseif ($this->setType($type)) {
			$this->_type = $type;
		}
		if (is_object($this->_class[$type]))
			return $this->_class[$type]->decode($data);
		else
			$this->_errors[] = 'Error: XFriendicaPackages Class Not Set';
		return false;
	}

	/**
	 * function encodeStatic
	 * For calculating a hash/checksum after class is instanciated
	 *
	 * @param string $data
	 * @param string $type
	 */
	static function encodeStatic($data, $type = 'json') {
		$class = 'XFriendicaPackages'.ucfirst($type);
		if (!class_exists($class))
			include_once(dirname(__FILE__).DS.$type.DS.$type.'.php');
		if (class_exists($class)&&method_exists($class, 'encodeStatic'))
			return call_user_method('encodeStatic', $class, array($data));
		return false;
	}
	
	/**
	 * function decodeStatic
	 * For calculating a hash/checksum after class is instanciated
	 *
	 * @param string $data
	 * @param string $type
	 */
	static function decodeStatic($data, $type = 'json') {
		$class = 'XFriendicaPackages'.ucfirst($type);
		if (!class_exists($class))
			include_once(dirname(__FILE__).DS.$type.DS.$type.'.php');
		if (class_exists($class)&&method_exists($class, 'decodeStatic'))
			return call_user_method('decodeStatic', $class, array($data));
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
			$class = 'XFriendicaPackages'.ucfirst($type);
			if (!class_exists($class))
				include_once(dirname(__FILE__).DS.$type.DS.$type.'.php');
			if (class_exists($class)) {
				$this->_type = $type;
				$this->_class[$type] = new $class($this);
				return true;
			} else {
				$this->_errors[] = 'Error: XFriendicaPackages Child Class Does not Exist - '.$class.' missing.';
			}
		} else {
			$this->_errors[] = 'Error: XFriendicaPackages Child Class Definition File Does not Exist - '.DS.$type.DS.$type.'.php missing.';
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