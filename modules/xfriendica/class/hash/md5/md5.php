<?php
/**
 * A md5 checksum wrapper class for hashing data.
 *
 */
class XoopsHashMd5 extends XoopsHash
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
		if (empty($options)&&is_object($this->_parent))
			$options = $this->_parent->_options[$this->_func];
		return $this->md5($data, $options);
	}

	/**
	 * private function md5
	 * For calculating an MD5 Checksum
	 *
	 * @param string $data
	 * @param array $options
	 */
	private function md5($data, $options) {
		if (isset($options['length']))
			return substr(md5($data), intval($options['start']), $options['length']);
		else
			return md5($data);
	}
}


/**
 * A md5 checksum wrapper class for hashing data statically.
 *
 * @abstract
 */
class XoopsHashMd5Static extends XoopsHashMd5
{
		function __construct($data, $options, $parent, $mode = 'inhertit') {
			return parent::__construct($data, $options, $parent, 'static');
		}
}
?>