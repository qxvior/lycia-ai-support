DATABASE utf_test
MAIN
DEFINE f1 CHAR(20)
		CREATE TEMP TABLE temp_lang(
			language_code        char(3),
			language_text        char(20),
			yes_flag             char(1),
			no_flag              char(1),
			national_text        char(20) 
		)
LOAD FROM "0724/language.unl" INSERT INTO temp_lang
SELECT national_text into f1 from temp_lang where language_code="ZHI"
DISPLAY "|",f1,"|" 
END MAIN