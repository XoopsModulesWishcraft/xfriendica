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
 * Description:	Queue Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaQueue extends XoopsObject
{
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, null, true, 40);
        $this->initVar('guid', XOBJ_DTYPE_TXTBOX, 0, false, 64);
        $this->initVar('method', XOBJ_DTYPE_ENUM, '', false, false, false, array('push','pull','ping','check','patch','update','none'));
        $this->initVar('type', XOBJ_DTYPE_ENUM, '', false, false, false, array('plugin','addon','adaptor','connector','event','profile','photo','item','mail','file','person','syndicate','announce','update','none','search','friends','keywords'));
        $this->initVar('type-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('command', XOBJ_DTYPE_TXTBOX, '', false, 32);
        $this->initVar('start', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('finish', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('tasks', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('taken', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('calls', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('success', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('failed', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('retries', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('rescheduled', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaQueueHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaQueueHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_queue", "XFriendicaQueue", "id", 'cmd');
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