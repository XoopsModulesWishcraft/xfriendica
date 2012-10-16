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

include_once (dirname(__FILE__).DS.'certificates'.DS.'certificates.php');

class XFriendicaCiphersOpenssl extends XFriendicaCiphers
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
	 * service certificate from XFriendicaCiphers ($this)
	 *
	 */
	var $_certs = array();
	
	/**
	 * Constructor
	 *
	 * @param string $data
	 * @param string $salt
	 * @param object $parent
	 */
	function __construct($data, $options, $parent, $mode = 'inhertit') {
		$this->_certs['service'] = XFriendicaOpensslCertificatesHandler::loadServiceCertificate();
		$this->_parent = $parent;
		
	}
	
	/**
	 * function cipher
	 * For Calculating an Checksum from Parent Class
	 *
	 * @param string $data
	 */
	function cipher($data) {
		return $this->_certs['service']->encrypt($data);
	}

	/**
	 * function decipher
	 * For Calculating an Checksum from Parent Class
	 *
	 * @param string $data
	 */
	function decipher($data, $private_key) {
		if (!empty($private_key))
			$this->_certs['service']->private_key($private_key);
		return $this->_certs['service']->decrypt($data);
	}
	
}

/**
 * A md5 checksum wrapper class for hashing data statically.
 *
 * @abstract
 */
class XFriendicaCiphersOpensslStatic extends XFriendicaCiphersOpenssl
{
	function __construct($data, $options, $parent, $mode = 'inhertit') {
		return parent::__construct($data, $options, $parent, 'static');
	}
}
?>