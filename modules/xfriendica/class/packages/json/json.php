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
 * A XFriendicaPackages Class for json encoding/decoding of data.
 *
 * @abstract
 */
class XFriendicaPackagesJson extends XFriendicaPackages {
	
	/**
	 * function encode
	 *
     * @param string $data
 	 */
	function encode($data) {
		return json_encode($data);
	}

	/**
	 * function decode
	 *
     * @param string $data
 	 */
	function decode($data) {
		return json_decode($data);
	}

	/**
	 * function encodeStatic
	 *
	 * @param string $data
	 */
	static function encodeStatic($data) {
		return json_encode($data);
	}
	
	/**
	 * function decodeStatic
	 *
	 * @param string $data
	 */
	static function decodeStatic($data) {
		return json_decode($data);
	}
	

}