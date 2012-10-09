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
 * Description:	Guid Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaGuid extends XoopsObject
{
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, null, true);
        $this->initVar('state', XOBJ_DTYPE_ENUM, 'internal', false, false, false, array('internal','protocol','network','server','route','path','plugin','addon','mail','group','album','photo','profile','event','item','api','package','file','avarta','client','discussion','key','location','person','queue','template'));
        $this->initVar('guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('network-guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('hash', XOBJ_DTYPE_TXTBOX, 0, false, 32);
        $this->initVar('key-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('network-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('server-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('path-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('api-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('class', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('module', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('tags', XOBJ_DTYPE_TXTBOX, '', false, 255);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaGuidHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaGuidHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_guid", "XFriendicaGuid", "id", 'gcid');
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