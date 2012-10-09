<?php
/**
 * XOOPS sha1 checksum handler
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
 * @version         $Id: sha1.php 8066 2012-09-08 12:19:00Z wishcraft $
 */


/**
 * A sha1 checksum wrapper class for hashing data.
 *
 */
class XoopsHashSha1 extends XoopsHash
{
	/**
	 * function name and class typecast
	 *
	 */
	var $_func = 'sha1';
	
	/**
	 * method name for calculation of checksum
	 *
	 */
	var $_method = 'calc';
	
	/**
	 * class name of this class
	 *
	 */
	var $_name = __CLASS__;
	
	/**
	 * parent object from XoopsHash ($this)
	 *
	 */
	var $_parent = '';

	/**
	 * Constructor
	 *
	 * @param string $data
	 * @param array $options
	 * @param object $parent
	 */
	function __construct($data, $options, $parent, $mode = 'inhertit') {
		switch ($mode) {
			default:
				$this->_parent = $parent;
				if (empty($options)&&is_object($this->_parent))
					$options = $this->_parent->_options[$this->_func];
				if (!empty($data))
					$this->_crc = $this->calc($data, $options);
				break;
			case 'static':
				return $this->calc($data, $options);
		}
	}
	
	/**
	 * function calc
	 * For Calculating an Checksum from Parent Class
	 *
	 * @param string $data
	 * @param array $options
	 */
	function calc($data, $options) {
		return $this->sha1($data, $options);
	}
	
	/**
	 * private function sha1
	 * For calculating an SHA1 Checksum
	 *
	 * @param string $data
	 * @param array $options
	 */
	private function sha1($data, $options) {
		if (isset($options['length']))
			return substr(sha1($data), intval($options['start']), $options['length']);
		else
			return sha1($data);
	}
}

/**
 * A md5 checksum wrapper class for hashing data statically.
 *
 * @abstract
 */
class XoopsHashSha1Static extends XoopsHashSha1
{
	function __construct($data, $options, $parent, $mode = 'inhertit') {
		return parent::__construct($data, $options, $parent, 'static');
	}
}
?>