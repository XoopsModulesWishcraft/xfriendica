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
 * Description:	Statistics Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaStatistics extends XoopsObject
{
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, null, true, 40);
        $this->initVar('type', XOBJ_DTYPE_ENUM, '', false, false, false, array('network','server','api','addon','avarta','discussion','event','file','group','item','key','location','mail','person','photo','album','plugin','profile','protocol','url','country','city','region'));
        $this->initVar('type-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hits-week', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hits-fortnight', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hits-month', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hits-quarter', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hits-year', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('ends-week', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('ends-fortnight', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('ends-month', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('ends-quarter', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('ends-year', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('session-week', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('session-fortnight', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('session-month', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('session-quarter', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('session-year', XOBJ_DTYPE_INT, 0, false);
     
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaStatisticsHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaStatisticsHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_statistics", "XFriendicaStatistics", "id", 'cmd');
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