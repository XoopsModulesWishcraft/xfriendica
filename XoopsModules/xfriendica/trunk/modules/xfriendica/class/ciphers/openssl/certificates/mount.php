<?php

class XFriendicaOpensslCertificatesMount  extends XFriendicaOpensslCertificates {
	
	function public_key($pubkey)
	{
		if (empty($pubkey))
			$this->_public_key = file_get_contents(XOOPS_VAR_PATH.DS.'xfriendica'.DS.'pki'.DS.'public'.DS.$this->getToken().".crt");
		else
			$this->_public_key = $pubkey;
		
		$this->_key = $this->_public_key;
		openssl_get_publickey($this->_public_key);
	}
	
	function private_key($privkey)
	{
		if (empty($privkey))
			$this->_private_key = file_get_contents(XOOPS_VAR_PATH.DS.'xfriendica'.DS.'pki'.DS.'private'.DS.$this->getToken().".key");
		else
			$this->_private_key = $privkey;
		
		$this->_key = openssl_get_privatekey($this->_private_key, $this->_passphrase);
	}

	function server_public_key()
	{
		$this->_public_key = file_get_contents(XOOPS_VAR_PATH.DS.'xfriendica'.DS.'pki'.DS.'public'.DS."server.crt");
		$this->_key = $this->_public_key;
		openssl_get_publickey($this->_public_key);
	}
	
	function server_private_key()
	{
		$this->_private_key = file_get_contents(XOOPS_VAR_PATH.DS.'xfriendica'.DS.'pki'.DS.'private'.DS."server.key");
		$this->_key = openssl_get_privatekey($this->_private_key, $this->_passphrase);
	}
	
}

?>