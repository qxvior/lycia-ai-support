GLOBALS "9654_glob.4gl"

MAIN
DISPLAY "Done"
END MAIN

FUNCTION etx_fundinter()

      SELECT payroll.fic_exempt INTO r_payroll.fic_exempt
         FROM payroll
        --  WHERE payroll.empl_no = r_payfile.empl_no

  RETURN TRUE

END FUNCTION