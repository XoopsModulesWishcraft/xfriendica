<?php
/**
 * Extended User XfriendicaProfile_
 *
 * You may not change or alter any portion of this comment or credits
 * of supporting developers from this source code or any supporting source code
 * which is considered copyrighted (c) material of the original comment or credit authors.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * @copyright       The XOOPS Project http://sourceforge.net/projects/xoops/
 * @license         GNU GPL 2 (http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)
 * @package         profile
 * @since           2.3.0
 * @author          Jan Pedersen
 * @author          Taiwen Jiang <phppp@users.sourceforge.net>
 * @version         $Id: category.php 8066 2011-11-06 05:09:33Z beckmi $
 */

defined('XOOPS_ROOT_PATH') or die("XOOPS root path not defined");

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XfriendicaProfile_category extends XoopsObject
{
    function __construct()
    {
        $this->initVar('id', XOBJ_DTYPE_INT, null, true);
        $this->initVar('title', XOBJ_DTYPE_TXTBOX);
        $this->initVar('description', XOBJ_DTYPE_TXTAREA);
        $this->initVar('weight', XOBJ_DTYPE_INT);
    }

    function XfriendicaProfile_category()
    {
        $this->__construct();
    }

    /**
    * Get {@link XoopsThemeForm} for adding/editing categories
    *
    * @param mixed $action URL to submit to or false for $_SERVER['REQUEST_URI']
    *
    * @return object
    */
    function getForm($action = false)
    {
        if ($action === false) {
            $action = $_SERVER['REQUEST_URI'];
        }
        $title = $this->isNew() ? sprintf(_PROFILE_AM_ADD, _PROFILE_AM_CATEGORY) : sprintf(_PROFILE_AM_EDIT, _PROFILE_AM_CATEGORY);

        include_once $GLOBALS['xoops']->path('class/xoopsformloader.php');

        $form = new XoopsThemeForm($title, 'form', $action, 'post', true);
        $form->addElement(new XoopsFormText(_PROFILE_AM_TITLE, 'title', 35, 255, $this->getVar('title')));
        if (!$this->isNew()) {
            //Load groups
            $form->addElement(new XoopsFormHidden('id', $this->getVar('id')));
        }
        $form->addElement(new XoopsFormTextArea(_PROFILE_AM_DESCRIPTION, 'description', $this->getVar('description', 'e')));
        $form->addElement(new XoopsFormText(_PROFILE_AM_WEIGHT, 'weight', 35, 35, $this->getVar('weight', 'e')));

        $form->addElement(new XoopsFormHidden('op', 'save') );
        $form->addElement(new XoopsFormButton('', 'submit', _SUBMIT, 'submit'));

        return $form;
    }
}

/**
 * @package kernel
 * @copyright copyright &copy; 2000 XOOPS.org
 */
class XfriendicaProfile_categoryHandler extends XoopsPersistableObjectHandler
{
    function XfriendicaProfile_categoryHandler(&$db)
    {
        $this->__construct($db);
    }

    function __construct(&$db)
    {
        parent::__construct($db, "xfriendica_profile_category", "XfriendicaProfile_category", "id", 'title');
    }
}
?>