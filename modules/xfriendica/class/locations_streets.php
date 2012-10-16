<?php
/*
 * Logs Guest and users IP Addresses for a period of time and provides
 * basic statistic of them in XOOPS Copyright (C) 2012 Simon Roberts 
 * Locations_streets: wishcraft - simon@chronolabs.com
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
 * This File:	mail.php
 * Description:	Locations_streets Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaLocations_streets extends XoopsObject
{
	
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, 0, true);
        $this->initVar('region-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('city-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('country-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('postcode-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('unit', XOBJ_DTYPE_TXTBOX, '', false, 8);
        $this->initVar('number', XOBJ_DTYPE_TXTBOX, '', false, 10);
        $this->initVar('street', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('street-type', XOBJ_DTYPE_TXTBOX, '', false, 32);
        $this->initVar('suplimental', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('longitude', XOBJ_DTYPE_FLOAT, 0, false);
        $this->initVar('latitude', XOBJ_DTYPE_FLOAT, 0, false);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
        
                
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaLocations_streetsHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaLocations_streetsHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_locations_streets", "XFriendicaLocations_streets", "id", 'name');
    }
    
}
?>