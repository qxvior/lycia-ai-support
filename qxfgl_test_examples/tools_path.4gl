#########################################################################################################
# Functions to access path / file access / file location
#
#
#
# FUNCTION                                        DESCRIPTION                                                RETURN
# get_client_temp_directory()                     Return client temp directory                               tl_client_temp_directory
# get_client_temp_path(file_name)                 Return file name with client temp path                     file_path
# get_cfg_directory()                             Return cfg directory                                       tl_settings.cfg_path
# get_cfg_path(cfg_name)                          Return file name with cfg path                             trim(ret)
# get_form_directory()                            Return cfg directory                                       tl_settings.form_path
# get_form_path(form_name)                        Return file name with form path                            trim(ret)
# get_image_directory()                           Return image directory                                     tl_settings.image_path
# get_image_path(image_name)                      Return file name with image path                           trim(ret)
# get_document_directory()                        Return document directory                                  tl_settings.document_path
# get_document_path(document_name)                Return file name with document path                        trim(ret)
# get_html_directory()                            Return html directory name                                 tl_settings.html_path
# get_html_path(document_name)                    Return file name with html path                            trim(ret)
# get_icon10_directory()                          Return icon10 (10pixel icon) directory                     tl_settings.icon10_path
# get_icon10_path(document_name)                  Return file name with 10pixel 'icon10' path                trim(ret)
# get_icon16_directory()                          Return icon10 (16pixel icon) directory                     tl_settings.icon16_path
# get_icon16_path(document_name)                  Return file name with 16pixel 'icon16' path                trim(ret)
# get_icon32_directory()                          Return icon32 (32pixel icon) directory                     tl_settings.icon32_path
# get_icon32_path(document_name)                  Return file name with 32pixel 'icon32' path                trim(ret)
# get_msg_directory()                             Return msg directory                                       tl_settings.msg_path 
# get_msg_path(file_name)                         Return file name with msg path                             trim(ret)
# get_unl_directory()                             Return unl directory                                       tl_settings.unl_path
# get_unl_path(file_name)                         Return file name with unl path                             trim(ret)
# get_online_demo_path()                          Return online path                                         tl_settings.unl_path
#########################################################################################################


############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


##################################################################################
# FUNCTION get_client_temp_directory()
#
# Return client temp directory
#
# RETURN tl_client_temp_directory
##################################################################################
FUNCTION get_client_temp_directory()

  RETURN tl_client_temp_directory

END FUNCTION


##################################################################################
# FUNCTION get_client_temp_path(file_name)
#
# Return file name with client temp path
#
# RETURN file_path
##################################################################################
FUNCTION get_client_temp_path(file_name)
  DEFINE
    file_path VARCHAR(200),
    file_name VARCHAR(100)

  LET file_path = tl_client_temp_directory CLIPPED, "/", file_name
	#????   #Define the client side document name and location
	#???  LET client_doc_name_with_path = trim(fgl_getproperty("gui", "system.file.client_temp", "")), "/", trim(doc_name)
  
  RETURN file_path

END FUNCTION


##################################################################################
# FUNCTION get_cfg_directory()
#
# Return cfg directory
#
# RETURN tl_settings.cfg_path
##################################################################################
FUNCTION get_cfg_directory()

  RETURN tl_settings.cfg_path

END FUNCTION


##################################################################################
# FUNCTION get_cfg_path(cfg_name)
#
# Return file name with cfg path
#
# RETURN trim(ret)
##################################################################################
FUNCTION get_cfg_path(cfg_name)
  DEFINE
    cfg_name VARCHAR(100),
    ret VARCHAR(200)

    LET ret = trim(tl_settings.cfg_path), "/", trim(cfg_name)
  RETURN trim(ret)
END FUNCTION


##################################################################################
# FUNCTION get_form_directory()
#
# Return cfg directory
#
# RETURN tl_settings.form_path
##################################################################################
FUNCTION get_form_directory()

  RETURN tl_settings.form_path

END FUNCTION


##################################################################################
# FUNCTION get_form_path(form_name)
#
# Return file name with form path
#
# RETURN trim(ret)
##################################################################################
FUNCTION get_form_path(form_name)
  DEFINE
    form_name VARCHAR(100),
    ret VARCHAR(200)

    LET ret = trim(tl_settings.form_path), "/", trim(form_name)
  RETURN trim(ret)
END FUNCTION


##################################################################################
# FUNCTION get_image_directory()
#
# Return image directory
#
# RETURN tl_settings.image_path
##################################################################################
FUNCTION get_image_directory()

  RETURN tl_settings.image_path

END FUNCTION


##################################################################################
# FUNCTION get_image_path(image_name)
#
# Return file name with image path
#
# RETURN trim(ret)
##################################################################################
FUNCTION get_image_path(image_name)
  DEFINE
    image_name VARCHAR(100),
    ret VARCHAR(200)

    LET ret = trim(tl_settings.image_path), "/", trim(image_name)
  RETURN trim(ret)
END FUNCTION


