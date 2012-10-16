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

if (!class_exists('AES')) {
	include_once (dirname(__FILE__).DS.'aes.class.php');
}

class XFriendicaCiphersPhpAes extends XFriendicaCiphers
{
	
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
	 * chipher object from XFriendicaCiphers ($this)
	 *
	 */
	var $_cipher = '';

	/**
	 * chipher_iv object from XFriendicaCiphers ($this)
	 *
	 */
	var $_cipher_iv = '';
	
	/**
	 * Constructor
	 *
	 * @param string $data
	 * @param string $salt
	 * @param object $parent
	 */
	function __construct($data, $salt, $parent, $mode = 'inhertit') {
		
		switch ($mode) {
			default:
				$this->_parent = $parent;
				if (empty($salt)&&is_object($this->_parent))
					$salt = $this->_parent->_options[$this->_func];
				if (!empty($data))
					$this->_data = $this->{$this->_method['encrypt']}($data, $salt);
				break;
			case 'static':
				return $this->{$this->_method['encrypt']}($data, $salt);
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
		return $this->{$this->_method['encrypt']}($data, $salt);
	}

	/**
	 * function decipher
	 * For Calculating an Checksum from Parent Class
	 *
	 * @param string $data
	 * @param string $salt
	 */
	function decipher($data, $salt) {
		return $this->{$this->_method['decrypt']}($data, $salt);
	}
	
	/**
	 * private function crypt
	 * For calculating an Encryption
	 *
	 * @param string $data
	 * @param string $salt
	 */
	private function encrypt($data, $salt) {
		$this->_cipher = new AES($salt);
		$encrypted_data = $this->_cipher->encrypt($data);
		return $encrypted_data;
	}
	
	/**
	 * private function decrypt
	 * For calculating an Decryption
	 *
	 * @param string $data
	 * @param string $salt
	 */
	private function decrypt($data, $salt) {
		$this->_cipher = new AES($salt);
		$decrypted_data = $this->_cipher->decrypt($data);
		return $decrypted_data;
	}
	
	function __destruct() {
		unset($this->_cipher);
	}
}

/**
 * A Crypt MCrypt wrapper class for hashing data statically.
 *
 * @abstract
 */
class XFriendicaCiphersPhpAesStatic extends XFriendicaCiphersPhpAes
{
	function __construct($data, $salt, $parent, $mode = 'inhertit') {
		return parent::__construct($data, $salt, $parent, 'static');
	}
}
?>