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
 * Description:	Event Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaEvent extends XoopsObject
{
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, null, true);
        $this->initVar('guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('type-id', XOBJ_DTYPE_INT, null, true);
        $this->initVar('person-id', XOBJ_DTYPE_INT, null, true);
        $this->initVar('location-id', XOBJ_DTYPE_INT, null, true);
        $this->initVar('invitees', XOBJ_DTYPE_INT, null, true);
        $this->initVar('attending', XOBJ_DTYPE_INT, null, true);
        $this->initVar('missing', XOBJ_DTYPE_INT, null, true);
        $this->initVar('maybe', XOBJ_DTYPE_INT, null, true);
        $this->initVar('url-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('start', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('finish', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('passion', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('nofinish', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('adjust', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('ignore', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('activity', XOBJ_DTYPE_DECIMAL, 0, false);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
        
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaEventHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaEventHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_event", "XFriendicaEvent", "id", 'cmd');
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