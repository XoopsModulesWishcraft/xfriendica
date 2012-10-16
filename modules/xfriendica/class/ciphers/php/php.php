<?php
/**
 * XOOPS crypt checksum handler
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
 * @version         $Id: crypt.php 8066 2012-09-08 12:19:00Z wishcraft $
 */


/**
 * A crypt checksum wrapper class for hashing data.
 *
 */
class XFriendicaCiphersPhp extends XFriendicaCiphers
{
	/**
	 * function name and class typecast
	 *
	 */
	var $_preferences 			= 		array(	0	=>		'aes'
										);
	
	/**
	 * method name for calculation of checksum
	 *
	 */
	var $_method  = array(	'encrypt'	=>	'encrypt', 
							'decrypt'	=> 	'decrypt'
					);
	
	/**
	 * class name of this class
	 *
	 */
	var $_name = __CLASS__;
	
	/**
	 * parent object from XFriendicaCiphers ($this)
	 *
	 */
	var $_parent = '';


	/**
	 * algorithm for Php from XFriendicaCiphers ($this)
	 *
	 */
	var $_algorithm = '';

	/**
	 * algorithms Objects for Php from XFriendicaCiphers ($this)
	 *
	 */
	var $_algorithms = array();
	
	/**
	 * Constructor
	 *
	 * @param string $data
	 * @param string $salt
	 * @param object $parent
	 */
	function __construct($data, $options, $parent, $mode = 'inhertit') {
		if (function_exists('mcrypt_list_algorithms')) {
			foreach(mcrypt_list_algorithms() as $algorithm) {
				if (empty($this->_algorithm)) {
					if ($algorithm == $options['algorithm']) {
						$this->_algorithm = $options['algorithm'];
					}	
					if (in_array($algorithm, $this->_preferences)) {
						$this->_algorithm = $algorithm;
					}
				}
			}
			@loadAlgorithm($this->_algorithm);
		}
	}

	/**
	 * private function loadAlgorithm
	 * For Loading an Algorithm Child Class
	 *
	 * @param string $dirname
	 */
	private function loadAlgorithm($dirname) {
		if (!in_array($dirname, mcrypt_list_algorithms())) {
			trigger_error('Php Ciphers Algorithm '. $dirname. ' doesn\'t exist in '.__CLASS__.'::'.__FUNCTION__. ' in file '.__FILE__, E_ERROR);
			return false;
		}
		if (!isset($this->_algorithms[$dirname])) {
			include_once dirname(__FILE__).DS.$dirname.DS.$dirname.'.php';
			$class = 'XFriendicaCiphersPhp'.ucfirst($dirname);
			$this->_algorithms[$dirname] = new $class('', '', $this, 'inherit');
		}
		return true;
	}
	
	function getAlgorithms() {
		return $_preferences;
	}
	
	function __call($type, $args) {
		$parts = array();
		if (substr($type, 0, strlen('encrypt_'))=='encrypt_') {
			$parts = explode('_', $type);
			if (!in_array($parts[1], $this->_preferences)) {
				return false;
			}
		} elseif (substr($type, 0, strlen('decrypt_'))=='decrypt_') {
			$parts = explode('_', $type);
			if (!in_array($parts[1], $this->_preferences)) {
				return false;
			}
		}
		if (count($parts)==2&&loadAlgorithm($parts[1])==true) {
			switch ($parts[0]) {
				case 'encrypt':
					return $this->_algorithms[$parts[0]]->cipher($args[0], $args[1]);
					break;
				case 'decrypt':
					return $this->_algorithms[$parts[0]]->decipher($args[0], $args[1]);
					break;
			}
		}
	}
	/**
	 * function cipher
	 * For Calculating an Checksum from Parent Class
	 *
	 * @param string $data
	 * @param string $salt
	 */
	function cipher($data, $salt) {
		return $this->_algorithms[$this->_algorithm]->cipher($data, $salt);
	}

	/**
	 * function decipher
	 * For Calculating an Checksum from Parent Class
	 *
	 * @param string $data
	 * @param string $salt
	 */
	function decipher($data, $salt) {
		return $this->_algorithms[$this->_algorithm]->decipher($data, $salt);
	}
	
}

/**
 * A md5 checksum wrapper class for hashing data statically.
 *
 * @abstract
 */
class XFriendicaCiphersPhpStatic extends XFriendicaCiphersPhp
{
	function __construct($data, $options, $parent, $mode = 'inhertit') {
		return parent::__construct($data, $options, $parent, 'static');
	}
}
?>