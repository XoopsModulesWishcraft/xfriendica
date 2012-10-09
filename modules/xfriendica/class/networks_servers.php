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
 * Description:	Networks_servers Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @function kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaNetworks_servers	 extends XoopsObject
{
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, null, true, 40);
        $this->initVar('state', XOBJ_DTYPE_ENUM, 'offline', false, false, false, array('online','offline','listening','ignoring','partial','repeater','dropbox','system'));
        $this->initVar('route', XOBJ_DTYPE_ENUM, 'direct', false, false, false, array('direct','route'));
        $this->initVar('verify', XOBJ_DTYPE_ENUM, 'Master', false, false, false, array('IP','NetBios','Master'));
        $this->initVar('trust', XOBJ_DTYPE_ENUM, 'untrusted', false, false, false, array('banned','listen','untrusted','trusted','signed'));
        $this->initVar('client-id', XOBJ_DTYPE_TXTBOX, '', false, 20);
        $this->initVar('avarta-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('keys-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('gmt', XOBJ_DTYPE_DECIMAL, 0, false);
        $this->initVar('network-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('route-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('routes', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('name', XOBJ_DTYPE_TXTBOX, '', false, 255);
        $this->initVar('guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('netbios', XOBJ_DTYPE_TXTBOX, '', false, 255);
        $this->initVar('trust', XOBJ_DTYPE_ENUM, 'http://', false, false, false, array('http://','https://','ftp://','ftps://'));
        $this->initVar('cipher-key', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('trust-key', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('handshake-method', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('handshake-key', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('handshake-secret', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('auth-token', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('auth-secret', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('auth-expires', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('allow-push', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('allow-pull', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('allow-route', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('allow-callback', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('method-push', XOBJ_DTYPE_ENUM, 'json', false, false, false, array('json','serial','xml','soap'));
        $this->initVar('method-package', XOBJ_DTYPE_ENUM, 'raw', false, false, false, array('raw','base64','cipher','url'));
        $this->initVar('method-cipher', XOBJ_DTYPE_ENUM, 'aes', false, false, false, array('crypt','aes'));
        $this->initVar('method-cipher-key', XOBJ_DTYPE_ENUM, 'pull', false, false, false, array('push','pull'));
        $this->initVar('interval', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('items', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('quota', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('networks', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('population', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hookups', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hops', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('heard', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('pushed', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('opens', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('closes', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('offline', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('notified', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('batch-when', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('batch-minimum', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('batch-quantity', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('activity', XOBJ_DTYPE_DECIMAL, 0, false);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
    }

}

/**
 * @function kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaNetworks_serversHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaNetworks_serversHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_networks_servers", "XFriendicaNetworks_servers", "id", 'domain');
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