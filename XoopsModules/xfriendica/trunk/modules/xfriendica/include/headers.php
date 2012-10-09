<?php

		// Core Settings on XIPS Header Data
		// module name
		header('XIPS-Instance-Network-Name: XFriendica');
		// site name
		header('XIPS-Instance-Network-Site: XOOPS Site');
		// global identify guid for this instance
		header('XIPS-Identity-Network-GUID: sdjkrfy834756346o52h64o3r87267ho3468o234dgbodg56g');
		// your handshake for this instance
		header('XIPS-Handshake-Network-Key: sdlfku489ujf984v5ghijrehg89067ho3468o234dgbodg56g');
		// your handshake method for this instance
		header('XIPS-Handshake-Network-Method: XIPSNetworkAuth');
		// your Network Acceptance Type for this instance can be: accepted, added, not accepting, requires secret
		header('XIPS-Instance-Network-Acceptance: accepted');
		// (Optional) your Network Secret for this instance is only required when it is a private network 
		// and Network-Acceptance = requires secret
		header('XIPS-Instance-Network-Secret: 84v5ghi8o234dgbojrehg89067ho346sdlfku489ujf9dg56g');
		// URL for Root of Site
		header('XIPS-Instance-Network-URL: '.XOOPS_URL);
		// Version of XFriendica Engine
		header('XIPS-Instance-Engine-Version: 1.2.3');
		// Version of XFriendica XIPS Protocol Engine
		header('XIPS-Protocol-Engine-Version: 1.2.3');
		// Version of XFriendica XIPS Services Engine
		header('XIPS-Services-Engine-Version: 1.2.3');
		// Version of XFriendica XIPS User API Engine
		header('XIPS-API-Engine-Version: 1.2.3');
		// Version of XFriendica XIPS Push Engine
		header('XIPS-Push-Engine-Version: 1.2.3');
		// Version of XFriendica XIPS Pull Engine
		header('XIPS-Pull-Engine-Version: 1.2.3');
		// GMT of Instance
		header('XIPS-Instance-Network-GMT: 10.00+');
		// Time of Day Services and API is Open Seconds of Day ie 0 = 0:0:0
		header('XIPS-Instance-Network-Opens: 0');
		// Time of Day Services and API is Open Seconds of Day ie. 86399 = 23:59:59
		header('XIPS-Instance-Network-Closes: 86399');
		// Time when system came online last
		header('XIPS-Instance-Network-Online: 138736423');
		// Number of Seconds to Wait between Polling Function (Otherwise presented 404)
		header('XIPS-Instance-Interval-Poll: 5');
		// Number of Seconds to Wait between Pushing a Function (Otherwise presented 404)
		header('XIPS-Instance-Interval-Push: 5');
		// (Optional) When the API & Services are Offline till by Server Time
		header('XIPS-Instance-Network-Offline: 138736423');
		
		
		// API Settings on XIPS Header Data
		// API Location
		header('XIPS-API-User-Location: /modules/friendica/api/');
		// Methods available on API
		header('XIPS-API-User-Methods: json,serial,xml,soap');
		// List of API Functions
		header('XIPS-API-User-Functions: /modules/friendica/api/functions/');
		// Authentication Method on API (REST String to provide)
		header('XIPS-API-User-Authentication: username=%email%&password=%password%');
		// Method of Password Passing can be md5, sha1 or open
		header('XIPS-API-Password-Method: md5');
		
		// Services Settings on XIPS Header Data
		// Number of Protocols available for download and use on Services
		header('XIPS-Services-Numberof-Protocols: 4');
		// Number of Addons available for download and use on Services
		header('XIPS-Services-Numberof-Addons: 3');
		// Number of Plugins available for download and use on Services
		header('XIPS-Services-Numberof-Plugins: 5');
		// Number of Addons available for download and use on Services
		header('XIPS-Services-Numberof-Adaptors: 3');
		// Number of Plugins available for download and use on Services
		header('XIPS-Services-Numberof-Connectors: 5');
		// Number of Plugins available for download and use on Services
		header('XIPS-Services-Numberof-Resources: 0');
		// Methods available on Services
		header('XIPS-Services-API-Methods: json,serial,xml,soap');
		// Methods available on Services
		header('XIPS-Services-API-Types: Protocols=protocol,Addons=addon,Plugins=plugin,Adaptors=adaptor,Connectors=connector,Resources=resource');
		// URI for Services API for Resources
		header('XIPS-Plugins-Resources-Location: /modules/friendica/services/resources/');
		// URI for List of Functions on Services API for Resources
		header('XIPS-Plugins-Resources-Functions: /modules/friendica/services/resources/functions/');
		// URI for List of Resources available on Services API for Downloading
		header('XIPS-Plugins-Resources-List: /modules/friendica/services/resources/available/');
		// URI for Services API for Plugins
		header('XIPS-Plugins-Services-Location: /modules/friendica/services/plugins/');
		// URI for List of Functions on Services API for Plugins
		header('XIPS-Plugins-Services-Functions: /modules/friendica/services/plugins/functions/');
		// URI for List of Plugins available on Services API for Downloading
		header('XIPS-Plugins-Services-List: /modules/friendica/services/plugins/available/');
		// URI for Services API for Addons
		header('XIPS-Addons-Services-Location: /modules/friendica/services/addons/');
		// URI for List of Functions on Services API for Addons
		header('XIPS-Addons-Services-Functions: /modules/friendica/services/addons/functions/');
		// URI for List of Addons available on Services API for Downloading
		header('XIPS-Addons-Services-List: /modules/friendica/services/addons/available/');
		// URI for Services API for Adaptors
		header('XIPS-Adaptors-Services-Location: /modules/friendica/services/adaptors/');
		// URI for List of Functions on Services API for Adaptors
		header('XIPS-Adaptors-Services-Functions: /modules/friendica/services/adaptors/functions/');
		// URI for List of Adaptors available on Services API for Downloading
		header('XIPS-Adaptors-Services-List: /modules/friendica/services/adaptors/available/');
		// URI for Services API for Connectors
		header('XIPS-Connectors-Services-Location: /modules/friendica/services/connectors/');
		// URI for List of Functions on Services API for Connectors
		header('XIPS-Connectors-Services-Functions: /modules/friendica/services/connectors/functions/');
		// URI for List of Connectors available on Services API for Downloading
		header('XIPS-Connectors-Services-List: /modules/friendica/services/connectors/available/');
		// URI for Services API for Protocols
		header('XIPS-Protocols-Services-Location: /modules/friendica/services/protocols/');
		// URI for List of Functions on Services API for Protocols
		header('XIPS-Protocols-Services-Functions: /modules/friendica/services/protocols/functions/');
		// URI for List of Protocols available on Services API for Downloading
		header('XIPS-Protocols-Services-List: /modules/friendica/services/protocols/available/');
		// URI for Services API for Pushing Data
		header('XIPS-Push-Services-Location: /modules/friendica/services/push/');
		// URI for List of Functions on Services API for Pushing Data
		header('XIPS-Push-Services-Functions: /modules/friendica/services/push/functions/');
		// URI for Services API for Poll
		header('XIPS-Poll-Services-Location: /modules/friendica/services/poll/');
		// URI for List of Functions on Services API for Poll
		header('XIPS-Poll-Services-Functions: /modules/friendica/services/poll/functions/');
			
?>