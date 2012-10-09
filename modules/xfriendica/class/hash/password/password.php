<?php
/**
 * XOOPS password checksum handler
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
 * @version         $Id: password.php 8066 2012-09-08 12:19:00Z wishcraft $
 */

include_once dirname(dirname(__FILE__)).'/xoopscrc/xoops.crc.base.php';
include_once dirname(dirname(__FILE__)).'/xoopscrc/xoops.crc.enumerator.php';
include_once dirname(dirname(__FILE__)).'/xoopscrc/xoops.crc.leaver.php';
include_once dirname(dirname(__FILE__)).'/xoopscrc/xoops.crc.class.php';
include_once dirname(dirname(__FILE__)).'/xoopscrc/xoopscrc.php';

/**
 * A password checksum wrapper class for hashing data.
 *
 */
class XoopsHashPassword extends XoopsHashXoopscrc
{

	/**
	 * Constructor
	 *
	 * @param string $data
	 * @param array $options
	 * @param object $parent
	 */
	function __construct($data, $options, $parent, $mode = 'inhertit') {
		$this->_func = 'password';
		$this->_name = __CLASS__;	
		return parent::__construct($data, $options, $parent, $mode);
	}
	
	/**
	 * function calc
	 * For Calculating an Checksum from Parent Class
	 *
	 * @param string $data
	 * @param array $options
	 */
	function calc($data, $options) {
		if (empty($options)&&is_object($this->_parent))
			$options = $this->_parent->_options[$this->_func];
		return $this->password($data, $options);
	}
	
	/**
	 * private function password
	 * For calculating an Password Checksum
	 *
	 * @param string $data
	 * @param array $options
	 */
	private function password($data, $options) {
		if (empty($options)&&is_object($this->_parent))
			$options = $this->_parent->_options[$this->_func];
		if (!isset($options['seed'])) {
			if(is_numeric($this->_parent->_options[$this->_func]['seed'])&&$this->_parent->_options[$this->_func]['seed']<255)
				$options['seed'] = $this->_parent->_options[$this->_func]['seed'];
			else
				$options['seed'] = ord(substr($data, 0, 1));
		} elseif (!is_numeric($options['seed'])) {
			$options['seed'] = ord(substr($data, 0, 1));
		}
		if (!isset($options['length'])) {
			if(is_numeric($this->_parent->_options[$this->_func]['length'])&&$this->_parent->_options[$this->_func]['length']>1)
				$options['length'] = $this->_parent->_options[$this->_func]['length'];
			else
				$options['length'] = 12;
		}
		set_time_limit(120);
		$crc = new $this->_class($data, $options['seed'], $options['length']);
		return $crc->crc;
	}		
}

/**
 * A password checksum wrapper class for hashing data statically.
 *
 * @abstract
 */
class XoopsHashPasswordStatic extends XoopsHashPassword
{
	function __construct($data, $options, $parent, $mode = 'inhertit') {
		return parent::__construct($data, $options, $parent, 'static');
	}
}
?>