<?php
/*
 * Logs Guest and users IP Addresses for a period of time and provides
 * basic statistic of them in XOOPS Copyright (C) 2012 Simon Roberts 
 * Item: wishcraft - simon@chronolabs.com
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
 * This File:	item_signed.php
 * Description:	Item_signed Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaItem_signed extends XoopsObject
{
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_TXTBOX, null, true);
        $this->initVar('item-id', XOBJ_DTYPE_INT, 0, true);
        $this->initVar('person-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('author-person-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('owner-person-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('retract-item-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('item-hash', XOBJ_DTYPE_TXTBOX, 0, false, 32);
        $this->initVar('item-date', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('signature', XOBJ_DTYPE_OTHER, 0, false);
        $this->initVar('signed', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('notified', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('requested', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('resigned', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaItem_signedHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaItem_signedHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_item_signed", "XFriendicaItem_signed", "id", 'item-hash');
    }
    
    function insert($object, $force = true) {
    	 
    	return parent::insert($object, $force);
    }
}
?>