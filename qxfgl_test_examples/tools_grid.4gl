


FUNCTION grid_export(grid_name)
  DEFINE 
    grid_name VARCHAR(50),
    exp_format SMALLINT,
    exp_location SMALLINT,
    local_debug SMALLINT,
    exp_start,exp_end INTEGER,
    exp_location_name_arr ARRAY[2] OF VARCHAR(20),
    exp_format_name_arr ARRAY[2] OF VARCHAR(20)

  LET local_debug = FALSE

  #initialise variables
  LET exp_format = 1  --HTML
  LET exp_location = 1  --Clipboard

  LET exp_location_name_arr[1] = "clipboard"
  LET exp_location_name_arr[2] = "file"

  LET exp_format_name_arr[1] = "html"
  LET exp_format_name_arr[2] = "csv"

  # set help file '10' (10 is used for this tools library) define in congiruation & language   HELP FILE "msg/cm_context_help.erm",
  CALL set_classic_help_file(10)

  CALL fgl_window_open("w_grid_export",5,5,get_form_path("f_tools_grid_export"),TRUE)

  CALL fgl_settitle(get_str_tool(300)) 
  DISPLAY get_str_tool(300) TO lbTitle
  DISPLAY get_str_tool(301) TO dl_f1
  DISPLAY get_str_tool(302) TO dl_f2
  DISPLAY get_str_tool(303) TO dl_f3
  DISPLAY get_str_tool(304) TO dl_f4
  DISPLAY get_str_tool(305) TO dl_guide

  INPUT BY NAME exp_format,exp_location,exp_start,exp_end WITHOUT DEFAULTS HELP 500

  IF local_Debug THEN
    DISPLAY "grid_export() - grid_name=", grid_name
    DISPLAY "grid_export() - exp_start=", exp_start
    DISPLAY "grid_export() - exp_end=", exp_end
    DISPLAY "grid_export() - exp_location_name_arr[exp_location]=", exp_location_name_arr[exp_location]
    DISPLAY "grid_export() - exp_format_name_arr[exp_format]=", exp_format_name_arr[exp_format]
    DISPLAY "grid_export() - exp_format=", exp_format
    DISPLAY "grid_export() - exp_location=", exp_location
  END IF

  CALL fgl_window_close("w_grid_export")

  CALL fgl_grid_export(grid_name,exp_start,exp_end,exp_location_name_arr[exp_location],exp_format_name_arr[exp_format])

  CALL set_classic_help_file(1)
END FUNCTION

