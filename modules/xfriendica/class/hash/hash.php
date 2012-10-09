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
class FriendicaHash {
	
	// Child Checksum/Hash Storage
	var $_class = array();
	
	// Errors Storage Mechanism
	var $_errors = array();
	
	// Last Checksum Calculated
	var $_crc = '';
	
	// Last Type Hashes/Checksums Used
	var $_type = 'md5';
	
	// Default Options for the Preset Hashes/Checksums
	var $_options = array(	'md5'		=>	array(),
							'sha1'		=>	array(),
							'xoopscrc'	=>	array('seed'=>'ord(0)', 'length' => 28),
							'password'	=>	array('seed'=>'ord(0)', 'length' => 12)		);
		
	private static $_vars = array(	'class' 	=>		array(),
									'crc'		=>		'',
									'type'		=>		'md5',
									'options'	=>		array(	'md5'		=>	array(),
																'sha1'		=>	array(),
																'xoopscrc'	=>	array('seed'=>'ord(0)', 'length' => 28),
																'password'	=>	array('seed'=>'ord(0)', 'length' => 12))
							);
	
    /**
     * Constructor
     *
     * @param string $data
     * @param string $type
     * @param array $options
     */
     function __construct($data = '', $type = '', $options = '') {
		if (empty($type))
			$type = $this->_type;
		else
			$this->_type = $type;
		if (empty($options)&&isset($this->_options[$type]))
			$options = $this->_options[$type];
		if ($this->setType($type, $data, $options)) {
			if (!empty($data)&&!empty($this->_crc))
				return $this->_crc;
		}
		return $this;
	}

	/**
	 * function __call
	 * magic method for calling checksum types as a function
	 *
	 * ie.
	 * 		$objsHash = new FriendicaHash();	// Instanciate the Object
	 * 		$objsHash->md5($data); 		// Returns MD5 Checksum
	 * 		$objsHash->sha1($data); 		// Returns SHA1 Checksum
	 *  	$objsHash->xoopscrc($data); 	// Returns XoopsCrc Checksum
	 *   	$objsHash->password($data); 	// Returns Password Checksum
	 *   
	 * @param string $type
	 * @param array $args
	 */
	function __call($type, $args) {
		if (empty($args[1])&&isset($this->_options[$type]))
			$args[1] = $this->_options[$type];
		return $this->calc($args[0], $type, $args[1]);
	}
	
	/**
	 * function __callStatic
	 * magic method for calling checksum statically as types in function
	 *
	 * ie.
	 * 		FriendicaHash::md5($data); 			// Returns MD5 Checksum
	 * 		FriendicaHash::sha1($data); 		// Returns SHA1 Checksum
	 *  	FriendicaHash::xoopscrc($data); 	// Returns XoopsCrc Checksum
	 *   	FriendicaHash::password($data); 	// Returns Password Checksum
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
	function calc($data, $type = '', $options = '') {
		if (empty($options)&&isset($this->_options[$type]))
			$options = $this->_options[$type];
		
		if (empty($type))
			$type = $this->_type;
		else {
			if (isset($this->_class[$type])) {
				$this->_type = $type;
			} elseif ($this->setType($type, $data, $options)) {
				$this->_type = $type;
				return $this->_crc;
			}
		}
		if (is_object($this->_class[$type]))
			return $this->_class[$type]->calc($data, $options);
		else
			$this->_errors[] = 'Error: FriendicaHash Class Not Set';
		return false;
	}

	/**
	 * function calcStatic
	 * For calculating a hash/checksum after class is called statically
	 *
	 * @param string $data
	 * @param string $type
	 * @param array $options
	 */
	function calcStatic($data, $type = '', $options = '') {
		if (empty($options)&&isset(self::$_options[$type]))
			$options = self::$_vars['options'][$type];
		return self::setTypeStatic($type, $data, $options);
	}
	
	/**
	 * private function setType
	 * For load a child Class and instaniating it
	 *
	 * @param string $type
	 * @param string $data
	 * @param array $options
	 */	
	private function setType($type, $data, $options) {
		if (file_exists(dirname(__FILE__).DS.$type.DS.$type.'.php')) {
			if (!class_exists('FriendicaHash'.ucfirst($type)))
				include_once(dirname(__FILE__).DS.$type.DS.$type.'.php');
			$class = 'FriendicaHash'.ucfirst($type);
			if (class_exists($class)) {
				$this->_type = $type;
				$this->_options[$type] = $options;
				$this->_class[$type] = new $class($data, $options, $this);
				return true;
			} else {
				$this->_errors[] = 'Error: FriendicaHash Child Class Does not Exist - '.$class.' missing.';
			}
		} else {
			$this->_errors[] = 'Error: FriendicaHash Child Class Definition File Does not Exist - '.DS.$type.DS.$type.'.php missing.';
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
			$class = 'FriendicaHash'.ucfirst($type).'Static';
			if (class_exists($class)) {
				return new $class($data, $options, null, 'static');
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