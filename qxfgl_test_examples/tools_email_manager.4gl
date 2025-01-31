#########################################################################################################
# Functions for E-Mail handling
#
# Modification History:
# 01.12.06 HH - Created
#########################################################################################################

############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"

############################################################
# NOTE: This function is invoked from the toolbar. The Email Hotlink in the Gui contact form uses the HTML email tag
############################################################


##########################################################################################
# FUNCTION post_email_default_client(to_e_addr, to_e_name)
###########################################################################################
FUNCTION post_email_default_client(to_e_addr, to_e_name)
  DEFINE 
    from_e_addr, from_e_name, to_e_addr, to_e_name, f,t  VARCHAR(200),
    out_file_name VARCHAR(200),
    ret SMALLINT,
    local_debug SMALLINT,
    url_exec_name vARCHAR(200)

  LET local_debug = 0

  LET t = trim(to_e_addr)
  #CALL fgl_winmessage ("->" || t || "<-",t,"info")

  LET url_exec_name = "explorer mailto:", " ", trim(t)
  CALL winexec(url_exec_name)
  #mailto:<address_of_the_receiver>?cc=<whom_a_copy> &bcc=<whom_a_hidden_copy>&subject=<subject_of_the_message> &body=<text_of_the_message>"path_to_the_attached_file".

END FUNCTION

