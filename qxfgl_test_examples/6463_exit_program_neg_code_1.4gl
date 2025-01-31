MAIN
DEFINE ln_run_return INT
DEFINE lc_run_cmd CHAR(250)

LET lc_run_cmd = "./6463_exit_program_neg_code_2" 
RUN lc_run_cmd RETURNING ln_run_return

LET ln_run_return = ln_run_return/256
DISPLAY ln_run_return

END MAIN 