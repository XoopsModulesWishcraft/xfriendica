<?php

class XFriendicaOpensslCertificatesPublic  extends XFriendicaOpensslCertificates {
	
	function encrypt($data)
	{
		if (openssl_public_encrypt($data, $result, $this->_key)) {
			return $result;
		}
		return false;
	}
	
	function decrypt($data)
	{
		if (openssl_private_decrypt($data, $result, $this->_key)) {
			return $result;
		}
		return false;
	}
	
}

?>