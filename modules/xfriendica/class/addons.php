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
 * This File:	addons.php
 * Description:	Addons Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaAddons extends XoopsObject
{
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, null, true);
        $this->initVar('salt', XOBJ_DTYPE_TXTBOX, hash(__CLASS__.__FUNCTION__.__LINE__.microtime(true)._MI_XFRND_SALT.XOOPS_DB_HOST.XOOPS_DB_PASS.XOOPS_DB_USER.XOOPS_DB_NAME.XOOPS_ROOT_PATH, 128), false, 128);
        $this->initVar('guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('name', XOBJ_DTYPE_TXTBOX, '', false, 255);
        $this->initVar('version', XOBJ_DTYPE_TXTBOX, '', false, 255);
        $this->initVar('version-php', XOBJ_DTYPE_TXTBOX, '', false, 16);
        $this->initVar('version-xoops', XOBJ_DTYPE_TXTBOX, '', false, 16);
        $this->initVar('version-friendica', XOBJ_DTYPE_TXTBOX, '', false, 16);
        $this->initVar('dirname', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('filename', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('protocol-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('function', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('class', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('prefix', XOBJ_DTYPE_TXTBOX, '', false, 8);
        $this->initVar('network-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('path-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('api-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('upgraded', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('installed', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('hidden', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('system', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('admin', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('resources', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('modules', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('protocols', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('optionals', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('last', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaAddonsHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaAddonsHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_addons", "XFriendicaAddons", "id", 'name');
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