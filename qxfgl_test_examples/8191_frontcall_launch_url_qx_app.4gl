MAIN
    DEFINE uri STRING
	MENU
		COMMAND "APP RESOURCE"
			CALL ui.Interface.frontCall("standard", "launchURL", ["qx://application/ttt.webp"], [])
		COMMAND "EXTERNAL URL"
            CALL ui.Interface.frontCall("standard", "launchURL", ["http://querix.com"], [])
		COMMAND "NO IFRAME"
            CALL ui.Interface.frontCall("standard", "launchURL", ["https://www.youtube.com/results?search_query=abc+news"], [])
		COMMAND "EXIT"
			EXIT MENU
	END MENU

END MAIN