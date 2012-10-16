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
class XFriendicaCiphersMCryptRc6 extends XFriendicaCiphers
{
	/**
	 * function name and class typecast
	 *
	 */
	var $_func = 	MCRYPT_RC6;
	
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
		if (function_exists('mcrypt_module_open')) {
			$this->_cipher = mcrypt_module_open($this->_func);
			$this->_cipher_iv = mcrypt_create_iv(mcrypt_enc_get_iv_size($this->_cipher), MCRYPT_RAND);
			
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
		} else {
			trigger_error('MCrypt PHP Extension not Loaded is Required for '.__CLASS__. '::'.__FUNCTION__.' in file '.__FILE__, E_ERROR);
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
		mcrypt_generic_init($this->_cipher, $salt, $this->_cipher_iv);
		$encrypted_data = mcrypt_generic($this->_cipher, $data);
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
		mcrypt_generic_init($this->_cipher, $salt, $this->_cipher_iv);
		$decrypted_data = mdecrypt_generic($this->_cipher, $data);
		return $decrypted_data;
	}
	
	function __destruct() {
		mcrypt_generic_deinit($this->_cipher);
		mcrypt_module_close($this->_cipher);
	}
}

/**
 * A Crypt MCrypt wrapper class for hashing data statically.
 *
 * @abstract
 */
class XFriendicaCiphersMCryptRc6Static extends XFriendicaCiphersMCryptRc6
{
	function __construct($data, $salt, $parent, $mode = 'inhertit') {
		return parent::__construct($data, $salt, $parent, 'static');
	}
}
?>