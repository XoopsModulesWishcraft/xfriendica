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
 * Description:	Networks_routes Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @function kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaNetworks_routes	 extends XoopsObject
{
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, null, true, 40);
        $this->initVar('parent-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('method', XOBJ_DTYPE_ENUM, 'direct', false, false, false, array('direct','hop'));
        $this->initVar('depth', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('weight', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('keys-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('network-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('server-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('ciphered', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('called-server-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('called-path-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('called-api-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
    }

}

/**
 * @function kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaNetworks_routesHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaNetworks_routesHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_networks_routes", "XFriendicaNetworks_routes", "id", 'domain');
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