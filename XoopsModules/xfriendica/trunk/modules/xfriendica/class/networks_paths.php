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
 * Description:	Networks_paths Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @function kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaNetworks_paths extends XoopsObject
{
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, null, true, 40);
        $this->initVar('state', XOBJ_DTYPE_ENUM, '', false, false, false, false, array('active','inactive','dead','offline'));
        $this->initVar('type', XOBJ_DTYPE_ENUM, '', false, false, false, false, array('unknown','friendica','xfriendica','xips','system'));
        $this->initVar('mode', XOBJ_DTYPE_ENUM, '', false, false, false, false, array('resource','public network','private network'));
        $this->initVar('network-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('path', XOBJ_DTYPE_TXTBOX, '', false, 255);
        $this->initVar('name', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('network-name', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('network-guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('server-name', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('server-guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('server-passkey', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('handshake-method', XOBJ_DTYPE_TXTBOX, '', false, 32);
        $this->initVar('handshake-key', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('handshake-secret', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('auth-token', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('auth-secret', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('auth-expires', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('locale-guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('online', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('opens', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('closes', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('poll-interval', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('push-interval', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('offline', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('plugins', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('addons', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('adaptors', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('connectors', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('resources', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('requests-received', XOBJ_DTYPE_INT, 0, false);                        
        $this->initVar('requests-sent', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('items-received', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('items-sent', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
    }

}

/**
 * @function kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaNetworks_pathsHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaNetworks_pathsHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_networks_paths", "XFriendicaNetworks_paths", "id", 'domain');
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