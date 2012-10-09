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
 * Description:	Protocols Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaProtocols extends XoopsObject
{
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, null, true, 40);
        $this->initVar('salt', XOBJ_DTYPE_TXTBOX, hash(__CLASS__.__FUNCTION__.__LINE__.microtime(true)._MI_XFRND_SALT.XOOPS_DB_HOST.XOOPS_DB_PASS.XOOPS_DB_USER.XOOPS_DB_NAME.XOOPS_ROOT_PATH, 128), false, 128);
        $this->initVar('guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('name', XOBJ_DTYPE_TXTBOX, '', false, 255);
        $this->initVar('summary', XOBJ_DTYPE_TXTBOX, '', false, 600);
        $this->initVar('path', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('prefix', XOBJ_DTYPE_TXTBOX, '', false, 8);
        $this->initVar('version', XOBJ_DTYPE_TXTBOX, '', false, 255);
        $this->initVar('system', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('forapi', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('forservice', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('fornetwork', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hidden', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('haspoll', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('haspush', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hascron', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hasadmin', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hassource', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaProtocolsHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaProtocolsHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_protocols", "XFriendicaProtocols", "id", 'domain');
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