##################################################################################
# FUNCTION get_document_directory()
#
# Return document directory
#
# RETURN tl_settings.document_path
##################################################################################
FUNCTION get_document_directory()

  RETURN tl_settings.document_path

END FUNCTION


##################################################################################
# FUNCTION get_document_path(document_name)
#
# Return file name with document path
#
# RETURN trim(ret)
##################################################################################
FUNCTION get_document_path(document_name)
  DEFINE
    document_name VARCHAR(100),
    ret VARCHAR(200)

    LET ret = trim(tl_settings.document_path), "/", trim(document_name)
  RETURN trim(ret)
END FUNCTION


##################################################################################
# FUNCTION get_html_directory()
#
# Return html directory name
#
# RETURN tl_settings.html_path
##################################################################################
FUNCTION get_html_directory()

  RETURN tl_settings.html_path

END FUNCTION

##################################################################################
# FUNCTION get_html_path(document_name)
#
# Return file name with html path
#
# RETURN trim(ret)
##################################################################################
FUNCTION get_html_path(document_name)
  DEFINE
    document_name VARCHAR(100),
    ret VARCHAR(200)

    LET ret = trim(tl_settings.html_path), "/", trim(document_name)
  RETURN trim(ret)
END FUNCTION



##################################################################################
# FUNCTION get_icon10_directory()
#
# Return icon10 (10pixel icon) directory
#
# RETURN tl_settings.icon10_path
##################################################################################
FUNCTION get_icon10_directory()

  RETURN tl_settings.icon10_path

END FUNCTION


##################################################################################
# FUNCTION get_icon10_path(document_name)
#
# Return file name with 10pixel 'icon10' path
#
# RETURN trim(ret)
##################################################################################
FUNCTION get_icon10_path(icon_name)
  DEFINE
    icon_name VARCHAR(100),
    ret VARCHAR(200)

    LET ret = trim(tl_settings.icon10_path), "/", trim(icon_name)
  RETURN trim(ret)
END FUNCTION


##################################################################################
# FUNCTION get_icon16_directory()
#
# Return icon16 (16pixel icon) directory
#
# RETURN tl_settings.icon16_path
##################################################################################
FUNCTION get_icon16_directory()

  RETURN tl_settings.icon16_path

END FUNCTION


##################################################################################
# FUNCTION get_icon16_path(document_name)
#
# Return file name with 16pixel 'icon16' path
#
# RETURN trim(ret)
##################################################################################
FUNCTION get_icon16_path(icon_name)
  DEFINE
    icon_name VARCHAR(100),
    ret VARCHAR(200)

    LET ret = trim(tl_settings.icon16_path), "/", trim(icon_name)
  RETURN trim(ret)
END FUNCTION


##################################################################################
# FUNCTION get_icon32_directory()
#
# Return icon32 (32pixel icon) directory
#
# RETURN tl_settings.icon32_path
##################################################################################
FUNCTION get_icon32_directory()

  RETURN tl_settings.icon32_path

END FUNCTION


##################################################################################
# FUNCTION get_icon32_path(document_name)
#
# Return file name with 32pixel 'icon32' path
#
# RETURN trim(ret)
##################################################################################
FUNCTION get_icon32_path(icon_name)
  DEFINE
    icon_name VARCHAR(100),
    ret VARCHAR(200)

    LET ret = trim(tl_settings.icon32_path), "/", trim(icon_name)
  RETURN trim(ret)
END FUNCTION



##################################################################################
# FUNCTION get_msg_directory()
#
# Return msg directory
#
# RETURN tl_settings.msg_path
##################################################################################
FUNCTION get_msg_directory()

  RETURN tl_settings.msg_path

END FUNCTION


##################################################################################
# FUNCTION get_msg_path(file_name)
#
# Return file name with msg path
#
# RETURN trim(ret)
##################################################################################
FUNCTION get_msg_path(file_name)
  DEFINE
    file_name VARCHAR(100),
    ret VARCHAR(200)

    LET ret = trim(tl_settings.msg_path), "/", trim(file_name)
  RETURN trim(ret)
END FUNCTION


##################################################################################
# FUNCTION get_unl_directory()
#
# Return unl directory
#
# RETURN tl_settings.unl_path
##################################################################################
FUNCTION get_unl_directory()

  RETURN tl_settings.unl_path

END FUNCTION


##################################################################################
# FUNCTION get_unl_path(file_name)
#
# Return file name with unl path
#
# RETURN trim(ret)
##################################################################################
FUNCTION get_unl_path(file_name)
  DEFINE
    file_name VARCHAR(100),
    ret VARCHAR(200)

    LET ret = trim(tl_settings.unl_path), "/", trim(file_name)
  RETURN trim(ret)
END FUNCTION


##################################################################################
# FUNCTION get_online_demo_path()
#
# Return online path
#
# RETURN tl_settings.unl_path
##################################################################################
FUNCTION get_online_demo_path()

  RETURN tl_settings.online_demo_path

END FUNCTION

