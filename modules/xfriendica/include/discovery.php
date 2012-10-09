<?php

function curl_parse ( $response )
{
	if (empty($response))
	{
		return array();
	}

	@list($headers,$body) = explode("\r\n\r\n",$response,2);
	$lines = explode("\r\n",$headers);

	if (preg_match('@^HTTP/[0-9]\.[0-9] +100@', $lines[0]))
	{
		/* HTTP/1.x 100 Continue
		 * the real data is on the next line
		*/
		@list($headers,$body) = explode("\r\n\r\n",$body,2);
		$lines = explode("\r\n",$headers);
	}

	// first line of headers is the HTTP response code
	$http_line = array_shift($lines);
	if (preg_match('@^HTTP/[0-9]\.[0-9] +([0-9]{3})@', $http_line, $matches))
	{
		$code = $matches[1];
	}

	// put the rest of the headers in an array
	$headers = array();
	foreach ($lines as $l)
	{
		list($k, $v) = explode(': ', $l, 2);
		$headers[strtolower($k)] = $v;
	}

	return array( 'code' => $code, 'headers' => $headers, 'body' => $body);
}

$header[]         = 'Content-Type: application/octet-stream';
$header[]         = 'XIPS-Interface-Network-GUID: 348906u8hgdfog890403hy9gfduivhopdzt348g99p80j';
// Required when Intialising with a Private Network You need the Network Secret for your service
  $header[]         = 'XIPS-Interface-Network-Secret: wty8ufn5789wch87h87w54h8c785u4hg8uwh84th659';
  $header[]         = 'XIPS-Interface-Network-Callback: http://mysite.com/modules/friendica/services/callback'; 
  $header[]         = 'XIPS-Interface-Handshake-Method: XIPSAuth';

curl_setopt($ch, CURLOPT_HTTPHEADER,	 	$header);
curl_setopt($ch, CURLOPT_USERAGENT,		 	'XFriendica 1.2.3/XIPS Discovery (XIPS 1.0.1, PHP '.PHP_VERSION.', '.XOOPS_VERSION.')');
curl_setopt($ch, CURLOPT_URL, 			 	$url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 	true);
curl_setopt($ch, CURLOPT_HEADER, 		 	true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 	false);
curl_setopt($ch, CURLOPT_VERBOSE, 			false);
curl_setopt($ch, CURLOPT_TIMEOUT, 		 	45);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 	45);
$data = curl_parse(curl_exec($ch));
curl_close($ch);

// $data['header'] contains the following information retrieved from the service

// XIPS-Instance-Network-Name: XFriendica
// XIPS-Instance-Network-Site: XOOPS Site
// XIPS-Identity-Network-GUID: sdjkrfy834756346o52h64o3r87267ho3468o234dgbodg56g
// XIPS-Handshake-Network-Key: sdlfku489ujf984v5ghijrehg89067ho3468o234dgbodg56g
// XIPS-Handshake-Network-Method: XIPSNetworkAuth
// XIPS-Instance-Network-Acceptance: accepted
// XIPS-Instance-Network-Secret: 84v5ghi8o234dgbojrehg89067ho346sdlfku489ujf9dg56g
// XIPS-Instance-Network-URL: http://xfriendica.com
// XIPS-Instance-Engine-Version: 1.2.3
// XIPS-Protocol-Engine-Version: 1.2.3
// XIPS-Services-Engine-Version: 1.2.3
// XIPS-API-Engine-Version: 1.2.3
// XIPS-Push-Engine-Version: 1.2.3
// XIPS-Pull-Engine-Version: 1.2.3
// XIPS-Instance-Network-GMT: 10.00+
// XIPS-Instance-Network-Opens: 0
// XIPS-Instance-Network-Closes: 86399
// XIPS-Instance-Network-Online: 138736423
// XIPS-Instance-Interval-Poll: 5
// XIPS-Instance-Interval-Push: 5
// XIPS-Instance-Network-Offline: 138736423
// XIPS-API-User-Location: http://xfriendica.com/modules/friendica/api/
// XIPS-API-User-Methods: json,serial,xml,soap
// XIPS-API-User-Functions: http://xfriendica.com/modules/friendica/api/functions/
// XIPS-API-User-Authentication: username=%email%&password=%password%
// XIPS-API-Password-Method: md5
// XIPS-Services-Numberof-Protocols: 4
// XIPS-Services-Numberof-Addons: 3
// XIPS-Services-Numberof-Plugins: 5
// XIPS-Services-Numberof-Adaptors: 3
// XIPS-Services-Numberof-Connectors: 5
// XIPS-Services-Numberof-Resources: 0
// XIPS-Services-API-Methods: json,serial,xml,soap
// XIPS-Services-API-Types: Protocols=protocol,Addons=addon,Plugins=plugin,Adaptors=adaptor,Connectors=connector,Resources=resource
// XIPS-Plugins-Resources-Location: http://xfriendica.com/modules/friendica/services/resources/
// XIPS-Plugins-Resources-Functions: http://xfriendica.com/modules/friendica/services/resources/functions/
// XIPS-Plugins-Resources-List: http://xfriendica.com/modules/friendica/services/resources/available/
// XIPS-Plugins-Services-Location: http://xfriendica.com/modules/friendica/services/plugins/
// XIPS-Plugins-Services-Functions: http://xfriendica.com/modules/friendica/services/plugins/functions/
// XIPS-Plugins-Services-List: http://xfriendica.com/modules/friendica/services/plugins/available/
// XIPS-Addons-Services-Location: http://xfriendica.com/modules/friendica/services/addons/
// XIPS-Addons-Services-Functions: http://xfriendica.com/modules/friendica/services/addons/functions/
// XIPS-Addons-Services-List: http://xfriendica.com/modules/friendica/services/addons/available/
// XIPS-Adaptors-Services-Location: http://xfriendica.com/modules/friendica/services/adaptors/
// XIPS-Adaptors-Services-Functions: http://xfriendica.com/modules/friendica/services/adaptors/functions/
// XIPS-Adaptors-Services-List: http://xfriendica.com/modules/friendica/services/adaptors/available/
// XIPS-Connectors-Services-Location: http://xfriendica.com/modules/friendica/services/connectors/
// XIPS-Connectors-Services-Functions: http://xfriendica.com/modules/friendica/services/connectors/functions/
// XIPS-Connectors-Services-List: http://xfriendica.com/modules/friendica/services/connectors/available/
// XIPS-Protocols-Services-Location: http://xfriendica.com/modules/friendica/services/protocols/
// XIPS-Protocols-Services-Functions: http://xfriendica.com/modules/friendica/services/protocols/functions/
// XIPS-Protocols-Services-List: http://xfriendica.com/modules/friendica/services/protocols/available/
// XIPS-Push-Services-Location: http://xfriendica.com/modules/friendica/services/push/
// XIPS-Push-Services-Functions: http://xfriendica.com/modules/friendica/services/push/functions/
// XIPS-Poll-Services-Location: http://xfriendica.com/modules/friendica/services/poll/
// XIPS-Poll-Services-Functions: http://xfriendica.com/modules/friendica/services/poll/functions/
//