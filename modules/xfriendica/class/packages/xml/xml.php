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
class XFriendicaPackagesXml extends XFriendicaPackages {
	
	/**
	 * function encode
	 *
     * @param string $data
 	 */
	function encode($data, $root = 'xfreiendica') {
		return XFriendicaPackagesXml::toXml($data, $root);
	}

	/**
	 * function decode
	 *
     * @param string $data
 	 */
	function decode($data, $root = 'xfriendica') {
		$ret = XFriendicaPackagesXml::convertXmlToArray(simplexml_load_string($data, $root));
		return $ret;
	}

	/**
	 * function encodeStatic
	 *
	 * @param string $data
	 */
	static function encodeStatic($data, $root = 'xfreiendica') {
		return XFriendicaPackagesXml::toXml($data, $root);
	}
	
	/**
	 * function decodeStatic
	 *
	 * @param string $data
	 */
	static function decodeStatic($data, $root = 'xfreiendica') {
		$ret = XFriendicaPackagesXml::convertXmlToArray(simplexml_load_string($data, $root));
		return $ret;
	}
	
	public static function convertXmlToArray($obj, &$arr){
		$children = $obj->children();
		$executed = false;
		foreach ($children as $elementName => $node){
			if($arr[$elementName]!=null){
				if($arr[$elementName][0]!==null){
					$i = count($arr[$elementName]);
					XFriendicaPackagesXml::convertXmlToArray($node, $arr[$elementName][$i]);
				}else{
					$tmp = $arr[$elementName];
					$arr[$elementName] = array();
					$arr[$elementName][0] = $tmp;
					$i = count($arr[$elementName]);
					XFriendicaPackagesXml::convertXmlToArray($node, $arr[$elementName][$i]);
				}
			}else{
				$arr[$elementName] = array();
				XFriendicaPackagesXml::convertXmlToArray($node, $arr[$elementName]);
			}
			$executed = true;
		}
		if(!$executed&&$children->getName()==""){
			$arr = (String)$obj;
		}
		return;
	}
	
	/**
	 * The main function for converting to an XML document.
	 * Pass in a multi dimensional array and this recrusively loops through and builds up an XML document.
	 *
	 * @param array $data
	 * @param string $rootNodeName - what you want the root node to be - defaultsto data.
	 * @param SimpleXMLElement $xml - should only be used recursively
	 * @return string XML
	 */
	public static function toXml($data, $rootNodeName = 'data', $xml=null)
	{
		// turn off compatibility mode as simple xml throws a wobbly if you don't.
		if (ini_get('zend.ze1_compatibility_mode') == 1)
		{
			ini_set ('zend.ze1_compatibility_mode', 0);
		}

		if ($xml == null)
		{
			$xml = simplexml_load_string("<?xml version='1.0' encoding='utf-8'?><$rootNodeName />");
		}

		// loop through the data passed in.
		foreach($data as $key => $value)
		{
			// no numeric keys in our xml please!
			if (is_numeric($key))
			{
				// make string key...
				$key = "unknownNode_". (string) $key;
			}
				
			// replace anything not alpha numeric
			$key = preg_replace('/[^a-z]/i', '', $key);
				
			// if there is another array found recrusively call this function
			if (is_array($value))
			{
				$node = $xml->addChild($key);
				// recrusive call.
				XFriendicaPackagesXml::toXml($value, $rootNodeName, $node);
			}
			else
			{
				// add single node.
				$value = htmlentities($value);
				$xml->addChild($key,$value);
			}
				
		}
		// pass back as string. or simple xml object if you want!
		return $xml->asXML();
	}
}