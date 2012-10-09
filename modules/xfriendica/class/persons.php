<?php
/*
 * Logs Guest and users IP Addresses for a period of time and provides
 * basic statistic of them in XOOPS Copyright (C) 2012 Simon Roberts 
 * Persons: wishcraft - simon@chronolabs.com
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
 * This File:	persons.php
 * Description:	Persons Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaPersons extends XoopsObject
{
	
	var $_chars = array();
	
	var $_texts = array();
	
	var $_keys = array();
	
	function setVar($key, $value) {
		if (isset($this->vars['chars-id-'.$key])) {
			if (isset($this->_chars[$key]))
				$this->_chars[$key]->setVar('value', $value);
			else {
				$persons_chars_handler = xoops_getmodulehandler('persons_chars', 'xfriendica');
				$this->_chars[$key] = $persons_chars_handler->create();
				$this->_chars[$key]->setVar('type', $key);
				$this->_chars[$key]->setVar('value', $value);
			}
		} elseif (isset($this->vars['texts-id-'.$key])) {
			if (isset($this->_texts[$key]))
				$this->_texts[$key]->setVar('value', $value);
			else {
				$persons_texts_handler = xoops_getmodulehandler('persons_texts', 'xfriendica');
				$this->_texts[$key] = $persons_texts_handler->create();
				$this->_texts[$key]->setVar('type', $key);
				$this->_texts[$key]->setVar('value', $value);
			}
		} elseif ($key = 'site-pubkey') {
			if (isset($this->_keys['keys-id-site']))
				$this->_keys['keys-id-site']->setVar('public', $value);
			else {
				$keys_handler = xoops_getmodulehandler('keys', 'xfriendica');
				$this->_keys['keys-id-site'] = $keys_handler->create();
				$this->_keys['keys-id-site']->setVar('type', 'persons');
				$this->_keys['keys-id-site']->setVar('public', $value);
			}
		} elseif ($key = 'pubkey') {
			if (isset($this->_keys['keys-id']))
				$this->_keys['keys-id']->setVar('public', $value);
			else {
				$keys_handler = xoops_getmodulehandler('keys', 'xfriendica');
				$this->_keys['keys-id'] = $keys_handler->create();
				$this->_keys['keys-id']->setVar('type', 'persons');
				$this->_keys['keys-id']->setVar('public', $value);
			}
		} elseif ($key = 'prvkey') {
			if (isset($this->_keys['keys-id']))
				$this->_keys['keys-id']->setVar('private', $value);
			else {
				$keys_handler = xoops_getmodulehandler('keys', 'xfriendica');
				$this->_keys['keys-id'] = $keys_handler->create();
				$this->_keys['keys-id']->setVar('type', 'persons');
				$this->_keys['keys-id']->setVar('private', $value);
			}
		} else {
			parent::setVar($key, $value);
		}
	}

	function assignVar($key, $value) {
		parent::assignVar($key, $value);
		if (isset($this->vars[$key])&&substr($key,0,strlen('chars-id-'))=='chars-id-'&&$value!=0) {
			$persons_chars_handler = xoops_getmodulehandler('persons_chars', 'xfriendica');
			$this->_chars[substr($key,strlen('chars-id-'),strlen($key)-strlen('chars-id-'))] = $persons_chars_handler->get($value);
		} elseif (isset($this->vars[$key])&&substr($key,0,strlen('texts-id-'))=='texts-id-'&&$value!=0) {
			$persons_texts_handler = xoops_getmodulehandler('persons_texts', 'xfriendica');
			$this->_texts[substr($key,strlen('texts-id-'),strlen($key)-strlen('texts-id-'))] = $persons_texts_handler->get($value);
		} elseif ($key = 'keys-id-site'&&$value!=0) {
			$keys_handler = xoops_getmodulehandler('keys', 'xfriendica');
			$this->_keys['keys-id-site'] = $keys_handler->get($value);
		} elseif ($key = 'keys-id'&&$value!=0) {
			$keys_handler = xoops_getmodulehandler('keys', 'xfriendica');
			$this->_keys['keys-id'] = $keys_handler->get($value);
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
		} elseif ($key = 'site-pubkey') {
			if (isset($this->_keys['keys-id-site']))
				return $this->_keys['keys-id-site']->getVar('public');
			else {
				return '';
			}
		} elseif ($key = 'pubkey') {
			if (isset($this->_keys['keys-id']))
				return $this->_keys['keys-id']->getVar('public');
			else {
				return '';
			}
		} elseif ($key = 'prvkey') {
			if (isset($this->_keys['keys-id']))
				return $this->_keys['keys-id']->getVar('private');
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
        $this->initVar('guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('state', XOBJ_DTYPE_ENUM, '', false, false, false, array('local','remote','unknown'));
        $this->initVar('code', XOBJ_DTYPE_TXTBOX, '', false, 32);
        $this->initVar('network-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('server-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('path-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('api-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('url-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('keys-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('skeys-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('longitude', XOBJ_DTYPE_FLOAT, 0, false);
        $this->initVar('latitude', XOBJ_DTYPE_FLOAT, 0, false);
        $this->initVar('location-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('avarta-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('last-url-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('protocol-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('key-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('firstname', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('lastname', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('alias', XOBJ_DTYPE_TXTBOX, '', false, 128);
        $this->initVar('one-liner', XOBJ_DTYPE_TXTBOX, '', false, 255);
        $this->initVar('priority', XOBJ_DTYPE_DECIMAL, 0, false);
        $this->initVar('activity', XOBJ_DTYPE_DECIMAL, 0, false);
        $this->initVar('rating', XOBJ_DTYPE_DECIMAL, 0, false);
        $this->initVar('readonly', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('writable', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('private', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('archived', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('readonly', XOBJ_DTYPE_ENUM, 'No', false, false, false, array('Yes', 'No'));
        $this->initVar('update', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('success', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('name', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('dob-year', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('votes', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('items', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('replies', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('emails', XOBJ_DTYPE_TXTBOX, '', false, 255);
        $this->initVar('spams', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('polled', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('requested', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('notified', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('confirmed', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
           
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaPersonsHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaPersonsHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_persons", "XFriendicaPersons", "id", 'name');
    }
    
    function insert($object, $force = true) {
    	if ($object->isNew()) {
    		$object->setVar('created', time());
    		$object = parent::get($persons_id = parent::insert($object, $force));
    	} else {
    		$object->setVar('updated', time());
    		$persons_id = $object->getVar('persons-id');
    	}
    	
    	$persons_chars_handler = xoops_getmodulehandler('persons_chars', 'xfriendica');
    	foreach($object->_chars as $key => $obj) {
    		if ($obj->isNew()||$obj->isDirty()) {
    			$object->_chars[$key]->setVar('persons-id', $persons_id);
    			$object->setVar('chars-id-'.$key, $persons_chars_handler->insert($object->_chars[$key], true));
    		}
    	}
    	$persons_texts_handler = xoops_getmodulehandler('persons_texts', 'xfriendica');
    	foreach($object->_texts as $key => $obj) {
    		if ($obj->isNew()||$obj->isDirty()) {
    			$object->_texts[$key]->setVar('persons-id', $persons_id);
    			$object->setVar('texts-id-'.$key, $persons_texts_handler->insert($object->_texts[$key], true));
    		}
    	}
    	$keys_handler = xoops_getmodulehandler('keys', 'xfriendica');
    	foreach($object->_keys as $key => $obj) {
    		if ($this->_keys[$key]->isNew()||$this->_keys[$key]->isDirty()) {
    			$object->setVar($key, $keys_handler->insert($object->_keys[$key], true));
    		}
    	}
    	
    	return parent::insert($object, $force);
    }
}
?>