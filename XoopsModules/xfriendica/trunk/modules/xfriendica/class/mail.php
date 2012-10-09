<?php
/*
 * Logs Guest and users IP Addresses for a period of time and provides
 * basic statistic of them in XOOPS Copyright (C) 2012 Simon Roberts 
 * Mail: wishcraft - simon@chronolabs.com
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
 * Description:	Mail Handler and Object Class for Module
 * Date:		04/10/2012 10:45AM AEST
 * License:		GNU3
 * 
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaMail extends XoopsObject
{
	
	var $_chars = array();
	
	var $_texts = array();
	
	var $_users = array();
	
	var $_contacts = array();
	
	function setVar($key, $value) {
		if (isset($this->vars['chars-id-'.$key])) {
			if (isset($this->_chars[$key]))
				$this->_chars[$key]->setVar('value', $value);
			else {
				$mail_chars_handler = xoops_getmodulehandler('mail_chars', 'xfriendica');
				$this->_chars[$key] = $mail_chars_handler->create();
				$this->_chars[$key]->setVar('type', $key);
				$this->_chars[$key]->setVar('value', $value);
			}
		} elseif (isset($this->vars['texts-id-'.$key])) {
			if (isset($this->_texts[$key]))
				$this->_texts[$key]->setVar('value', $value);
			else {
				$mail_texts_handler = xoops_getmodulehandler('mail_texts', 'xfriendica');
				$this->_texts[$key] = $mail_texts_handler->create();
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
			$mail_chars_handler = xoops_getmodulehandler('mail_chars', 'xfriendica');
			$this->_chars[substr($key,strlen('chars-id-'),strlen($key)-strlen('chars-id-'))] = $mail_chars_handler->get($value);
		} elseif (isset($this->vars[$key])&&substr($key,0,strlen('texts-id-'))=='texts-id-'&&$value!=0) {
			$mail_texts_handler = xoops_getmodulehandler('mail_texts', 'xfriendica');
			$this->_texts[substr($key,strlen('texts-id-'),strlen($key)-strlen('texts-id-'))] = $mail_texts_handler->get($value);
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
        $this->initVar('users', XOBJ_DTYPE_INT, 0, true);
        $this->initVar('contacts', XOBJ_DTYPE_INT, 0, true);
        $this->initVar('guid', XOBJ_DTYPE_TXTBOX, '', false, 64);
        $this->initVar('person-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('discussion-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('chars-id-title', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('texts-id-body', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('url-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('parent-url-id', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('activity', XOBJ_DTYPE_DECIMAL, 0, false);
        $this->initVar('created', XOBJ_DTYPE_INT, 0, false);
        $this->initVar('updated', XOBJ_DTYPE_INT, 0, false);
        
                
    }

}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XFriendicaMailHandler extends XoopsPersistableObjectHandler
{
    function XFriendicaMailHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_mail", "XFriendicaMail", "id", 'name');
    }
    
    function insert($object, $force = true) {
    	if ($object->isNew()) {
    		$object->setVar('created', time());
    		$object = parent::get($mail_id = parent::insert($object, $force));
    	} else {
    		$object->setVar('updated', time());
    		$mail_id = $object->getVar('mail-id');
    	}
    	
    	$mail_chars_handler = xoops_getmodulehandler('mail_chars', 'xfriendica');
    	foreach($object->_chars as $key => $obj) {
    		if ($obj->isNew()||$obj->isDirty()) {
    			$object->_chars[$key]->setVar('mail-id', $mail_id);
    			$object->setVar('chars-id-'.$key, $mail_chars_handler->insert($object->_chars[$key], true));
    		}
    	}
    	$mail_texts_handler = xoops_getmodulehandler('mail_texts', 'xfriendica');
    	foreach($object->_texts as $key => $obj) {
    		if ($obj->isNew()||$obj->isDirty()) {
    			$object->_texts[$key]->setVar('mail-id', $mail_id);
    			$object->setVar('texts-id-'.$key, $mail_texts_handler->insert($object->_texts[$key], true));
    		}
    	}
    	
    	return parent::insert($object, $force);
    }
}
?>