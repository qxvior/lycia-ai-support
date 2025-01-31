MAIN
  DEFINE s STRING
  DEFINE ja util.JsonArray  
  DEFINE jo util.JsonObject
  DEFINE dict DICTIONARY
  
  LET s = '[[{
			"policyholder":	{
				"fullname":	"Jonathan Archer",
				"dob":	"04/08/2112",
				"idnumber":	"NX-01",
				"phone":	["Bridge", "Home"],
				"email":	["TheFuture.Xindicom"],
				"clienttype":	"JOINT FIRST",
				"clientrefid":	1234567890
		},
			"addressuk":	{
				"address1":	"Captains Cabin",
				"address2":	"Enterprise",
				"city":	"San Francisco",
				"country":	"USA",
				"countrycode":	"USA",
				"postcode":	"NX-01",
				"addressstatus":	"ACTIVE",
				"addresstype":	"MAIN",
				"addressrefid":	98765
		},
			"policy":	[{
					"policynumber":	"UK98765/1",
					"policystatus":	"ACTIVE",
					"premium":	123.45,
					"policytype":	"BOND",
					"contractrefid":	87654
			}]
	}, {
			"policyholder":	{
				"fullname":	"James Tiberius Kirk",
				"dob":	"22/03/2233",
				"idnumber":	"NCC-1701",
				"phone":	["Channel 1", "Netflix"],
				"email":	["Starbase1@rigel6.com", "DeepSpace9@EpsilonG.com", "Boldly@Gone.com"],
				"clienttype":	"JOINT SECOND",
				"clientrefid":	234567890
		},
			"addressuk":	{
				"address1":	"Captains Cabin",
				"address2":	"Enterprise",
				"city":	"San Francisco",
				"country":	"USA",
				"countrycode":	"USA",
				"postcode":	"NCC-1701B",
				"addressstatus":	"ACTIVE",
				"addresstype":	"MAIN",
				"addressrefid":	76543
		},
			"monitorwarning":	[{
					"monitorcode":	"PEP",
					"monitorreason":	"His Relationship With Spock"
			}],
			"policy":	[{
					"policynumber":	"UK98765/1",
					"policystatus":	"ACTIVE",
					"premium":	123.45,
					"policytype":	"BOND",
					"contractrefid":	87654
			}, {
					"policynumber":	"UK98765/2",
					"policystatus":	"ACTIVE",
					"premium":	234.56,
					"policytype":	"CIC",
					"warningmessage":	"Damn Right There Is!",
					"contractrefid":	76543
			}]
	}]]'
				
				
  LET ja = util.JSONArray.parse(s)
  LET ja = ja.get(1)
  
  LET jo = ja.get(1)
  CALL jo.ToFGL(dict)
  DISPLAY "=========================FIRST RECORD=================================="
  CALL dict.keySort()
  DISPLAY dict

  CALL dict.Clear() 
  LET jo = ja.get(2)
  CALL jo.ToFGL(dict)
  DISPLAY "========================SECOND RECORD=================================="
  CALL dict.keySort()
  DISPLAY dict
  DISPLAY "====================SECOND RECORD policy array========================="
  DISPLAY dict["policy"]
  DISPLAY "=============SECOND RECORD policy array - first element ==============="
  DISPLAY dict["policy"][1]
  
END MAIN