<?php
/*
 * Logs Guest and users IP Addresses for a period of time and provides
 * basic statistic of them in XOOPS Copyright (C) 2012 Simon Roberts 
 * Contact: wishcraft - simon@chronolabs.com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 * See /docs/license.pdf for full license.
 * 
 * Shouts:- 	Mike Macgirvin [mike@macgirvin.com] original author of
 *              Friendica
 * 
 * Version:		1.01 Alpha
 * Published:	Chronolabs
 * Download:	http://code.google.com/p/chronolabs
 * This File:	conv.php
 * Description:	Networks_apis_files Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaNetworks_apis_files extends XoopsObject
{
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, null, true, 40);
        $this->initVar('api-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('function-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('package-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('plugin-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('addon-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('relative-to', XOBJ_DTYPE_ENUM, '', false, false, false, array('XOOPS_ROOT_PATH','XOOPS_VAR_PATH','XOOPS_UPLOAD_PATH','XOOPS_TRUST_PATH','XFRIENDICA_ROOT_PATH','XFRIENDICA_PLUGINS_PATH','XFRIENDICA_ADAPTORS_PATH','XFRIENDICA_ADDONS_PATH','XFRIENDICA_CONNECTORS_PATH'));
        $this->initVar('file-guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('file-name', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('file-type', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('file-path', XOBJ_DTYPE_TXTBOX, '', false, 255);
        $this->initVar('file-size', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('file-md5', XOBJ_DTYPE_TXTBOX, '', false, 32);
        $this->initVar('retrieved', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaNetworks_apis_filesHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaNetworks_apis_filesHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_networks_apis_files", "XFriendicaNetworks_apis_files", "id", 'domain');
    }
    
    function insert($object, $force = true) {
    	if ($object->isNew())
    		$object->setVar('created', time());
    	else
    		$object->setVar('updated', time());
    
    	return parent::insert($object, $force);
    }
}
?>