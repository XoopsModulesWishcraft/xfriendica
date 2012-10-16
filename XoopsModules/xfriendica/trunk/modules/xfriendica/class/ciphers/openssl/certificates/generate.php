<?php

class XFriendicaOpensslCertificatesGenerate  extends XFriendicaOpensslCertificates {
	
	function generate()
	{
		$dn = array(	"countryName" 				=> $this->_countryName, 
						"stateOrProvinceName" 		=> $this->_stateOrProvinceName,
						"localityName"				=> $this->_localityName, 
						"organizationName" 			=> $this->_organizationName, 
						"organizationalUnitName" 	=> $this->_organizationalUnitName, 
						"commonName" 				=> $this->_commonName, 
						"emailAddress" 				=> $this->_emailAddress);
		
		//Passphrase can be taken during registration
		//Here its initialized to 1234 for sample
		$privkeypass = $this->_passphrase;
		$numberofdays = $this->_numberofdays;
		//RSA encryption and 1024 bits length
		$privkey = openssl_pkey_new(array('private_key_bits' => $this->_private_key_bits,'private_key_type' => $this->_private_key_type));
		$csr = openssl_csr_new($dn, $privkey);
		$sscert = openssl_csr_sign($csr, null, $privkey, $numberofdays);
		openssl_x509_export($sscert, $publickey);
		openssl_pkey_export($privkey, $privatekey, $privkeypass);
		openssl_csr_export($csr, $csrStr);
		
		$this->_public_key = $publickey;
		$this->_private_key = $privatekey;
		
		mkdir(XOOPS_VAR_PATH.DS.'xfriendica'.DS.'pki'.DS.'private', 0777, true);
		mkdir(XOOPS_VAR_PATH.DS.'xfriendica'.DS.'pki'.DS.'public', 0777, true);
		//Generated keys are stored into files
		$fp=fopen(XOOPS_VAR_PATH.DS.'xfriendica'.DS.'pki'.DS.'private'.DS.$this->getToken().".key","w");
		fwrite($fp,$privatekey);
		fclose($fp);
		$fp=fopen(XOOPS_VAR_PATH.DS.'xfriendica'.DS.'pki'.DS.'public'.DS.$this->getToken().".crt","w");
		fwrite($fp,$publickey);
		fclose($fp);
		
	}
	
}

?>