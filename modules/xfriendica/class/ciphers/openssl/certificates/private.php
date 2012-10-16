<?php

class XFriendicaOpensslCertificatesPrivate  extends XFriendicaOpensslCertificates {
	
	function encrypt_private($data)
	{
		if (openssl_private_encrypt($data, $result, $this->_key)) {
			return $result;
		}
		return false;
	}
	
	function decrypt_private($data)
	{
		if (openssl_public_decrypt($data, $result, $this->_key)) {
			return $result;
		}
		return false;
	}
	
}

?>