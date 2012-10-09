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
 * This File:	item.php
 * Description:	Item Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaItem extends XoopsObject
{
	
	var $_chars = array();
	
	var $_texts = array();
	
	function setVar($key, $value) {
		if (isset($this->vars['chars-id-'.$key])) {
			if (isset($this->_chars[$key]))
				$this->_chars[$key]->setVar('value', $value);
			else {
				$item_chars_handler = xoops_getmodulehandler('item_chars', 'xfriendica');
				$this->_chars[$key] = $item_chars_handler->create();
				$this->_chars[$key]->setVar('type', $key);
				$this->_chars[$key]->setVar('value', $value);
			}
		} elseif (isset($this->vars['texts-id-'.$key])) {
			if (isset($this->_texts[$key]))
				$this->_texts[$key]->setVar('value', $value);
			else {
				$item_texts_handler = xoops_getmodulehandler('item_texts', 'xfriendica');
				$this->_texts[$key] = $item_texts_handler->create();
				$this->_texts[$key]->setVar('type', $key);
				$this->_texts[$key]->setVar('value', $value);
			}
		} else {
			parent::setVar($key, $value);
		}
	}

	function assignVar($key, $value) {
		parent::assignVar($key, $value);
		if (isset($this->vars[$key])&&substr($key,0,strlen('chars-id-'))=='chars-id-'&&$value!=0) {
			$item_chars_handler = xoops_getmodulehandler('item_chars', 'xfriendica');
			$this->_chars[substr($key,strlen('chars-id-'),strlen($key)-strlen('chars-id-'))] = $item_chars_handler->get($value);
		} elseif (isset($this->vars[$key])&&substr($key,0,strlen('texts-id-'))=='texts-id-'&&$value!=0) {
			$item_texts_handler = xoops_getmodulehandler('item_texts', 'xfriendica');
			$this->_texts[substr($key,strlen('texts-id-'),strlen($key)-strlen('texts-id-'))] = $item_texts_handler->get($value);
		} 
	}

	function getVar($key, $format = 's') {
		if (isset($this->vars['chars-id-'.$key])) {
			if (isset($this->_chars[$key]))
				return $this->_chars[$key]->getVar('value');
			else {
				return '';
			}
		} elseif (isset($this->vars['texts-id-'.$key])) {
			if (isset($this->_texts[$key]))
				return $this->_texts[$key]->getVar('value');
			else {
				return '';
			}
		} else {
			return parent::getVar($key, $format);
		}
	}
	
    function __construct()
    {
    	
        $this->initVar('id', XOBJ_DTYPE_INT, 0, true);
        $this->initVar('person-id', XOBJ_DTYPE_INT, 0, true);
        $this->initVar('parent', XOBJ_DTYPE_INT, 0, true);
        $this->initVar('child', XOBJ_DTYPE_INT, 0, true);
        $this->initVar('guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('method', XOBJ_DTYPE_ENUM, '', false, false, false, array('raw','json','serial','xml'));
        $this->initVar('storage', XOBJ_DTYPE_ENUM, '', false, false, false, array('item','state'));
        $this->initVar('visibility', XOBJ_DTYPE_ENUM, '', false, false, false, array('global','network','localised','public','admins','moderators','friends','groups','open','closed'));
        $this->initVar('type', XOBJ_DTYPE_ENUM, '', false, false, false, array('plugin','adaptor','addon','connector','unknown'));
        $this->initVar('type-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('template-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('longitude', XOBJ_DTYPE_FLOAT, 0, false);
        $this->initVar('latitude', XOBJ_DTYPE_FLOAT, 0, false);
        $this->initVar('location-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('owner-person-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('author-person-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('moderator-person-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('parent-url-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('url-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('chars-id-title', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('chars-id-subtitle', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('texts-id-parent-paths', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('texts-id-body', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('texts-id-footer', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('moderated', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('event', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('forum', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('wall', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('gravity', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('visible', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('spam', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('starred', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('bookmark', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('unseen', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('deleted', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('original', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('last-child', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('network', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('syndicated', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('radius', XOBJ_DTYPE_DECIMAL, 0, false);
        $this->initVar('score', XOBJ_DTYPE_DECIMAL, 0, false);
        $this->initVar('activity', XOBJ_DTYPE_DECIMAL, 0, false);       
        $this->initVar('files', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('hits', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('votes', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('votes-close', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('commented', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('received', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('changed', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('responded', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state', XOBJ_DTYPE_ENUM, 'plugin', false, false, false, array('adaptor','plugin','addon','connector','event','item'));
        $this->initVar('state-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-key-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-token', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('state-parent-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-network-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-server-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-api-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-path-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-check', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-expired', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-deleted', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-pushed', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-pulled', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-hash', XOBJ_DTYPE_TXTBOX, '', false, 32);
        $this->initVar('state-template-hash', XOBJ_DTYPE_TXTBOX, '', false, 32);
        $this->initVar('state-template-guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('state-source', XOBJ_DTYPE_ENUM, 'server', false, false, false, array('server','network','unknown'));
        $this->initVar('state-source-guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('state-source-network-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-source-path-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-source-server-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-source-notified', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-source-called', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-source-given', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('state-source-hopped', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('state-source-direct', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('state-source-unknown', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);        
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaItemHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaItemHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_item", "XFriendicaItem", "id", 'guid');
    }
    
    function insert($object, $force = true) {
    	if ($object->isNew()) {
    		$object->setVar('created', time());
    		$object = parent::get($item_id = parent::insert($object, $force));
    	} else {
    		$object->setVar('updated', time());
    		$item_id = $object->getVar('item-id');
    	}
    	
    	$item_chars_handler = xoops_getmodulehandler('item_chars', 'xfriendica');
    	foreach($object->_chars as $key => $obj) {
    		if ($obj->isNew()||$obj->isDirty()) {
    			$object->_chars[$key]->setVar('item-id', $item_id);
    			$object->setVar('chars-id-'.$key, $item_chars_handler->insert($object->_chars[$key], true));
    		}
    	}
    	$item_texts_handler = xoops_getmodulehandler('item_texts', 'xfriendica');
    	foreach($object->_texts as $key => $obj) {
    		if ($obj->isNew()||$obj->isDirty()) {
    			$object->_texts[$key]->setVar('item-id', $item_id);
    			$object->setVar('texts-id-'.$key, $item_texts_handler->insert($object->_texts[$key], true));
    		}
    	}
    	return parent::insert($object, $force);
    }
}
?>