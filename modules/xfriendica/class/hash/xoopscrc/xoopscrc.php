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
 * @version         $Id: xoopscrc.php 8066 2012-09-08 12:19:00Z wishcraft $
 */

include_once dirname(__FILE__).'/xoops.crc.base.php';
include_once dirname(__FILE__).'/xoops.crc.enumerator.php';
include_once dirname(__FILE__).'/xoops.crc.leaver.php';
include_once dirname(__FILE__).'/xoops.crc.class.php';

/**
 * A xoops checksum wrapper class for hashing data.
 *
 */
class XoopsHashXoopscrc extends XoopsHash
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
	 * 3rd Party class/function to use for generation of checksum
	 *
	 */
	var $_class = 'xoops_crc';

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
		if (empty($options)&&is_object($this->_parent))
			$options = $this->_parent->_options[$this->_func];
		return $this->xoopscrc($data, $options);
	}
	
	/**
	 * private function xoopscrc
	 * For calculating an XoopsCrc Checksum
	 *
	 * @param string $data
	 * @param array $options
	 */
	private function xoopscrc($data, $options) {
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
				$options['length'] = 28;
		}
		set_time_limit(120);
		$crc = new $this->_class($data, $options['seed'], $options['length']);
		return $crc->crc;
	}		
}

/**
 * A md5 checksum wrapper class for hashing data statically.
 *
 * @abstract
 */
class XoopsHashXoopscrcStatic extends XoopsHashXoopscrc
{
	function __construct($data, $options, $parent, $mode = 'inhertit') {
		return parent::__construct($data, $options, $parent, 'static');
	}
}
?>