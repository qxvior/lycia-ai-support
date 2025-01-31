MAIN
    START REPORT rep_p
        OUTPUT TO REPORT rep_p()
    FINISH REPORT rep_p

    START REPORT rep_p_s
        OUTPUT TO REPORT rep_p_s()
    FINISH REPORT rep_p_s

    START REPORT rep_inp
        OUTPUT TO REPORT rep_inp()
    FINISH REPORT rep_inp

    START REPORT rep_inp_s
        OUTPUT TO REPORT rep_inp_s()
    FINISH REPORT rep_inp_s
    
    CALL fgl_getkey()
END MAIN

REPORT rep_p_s()
 DEFINE c CHAR(20) 
 FORMAT
    FIRST PAGE HEADER
        PROMPT "1" FOR CHAR c
            ON KEY (ESC,INTERRUPT)
        END PROMPT
        PRINT c

    PAGE HEADER
        PROMPT "1" FOR CHAR c
            ON KEY (ESC,INTERRUPT)
        END PROMPT
        PRINT c

    ON EVERY ROW 
        PROMPT "1" FOR CHAR c
            ON KEY (ESC,INTERRUPT)
        END PROMPT
        PRINT c

    ON LAST ROW
        PROMPT "1" FOR CHAR c
            ON KEY (ESC,INTERRUPT)
        END PROMPT
        PRINT c

    PAGE TRAILER
        PROMPT "1" FOR CHAR c
            ON KEY (ESC,INTERRUPT)
        END PROMPT
        PRINT c
END REPORT

REPORT rep_p()
 DEFINE c CHAR(20) 
 FORMAT        
    FIRST PAGE HEADER
        PROMPT "1" FOR CHAR c
        PRINT c

    PAGE HEADER
        PROMPT "1" FOR CHAR c
        PRINT c

    ON EVERY ROW 
        PROMPT "1" FOR CHAR c
        PRINT c

    ON LAST ROW
        PROMPT "1" FOR CHAR c
        PRINT c

    PAGE TRAILER
        PROMPT "1" FOR CHAR c
        PRINT c
END REPORT

REPORT rep_inp_s()
DEFINE c CHAR(20)
FORMAT
    FIRST PAGE HEADER
        OPEN WINDOW W WITH FORM "8349/8349_report_prompt_input" ATTRIBUTE(BORDER)
        INPUT BY NAME c
            ON ACTION show DISPLAY "action text"
        END INPUT
        PRINT c
        CLOSE WINDOW w
END REPORT

REPORT rep_inp()
DEFINE c CHAR(20)
FORMAT
    FIRST PAGE HEADER
        OPEN WINDOW W WITH FORM "8349/8349_report_prompt_input" ATTRIBUTE(BORDER)
        INPUT BY NAME c
        PRINT c
        CLOSE WINDOW w
END REPORT 