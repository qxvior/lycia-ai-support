#database soporcel
function abc()

	DEFINE  input_record  RECORD
    		CountryName  VARCHAR(255)
	END  RECORD

	DEFINE  output_record  RECORD
		GetCitiesByCountryResult  VARCHAR(255)
	END  RECORD

	
	MENU "TESTEAPP"
        COMMAND KEY ("CONTROL-C", "E") "Exit" "Return to the list menu"
            if ( int_flag ) then
                exit program
            end if

        command "Cities" "Get cities by country"

            	let int_flag = FALSE
            	let quit_flag = FALSE
	
	    	let input_record.CountryName = "portugal"
		
		call errorlog("input_record.CountryName")
		call errorlog(input_record.CountryName)
	    
		call GetCitiesByCountry(input_record.*) returning output_record.*
		
		call errorlog("##########################################################")
		call errorlog(output_record.GetCitiesByCountryResult)
		call errorlog("##########################################################")

	    #display "TESTE" at 4,5
	    #display output_record.GetCitiesByCountryResult at 5,5
	
		CALL fgl_winmessage(output_record.GetCitiesByCountryResult,output_record.GetCitiesByCountryResult,"info")
	end menu

end function
