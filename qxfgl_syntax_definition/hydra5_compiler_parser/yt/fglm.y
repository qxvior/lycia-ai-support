/* 
 * #%L
 * QUERIX
 * %%
 * Copyright (C) 2014 QUERIX
 * %%
 * ALL RIGTHS RESERVED.
 * 50 THE AVENUE
 * SOUTHAMPTON SO17 1XQ
 * UNITED KINGDOM
 * Tel ; +(44)02380 385 180
 * Fax : +(44)02380 635 118
 * http://www.querix.com/
 * #L%
 */
 
/*
_QXTGENERATED_
This file was generated from qxt template.
WARNING: do not change it!!!
 */
%{
    #include "JsonEngine.h"
namespace dyn = querix::fglm::engine;
#include "fglm.parser.h"
namespace querix {
  namespace meta {
    namespace parser {
        class Context;
    }
  }
}

%}
%token KW_VALUES KW_FULL KW_FOREIGN KW_SIZEOF KW_INTCON KW_NOT_LIKE
%token KW_DIALOGDOT KW_INPUTDOT
%token KW_DIMENSION KW_DOTSTAR KW_ON_LAST_ROW KW_CHAR
%token KW_ACCELERATOR4 KW_FLUSH KW_PREVIOUS KW_TO KW_AS KW_USING KW_UNLOCK
%token KW_BUFFERED KW_FOR_UPDATE KW_PRIOR KW_DOWN KW_SOAP_FAULT KW_OF
%token KW_LABEL KW_SELECT KW_REFERENCES KW_IF KW_STATIC KW_EQ KW_BORDER
%token KW_REOPTIMIZATION KW_END_SQL KW_CLUSTER KW_DIALOG KW_LPARENTHESIS
%token KW_ORDER_BY KW_SET KW_CYAN KW_ELSE KW_NAMED KW_PUT KW_NEXT_SIZE
%token KW_CREATE KW_BEGIN KW_END_GLOBALS KW_ISOLATION KW_PROCEDURE
%token KW_ARGUMENT_ERROR KW_SAVEPOINT KW_END_CONSTRUCT KW_BOTTOM_MARGIN
%token KW_MENU KW_DATABASE KW_CONTINUE_INPUT KW_OUTER KW_SECOND KW_YES
%token KW_ON_DELETE_CASCADE KW_NEXT KW_TIMER KW_DRAG_OVER KW_CLEAR
%token KW_WORDWRAP KW_TRANSACTION KW_TERMINATE KW_FRACTION KW_MODIFY KW_QUIT
%token KW_REVERSE KW_GROUP KW_EQEQ KW_SPACES KW_BETWEEN KW_SHARE
%token KW_BEFORE_GROUP_OF KW_INNER KW_LIKE KW_OTHERWISE KW_DATETIME KW_FETCH
%token KW_OR KW_ACCEPT_DISPLAY KW_LEFT KW_RESOLUTION KW_DEFAULTVIEW
%token KW_PAGE_LENGTH KW_DBA KW_PRINTER KW_OPEN KW_NAME KW_ALTER KW_OFF
%token KW_NEXT_FIELD_CURRENT KW_HOLD KW_BLINK KW_HIDE KW_DEFINE KW_IDENTIFIER
%token KW_IS_NULL KW_DISCONNECT KW_JAVA KW_ON_EVERY_ROW KW_LOCAL KW_WINDOW
%token KW_SIGNAL KW_EXIT_FOREACH KW_AT KW_MODE KW_DISTRIBUTIONS_ONLY
%token KW_EXIT_REPORT KW_INSERT KW_WHEN KW_END_FOREACH KW_PRINT KW_INDEX
%token KW_FIRST_PAGE_HEADER KW_VALIDATE KW_INTERVAL KW_MESSAGEBOX KW_MEDIUM
%token KW_TOP_OF_PAGE KW_NOT_IN KW_WORK KW_ACCELERATOR KW_CONCURRENT
%token KW_THROUGH KW_CLIPPED KW_ESCAPE KW_BLUE KW_THRU KW_NOT KW_IMAGE
%token KW_UNARYMINUS KW_MODULE KW_ROWBOUND KW_COLUMN KW_RESIZE_ARRAY
%token KW_FUNCTION KW_END_MAIN KW_FILTERING KW_DELETE KW_MAGENTA KW_LOG
%token KW_READ KW_TOP_MARGIN KW_RESTRICT KW_WRITE KW_DIRTY KW_GET KW_OPTIONS
%token KW_UNDER KW_ROW KW_UPDATE KW_MESSAGE KW_STRCAT KW_SYNONYM KW_PUBLIC
%token KW_ANY KW_ROLLBACK KW_SORT KW_LOCK KW_VARIABLE KW_MAXCOUNT KW_HIGH
%token KW_TEMPORARY KW_CURSOR KW_UNARYPLUS KW_APPLICATION KW_LOCK_MODE
%token KW_ONLY KW_CLOSE_FORM KW_GROUP_BY KW_WITH KW_FGL KW_HINT
%token KW_PRINT_SELECT KW_PIPE KW_CHECK KW_ADD KW_CONTINUE_FOREACH KW_IN
%token KW_PICTURE KW_FREE KW_NEXT_FIELD KW_FATAL_ERROR KW_DESTINATION KW_WEB
%token KW_SCREEN KW_OPTION KW_COUNT KW_STOP KW_NOT_FOUND KW_SQL KW_BY_NAME
%token KW_END_STREAM KW_NOTFOUND KW_REPORT KW_EXECUTE KW_HIGHEST KW_ROWIDS
%token KW_END_REPORT KW_EXPAND KW_HAVING KW_GLOBALS KW_ACCELERATOR2 KW_BLACK
%token KW_DEFAULT KW_BUFFER KW_ATTRIBUTE KW_UNDEFINED_FUNCTION KW_REPEATABLE
%token KW_AUTO KW_COLLAPSE KW_CONTINUE_MENU KW_RETURNING KW_EXPLAIN KW_COMMIT
%token KW_LOCATE_WINDOW KW_MAIN KW_NULL KW_END_FOR KW_TABLE KW_IDLE
%token KW_RELEASE KW_UPDATE_STATISTICS KW_CRCOLS KW_FOREACH KW_PROMPT
%token KW_RIGHT_MARGIN KW_DIM KW_LET KW_FILE KW_FALSE KW_BOLD KW_TRUE
%token KW_ACCELERATOR3 KW_VIEW KW_CANCEL KW_CONSTRAINT KW_KEY KW_ON
%token KW_ACCEPT_CONSTRUCT KW_GO KW_LE KW_STATUSBAR KW_ERROR KW_GREEN
%token KW_CONTINUE_WHILE KW_DISPLAY KW_AND KW_TEMP KW_MDY KW_GOTO KW_AFTER
%token KW_INSTANCEOF KW_UNION KW_PAGE KW_FOR KW_RETURN KW_DRAG_START KW_MOD
%token KW_EXIT_INPUT KW_SCHEMA KW_WHERE KW_DISABLED KW_ON_DELETE_RESTRICT
%token KW_CAST KW_CHANGE KW_WITH_FORM KW_CFUNCTION KW_OPEN_WINDOW KW_COMMAND
%token KW_LINES KW_RETURNS KW_END KW_ALTSTATUSBAR KW_END_TRY KW_WITHOUT
%token KW_DELIMITER KW_WITHOUT_DEFAULTS KW_CURRENT_WINDOW KW_WITH_NO_LOG
%token KW_ACTION KW_RENAME KW_POW KW_EXTEND KW_RELATIVE KW_EXIT KW_LOWEST
%token KW_IS KW_MONTH KW_LEFT_MARGIN KW_FOR_TABLE KW_SCROLL KW_YELLOW
%token KW_EXIT_DISPLAY KW_CONTINUE_DISPLAY KW_KEEP KW_PAGE_TRAILER KW_OUTPUT
%token KW_END_MENU KW_DATECON KW_ALLOCATE_ARRAY KW_REPLCHECK KW_END_WHILE
%token KW_SPACE KW_FIELD KW_DYNAMIC_ARRAY KW_UNITS KW_END_INPUT KW_FROM
%token KW_CONSTRAINED KW_CLOSE_WINDOW KW_DECCON KW_SITENAME KW_EXIT_CONSTRUCT
%token KW_WHITE KW_EXTENT_SIZE KW_CASE KW_NE KW_ANSI KW_RETURN_ERROR KW_CLOSE
%token KW_RECORD KW_NATIVE KW_CLIENT KW_FINISH KW_PRIMARY KW_CONNECTION
%token KW_THEN KW_EXIT_MAIN KW_INFIELD KW_DONE KW_DBSERVERNAME KW_DAY
%token KW_AUTOREFRESH KW_DEFAULT_NULL KW_NOT_NULL KW_PROTOTYPE KW_CONTINUE
%token KW_CONTINUE_CONSTRUCT KW_PAGE_HEADER KW_JOIN KW_RED KW_EXIT_MENU
%token KW_IMPORT KW_PRIMARY_KEY KW_ACTIVATION KW_CONTINUE_PROMPT KW_NORMAL
%token KW_MATCHES KW_END_IF KW_ARRAY KW_DTIMECON KW_CASCADE KW_INTERRUPT
%token KW_TRY KW_EXCLUSIVE KW_SKIP KW_CONTINUE_FOR KW_PAUSE KW_ATTRIBUTES
%token KW_AFTER_GROUP_OF KW_EXIT_FOR KW_DECLARE KW_NEED KW_CONTEXTMENU KW_UP
%token KW_IS_NOT_NULL KW_COMMITTED KW_YIELD KW_CLEAR_FORM KW_LAST KW_WRAP
%token KW_END_CASE KW_WAITING KW_BY KW_RAISE KW_COMMENT KW_SLEEP KW_BEFORE
%token KW_ORDER_BY_EXTERNAL KW_RESOURCE KW_ASSIGNMENTOPERATOR KW_UNDERLINE
%token KW_CROSS KW_ORDER KW_DATA KW_LOCATE KW_EXIT_FUNCTION KW_UNLOAD
%token KW_DRAG_ENTER KW_EXIT_PROMPT KW_ENABLED KW_LINE KW_ASCII KW_FORM
%token KW_CATCH KW_XWHERE KW_RIGHT KW_OBJECT KW_GRANT KW_IMMEDIATE KW_DROP
%token KW_CONNECT KW_DEFER KW_WHENEVER KW_DISCLOSUREINDICATOR
%token KW_DOUBLE_PRECISION KW_NOT_MATCHES KW_END_DISPLAY KW_WARNING KW_DIV
%token KW_LOAD KW_DESC KW_ALL KW_UNIQUE KW_INPUT KW_UNCONSTRAINED
%token KW_PRIVILEGES KW_DROP_DISTRIBUTIONS KW_GE KW_ASC KW_EXIT_PROGRAM
%token KW_NOT_EXISTS KW_ROWS KW_FORMAT_EVERY_ROW KW_WITHOUT_SCROLL KW_MINUTE
%token KW_CONSTANT KW_RPARENTHESIS KW_ORDER_EXTERNAL_BY KW_EXIT_CASE
%token KW_END_DIALOG KW_COLUMNS KW_CENTURY KW_STYLE KW_GLOBAL KW_SWAGGER
%token KW_STREAM KW_OPEN_FORM KW_APPEND KW_WAIT KW_CLEAR_SCREEN KW_IN_MEMORY
%token KW_COMMA KW_SEEK KW_FIRST KW_EXIT_WHILE KW_ERKEY KW_INITIALIZE
%token KW_ASYNC KW_SHIFT KW_HANGUP KW_UNBUFFERED KW_END_FUNCTION KW_UNION_ALL
%token KW_CLEAR_WINDOW KW_SFMT KW_CALL KW_YEAR KW_ACCEPT KW_USER KW_INVISIBLE
%token KW_REVOKE KW_PRIVATE KW_LOW KW_TEXT KW_STRCON KW_SHOW KW_DORMANT
%token KW_END_ASYNC KW_INTO KW_TODAY KW_FILL KW_RUN KW_HOUR KW_IN_FILE
%token KW_DISTINCT KW_DIMENSIONS KW_START KW_ABSOLUTE KW_HELP KW_TYPE
%token KW_FORMAT KW_NO KW_STEP KW_EXISTS KW_CONSTRUCT KW_WHILE
%token KW_DEALLOCATE_ARRAY KW_CURRENT KW_PREPARE KW_DRAG_FINISHED
%token KW_END_PROMPT KW_NOT_BETWEEN KW_DISPLAY_FORM KW_EXPRESSION
%token KW_STABILITY KW_OUT KW_INOUT KW_HASHMAP KW_DICTIONARY
%token KW_XML KW_PRINTX KW_HANDLER KW_LIMIT
%token KW_ADDITION_ASSIGNMENT_OPERATOR KW_SUBTRACTION_ASSIGNMENT_OPERATOR
%token KW_MULTIPLICATION_ASSIGNMENT_OPERATOR KW_DIVISION_ASSIGNMENT_OPERATOR
%token KW_APPEND_ASSIGNMENT_OPERATOR KW_CONCATENATION_ASSIGNMENT_OPERATOR
%left KW_LOWEST
%left KW_ASSIGNMENTOPERATOR
%left KW_MENU KW_ERROR KW_MESSAGE OPTIONS error KW_ON KW_BEFORE KW_AFTER
      KW_PROMPT KW_RIGHT_MARGIN KW_INSERT KW_DELETE KW_RETURN KW_NEXT KW_LOCK
      KW_AS KW_IDENTIFIER KW_WHERE KW_HAVING KW_ORDER_BY KW_GROUP_BY KW_INTO
      KW_FOR_UPDATE KW_UNION KW_UNION_ALL KW_OF KW_XWHERE KW_COMMAND KW_ASYNC
      KW_STREAM
%left KW_COMMA KW_JOIN KW_OUTER KW_LEFT KW_RIGHT KW_CROSS KW_INNER KW_FULL
%left KW_BETWEEN KW_NOT_BETWEEN KW_SELECT
%left '&' '^' '|'
%left KW_OR
%left KW_AND
%left KW_NOT
%left '~'
%left KW_IS_NULL KW_IS_NOT_NULL
%left KW_ASCII
%left KW_NE '>' KW_DOUBLE_PERCENT KW_EQ KW_EQEQ KW_LE KW_GE '<'
%nonassoc KW_MATCHES KW_NOT_MATCHES KW_LIKE KW_NOT_LIKE
%left KW_IN KW_NOT_IN
%left KW_SPACES KW_CLIPPED KW_COLUMN KW_SPACE KW_EXISTS KW_NOT_EXISTS KW_NAMED
      KW_SIZEOF
%left KW_STRCAT
%right KW_USING
%left '+' '-' '%'
%left '*' KW_DIV
%left KW_MOD
%left KW_CAST KW_INSTANCEOF
%left KW_POW KW_IS
%left KW_GROUP
%right KW_UNARYMINUS KW_UNARYPLUS '$'
%left '[' KW_LPARENTHESIS '.'
%nonassoc '@'
%nonassoc ':'
%left KW_WORDWRAP KW_END_DISPLAY KW_END_INPUT
%left KW_UNITS
%nonassoc KW_ESCAPE
%left KW_HIGHEST
%left KW_SUM KW_PERCENT KW_MIN KW_MAX KW_AVG
%left KW_SHORT KW_CIRCUIT KW_SUBDIALOG

%%

start_fgl: program { context.parserResult($1); };

opt_semi:      {
                   $$ = dyn::nil();                                            
               }
               | ';' {
                   $$ = $1;                                            
               }
               ;
identifier:      KW_IDENTIFIER {
                     $$ = $1;                                            
                 }
                 ;
lcase_identifier:      KW_IDENTIFIER {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"Identifier",$1);  $$ = obj;  
                                                                    
                       }
                       | error KW_IDENTIFIER {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"ErrorNode",$1); 
                           dyn::field(obj,"Identifier",$2);  $$ = obj;  
                                                                    
                       }
                       ;
object_name:      identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"identifier",$1);  $$ = obj;  
                                                               
                  }
                  | KW_LOCAL identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Local",$1); 
                      dyn::field(obj,"identifier",$2);  $$ = obj;  
                                                               
                  }
                  | KW_STATIC KW_LOCAL identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"Static",$1);  dyn::field(obj,"Local",$2); 
                      dyn::field(obj,"identifier",$3);  $$ = obj;  
                                                               
                  }
                  | KW_GLOBAL identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)3)); 
                      dyn::field(obj,"Global",$1); 
                      dyn::field(obj,"identifier",$2);  $$ = obj;  
                                                               
                  }
                  | KW_VARIABLE identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)4)); 
                      dyn::field(obj,"Variable",$1); 
                      dyn::field(obj,"identifier",$2);  $$ = obj;  
                                                               
                  }
                  ;
begin_sql:      {
                    $$ = dyn::nil();                
                                 SetSqlTokens(1);              
                }
                ;
column_id:      database_id ':' db_identifier '.' db_identifier '.'
                db_identifier {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"databaseId",$1); 
                    dyn::field(obj,"ColonSign",$2); 
                    dyn::field(obj,"dbIdentifier",$3); 
                    dyn::field(obj,"DotSign",$4); 
                    dyn::field(obj,"dbIdentifier1",$5); 
                    dyn::field(obj,"DotSign1",$6); 
                    dyn::field(obj,"dbIdentifier",$7);  $$ = obj;  
                                                             
                }
                | database_id ':' db_identifier '.' db_identifier {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"databaseId",$1); 
                    dyn::field(obj,"ColonSign",$2); 
                    dyn::field(obj,"dbIdentifier",$3); 
                    dyn::field(obj,"DotSign",$4); 
                    dyn::field(obj,"dbIdentifier1",$5);  $$ = obj;  
                                                             
                }
                | db_identifier '.' db_identifier '.' db_identifier {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)2)); 
                    dyn::field(obj,"dbIdentifier",$1); 
                    dyn::field(obj,"DotSign",$2); 
                    dyn::field(obj,"dbIdentifier1",$3); 
                    dyn::field(obj,"DotSign1",$4); 
                    dyn::field(obj,"dbIdentifier",$5);  $$ = obj;  
                                                             
                }
                | db_identifier '.' db_identifier {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)3)); 
                    dyn::field(obj,"dbIdentifier",$1); 
                    dyn::field(obj,"DotSign",$2); 
                    dyn::field(obj,"dbIdentifier1",$3);  $$ = obj;  
                                                             
                }
                | db_identifier %prec KW_LOWEST {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)4)); 
                    dyn::field(obj,"dbIdentifier",$1);  $$ = obj;  
                                                             
                }
                ;
column_list:      column_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"columnName",$1);  $$ = obj;  
                                                               
                  }
                  | column_list KW_COMMA column_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"columnList",$1); 
                      dyn::field(obj,"Comma",$2); 
                      dyn::field(obj,"columnName",$3);  $$ = obj;  
                                                               
                  }
                  ;
column_name:      column_id {
                      $$ = $1;                                            
                  }
                  ;
database_id:      db_identifier '@' db_identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"dbIdentifier",$1); 
                      dyn::field(obj,"AtSign",$2); 
                      dyn::field(obj,"dbIdentifier1",$3);  $$ = obj;  
                                                               
                  }
                  | db_identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"dbIdentifier",$1);  $$ = obj;  
                                                               
                  }
                  ;
db_identifier:      lcase_identifier {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"lcaseIdentifier",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_STRCON {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Strcon",$1);  $$ = obj;                
                                                   
                    }
                    ;
opt_into:      {
                   $$ = dyn::nil();                                            
               }
               | into {
                   $$ = $1;                                            
               }
               ;
into:      KW_INTO lvalue_list {
               dyn::ptr_t obj = dyn::createObject();  dyn::field(obj,"Into",$1);
                dyn::field(obj,"lvalueList",$2);  $$ = obj;                
                                          
           }
           ;
order_expr_list:      order_expr {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"orderExpr",$1);  $$ = obj;  
                                                                   
                      }
                      | order_expr_list KW_COMMA order_expr {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"orderExprList",$1); 
                          dyn::field(obj,"Comma",$2); 
                          dyn::field(obj,"orderExpr",$3);  $$ = obj;  
                                                                   
                      }
                      ;
order_expr:      expr opt_dir {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"expr",$1);  dyn::field(obj,"optDir",$2); 
                     $$ = obj;                                            
                 }
                 ;
opt_dir:      %prec KW_LOWEST {
                  $$ = dyn::nil();                                            
              }
              | KW_ASC {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)1)); 
                  dyn::field(obj,"Asc",$1);  $$ = obj;                
                                             
              }
              | KW_DESC {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)2)); 
                  dyn::field(obj,"Desc",$1);  $$ = obj;                
                                             
              }
              ;
select_stmt:      KW_SELECT begin_sql opt_unique select_expr_list opt_into
                  KW_FROM select_tab_list where_clause group_clause
                  having_clause order_clause intemp_clause forupdate_clause
                  opt_union {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Select",$1); 
                      dyn::field(obj,"beginSql",$2); 
                      dyn::field(obj,"optUnique",$3); 
                      dyn::field(obj,"selectExprList",$4); 
                      dyn::field(obj,"optInto",$5);  dyn::field(obj,"From",$6); 
                      dyn::field(obj,"selectTabList",$7); 
                      dyn::field(obj,"whereClause",$8); 
                      dyn::field(obj,"groupClause",$9); 
                      dyn::field(obj,"havingClause",$10); 
                      dyn::field(obj,"orderClause",$11); 
                      dyn::field(obj,"intempClause",$12); 
                      dyn::field(obj,"forupdateClause",$13); 
                      dyn::field(obj,"optUnion",$14);  $$ = obj;                
                                   SetSqlTokens(0);              
                  }
                  ;
select_expr_list:      select_expr {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"selectExpr",$1);  $$ = obj;  
                                                                    
                       }
                       | select_expr_list KW_COMMA select_expr {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"selectExprList",$1); 
                           dyn::field(obj,"Comma",$2); 
                           dyn::field(obj,"selectExpr",$3);  $$ = obj;  
                                                                    
                       }
                       ;
select_expr:      expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"expr",$1);  $$ = obj;                
                                                 
                  }
                  | expr opt_AS KW_IDENTIFIER {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"expr",$1);  dyn::field(obj,"optAs",$2); 
                      dyn::field(obj,"Identifier",$3);  $$ = obj;  
                                                               
                  }
                  | star_expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"starExpr",$1);  $$ = obj;                
                                                 
                  }
                  ;
opt_AS:      {
                 $$ = dyn::nil();                                            
             }
             | KW_AS {
                 $$ = $1;                                            
             }
             ;
star_expr:      '*' {
                    $$ = $1;                                            
                }
                ;
select_tab_list:      select_tab_base {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"selectTabBase",$1);  $$ = obj;  
                                                                   
                      }
                      | select_tab_list cross_join select_tab_base
                      %prec KW_LOWEST {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"selectTabList",$1); 
                          dyn::field(obj,"crossJoin",$2); 
                          dyn::field(obj,"selectTabBase",$3);  $$ = obj;  
                                                                   
                      }
                      | select_tab_list outer_join select_tab_base KW_ON expr {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"selectTabList",$1); 
                          dyn::field(obj,"outerJoin",$2); 
                          dyn::field(obj,"selectTabBase",$3); 
                          dyn::field(obj,"On",$4);  dyn::field(obj,"expr",$5); 
                          $$ = obj;                                            
                      }
                      ;
select_tab_base:      select_tab_with_alias {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"selectTabWithAlias",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_LPARENTHESIS select_tab_list KW_RPARENTHESIS {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Lparenthesis",$1); 
                          dyn::field(obj,"selectTabList",$2); 
                          dyn::field(obj,"Rparenthesis",$3);  $$ = obj;  
                                                                   
                      }
                      | KW_OUTER select_tab_with_alias {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"Outer",$1); 
                          dyn::field(obj,"selectTabWithAlias",$2);  $$ = obj;  
                                                                   
                      }
                      | KW_OUTER KW_LPARENTHESIS select_tab_list KW_RPARENTHESIS
                      {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)3)); 
                          dyn::field(obj,"Outer",$1); 
                          dyn::field(obj,"Lparenthesis",$2); 
                          dyn::field(obj,"selectTabList",$3); 
                          dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                   
                      }
                      ;
select_tab_with_alias:      table_name %prec KW_LOWEST {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"tableName",$1);  $$ = obj;  
                                                                         
                            }
                            | table_name KW_IDENTIFIER {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"tableName",$1); 
                                dyn::field(obj,"Identifier",$2);  $$ = obj;  
                                                                         
                            }
                            | table_name KW_AS KW_IDENTIFIER {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)2)); 
                                dyn::field(obj,"tableName",$1); 
                                dyn::field(obj,"As",$2); 
                                dyn::field(obj,"Identifier",$3);  $$ = obj;  
                                                                         
                            }
                            ;
cross_join:      KW_COMMA {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"Comma",$1);  $$ = obj;                
                                                
                 }
                 | KW_CROSS KW_JOIN {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"Cross",$1);  dyn::field(obj,"Join",$2); 
                     $$ = obj;                                            
                 }
                 ;
outer_join:      KW_INNER KW_JOIN {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"Inner",$1);  dyn::field(obj,"Join",$2); 
                     $$ = obj;                                            
                 }
                 | KW_JOIN {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"Join",$1);  $$ = obj;                
                                                
                 }
                 | KW_OUTER {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)2)); 
                     dyn::field(obj,"Outer",$1);  $$ = obj;                
                                                
                 }
                 | KW_OUTER KW_JOIN {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)3)); 
                     dyn::field(obj,"Outer",$1);  dyn::field(obj,"Join",$2); 
                     $$ = obj;                                            
                 }
                 | KW_LEFT KW_OUTER KW_JOIN {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)4)); 
                     dyn::field(obj,"Left",$1);  dyn::field(obj,"Outer",$2); 
                     dyn::field(obj,"Join",$3);  $$ = obj;                
                                                
                 }
                 | KW_LEFT KW_JOIN {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)5)); 
                     dyn::field(obj,"Left",$1);  dyn::field(obj,"Join",$2); 
                     $$ = obj;                                            
                 }
                 | KW_RIGHT KW_OUTER KW_JOIN {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)6)); 
                     dyn::field(obj,"Right",$1);  dyn::field(obj,"Outer",$2); 
                     dyn::field(obj,"Join",$3);  $$ = obj;                
                                                
                 }
                 | KW_RIGHT KW_JOIN {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)7)); 
                     dyn::field(obj,"Right",$1);  dyn::field(obj,"Join",$2); 
                     $$ = obj;                                            
                 }
                 | KW_FULL KW_OUTER KW_JOIN {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)8)); 
                     dyn::field(obj,"Full",$1);  dyn::field(obj,"Outer",$2); 
                     dyn::field(obj,"Join",$3);  $$ = obj;                
                                                
                 }
                 | KW_FULL KW_JOIN {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)9)); 
                     dyn::field(obj,"Full",$1);  dyn::field(obj,"Join",$2); 
                     $$ = obj;                                            
                 }
                 ;
group_clause:      %prec KW_LOWEST {
                       $$ = dyn::nil();                              
                                    
                   }
                   | KW_GROUP_BY expr_list {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"GroupBy",$1); 
                       dyn::field(obj,"exprList",$2);  $$ = obj;                
                                                  
                   }
                   ;
having_clause:      %prec KW_LOWEST {
                        $$ = dyn::nil();                              
                                     
                    }
                    | KW_HAVING expr {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Having",$1);  dyn::field(obj,"expr",$2);
                         $$ = obj;                                            
                    }
                    ;
order_clause:      %prec KW_LOWEST {
                       $$ = dyn::nil();                              
                                    
                   }
                   | KW_ORDER_BY order_expr_list {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"OrderBy",$1); 
                       dyn::field(obj,"orderExprList",$2);  $$ = obj;  
                                                                
                   }
                   ;
intemp_clause:      %prec KW_LOWEST {
                        $$ = dyn::nil();                              
                                     
                    }
                    | KW_INTO KW_TEMP table_id log_option_intemp {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Into",$1);  dyn::field(obj,"Temp",$2); 
                        dyn::field(obj,"tableId",$3); 
                        dyn::field(obj,"logOptionIntemp",$4);  $$ = obj;  
                                                                 
                    }
                    ;
log_option_intemp:      %prec KW_LOWEST {
                            $$ = dyn::nil();                              
                                         
                        }
                        | KW_WITH_NO_LOG {
                            $$ = $1;                                            
                        }
                        ;
forupdate_clause:      %prec KW_LOWEST {
                           $$ = dyn::nil();                              
                                        
                       }
                       | KW_FOR_UPDATE {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"ForUpdate",$1);  $$ = obj;  
                                                                    
                       }
                       | KW_FOR_UPDATE KW_OF column_list {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)2)); 
                           dyn::field(obj,"ForUpdate",$1); 
                           dyn::field(obj,"Of",$2); 
                           dyn::field(obj,"columnList",$3);  $$ = obj;  
                                                                    
                       }
                       ;
opt_unique:      {
                     $$ = dyn::nil();                              
                                  
                 }
                 | KW_ALL {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"All",$1);  $$ = obj;                
                                                
                 }
                 | KW_UNIQUE {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)2)); 
                     dyn::field(obj,"Unique",$1);  $$ = obj;                
                                                
                 }
                 | KW_DISTINCT {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)3)); 
                     dyn::field(obj,"Distinct",$1);  $$ = obj;                
                                                
                 }
                 ;
opt_union:      %prec KW_LOWEST {
                    $$ = dyn::nil();                                            
                }
                | KW_UNION select_stmt {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Union",$1); 
                    dyn::field(obj,"selectStmt",$2);  $$ = obj;                
                                               
                }
                | KW_UNION_ALL select_stmt {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)2)); 
                    dyn::field(obj,"UnionAll",$1); 
                    dyn::field(obj,"selectStmt",$2);  $$ = obj;                
                                               
                }
                ;
table_id:      database_id ':' db_identifier '.' db_identifier {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"databaseId",$1); 
                   dyn::field(obj,"ColonSign",$2); 
                   dyn::field(obj,"dbIdentifier",$3); 
                   dyn::field(obj,"DotSign",$4); 
                   dyn::field(obj,"dbIdentifier1",$5);  $$ = obj;  
                                                            
               }
               | database_id ':' db_identifier {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"databaseId",$1); 
                   dyn::field(obj,"ColonSign",$2); 
                   dyn::field(obj,"dbIdentifier",$3);  $$ = obj;                
                                              
               }
               | db_identifier '.' db_identifier {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)2)); 
                   dyn::field(obj,"dbIdentifier",$1); 
                   dyn::field(obj,"DotSign",$2); 
                   dyn::field(obj,"dbIdentifier1",$3);  $$ = obj;  
                                                            
               }
               | db_identifier %prec KW_LOWEST {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)3)); 
                   dyn::field(obj,"dbIdentifier",$1);  $$ = obj;                
                                              
               }
               ;
table_name:      table_id {
                     $$ = $1;                                            
                 }
                 ;
where_clause:      %prec KW_LOWEST {
                       $$ = dyn::nil();                              
                                    
                   }
                   | KW_WHERE expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Where",$1);  dyn::field(obj,"expr",$2); 
                       $$ = obj;                                            
                   }
                   | KW_WHERE KW_CURRENT KW_OF curs_name {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"Where",$1); 
                       dyn::field(obj,"Current",$2);  dyn::field(obj,"Of",$3); 
                       dyn::field(obj,"cursName",$4);  $$ = obj;                
                                                  
                   }
                   ;
curs_name:      identifier {
                    $$ = $1;                                            
                }
                ;
const_dec_expr:      const_expr {
                         $$ = $1;                                            
                     }
                     ;
const_expr:      expr %prec KW_LOWEST {
                     $$ = $1;                                            
                 }
                 ;
const_int_expr:      const_expr {
                         $$ = $1;                                            
                     }
                     ;
datetime_interval_const_expr:      KW_INTERVAL KW_LPARENTHESIS opt_isminus
                                   dtime_const KW_RPARENTHESIS interval_qual {
                                       dyn::ptr_t obj = dyn::createObject(); 
                                       dyn::field(obj,"Interval",$1); 
                                       dyn::field(obj,"Lparenthesis",$2); 
                                       dyn::field(obj,"optIsminus",$3); 
                                       dyn::field(obj,"dtimeConst",$4); 
                                       dyn::field(obj,"Rparenthesis",$5); 
                                       dyn::field(obj,"intervalQual",$6); 
                                       $$ = obj;                              
                                                    
                                   }
                                   | KW_DATETIME KW_LPARENTHESIS dtime_const
                                   KW_RPARENTHESIS dtime_qual {
                                       dyn::ptr_t obj = dyn::createObject(); 
                                       dyn::field(obj,"$",dyn::val((int)1)); 
                                       dyn::field(obj,"Datetime",$1); 
                                       dyn::field(obj,"Lparenthesis",$2); 
                                       dyn::field(obj,"dtimeConst",$3); 
                                       dyn::field(obj,"Rparenthesis",$4); 
                                       dyn::field(obj,"dtimeQual",$5); 
                                       $$ = obj;                              
                                                    
                                   }
                                   ;
opt_isminus:      {
                      $$ = dyn::nil();                              
                                   
                  }
                  | '-' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"MinusSign",$1);  $$ = obj;                
                                                 
                  }
                  | '+' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"PlusSign",$1);  $$ = obj;                
                                                 
                  }
                  ;
dtime_const:      dtime_const_elem {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"dtimeConstElem",$1);  $$ = obj;  
                                                               
                  }
                  | dtime_const dtime_const_sep dtime_const_elem {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"dtimeConst",$1); 
                      dyn::field(obj,"dtimeConstSep",$2); 
                      dyn::field(obj,"dtimeConstElem",$3);  $$ = obj;  
                                                               
                  }
                  ;
dtime_const_elem:      KW_INTCON {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"Intcon",$1);  $$ = obj;  
                                                                    
                       }
                       | KW_DECCON {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"Deccon",$1);  $$ = obj;  
                                                                    
                       }
                       ;
dtime_const_sep:      {
                          $$ = dyn::nil();                              
                                       
                      }
                      | '-' {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"MinusSign",$1);  $$ = obj;  
                                                                   
                      }
                      | ':' {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"ColonSign",$1);  $$ = obj;  
                                                                   
                      }
                      ;
dtime_qual:      dtime_qual_base KW_TO dtime_qual_bit {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"dtimeQualBase",$1); 
                     dyn::field(obj,"To",$2); 
                     dyn::field(obj,"dtimeQualBit",$3);  $$ = obj;  
                                                              
                 }
                 ;
dtime_qual_base:      KW_YEAR {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"Year",$1);  $$ = obj;                
                                                     
                      }
                      | KW_MONTH {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Month",$1);  $$ = obj;                
                                                     
                      }
                      | KW_DAY {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"Day",$1);  $$ = obj;                
                                                     
                      }
                      | KW_HOUR {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)3)); 
                          dyn::field(obj,"Hour",$1);  $$ = obj;                
                                                     
                      }
                      | KW_MINUTE {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)4)); 
                          dyn::field(obj,"Minute",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_SECOND {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)5)); 
                          dyn::field(obj,"Second",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_FRACTION %prec KW_LOWEST {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)6)); 
                          dyn::field(obj,"Fraction",$1);  $$ = obj;  
                                                                   
                      }
                      ;
dtime_qual_bit:      dtime_qual_base {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"dtimeQualBase",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_FRACTION KW_LPARENTHESIS const_int_expr
                     KW_RPARENTHESIS {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Fraction",$1); 
                         dyn::field(obj,"Lparenthesis",$2); 
                         dyn::field(obj,"constIntExpr",$3); 
                         dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                  
                     }
                     ;
expr:      lvalue_or_const %prec KW_LOWEST {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"lvalueOrConst",$1);  $$ = obj;                
                                          
           }
           | lvalue KW_ASSIGNMENTOPERATOR expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)1)); 
               dyn::field(obj,"lvalue",$1); 
               dyn::field(obj,"Assignmentoperator",$2); 
               dyn::field(obj,"expr",$3);  $$ = obj;                
                                          
           }
           | KW_SFMT KW_LPARENTHESIS expr_list KW_RPARENTHESIS {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)2));  dyn::field(obj,"Sfmt",$1);
                dyn::field(obj,"Lparenthesis",$2); 
               dyn::field(obj,"exprList",$3); 
               dyn::field(obj,"Rparenthesis",$4);  $$ = obj;                
                                          
           }
           | expr '+' expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)3));  dyn::field(obj,"expr",$1);
                dyn::field(obj,"PlusSign",$2);  dyn::field(obj,"expr1",$3); 
               $$ = obj;                                            
           }
           | expr '-' expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)4));  dyn::field(obj,"expr",$1);
                dyn::field(obj,"MinusSign",$2);  dyn::field(obj,"expr1",$3); 
               $$ = obj;                                            
           }
           | expr '*' expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)5));  dyn::field(obj,"expr",$1);
                dyn::field(obj,"MultiplicationSign",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_DIV expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)6));  dyn::field(obj,"expr",$1);
                dyn::field(obj,"Div",$2);  dyn::field(obj,"expr1",$3); 
               $$ = obj;                                            
           }
           | expr KW_EQ expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)7));  dyn::field(obj,"expr",$1);
                dyn::field(obj,"Eq",$2);  dyn::field(obj,"expr1",$3);  $$ = obj;
                                                          
           }
           | expr KW_EQEQ expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)8));  dyn::field(obj,"expr",$1);
                dyn::field(obj,"Eqeq",$2);  dyn::field(obj,"expr1",$3); 
               $$ = obj;                                            
           }
           | expr KW_NE expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)9));  dyn::field(obj,"expr",$1);
                dyn::field(obj,"Ne",$2);  dyn::field(obj,"expr1",$3);  $$ = obj;
                                                          
           }
           | expr '>' expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)10)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"GreaterthanSign",$2);
                dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr '<' expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)11)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"LessthanSign",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_GE expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)12)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Ge",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_LE expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)13)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Le",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_AND expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)14)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"And",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_OR expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)15)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Or",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | KW_NOT expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)16));  dyn::field(obj,"Not",$1);
                dyn::field(obj,"expr",$2);  $$ = obj;                
                                          
           }
           | expr '&' expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)17)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"AmpSign",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr '|' expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)18)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"VerticalBarSign",$2);
                dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr '^' expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)19)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"CaretSign",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | '~' expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)20)); 
               dyn::field(obj,"TildeSign",$1);  dyn::field(obj,"expr",$2); 
               $$ = obj;                                            
           }
           | expr KW_MATCHES expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)21)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Matches",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_NOT_MATCHES expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)22)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"NotMatches",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_LIKE expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)23)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Like",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_NOT_LIKE expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)24)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"NotLike",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_ESCAPE expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)25)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Escape",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_IS_NULL {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)26)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"IsNull",$2); 
               $$ = obj;                                            
           }
           | expr KW_IS_NOT_NULL {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)27)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"IsNotNull",$2); 
               $$ = obj;                                            
           }
           | expr KW_CLIPPED {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)28)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Clipped",$2); 
               $$ = obj;                                            
           }
           | expr KW_USING expr %prec KW_HIGHEST {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)29)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Using",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_MOD expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)30)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Mod",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr spaces {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)31)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"spaces",$2); 
               $$ = obj;                                            
           }
           | KW_COLUMN expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)32)); 
               dyn::field(obj,"Column",$1);  dyn::field(obj,"expr",$2); 
               $$ = obj;                                            
           }
           | expr KW_POW expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)33)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Pow",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_STRCAT expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)34)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Strcat",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr KW_NAMED expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)35)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Named",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | KW_SIZEOF expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)36)); 
               dyn::field(obj,"Sizeof",$1);  dyn::field(obj,"expr",$2); 
               $$ = obj;                                            
           }
           | expr in_operator expr %prec KW_IN {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)37)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"inOperator",$2); 
               dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | expr between_operator expr %prec KW_BETWEEN {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)38)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"betweenOperator",$2);
                dyn::field(obj,"expr1",$3);  $$ = obj;                
                                          
           }
           | function_call {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)39)); 
               dyn::field(obj,"functionCall",$1);  $$ = obj;                
                                          
           }
           | KW_ASCII expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)40)); 
               dyn::field(obj,"Ascii",$1);  dyn::field(obj,"expr",$2); 
               $$ = obj;                                            
           }
           | expr KW_UNITS unit_qual {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)41)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Units",$2); 
               dyn::field(obj,"unitQual",$3);  $$ = obj;                
                                          
           }
           | KW_CURRENT dtime_qual {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)42)); 
               dyn::field(obj,"Current",$1);  dyn::field(obj,"dtimeQual",$2); 
               $$ = obj;                                            
           }
           | KW_CURRENT {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)43)); 
               dyn::field(obj,"Current",$1);  $$ = obj;                
                                          
           }
           | KW_EXTEND KW_LPARENTHESIS expr extend_qual KW_RPARENTHESIS {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)44)); 
               dyn::field(obj,"Extend",$1);  dyn::field(obj,"Lparenthesis",$2); 
               dyn::field(obj,"expr",$3);  dyn::field(obj,"extendQual",$4); 
               dyn::field(obj,"Rparenthesis",$5);  $$ = obj;                
                                          
           }
           | KW_INFIELD KW_LPARENTHESIS expr KW_RPARENTHESIS {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)45)); 
               dyn::field(obj,"Infield",$1);  dyn::field(obj,"Lparenthesis",$2);
                dyn::field(obj,"expr",$3);  dyn::field(obj,"Rparenthesis",$4); 
               $$ = obj;                                            
           }
           | '-' expr %prec KW_UNARYMINUS {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)46)); 
               dyn::field(obj,"MinusSign",$1);  dyn::field(obj,"expr",$2); 
               $$ = obj;                                            
           }
           | '+' expr %prec KW_UNARYPLUS {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)47)); 
               dyn::field(obj,"PlusSign",$1);  dyn::field(obj,"expr",$2); 
               $$ = obj;                                            
           }
           | KW_LPARENTHESIS expr_list KW_RPARENTHESIS {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)48)); 
               dyn::field(obj,"Lparenthesis",$1); 
               dyn::field(obj,"exprList",$2); 
               dyn::field(obj,"Rparenthesis",$3);  $$ = obj;                
                                          
           }
           | '[' opt_expr_list ']' {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)49)); 
               dyn::field(obj,"LeftSquareParen",$1); 
               dyn::field(obj,"optExprList",$2); 
               dyn::field(obj,"RightSquareParen",$3);  $$ = obj;                
                                          
           }
           | KW_GROUP expr {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)50)); 
               dyn::field(obj,"Group",$1);  dyn::field(obj,"expr",$2); 
               $$ = obj;                                            
           }
           | expr KW_WORDWRAP wordwrap_target {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)51)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Wordwrap",$2); 
               dyn::field(obj,"wordwrapTarget",$3);  $$ = obj;                
                                          
           }
           | exists_operator KW_LPARENTHESIS select_stmt KW_RPARENTHESIS {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)52)); 
               dyn::field(obj,"existsOperator",$1); 
               dyn::field(obj,"Lparenthesis",$2); 
               dyn::field(obj,"selectStmt",$3); 
               dyn::field(obj,"Rparenthesis",$4);  $$ = obj;                
                                          
           }
           | '?' {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)53)); 
               dyn::field(obj,"QuestionSign",$1);  $$ = obj;                
                                          
           }
           | expr KW_INSTANCEOF structured_type {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)54)); 
               dyn::field(obj,"expr",$1);  dyn::field(obj,"Instanceof",$2); 
               dyn::field(obj,"structuredType",$3);  $$ = obj;                
                                          
           }
           | KW_CAST KW_LPARENTHESIS expr KW_AS structured_type KW_RPARENTHESIS
           {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)55)); 
               dyn::field(obj,"Cast",$1);  dyn::field(obj,"Lparenthesis",$2); 
               dyn::field(obj,"expr",$3);  dyn::field(obj,"As",$4); 
               dyn::field(obj,"structuredType",$5); 
               dyn::field(obj,"Rparenthesis",$6);  $$ = obj;                
                                          
           }
           | error {
               dyn::ptr_t obj = dyn::createObject(); 
               dyn::field(obj,"$",dyn::val((int)56)); 
               dyn::field(obj,"ErrorNode",$1);  $$ = obj;                
                                          
           }
           | function identifier {
               dyn::ptr_t obj = dyn::createObject();
               dyn::field(obj,"$",dyn::val((int)57));
               dyn::field(obj,"function",$1);
               dyn::field(obj,"identifier",$2);
               $$ = obj;
           }
           | function identifier '.' identifier {
               dyn::ptr_t obj = dyn::createObject();
               dyn::field(obj,"$",dyn::val((int)58));
               dyn::field(obj,"function",$1);
               dyn::field(obj,"identifier",$2);
               dyn::field(obj,"DotSign",$3);
               dyn::field(obj,"identifier",$4);
               $$ = obj;
           }
           ;
structured_type:      KW_IDENTIFIER {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"Identifier",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_IDENTIFIER '.' structured_type {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Identifier",$1); 
                          dyn::field(obj,"DotSign",$2); 
                          dyn::field(obj,"structuredType",$3);  $$ = obj;  
                                                                   
                      }
                      ;
spaces:      KW_SPACES {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"Spaces",$1);  $$ = obj;                
                                            
             }
             | KW_SPACE {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)1)); 
                 dyn::field(obj,"Space",$1);  $$ = obj;                
                                            
             }
             ;
wordwrap_target:      %prec KW_LOWEST {
                          $$ = dyn::nil();                              
                                       
                      }
                      | KW_RIGHT_MARGIN expr {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"RightMargin",$1); 
                          dyn::field(obj,"expr",$2);  $$ = obj;                
                                                     
                      }
                      ;
unit_qual:      dtime_qual_bit {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"dtimeQualBit",$1);  $$ = obj;  
                                                             
                }
                | KW_EXPRESSION int_expr {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Expression",$1); 
                    dyn::field(obj,"intExpr",$2);  $$ = obj;                
                                               
                }
                ;
in_operator:      KW_IN {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"In",$1);  $$ = obj;                
                                                 
                  }
                  | KW_NOT_IN {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"NotIn",$1);  $$ = obj;                
                                                 
                  }
                  ;
between_operator:      KW_BETWEEN {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"Between",$1);  $$ = obj;  
                                                                    
                       }
                       | KW_NOT_BETWEEN {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"NotBetween",$1);  $$ = obj;  
                                                                    
                       }
                       ;
exists_operator:      KW_EXISTS {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"Exists",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_NOT_EXISTS {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"NotExists",$1);  $$ = obj;  
                                                                   
                      }
                      ;
extend_qual:      {
                      $$ = dyn::nil();                              
                                   
                  }
                  | KW_COMMA dtime_qual {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Comma",$1); 
                      dyn::field(obj,"dtimeQual",$2);  $$ = obj;                
                                                 
                  }
                  ;
expr_list:      expr_list_item {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"exprListItem",$1);  $$ = obj;  
                                                             
                }
                | expr_list KW_COMMA expr_list_item {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"exprList",$1);  dyn::field(obj,"Comma",$2); 
                    dyn::field(obj,"exprListItem",$3);  $$ = obj;  
                                                             
                }
                ;
expr_list_item:      expr %prec KW_LOWEST {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"expr",$1);  $$ = obj;                
                                                    
                     }
                     | expr thru_op expr %prec KW_LOWEST {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"expr",$1); 
                         dyn::field(obj,"thruOp",$2); 
                         dyn::field(obj,"expr1",$3);  $$ = obj;                
                                                    
                     }
                     | select_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"selectStmt",$1);  $$ = obj;  
                                                                  
                     }
                     ;
thru_op:      KW_THRU {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"Thru",$1);  $$ = obj;                
                                             
              }
              | KW_THROUGH {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)1)); 
                  dyn::field(obj,"Through",$1);  $$ = obj;                
                                             
              }
              ;
function_call:      expr KW_LPARENTHESIS opt_restriction opt_expr_list
                    KW_RPARENTHESIS opt_xwhere {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"expr",$1); 
                        dyn::field(obj,"Lparenthesis",$2); 
                        dyn::field(obj,"optRestriction",$3); 
                        dyn::field(obj,"optExprList",$4); 
                        dyn::field(obj,"Rparenthesis",$5); 
                        dyn::field(obj,"optXwhere",$6);  $$ = obj;  
                                                                 
                    }
                    | expr KW_LPARENTHESIS opt_restriction '*' KW_RPARENTHESIS
                    opt_xwhere {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"expr",$1); 
                        dyn::field(obj,"Lparenthesis",$2); 
                        dyn::field(obj,"optRestriction",$3); 
                        dyn::field(obj,"MultiplicationSign",$4); 
                        dyn::field(obj,"Rparenthesis",$5); 
                        dyn::field(obj,"optXwhere",$6);  $$ = obj;  
                                                                 
                    }
                    | expr KW_LPARENTHESIS opt_restriction opt_expr_list
                    KW_RPARENTHESIS retvalue_ref {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)2)); 
                        dyn::field(obj,"expr",$1); 
                        dyn::field(obj,"Lparenthesis",$2); 
                        dyn::field(obj,"optRestriction",$3); 
                        dyn::field(obj,"optExprList",$4); 
                        dyn::field(obj,"Rparenthesis",$5); 
                        dyn::field(obj,"retvalueRef",$6);  $$ = obj;  
                                                                 
                    }
                    ;
opt_restriction:      {
                          $$ = dyn::nil();                              
                                       
                      }
                      | KW_DISTINCT {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Distinct",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_UNIQUE {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"Unique",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_ALL {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)3)); 
                          dyn::field(obj,"All",$1);  $$ = obj;                
                                                     
                      }
                      ;
opt_xwhere:      %prec KW_LOWEST {
                     $$ = dyn::nil();                              
                                  
                 }
                 | KW_XWHERE expr {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"Xwhere",$1);  dyn::field(obj,"expr",$2); 
                     $$ = obj;                                            
                 }
                 ;
retvalue_ref:      refvalue {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"refvalue",$1);  $$ = obj;                
                                                  
                   }
                   | retvalue_ref refvalue {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"retvalueRef",$1); 
                       dyn::field(obj,"refvalue",$2);  $$ = obj;                
                                                  
                   }
                   ;
refvalue:      '.' identifier KW_LPARENTHESIS opt_expr_list KW_RPARENTHESIS {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"DotSign",$1); 
                   dyn::field(obj,"identifier",$2); 
                   dyn::field(obj,"Lparenthesis",$3); 
                   dyn::field(obj,"optExprList",$4); 
                   dyn::field(obj,"Rparenthesis",$5);  $$ = obj;                
                                              
               }
               | '.' identifier %prec KW_LOWEST {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"DotSign",$1); 
                   dyn::field(obj,"identifier",$2);  $$ = obj;                
                                              
               }
               ;
int_expr:      %prec KW_LOWEST expr {
                   $$ = $1;                                            
               }
               ;
interval_qual:      dtime_qual_base opt_qual_len KW_TO dtime_qual_bit {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"dtimeQualBase",$1); 
                        dyn::field(obj,"optQualLen",$2); 
                        dyn::field(obj,"To",$3); 
                        dyn::field(obj,"dtimeQualBit",$4);  $$ = obj;  
                                                                 
                    }
                    ;
opt_qual_len:      %prec KW_LOWEST {
                       $$ = dyn::nil();                              
                                    
                   }
                   | KW_LPARENTHESIS const_int_expr KW_RPARENTHESIS {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Lparenthesis",$1); 
                       dyn::field(obj,"constIntExpr",$2); 
                       dyn::field(obj,"Rparenthesis",$3);  $$ = obj;  
                                                                
                   }
                   ;
line_expr:      expr %prec KW_LOWEST {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"expr",$1);  $$ = obj;                
                                               
                }
                | KW_LAST %prec KW_LOWEST {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Last",$1);  $$ = obj;                
                                               
                }
                | KW_LAST '-' int_expr {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)2)); 
                    dyn::field(obj,"Last",$1);  dyn::field(obj,"MinusSign",$2); 
                    dyn::field(obj,"intExpr",$3);  $$ = obj;                
                                               
                }
                | KW_FIRST %prec KW_LOWEST {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)3)); 
                    dyn::field(obj,"First",$1);  $$ = obj;                
                                               
                }
                | KW_FIRST '+' int_expr {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)4)); 
                    dyn::field(obj,"First",$1);  dyn::field(obj,"PlusSign",$2); 
                    dyn::field(obj,"intExpr",$3);  $$ = obj;                
                                               
                }
                | KW_OFF {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)5)); 
                    dyn::field(obj,"Off",$1);  $$ = obj;                
                                               
                }
                ;
lvalue:      identifier {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"identifier",$1);  $$ = obj;                
                                            
             }
             | KW_DIALOGDOT identifier {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)1)); 
                 dyn::field(obj,"Dialogdot",$1); 
                 dyn::field(obj,"identifier",$2);  $$ = obj;                
                                            
             }
             | KW_INPUTDOT identifier {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)1)); 
                 dyn::field(obj,"Inputdot",$1); 
                 dyn::field(obj,"identifier",$2);  $$ = obj;                
                                            
             }
             | '@' identifier {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)2)); 
                 dyn::field(obj,"AtSign",$1);  dyn::field(obj,"identifier",$2); 
                 $$ = obj;                                            
             }
             | lvalue '@' identifier {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)3)); 
                 dyn::field(obj,"lvalue",$1);  dyn::field(obj,"AtSign",$2); 
                 dyn::field(obj,"identifier",$3);  $$ = obj;                
                                            
             }
             | lvalue ':' identifier {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)4)); 
                 dyn::field(obj,"lvalue",$1);  dyn::field(obj,"ColonSign",$2); 
                 dyn::field(obj,"identifier",$3);  $$ = obj;                
                                            
             }
             | lvalue '.' identifier {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)5)); 
                 dyn::field(obj,"lvalue",$1);  dyn::field(obj,"DotSign",$2); 
                 dyn::field(obj,"identifier",$3);  $$ = obj;                
                                            
             }
             | KW_STRCON '.' identifier {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)6)); 
                 dyn::field(obj,"Strcon",$1);  dyn::field(obj,"DotSign",$2); 
                 dyn::field(obj,"identifier",$3);  $$ = obj;                
                                            
             }
             | lvalue '.' KW_DIALOGDOT identifier {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)7)); 
                 dyn::field(obj,"lvalue",$1);  dyn::field(obj,"DotSign",$2); 
                 dyn::field(obj,"Dialogdot",$3); 
                 dyn::field(obj,"identifier",$4);  $$ = obj;                
                                            
             }
             | lvalue '.' KW_INPUTDOT identifier {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)7)); 
                 dyn::field(obj,"lvalue",$1);  dyn::field(obj,"DotSign",$2); 
                 dyn::field(obj,"Inputdot",$3); 
                 dyn::field(obj,"identifier",$4);  $$ = obj;                
                                            
             }
             | lvalue '[' expr_list ']' {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)8)); 
                 dyn::field(obj,"lvalue",$1); 
                 dyn::field(obj,"LeftSquareParen",$2); 
                 dyn::field(obj,"exprList",$3); 
                 dyn::field(obj,"RightSquareParen",$4);  $$ = obj;  
                                                          
             }
             | lvalue KW_DOTSTAR {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)9)); 
                 dyn::field(obj,"lvalue",$1);  dyn::field(obj,"Dotstar",$2); 
                 $$ = obj;                                            
             }
             ;
lvalue_consts:      string_param {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"stringParam",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_INTCON {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Intcon",$1);  $$ = obj;                
                                                   
                    }
                    | KW_DECCON {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)2)); 
                        dyn::field(obj,"Deccon",$1);  $$ = obj;                
                                                   
                    }
                    | KW_DTIMECON {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)3)); 
                        dyn::field(obj,"Dtimecon",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_DATECON {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)4)); 
                        dyn::field(obj,"Datecon",$1);  $$ = obj;                
                                                   
                    }
                    | KW_NULL {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)5)); 
                        dyn::field(obj,"Null",$1);  $$ = obj;                
                                                   
                    }
                    | KW_TRUE {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)6)); 
                        dyn::field(obj,"TrueVal",$1);  $$ = obj;                
                                                   
                    }
                    | KW_FALSE {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)7)); 
                        dyn::field(obj,"FalseVal",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_NOTFOUND {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)8)); 
                        dyn::field(obj,"Notfound",$1);  $$ = obj;  
                                                                 
                    }
                    | datetime_interval_const_expr {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)9)); 
                        dyn::field(obj,"datetimeIntervalConstExpr",$1); 
                        $$ = obj;                                            
                    }
                    ;
lvalue_list:      lvalue_list_val {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"lvalueListVal",$1);  $$ = obj;  
                                                               
                  }
                  | lvalue_list KW_COMMA lvalue_list_val {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"lvalueList",$1); 
                      dyn::field(obj,"Comma",$2); 
                      dyn::field(obj,"lvalueListVal",$3);  $$ = obj;  
                                                               
                  }
                  ;
lvalue_list_val:      lvalue {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"lvalue",$1);  $$ = obj;  
                                                                   
                      }
                      | lvalue KW_THRU lvalue {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"lvalue",$1); 
                          dyn::field(obj,"Thru",$2); 
                          dyn::field(obj,"lvalue1",$3);  $$ = obj;  
                                                                   
                      }
                      | lvalue KW_THROUGH lvalue {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"lvalue",$1); 
                          dyn::field(obj,"Through",$2); 
                          dyn::field(obj,"lvalue1",$3);  $$ = obj;  
                                                                   
                      }
                      ;
lvalue_or_const:      lvalue %prec KW_LOWEST {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"lvalue",$1);  $$ = obj;  
                                                                   
                      }
                      | lvalue_consts {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"lvalueConsts",$1);  $$ = obj;  
                                                                   
                      }
                      ;
opt_const_dec_expr:      %prec KW_LOWEST {
                             $$ = dyn::nil();                              
                                          
                         }
                         | const_dec_expr {
                             $$ = $1;                              
                                          
                         }
                         ;
opt_expr:      %prec KW_LOWEST {
                   $$ = dyn::nil();                                            
               }
               | expr {
                   $$ = $1;                                            
               }
               ;
opt_expr_list:      %prec KW_LOWEST {
                        $$ = dyn::nil();                              
                                     
                    }
                    | expr_list {
                        $$ = $1;                                            
                    }
                    ;
string_expr:      expr_list %prec KW_LOWEST {
                      $$ = $1;                                            
                  }
                  ;
string_expr_nolist:      expr %prec KW_LOWEST {
                             $$ = $1;                              
                                          
                         }
                         ;
string_param:      KW_STRCON {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"Strcon",$1);  $$ = obj;                
                                                  
                   }
                   | '%' KW_STRCON {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"PercentSign",$1); 
                       dyn::field(obj,"Strcon",$2);  $$ = obj;                
                                                  
                   }
                   ;
datatype:      type_name {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"typeName",$1);  $$ = obj;                
                                              
               }
               | type_name KW_LPARENTHESIS opt_expr_list KW_RPARENTHESIS {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"typeName",$1); 
                   dyn::field(obj,"Lparenthesis",$2); 
                   dyn::field(obj,"optExprList",$3); 
                   dyn::field(obj,"Rparenthesis",$4);  $$ = obj;                
                                              
               }
               | KW_DATETIME dtime_qual {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)2)); 
                   dyn::field(obj,"Datetime",$1); 
                   dyn::field(obj,"dtimeQual",$2);  $$ = obj;                
                                              
               }
               | KW_INTERVAL interval_qual {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)3)); 
                   dyn::field(obj,"Interval",$1); 
                   dyn::field(obj,"intervalQual",$2);  $$ = obj;                
                                              
               }
               | KW_DOUBLE_PRECISION {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)4)); 
                   dyn::field(obj,"DoublePrecision",$1);  $$ = obj;  
                                                            
               }
               | KW_HASHMAP opt_datatype_attributes KW_OF define_datatype {
                   dyn::ptr_t obj = dyn::createObject();
                   dyn::field(obj,"$",dyn::val((int)5));
                   dyn::field(obj,"Hashmap",$1);
                   dyn::field(obj,"optDatatypeAttributes",$2);
                   dyn::field(obj,"Of",$3);
                   dyn::field(obj,"defineDatatype",$4);
                   $$ = obj;
               }
               | KW_HASHMAP opt_datatype_attributes {
                   dyn::ptr_t obj = dyn::createObject();
                   dyn::field(obj,"$",dyn::val((int)6));
                   dyn::field(obj,"Hashmap",$1);
                   dyn::field(obj,"optDatatypeAttributes",$2);
                   $$ = obj;
               }
               ;
type_name:      type_name_parts {
                    $$ = $1;                                            
                }
                ;
type_name_parts:      identifier {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"identifier",$1);  $$ = obj;  
                                                                   
                      }
                      | type_name_parts '.' identifier {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"typeNameParts",$1); 
                          dyn::field(obj,"DotSign",$2); 
                          dyn::field(obj,"identifier",$3);  $$ = obj;  
                                                                   
                      }
                      ;
block_start:      {
                      $$ = dyn::nil();                              
                                   
                  }
                  ;
block_finish:     {
                      $$ = dyn::nil();
                  }
                  ;
definition_list:      {
                          $$ = dyn::nil();                              
                                       
                      }
                      | definition_list definition_list_entry {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"definitionList",$1); 
                          dyn::field(obj,"definitionListEntry",$2);  $$ = obj;  
                                                                   
                      }
                      ;
definition_list_entry:      define_stmt opt_semi {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"defineStmt",$1); 
                                dyn::field(obj,"optSemi",$2);  $$ = obj;  
                                                                         
                            }
                            | function_prototype opt_semi {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"functionPrototype",$1); 
                                dyn::field(obj,"optSemi",$2);  $$ = obj;  
                                                                         
                            }
                            ;
define_stmt:      opt_publicprivate KW_DEFINE define_list {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"optPublicprivate",$1); 
                      dyn::field(obj,"Define",$2); 
                      dyn::field(obj,"defineList",$3);  $$ = obj;  
                                                               
                  }
                  | opt_publicprivate KW_TYPE identifier define_datatype {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"optPublicprivate",$1); 
                      dyn::field(obj,"Type",$2); 
                      dyn::field(obj,"identifier",$3); 
                      dyn::field(obj,"defineDatatype",$4);  $$ = obj;  
                                                               
                  }
                  | opt_publicprivate KW_CONSTANT const_definition_list {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"optPublicprivate",$1); 
                      dyn::field(obj,"Constant",$2); 
                      dyn::field(obj,"constDefinitionList",$3);  $$ = obj;  
                                                               
                  }
                  ;
const_definition_list:      define_const_value {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"defineConstValue",$1); 
                                $$ = obj;                              
                                             
                            }
                            | const_definition_list KW_COMMA define_const_value
                            {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"constDefinitionList",$1); 
                                dyn::field(obj,"Comma",$2); 
                                dyn::field(obj,"defineConstValue",$3); 
                                $$ = obj;                              
                                             
                            }
                            ;
define_const_value:      identifier KW_EQ value {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"identifier",$1); 
                             dyn::field(obj,"Eq",$2); 
                             dyn::field(obj,"value",$3);  $$ = obj;  
                                                                      
                         }
                         | identifier define_datatype KW_EQ value {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"identifier",$1); 
                             dyn::field(obj,"defineDatatype",$2); 
                             dyn::field(obj,"Eq",$3); 
                             dyn::field(obj,"value",$4);  $$ = obj;  
                                                                      
                         }
                         ;
opt_publicprivate:      {
                            $$ = dyn::nil();                              
                                         
                        }
                        | publicprivate {
                            $$ = $1;                                            
                        }
                        ;
value:      opt_sign KW_INTCON {
                dyn::ptr_t obj = dyn::createObject(); 
                dyn::field(obj,"optSign",$1);  dyn::field(obj,"Intcon",$2); 
                $$ = obj;                                            
            }
            | KW_DECCON {
                dyn::ptr_t obj = dyn::createObject(); 
                dyn::field(obj,"$",dyn::val((int)1)); 
                dyn::field(obj,"Deccon",$1);  $$ = obj;                
                                           
            }
            | KW_STRCON {
                dyn::ptr_t obj = dyn::createObject(); 
                dyn::field(obj,"$",dyn::val((int)2)); 
                dyn::field(obj,"Strcon",$1);  $$ = obj;                
                                           
            }
            | KW_TRUE {
                dyn::ptr_t obj = dyn::createObject(); 
                dyn::field(obj,"$",dyn::val((int)3)); 
                dyn::field(obj,"TrueVal",$1);  $$ = obj;                
                                           
            }
            | KW_FALSE {
                dyn::ptr_t obj = dyn::createObject(); 
                dyn::field(obj,"$",dyn::val((int)4)); 
                dyn::field(obj,"FalseVal",$1);  $$ = obj;                
                                           
            }
            | KW_MDY KW_LPARENTHESIS KW_INTCON KW_COMMA KW_INTCON KW_COMMA
            KW_INTCON KW_RPARENTHESIS {
                dyn::ptr_t obj = dyn::createObject(); 
                dyn::field(obj,"$",dyn::val((int)5));  dyn::field(obj,"Mdy",$1);
                 dyn::field(obj,"Lparenthesis",$2); 
                dyn::field(obj,"Intcon",$3);  dyn::field(obj,"Comma",$4); 
                dyn::field(obj,"Intcon1",$5);  dyn::field(obj,"Comma1",$6); 
                dyn::field(obj,"Intcon",$7);  dyn::field(obj,"Rparenthesis",$8);
                 $$ = obj;                                            
            }
            | datetime_interval_const_expr {
                dyn::ptr_t obj = dyn::createObject(); 
                dyn::field(obj,"$",dyn::val((int)6)); 
                dyn::field(obj,"datetimeIntervalConstExpr",$1);  $$ = obj;  
                                                         
            }
            ;
opt_sign:      {
                   $$ = dyn::nil();                                            
               }
               | '-' {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"MinusSign",$1);  $$ = obj;                
                                              
               }
               | '+' {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)2)); 
                   dyn::field(obj,"PlusSign",$1);  $$ = obj;                
                                              
               }
               ;
define_list:      define_var_or_type {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"defineVarOrType",$1);  $$ = obj;  
                                                               
                  }
                  | define_list KW_COMMA define_var_or_type {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"defineList",$1); 
                      dyn::field(obj,"Comma",$2); 
                      dyn::field(obj,"defineVarOrType",$3);  $$ = obj;  
                                                               
                  }
                  | error {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"ErrorNode",$1);  $$ = obj;                
                                                 
                  }
                  ;
define_var_or_type:      define_var {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"defineVar",$1);  $$ = obj;  
                                                                      
                         }
                         | define_type {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"defineType",$1);  $$ = obj;  
                                                                      
                         }
                         ;
recfld_list:      define_var {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"defineVar",$1);  $$ = obj;                
                                                 
                  }
                  | recfld_list KW_COMMA define_var {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"recfldList",$1); 
                      dyn::field(obj,"Comma",$2); 
                      dyn::field(obj,"defineVar",$3);  $$ = obj;                
                                                 
                  }
                  | error {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"ErrorNode",$1);  $$ = obj;                
                                                 
                  }
                  ;
define_var:      identifier_list opt_of define_datatype opt_inout opt_initializer {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"identifierList",$1); 
                     dyn::field(obj,"optOf",$2); 
                     dyn::field(obj,"defineDatatype",$3);
                     dyn::field(obj,"inout",$4);
                     dyn::field(obj,"initializer",$5);
					 $$ = obj;
                 }
                 ;
define_type:      identifier_list KW_TYPE opt_under KW_AS define_datatype {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"identifierList",$1); 
                      dyn::field(obj,"Type",$2);  dyn::field(obj,"optUnder",$3);
                       dyn::field(obj,"As",$4); 
                      dyn::field(obj,"defineDatatype",$5);  $$ = obj;  
                                                               
                  }
                  ;
opt_of:      {
                 $$ = dyn::nil();                                            
             }
             | KW_OF {
                 $$ = $1;                                            
             }
             ;
opt_inout:   {
                 $$ = dyn::nil();
             }
             | KW_INOUT {
                 $$ = $1;
             }
             ;
opt_initializer:{
                    $$ = dyn::nil();
                }
                | KW_EQ lvalue_consts {
                    dyn::ptr_t obj = dyn::createObject();
                    dyn::field(obj,"Eq",$1);
                    dyn::field(obj,"lvalueConsts",$2);
                    $$ = obj;
                }
                ;
opt_under:      {
                    $$ = dyn::nil();                                            
                }
                | KW_UNDER identifier {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Under",$1); 
                    dyn::field(obj,"identifier",$2);  $$ = obj;                
                                               
                }
                ;
identifier_list:      identifier {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"identifier",$1);  $$ = obj;  
                                                                   
                      }
                      | identifier_list KW_COMMA identifier {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"identifierList",$1); 
                          dyn::field(obj,"Comma",$2); 
                          dyn::field(obj,"identifier",$3);  $$ = obj;  
                                                                   
                      }
                      ;
define_datatype:      datatype {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"datatype",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_LIKE column_id {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Like",$1); 
                          dyn::field(obj,"columnId",$2);  $$ = obj;  
                                                                   
                      }
                      | KW_RECORD recfld_list KW_END KW_RECORD {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"Record",$1); 
                          dyn::field(obj,"recfldList",$2); 
                          dyn::field(obj,"End",$3); 
                          dyn::field(obj,"Record1",$4);  $$ = obj;  
                                                                   
                      }
                      | KW_RECORD KW_LIKE table_id KW_DOTSTAR {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)3)); 
                          dyn::field(obj,"Record",$1); 
                          dyn::field(obj,"Like",$2); 
                          dyn::field(obj,"tableId",$3); 
                          dyn::field(obj,"Dotstar",$4);  $$ = obj;  
                                                                   
                      }
                      | KW_ARRAY '[' expr_list ']' KW_OF define_datatype {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)4)); 
                          dyn::field(obj,"Array",$1); 
                          dyn::field(obj,"LeftSquareParen",$2); 
                          dyn::field(obj,"exprList",$3); 
                          dyn::field(obj,"RightSquareParen",$4); 
                          dyn::field(obj,"Of",$5); 
                          dyn::field(obj,"defineDatatype",$6);  $$ = obj;  
                                                                   
                      }
                      | KW_DYNAMIC_ARRAY opt_with_dimensions KW_OF
                      define_datatype {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)5)); 
                          dyn::field(obj,"DynamicArray",$1); 
                          dyn::field(obj,"optWithDimensions",$2); 
                          dyn::field(obj,"Of",$3); 
                          dyn::field(obj,"defineDatatype",$4);  $$ = obj;  
                                                                   
                      }
                      | function_reference_datatype {
                          dyn::ptr_t obj = dyn::createObject();
                          dyn::field(obj,"functionReferenceDatatype",$1);  $$ = obj;
                      }
                      ;
opt_with_dimensions:      {
                              $$ = dyn::nil();
                          }
                          | KW_WITH expr KW_DIMENSIONS {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)1)); 
                              dyn::field(obj,"With",$1); 
                              dyn::field(obj,"expr",$2); 
                              dyn::field(obj,"Dimensions",$3);  $$ = obj;  
                                                                       
                          }
                          | KW_WITH KW_DIMENSION expr {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)2)); 
                              dyn::field(obj,"With",$1); 
                              dyn::field(obj,"Dimension",$2); 
                              dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                       
                          }
                          ;
function_reference_datatype:
                          function
                            block_start
                              KW_LPARENTHESIS function_reference_parameters KW_RPARENTHESIS
                              opt_function_attributes
                              block_start
                                opt_returns_clause
                              block_finish
                            block_finish
                          {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"function",$1);
                              dyn::field(obj,"blockStart",$2);
                              dyn::field(obj,"Lparenthesis",$3);
                              dyn::field(obj,"functionReferenceParameters",$4);
                              dyn::field(obj,"Rparenthesis",$5);
                              dyn::field(obj,"optFunctionAttributes",$6);
                              dyn::field(obj,"blockStart",$7);
                              dyn::field(obj,"optReturnsClause",$8);
                              dyn::field(obj,"blockFinish",$9);
                              dyn::field(obj,"blockFinish",$10);
                              $$ = obj;
                          }
                          ;
function_reference_parameters: {
                              $$ = dyn::nil();
                          }
                          | function_reference_parameter {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"$",dyn::val((int)1));
                              dyn::field(obj,"functionReferenceParameter",$1);
                              $$ = obj;
                          }
                          | function_reference_parameters KW_COMMA function_reference_parameter {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"$",dyn::val((int)2));
                              dyn::field(obj,"functionReferenceParameters",$1);
                              dyn::field(obj,"Comma",$2);
                              dyn::field(obj,"functionReferenceParameter",$3);
                              $$ = obj;
                          }
                          ;
function_reference_parameter:
                          error {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"ErrorNode",$1);  $$ = obj;
                          }
                          | identifier define_datatype opt_inout {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"$",dyn::val((int)1));
                              dyn::field(obj,"identifier",$1);
                              dyn::field(obj,"defineDatatype",$2);
                              dyn::field(obj,"optInout",$3);
                              $$ = obj;
                          }
                          ;
opt_function_attributes:
                          opt_datatype_attributes {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"optDatatypeAttributes",$1);
                              $$ = obj;
                          }
                          ;
opt_datatype_attributes:  {
                              $$ = dyn::nil();
                          }
                          | KW_ATTRIBUTES KW_LPARENTHESIS datatype_attributes KW_RPARENTHESIS {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"$",dyn::val((int)1));
                              dyn::field(obj,"Attributes",$1);
                              dyn::field(obj,"Lparenthesis",$2);
                              dyn::field(obj,"datatypeAttributes",$3);
                              dyn::field(obj,"Rparenthesis",$4);
                              $$ = obj;
                          }
                          | KW_ATTRIBUTE KW_LPARENTHESIS datatype_attributes KW_RPARENTHESIS {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"$",dyn::val((int)2));
                              dyn::field(obj,"Attribute",$1);
                              dyn::field(obj,"Lparenthesis",$2);
                              dyn::field(obj,"datatypeAttributes",$3);
                              dyn::field(obj,"Rparenthesis",$4);
                              $$ = obj;
                          }
                          ;
datatype_attributes:
                          datatype_attribute {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"datatypeAttribute",$1);
                              $$ = obj;
                          }
                          | datatype_attributes KW_COMMA datatype_attribute {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"$",dyn::val((int)1));
                              dyn::field(obj,"datatypeAttributes",$1);
                              dyn::field(obj,"Comma",$2);
                              dyn::field(obj,"datatypeAttribute",$3);
                              $$ = obj;
                          }
                          ;
datatype_attribute:
                          identifier {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"identifier",$1);
                              $$ = obj;
                          }
                          | identifier KW_EQ KW_STRCON {
                              dyn::ptr_t obj = dyn::createObject();
                              dyn::field(obj,"$",dyn::val((int)1));
                              dyn::field(obj,"identifier",$1);
                              dyn::field(obj,"Eq",$2);
                              dyn::field(obj,"Strcon",$3);
                              $$ = obj;
                          }
                          ;
endstmt:      KW_END_MAIN {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"EndMain",$1);  $$ = obj;                
                                             
              }
              | KW_END_FUNCTION {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)1)); 
                  dyn::field(obj,"EndFunction",$1);  $$ = obj;                
                                             
              }
              | KW_END_IF {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)2)); 
                  dyn::field(obj,"EndIf",$1);  $$ = obj;                
                                             
              }
              | KW_END_WHILE {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)3)); 
                  dyn::field(obj,"EndWhile",$1);  $$ = obj;                
                                             
              }
              | KW_END_FOR {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)4)); 
                  dyn::field(obj,"EndFor",$1);  $$ = obj;                
                                             
              }
              | KW_END_DISPLAY {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)5)); 
                  dyn::field(obj,"EndDisplay",$1);  $$ = obj;                
                                             
              }
              | KW_END_INPUT {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)6)); 
                  dyn::field(obj,"EndInput",$1);  $$ = obj;                
                                             
              }
              | KW_END_CONSTRUCT {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)7)); 
                  dyn::field(obj,"EndConstruct",$1);  $$ = obj;                
                                             
              }
              | KW_END_MENU {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)8)); 
                  dyn::field(obj,"EndMenu",$1);  $$ = obj;                
                                             
              }
              | KW_END_FOREACH {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)9)); 
                  dyn::field(obj,"EndForeach",$1);  $$ = obj;                
                                             
              }
              | KW_END_CASE {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)10)); 
                  dyn::field(obj,"EndCase",$1);  $$ = obj;                
                                             
              }
              | KW_END_REPORT {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)11)); 
                  dyn::field(obj,"EndReport",$1);  $$ = obj;                
                                             
              }
              | KW_END_PROMPT {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)12)); 
                  dyn::field(obj,"EndPrompt",$1);  $$ = obj;                
                                             
              }
              | KW_END_SQL {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)13)); 
                  dyn::field(obj,"EndSql",$1);  $$ = obj;                
                                             
              }
              | KW_END_TRY {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)14)); 
                  dyn::field(obj,"EndTry",$1);  $$ = obj;                
                                             
              }
              | KW_END_DIALOG {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)15)); 
                  dyn::field(obj,"EndDialog",$1);  $$ = obj;                
                                             
              }
              | KW_END_ASYNC {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)16)); 
                  dyn::field(obj,"EndAsync",$1);  $$ = obj;                
                                             
              }
              | KW_END_STREAM {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)17)); 
                  dyn::field(obj,"EndStream",$1);  $$ = obj;                
                                             
              }
              ;
logical_block:      block_start definition_list statement_list {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"blockStart",$1); 
                        dyn::field(obj,"definitionList",$2); 
                        dyn::field(obj,"statementList",$3);  $$ = obj;  
                                                                 
                    }
                    ;
publicprivate:      KW_PRIVATE {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"Private",$1);  $$ = obj;                
                                                   
                    }
                    | KW_PUBLIC {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Public",$1);  $$ = obj;                
                                                   
                    }
                    ;
statement_list:      {
                         $$ = dyn::nil();                              
                                      
                     }
                     | statement_list statement {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"statementList",$1); 
                         dyn::field(obj,"statement",$2);  $$ = obj;  
                                                    SetSqlTokens(-1);
                                      
                     }
                     ;
begin:      KW_BEGIN {
                $$ = $1;                                            
            }
            ;
case:      KW_CASE {
               $$ = $1;                                            
           }
           ;
construct:      KW_CONSTRUCT {
                    $$ = $1;                                            
                }
                ;
display:      KW_DISPLAY {
                  $$ = $1;                                            
              }
              ;
foreach:      KW_FOREACH {
                  $$ = $1;                                            
              }
              ;
for:      KW_FOR {
              $$ = $1;                                            
          }
          ;
function:      KW_FUNCTION {
                   $$ = $1;                                            
               }
               ;
if:      KW_IF {
             $$ = $1;                                            
         }
         ;
input:      KW_INPUT {
                $$ = $1;                                            
            }
            ;
main:      KW_MAIN {
               $$ = $1;                                            
           }
           ;
menu:      KW_MENU {
               $$ = $1;                                            
           }
           ;
prompt:      KW_PROMPT {
                 $$ = $1;                                            
             }
             ;
try:      KW_TRY {
              $$ = $1;                                            
          }
          ;
while:      KW_WHILE {
                $$ = $1;                                            
            }
            ;
func_arg_list:      {
                        $$ = dyn::nil();                              
                                     
                    }
                    | func_arg_list_nonnull {
                        $$ = $1;                                            
                    }
                    ;
func_arg_list_nonnull:      func_arg_element {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"funcArgElement",$1);  $$ = obj; 
                                                                          
                            }
                            | func_arg_list KW_COMMA func_arg_element {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"funcArgList",$1); 
                                dyn::field(obj,"Comma",$2); 
                                dyn::field(obj,"funcArgElement",$3);  $$ = obj; 
                                                                          
                            }
                            ;
func_arg_element:      error {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"ErrorNode",$1);  $$ = obj;  
                                                                    
                       }
                       | identifier {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"identifier",$1);  $$ = obj;  
                                                                    
                       }
                       | identifier datatype opt_inout {
                           dyn::ptr_t obj = dyn::createObject();
                           dyn::field(obj,"$",dyn::val((int)2));
                           dyn::field(obj,"identifier",$1);
                           dyn::field(obj,"datatype",$2);
                           dyn::field(obj,"optInout",$3);
						   $$ = obj;
                       }
                       ;
function_definition:      opt_funcmodifier function block_start func_start
                          func_name KW_LPARENTHESIS func_arg_list
                          KW_RPARENTHESIS block_start opt_returns_clause
                          unwind_inner_block function_body unwind_inner_block
                          endstmt {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"optFuncmodifier",$1); 
                              dyn::field(obj,"function",$2); 
                              dyn::field(obj,"blockStart",$3); 
                              dyn::field(obj,"funcStart",$4); 
                              dyn::field(obj,"funcName",$5); 
                              dyn::field(obj,"Lparenthesis",$6); 
                              dyn::field(obj,"funcArgList",$7); 
                              dyn::field(obj,"Rparenthesis",$8); 
                              dyn::field(obj,"blockStart1",$9); 
                              dyn::field(obj,"optReturnsClause",$10); 
                              dyn::field(obj,"unwindInnerBlock",$11); 
                              dyn::field(obj,"functionBody",$12); 
                              dyn::field(obj,"unwindInnerBlock1",$13); 
                              dyn::field(obj,"endstmt",$14);  $$ = obj;  
                                                                       
                          }
                          ;
unwind_inner_block:      {
                             $$ = dyn::nil();                              
                                          
                         }
                         ;
func_start:      {
                     $$ = dyn::nil();                              
                                  
                 }
                 ;
func_name:      identifier {
                    $$ = $1;                                            
                }
                ;
function_prototype:      KW_PROTOTYPE opt_funcmodifier function block_start
                         opt_type func_name KW_LPARENTHESIS func_arg_list
                         KW_RPARENTHESIS block_start opt_returns_clause {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"Prototype",$1); 
                             dyn::field(obj,"optFuncmodifier",$2); 
                             dyn::field(obj,"function",$3); 
                             dyn::field(obj,"blockStart",$4); 
                             dyn::field(obj,"optType",$5); 
                             dyn::field(obj,"funcName",$6); 
                             dyn::field(obj,"Lparenthesis",$7); 
                             dyn::field(obj,"funcArgList",$8); 
                             dyn::field(obj,"Rparenthesis",$9); 
                             dyn::field(obj,"blockStart1",$10); 
                             dyn::field(obj,"optReturnsClause",$11);  $$ = obj; 
                                                                       
                         }
                         ;
opt_type:      {
                   $$ = dyn::nil();                                            
               }
               | KW_CFUNCTION {
                   $$ = $1;                                            
               }
               ;
function_body:      logical_block {
                        $$ = $1;                                            
                    }
                    ;
method_definition:
                    opt_funcmodifier function block_start
                      KW_LPARENTHESIS method_this_ptr_definition KW_RPARENTHESIS func_name
                      KW_LPARENTHESIS func_arg_list KW_RPARENTHESIS block_start opt_returns_clause
                      block_finish function_body block_finish endstmt {
                         dyn::ptr_t obj = dyn::createObject();
                         dyn::field(obj,"optFuncmodifier",$1);
                         dyn::field(obj,"function",$2);
                         dyn::field(obj,"blockStart",$3);
                         dyn::field(obj,"Lparenthesis",$4);
                         dyn::field(obj,"methodThisPtrDefinition",$5);
                         dyn::field(obj,"Rparenthesis",$6);
                         dyn::field(obj,"funcName",$7);
                         dyn::field(obj,"Lparenthesis",$8);
                         dyn::field(obj,"funcArgList",$9);
                         dyn::field(obj,"Rparenthesis",$10);
                         dyn::field(obj,"blockStart",$11);
                         dyn::field(obj,"optReturnsClause",$12);
                         dyn::field(obj,"blockFinish",$13);
                         dyn::field(obj,"functionBody",$14);
                         dyn::field(obj,"blockFinish",$15);
                         dyn::field(obj,"endstmt",$16);
                         $$ = obj;
                    }
                    ;
method_this_ptr_definition:
                    identifier define_datatype {
                         dyn::ptr_t obj = dyn::createObject();
                         dyn::field(obj,"identifier",$1);
                         dyn::field(obj,"defineDatatype",$2);
                         $$ = obj;
                    }
                    ;
main_definition:      main main_start function_body endstmt {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"main",$1); 
                          dyn::field(obj,"mainStart",$2); 
                          dyn::field(obj,"functionBody",$3); 
                          dyn::field(obj,"endstmt",$4);  $$ = obj;  
                                                                   
                      }
                      ;
main_start:      {
                     $$ = dyn::nil();                              
                                  
                 }
                 ;
opt_funcmodifier:      {
                           $$ = dyn::nil();                              
                                        
                       }
                       | KW_WEB {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"Web",$1);  $$ = obj;                
                                                      
                       }
                       | KW_PUBLIC {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)2)); 
                           dyn::field(obj,"Public",$1);  $$ = obj;  
                                                                    
                       }
                       | KW_PRIVATE {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)3)); 
                           dyn::field(obj,"Private",$1);  $$ = obj;  
                                                                    
                       }
                       ;
opt_returns_clause:      {
                             $$ = dyn::nil();
                         }
                         | KW_RETURNS returns_clause_item {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"Returns",$1); 
                             dyn::field(obj,"funcArgElement",$2);
                             $$ = obj;
                         }
                         | KW_RETURNS KW_LPARENTHESIS returns_clause_items KW_RPARENTHESIS {
                             dyn::ptr_t obj = dyn::createObject();
                             dyn::field(obj,"$",dyn::val((int)2));
                             dyn::field(obj,"Returns",$1);
                             dyn::field(obj,"Lparenthesis",$2);
                             dyn::field(obj,"funcArgList",$3);
                             dyn::field(obj,"Rparenthesis",$4);  $$ = obj;
                         }
                         ;
returns_clause_items:
                         returns_clause_item {
                             dyn::ptr_t obj = dyn::createObject();
                             dyn::field(obj,"returnsClauseItem",$1);
                             $$ = obj;
                         }
                         | returns_clause_items KW_COMMA returns_clause_item {
                             dyn::ptr_t obj = dyn::createObject();
                             dyn::field(obj,"$",dyn::val((int)1));
                             dyn::field(obj,"returnsClauseItems",$1);
                             dyn::field(obj,"Comma",$2);
                             dyn::field(obj,"returnsClauseItem",$3);
                             $$ = obj;
                         }
                         ;
returns_clause_item:
                         define_datatype {
                             dyn::ptr_t obj = dyn::createObject();
                             dyn::field(obj,"defineDatatype",$1);
                             $$ = obj;
                         }
                         ;

action_or_action_list:      single_action {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"singleAction",$1);  $$ = obj;  
                                                                         
                            }
                            | KW_LPARENTHESIS action_name_list KW_RPARENTHESIS {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"Lparenthesis",$1); 
                                dyn::field(obj,"actionNameList",$2); 
                                dyn::field(obj,"Rparenthesis",$3);  $$ = obj;  
                                                                         
                            }
                            ;
single_action:      action_name {
                        $$ = $1;                                            
                    }
                    ;
action_name_list:      single_action {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"singleAction",$1);  $$ = obj;  
                                                                    
                       }
                       | action_name_list KW_COMMA action_name {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"actionNameList",$1); 
                           dyn::field(obj,"Comma",$2); 
                           dyn::field(obj,"actionName",$3);  $$ = obj;  
                                                                    
                       }
                       ;
action_name:      identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"identifier",$1);  $$ = obj;  
                                                               
                  }
                  | string_param {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"stringParam",$1);  $$ = obj;  
                                                               
                  }
                  ;
async_expr:      async_start block_start definition_list async_expr_block
                 endstmt {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"asyncStart",$1); 
                     dyn::field(obj,"blockStart",$2); 
                     dyn::field(obj,"definitionList",$3); 
                     dyn::field(obj,"asyncExprBlock",$4); 
                     dyn::field(obj,"endstmt",$5);  $$ = obj;                
                                                
                 }
                 ;
async_start:      KW_ASYNC {
                      $$ = $1;                                            
                  }
                  ;
async_expr_block:      %prec KW_LOWEST {
                           $$ = dyn::nil();                              
                                        
                       }
                       | async_event_list {
                           $$ = $1;                                            
                       }
                       ;
async_event_list:      async_event_stmt {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"asyncEventStmt",$1);  $$ = obj;  
                                                                    
                       }
                       | async_event_list async_event_stmt {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"asyncEventList",$1); 
                           dyn::field(obj,"asyncEventStmt",$2);  $$ = obj;  
                                                                    
                       }
                       ;
async_event_stmt:      on_async_event statement_list {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"onAsyncEvent",$1); 
                           dyn::field(obj,"statementList",$2);  $$ = obj;  
                                                                    
                       }
                       ;
on_async_event:      KW_ON async_event KW_LPARENTHESIS async_expr_list
                     KW_RPARENTHESIS {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"On",$1); 
                         dyn::field(obj,"asyncEvent",$2); 
                         dyn::field(obj,"Lparenthesis",$3); 
                         dyn::field(obj,"asyncExprList",$4); 
                         dyn::field(obj,"Rparenthesis",$5);  $$ = obj;  
                                                                  
                     }
                     | KW_BEFORE async_type {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Before",$1); 
                         dyn::field(obj,"asyncType",$2);  $$ = obj;  
                                                                  
                     }
                     | KW_ON KW_GET {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"On",$1);  dyn::field(obj,"Get",$2); 
                         $$ = obj;                                            
                     }
                     | KW_ON KW_TIMER int_expr {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)3)); 
                         dyn::field(obj,"On",$1);  dyn::field(obj,"Timer",$2); 
                         dyn::field(obj,"intExpr",$3);  $$ = obj;  
                                                                  
                     }
                     ;
async_type:      KW_ASYNC {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"Async",$1);  $$ = obj;                
                                                
                 }
                 | KW_STREAM {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"Stream",$1);  $$ = obj;                
                                                
                 }
                 ;
async_expr_list:      async_expr_list_item {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"asyncExprListItem",$1);  $$ = obj;  
                                                                   
                      }
                      | async_expr_list KW_COMMA async_expr_list_item {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"asyncExprList",$1); 
                          dyn::field(obj,"Comma",$2); 
                          dyn::field(obj,"asyncExprListItem",$3);  $$ = obj;  
                                                                   
                      }
                      ;
async_expr_list_item:      expr %prec KW_LOWEST {
                               dyn::ptr_t obj = dyn::createObject(); 
                               dyn::field(obj,"expr",$1);  $$ = obj;  
                                                                        
                           }
                           | lvalue KW_EQ expr {
                               dyn::ptr_t obj = dyn::createObject(); 
                               dyn::field(obj,"$",dyn::val((int)1)); 
                               dyn::field(obj,"lvalue",$1); 
                               dyn::field(obj,"Eq",$2); 
                               dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                        
                           }
                           ;
async_event:      KW_MESSAGE {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Message",$1);  $$ = obj;                
                                                 
                  }
                  | KW_DONE {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Done",$1);  $$ = obj;                
                                                 
                  }
                  | KW_DATA {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"Data",$1);  $$ = obj;                
                                                 
                  }
                  | KW_GET {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)3)); 
                      dyn::field(obj,"Get",$1);  $$ = obj;                
                                                 
                  }
                  ;
cursor_expr:      cursor_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"cursorName",$1);  $$ = obj;  
                                                               
                  }
                  | KW_OBJECT KW_LPARENTHESIS cursor_expr KW_RPARENTHESIS {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Object",$1); 
                      dyn::field(obj,"Lparenthesis",$2); 
                      dyn::field(obj,"cursorExpr",$3); 
                      dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                               
                  }
                  ;
cursor_name:      cursor_object object_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"cursorObject",$1); 
                      dyn::field(obj,"objectName",$2);  $$ = obj;  
                                                               
                  }
                  ;
cursor_object:      {
                        $$ = dyn::nil();                              
                                     
                    }
                    ;
execute_cursor_expr:      execute_cursor_name {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"executeCursorName",$1);  $$ = obj;
                                                                         
                          }
                          | KW_EXPRESSION expr %prec KW_LOWEST {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)1)); 
                              dyn::field(obj,"Expression",$1); 
                              dyn::field(obj,"expr",$2);  $$ = obj;  
                                                                       
                          }
                          ;
execute_cursor_name:      execute_cursor_object object_name {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"executeCursorObject",$1); 
                              dyn::field(obj,"objectName",$2);  $$ = obj;  
                                                                       
                          }
                          ;
execute_cursor_object:      {
                                $$ = dyn::nil();                              
                                             
                            }
                            ;
ext_4glexpr:      async_expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"asyncExpr",$1);  $$ = obj;                
                                                 
                  }
                  | stream_expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"streamExpr",$1);  $$ = obj;  
                                                               
                  }
                  ;
field_list:      field_list_item {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"fieldListItem",$1);  $$ = obj;  
                                                              
                 }
                 | field_list KW_COMMA field_list_item {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"fieldList",$1); 
                     dyn::field(obj,"Comma",$2); 
                     dyn::field(obj,"fieldListItem",$3);  $$ = obj;  
                                                              
                 }
                 ;
field_list_item:      input_field {
                          $$ = $1;                                            
                      }
                      ;
form_expr:      form_name {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"formName",$1);  $$ = obj;                
                                               
                }
                | KW_EXPRESSION expr {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Expression",$1);  dyn::field(obj,"expr",$2);
                     $$ = obj;                                            
                }
                ;
form_name:      form_object object_name {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"formObject",$1); 
                    dyn::field(obj,"objectName",$2);  $$ = obj;                
                                               
                }
                ;
form_object:      {
                      $$ = dyn::nil();                              
                                   
                  }
                  ;
input_field:      expr %prec KW_LOWEST {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"expr",$1);  $$ = obj;                
                                                 
                  }
                  | KW_EXPRESSION expr %prec KW_LOWEST {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Expression",$1); 
                      dyn::field(obj,"expr",$2);  $$ = obj;                
                                                 
                  }
                  ;
key_list:      field_list {
                   $$ = $1;                                            
               }
               ;
logical_key:      KW_INSERT {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Insert",$1);  $$ = obj;                
                                                 
                  }
                  | KW_DELETE {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Delete",$1);  $$ = obj;                
                                                 
                  }
                  | KW_RETURN {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"Ret",$1);  $$ = obj;                
                                                 
                  }
                  | KW_ACCEPT {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)3)); 
                      dyn::field(obj,"Accept",$1);  $$ = obj;                
                                                 
                  }
                  | KW_NEXT {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)4)); 
                      dyn::field(obj,"Next",$1);  $$ = obj;                
                                                 
                  }
                  | KW_PREVIOUS {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)5)); 
                      dyn::field(obj,"Previous",$1);  $$ = obj;                
                                                 
                  }
                  | KW_HELP {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)6)); 
                      dyn::field(obj,"Help",$1);  $$ = obj;                
                                                 
                  }
                  | identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)7)); 
                      dyn::field(obj,"identifier",$1);  $$ = obj;  
                                                               
                  }
                  ;
opt_help:      {
                   $$ = dyn::nil();                                            
               }
               | KW_HELP int_expr {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"Help",$1);  dyn::field(obj,"intExpr",$2); 
                   $$ = obj;                                            
               }
               ;
opt_using:      {
                    $$ = dyn::nil();                                            
                }
                | using {
                    $$ = $1;                                            
                }
                ;
using:      KW_USING expr_list %prec KW_HIGHEST {
                dyn::ptr_t obj = dyn::createObject(); 
                dyn::field(obj,"Using",$1);  dyn::field(obj,"exprList",$2); 
                $$ = obj;                                            
            }
            ;
prepare_expr:      prepare_name {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"prepareName",$1);  $$ = obj;  
                                                                
                   }
                   | KW_EXPRESSION expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Expression",$1); 
                       dyn::field(obj,"expr",$2);  $$ = obj;                
                                                  
                   }
                   ;
prepare_name:      prepare_object object_name {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"prepareObject",$1); 
                       dyn::field(obj,"objectName",$2);  $$ = obj;  
                                                                
                   }
                   ;
prepare_object:      {
                         $$ = dyn::nil();                              
                                      
                     }
                     ;
report_attribute:      KW_EXPRESSION expr %prec KW_LOWEST {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"Expression",$1); 
                           dyn::field(obj,"expr",$2);  $$ = obj;                
                                                      
                       }
                       | KW_TOP_MARGIN opt_equal int_expr {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"TopMargin",$1); 
                           dyn::field(obj,"optEqual",$2); 
                           dyn::field(obj,"intExpr",$3);  $$ = obj;  
                                                                    
                       }
                       | KW_BOTTOM_MARGIN opt_equal int_expr {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)2)); 
                           dyn::field(obj,"BottomMargin",$1); 
                           dyn::field(obj,"optEqual",$2); 
                           dyn::field(obj,"intExpr",$3);  $$ = obj;  
                                                                    
                       }
                       | KW_LEFT_MARGIN opt_equal int_expr {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)3)); 
                           dyn::field(obj,"LeftMargin",$1); 
                           dyn::field(obj,"optEqual",$2); 
                           dyn::field(obj,"intExpr",$3);  $$ = obj;  
                                                                    
                       }
                       | KW_RIGHT_MARGIN opt_equal int_expr {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)4)); 
                           dyn::field(obj,"RightMargin",$1); 
                           dyn::field(obj,"optEqual",$2); 
                           dyn::field(obj,"intExpr",$3);  $$ = obj;  
                                                                    
                       }
                       | KW_PAGE_LENGTH opt_equal int_expr {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)5)); 
                           dyn::field(obj,"PageLength",$1); 
                           dyn::field(obj,"optEqual",$2); 
                           dyn::field(obj,"intExpr",$3);  $$ = obj;  
                                                                    
                       }
                       | KW_TOP_OF_PAGE opt_equal string_expr_nolist {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)6)); 
                           dyn::field(obj,"TopOfPage",$1); 
                           dyn::field(obj,"optEqual",$2); 
                           dyn::field(obj,"stringExprNolist",$3);  $$ = obj;  
                                                                    
                       }
                       ;
opt_equal:      {
                    $$ = dyn::nil();                                            
                }
                | KW_EQ {
                    $$ = $1;                                            
                }
                ;
stream_expr:      stream_start block_start definition_list async_expr_block
                  endstmt {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"streamStart",$1); 
                      dyn::field(obj,"blockStart",$2); 
                      dyn::field(obj,"definitionList",$3); 
                      dyn::field(obj,"asyncExprBlock",$4); 
                      dyn::field(obj,"endstmt",$5);  $$ = obj;                
                                                 
                  }
                  ;
stream_start:      KW_STREAM {
                       $$ = $1;                                            
                   }
                   ;
window_expr:      window_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"windowName",$1);  $$ = obj;  
                                                               
                  }
                  | KW_EXPRESSION expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Expression",$1); 
                      dyn::field(obj,"expr",$2);  $$ = obj;                
                                                 
                  }
                  ;
window_name:      window_object object_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"windowObject",$1); 
                      dyn::field(obj,"objectName",$2);  $$ = obj;  
                                                               
                  }
                  ;
window_object:      {
                        $$ = dyn::nil();                              
                                     
                    }
                    ;
menu_stmt:      menu block_start opt_title opt_menu_attributes command_list
                endstmt {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"menu",$1);  dyn::field(obj,"blockStart",$2);
                     dyn::field(obj,"optTitle",$3); 
                    dyn::field(obj,"optMenuAttributes",$4); 
                    dyn::field(obj,"commandList",$5); 
                    dyn::field(obj,"endstmt",$6);  $$ = obj;                
                                               
                }
                | KW_NEXT KW_OPTION expr {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Next",$1);  dyn::field(obj,"Option",$2); 
                    dyn::field(obj,"expr",$3);  $$ = obj;                
                                               
                }
                | KW_HIDE KW_OPTION expr_list {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)2)); 
                    dyn::field(obj,"Hide",$1);  dyn::field(obj,"Option",$2); 
                    dyn::field(obj,"exprList",$3);  $$ = obj;                
                                               
                }
                | KW_HIDE KW_OPTION KW_ALL {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)3)); 
                    dyn::field(obj,"Hide",$1);  dyn::field(obj,"Option",$2); 
                    dyn::field(obj,"All",$3);  $$ = obj;                
                                               
                }
                | KW_SHOW KW_OPTION expr_list {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)4)); 
                    dyn::field(obj,"Show",$1);  dyn::field(obj,"Option",$2); 
                    dyn::field(obj,"exprList",$3);  $$ = obj;                
                                               
                }
                | KW_SHOW KW_OPTION KW_ALL {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)5)); 
                    dyn::field(obj,"Show",$1);  dyn::field(obj,"Option",$2); 
                    dyn::field(obj,"All",$3);  $$ = obj;                
                                               
                }
                ;
command_list:      {
                       $$ = dyn::nil();                              
                                    
                   }
                   | command_list menu_command {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"commandList",$1); 
                       dyn::field(obj,"menuCommand",$2);  $$ = obj;  
                                                                
                   }
                   ;
menu_command:      KW_COMMAND opt_key opt_two_expr opt_help
                   opt_local_block_attributes statement_list {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"Command",$1); 
                       dyn::field(obj,"optKey",$2); 
                       dyn::field(obj,"optTwoExpr",$3); 
                       dyn::field(obj,"optHelp",$4); 
                       dyn::field(obj,"optLocalBlockAttributes",$5); 
                       dyn::field(obj,"statementList",$6);  $$ = obj;  
                                                                
                   }
                   | KW_BEFORE KW_MENU statement_list {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Before",$1);  dyn::field(obj,"Menu",$2); 
                       dyn::field(obj,"statementList",$3);  $$ = obj;  
                                                                
                   }
                   | KW_ON KW_ACTION action_or_action_list
                   opt_local_block_attributes statement_list {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"On",$1);  dyn::field(obj,"Action",$2); 
                       dyn::field(obj,"actionOrActionList",$3); 
                       dyn::field(obj,"optLocalBlockAttributes",$4); 
                       dyn::field(obj,"statementList",$5);  $$ = obj;  
                                                                
                   }
                   | KW_ON KW_IDLE expr statement_list {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)3)); 
                       dyn::field(obj,"On",$1);  dyn::field(obj,"Idle",$2); 
                       dyn::field(obj,"expr",$3); 
                       dyn::field(obj,"statementList",$4);  $$ = obj;  
                                                                
                   }
                   | KW_ON KW_TIMER int_expr statement_list {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)4)); 
                       dyn::field(obj,"On",$1);  dyn::field(obj,"Timer",$2); 
                       dyn::field(obj,"intExpr",$3); 
                       dyn::field(obj,"statementList",$4);  $$ = obj;  
                                                                
                   }
                   | KW_ON KW_DONE KW_LPARENTHESIS identifier KW_RPARENTHESIS
                   statement_list {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)5)); 
                       dyn::field(obj,"On",$1);  dyn::field(obj,"Done",$2); 
                       dyn::field(obj,"Lparenthesis",$3); 
                       dyn::field(obj,"identifier",$4); 
                       dyn::field(obj,"Rparenthesis",$5); 
                       dyn::field(obj,"statementList",$6);  $$ = obj;  
                                                                
                   }
                   | KW_ON KW_DATA KW_LPARENTHESIS identifier KW_RPARENTHESIS
                   statement_list {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)6)); 
                       dyn::field(obj,"On",$1);  dyn::field(obj,"Data",$2); 
                       dyn::field(obj,"Lparenthesis",$3); 
                       dyn::field(obj,"identifier",$4); 
                       dyn::field(obj,"Rparenthesis",$5); 
                       dyn::field(obj,"statementList",$6);  $$ = obj;  
                                                                
                   }
                   | KW_ON KW_MESSAGE KW_LPARENTHESIS identifier KW_RPARENTHESIS
                   statement_list {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)7)); 
                       dyn::field(obj,"On",$1);  dyn::field(obj,"Message",$2); 
                       dyn::field(obj,"Lparenthesis",$3); 
                       dyn::field(obj,"identifier",$4); 
                       dyn::field(obj,"Rparenthesis",$5); 
                       dyn::field(obj,"statementList",$6);  $$ = obj;  
                                                                
                   }
                   ;
opt_key:      {
                  $$ = dyn::nil();                                            
              }
              | KW_KEY KW_LPARENTHESIS key_list KW_RPARENTHESIS {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)1)); 
                  dyn::field(obj,"Key",$1);  dyn::field(obj,"Lparenthesis",$2); 
                  dyn::field(obj,"keyList",$3); 
                  dyn::field(obj,"Rparenthesis",$4);  $$ = obj;                
                                             
              }
              ;
opt_two_expr:      %prec KW_LOWEST {
                       $$ = dyn::nil();                              
                                    
                   }
                   | one_menu_expr one_menu_expr %prec KW_LOWEST {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"oneMenuExpr",$1); 
                       dyn::field(obj,"oneMenuExpr1",$2);  $$ = obj;  
                                                                
                   }
                   | one_menu_expr %prec KW_LOWEST {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"oneMenuExpr",$1);  $$ = obj;  
                                                                
                   }
                   | one_menu_expr KW_COMMA one_menu_expr %prec KW_LOWEST {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)3)); 
                       dyn::field(obj,"oneMenuExpr",$1); 
                       dyn::field(obj,"Comma",$2); 
                       dyn::field(obj,"oneMenuExpr1",$3);  $$ = obj;  
                                                                
                   }
                   ;
one_menu_expr:      lvalue_or_const %prec KW_LOWEST {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"lvalueOrConst",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_LPARENTHESIS expr_list KW_RPARENTHESIS %prec KW_LOWEST
                    {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Lparenthesis",$1); 
                        dyn::field(obj,"exprList",$2); 
                        dyn::field(obj,"Rparenthesis",$3);  $$ = obj;  
                                                                 
                    }
                    ;
opt_title:      %prec KW_LOWEST {
                    $$ = dyn::nil();                                            
                }
                | string_expr {
                    $$ = $1;                                            
                }
                ;
report_stmt:      KW_START KW_REPORT func_name opt_append_flag opt_report_dest
                  opt_dimensions {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Start",$1);  dyn::field(obj,"Report",$2); 
                      dyn::field(obj,"funcName",$3); 
                      dyn::field(obj,"optAppendFlag",$4); 
                      dyn::field(obj,"optReportDest",$5); 
                      dyn::field(obj,"optDimensions",$6);  $$ = obj;  
                                                               
                  }
                  | KW_FINISH KW_REPORT func_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Finish",$1);  dyn::field(obj,"Report",$2);
                       dyn::field(obj,"funcName",$3);  $$ = obj;                
                                                 
                  }
                  | KW_OUTPUT KW_TO KW_REPORT func_name KW_LPARENTHESIS
                  opt_expr_list KW_RPARENTHESIS {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"Output",$1);  dyn::field(obj,"To",$2); 
                      dyn::field(obj,"Report",$3); 
                      dyn::field(obj,"funcName",$4); 
                      dyn::field(obj,"Lparenthesis",$5); 
                      dyn::field(obj,"optExprList",$6); 
                      dyn::field(obj,"Rparenthesis",$7);  $$ = obj;  
                                                               
                  }
                  | KW_TERMINATE KW_REPORT func_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)3)); 
                      dyn::field(obj,"Terminate",$1); 
                      dyn::field(obj,"Report",$2); 
                      dyn::field(obj,"funcName",$3);  $$ = obj;                
                                                 
                  }
                  ;
opt_report_dest:      {
                          $$ = dyn::nil();                              
                                       
                      }
                      | KW_TO report_device {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"To",$1); 
                          dyn::field(obj,"reportDevice",$2);  $$ = obj;  
                                                                   
                      }
                      ;
opt_append_flag:      {
                          $$ = dyn::nil();                              
                                       
                      }
                      | KW_APPEND {
                          $$ = $1;                                            
                      }
                      ;
opt_dimensions:      {
                         $$ = dyn::nil();                              
                                      
                     }
                     | KW_WITH report_attribute_list {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"With",$1); 
                         dyn::field(obj,"reportAttributeList",$2);  $$ = obj;  
                                                                  
                     }
                     ;
report_attribute_list:      report_attribute {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"reportAttribute",$1);  $$ = obj;
                                                                           
                            }
                            | report_attribute_list KW_COMMA report_attribute {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"reportAttributeList",$1); 
                                dyn::field(obj,"Comma",$2); 
                                dyn::field(obj,"reportAttribute",$3);  $$ = obj;
                                                                           
                            }
                            ;
report_definition:      opt_funcmodifier report report_block_start func_name
                        KW_LPARENTHESIS func_arg_list KW_RPARENTHESIS
                        block_start definition_list report_block_drop_global
                        output_section order_section format_section
                        unwind_inner_block2 endstmt {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"optFuncmodifier",$1); 
                            dyn::field(obj,"report",$2); 
                            dyn::field(obj,"reportBlockStart",$3); 
                            dyn::field(obj,"funcName",$4); 
                            dyn::field(obj,"Lparenthesis",$5); 
                            dyn::field(obj,"funcArgList",$6); 
                            dyn::field(obj,"Rparenthesis",$7); 
                            dyn::field(obj,"blockStart",$8); 
                            dyn::field(obj,"definitionList",$9); 
                            dyn::field(obj,"reportBlockDropGlobal",$10); 
                            dyn::field(obj,"outputSection",$11); 
                            dyn::field(obj,"orderSection",$12); 
                            dyn::field(obj,"formatSection",$13); 
                            dyn::field(obj,"unwindInnerBlock2",$14); 
                            dyn::field(obj,"endstmt",$15);  $$ = obj;  
                                                                     
                        }
                        ;
report_block_drop_global:      {
                                   $$ = dyn::nil();                
                                                              
                               }
                               ;
unwind_inner_block2:      {
                              $$ = dyn::nil();                              
                                           
                          }
                          ;
report_block_start:      block_start {
                             $$ = $1;                              
                                          
                         }
                         ;
output_section:      {
                         $$ = dyn::nil();                              
                                      
                     }
                     | KW_OUTPUT output_list {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Output",$1); 
                         dyn::field(obj,"outputList",$2);  $$ = obj;  
                                                                  
                     }
                     ;
output_list:      {
                      $$ = dyn::nil();                              
                                   
                  }
                  | output_list output_clause {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"outputList",$1); 
                      dyn::field(obj,"outputClause",$2);  $$ = obj;  
                                                               
                  }
                  ;
output_clause:      KW_REPORT opt_append_flag2 KW_TO report_device {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"Report",$1); 
                        dyn::field(obj,"optAppendFlag2",$2); 
                        dyn::field(obj,"To",$3); 
                        dyn::field(obj,"reportDevice",$4);  $$ = obj;  
                                                                 
                    }
                    | report_attribute {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"reportAttribute",$1);  $$ = obj;  
                                                                 
                    }
                    ;
opt_append_flag2:      {
                           $$ = dyn::nil();                              
                                        
                       }
                       | KW_APPEND {
                           $$ = $1;                                            
                       }
                       ;
order_section:      {
                        $$ = dyn::nil();                              
                                     
                    }
                    | KW_ORDER_BY order_expr_list {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"OrderBy",$1); 
                        dyn::field(obj,"orderExprList",$2);  $$ = obj;  
                                                                 
                    }
                    | KW_ORDER_BY_EXTERNAL opt_order_expr_list {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)2)); 
                        dyn::field(obj,"OrderByExternal",$1); 
                        dyn::field(obj,"optOrderExprList",$2);  $$ = obj;  
                                                                 
                    }
                    | KW_ORDER_EXTERNAL_BY opt_order_expr_list {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)3)); 
                        dyn::field(obj,"OrderExternalBy",$1); 
                        dyn::field(obj,"optOrderExprList",$2);  $$ = obj;  
                                                                 
                    }
                    ;
opt_order_expr_list:      {
                              $$ = dyn::nil();                              
                                           
                          }
                          | order_expr_list {
                              $$ = $1;                              
                                           
                          }
                          ;
format_section:      KW_FORMAT format_section_body {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"Format",$1); 
                         dyn::field(obj,"formatSectionBody",$2);  $$ = obj;  
                                                                  
                     }
                     | KW_FORMAT_EVERY_ROW {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"FormatEveryRow",$1);  $$ = obj;  
                                                                  
                     }
                     ;
format_section_body:      {
                              $$ = dyn::nil();                              
                                           
                          }
                          | format_section_body format_clause statement_list {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)1)); 
                              dyn::field(obj,"formatSectionBody",$1); 
                              dyn::field(obj,"formatClause",$2); 
                              dyn::field(obj,"statementList",$3);  $$ = obj;  
                                                                       
                          }
                          ;
format_clause:      KW_PAGE_HEADER {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"PageHeader",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_PAGE_TRAILER {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"PageTrailer",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_FIRST_PAGE_HEADER {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)2)); 
                        dyn::field(obj,"FirstPageHeader",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_ON_EVERY_ROW {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)3)); 
                        dyn::field(obj,"OnEveryRow",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_ON_LAST_ROW {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)4)); 
                        dyn::field(obj,"OnLastRow",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_BEFORE_GROUP_OF lvalue {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)5)); 
                        dyn::field(obj,"BeforeGroupOf",$1); 
                        dyn::field(obj,"lvalue",$2);  $$ = obj;                
                                                   
                    }
                    | KW_AFTER_GROUP_OF lvalue {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)6)); 
                        dyn::field(obj,"AfterGroupOf",$1); 
                        dyn::field(obj,"lvalue",$2);  $$ = obj;                
                                                   
                    }
                    ;
report:      KW_REPORT {
                 $$ = $1;                                            
             }
             ;
report_device:      KW_PRINTER {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"Printer",$1);  $$ = obj;                
                                                   
                    }
                    | KW_PIPE string_expr {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Pipe",$1); 
                        dyn::field(obj,"stringExpr",$2);  $$ = obj;  
                                                                 
                    }
                    | KW_FILE string_expr {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)2)); 
                        dyn::field(obj,"File",$1); 
                        dyn::field(obj,"stringExpr",$2);  $$ = obj;  
                                                                 
                    }
                    | string_expr {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)3)); 
                        dyn::field(obj,"stringExpr",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_SCREEN {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)4)); 
                        dyn::field(obj,"Screen",$1);  $$ = obj;                
                                                   
                    }
                    | KW_OUTPUT string_expr opt_output_destination {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)5)); 
                        dyn::field(obj,"Output",$1); 
                        dyn::field(obj,"stringExpr",$2); 
                        dyn::field(obj,"optOutputDestination",$3);  $$ = obj;  
                                                                 
                    }
                    | KW_EXPRESSION string_expr {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)6)); 
                        dyn::field(obj,"Expression",$1); 
                        dyn::field(obj,"stringExpr",$2);  $$ = obj;  
                                                                 
                    }
                    | KW_XML KW_HANDLER expr {
                        dyn::ptr_t obj = dyn::createObject();
                        dyn::field(obj,"$",dyn::val((int)7));
                        dyn::field(obj,"Xml",$1);
                        dyn::field(obj,"Handler",$2);
                        dyn::field(obj,"expr",$3);
                        $$ = obj;
                    }
                    ;
opt_output_destination:      {
                                 $$ = dyn::nil();                              
                                              
                             }
                             | KW_DESTINATION string_expr {
                                 dyn::ptr_t obj = dyn::createObject(); 
                                 dyn::field(obj,"$",dyn::val((int)1)); 
                                 dyn::field(obj,"Destination",$1); 
                                 dyn::field(obj,"stringExpr",$2);  $$ = obj;  
                                                                          
                             }
                             ;
call_stmt:      KW_CALL function_call opt_returning {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"Call",$1); 
                    dyn::field(obj,"functionCall",$2); 
                    dyn::field(obj,"optReturning",$3);  $$ = obj;  
                                                             
                }
                ;
opt_returning:      {
                        $$ = dyn::nil();                              
                                     
                    }
                    | KW_RETURNING lvalue_list {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Returning",$1); 
                        dyn::field(obj,"lvalueList",$2);  $$ = obj;  
                                                                 
                    }
                    ;
control_stmt:      if_stmt {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"ifStmt",$1);  $$ = obj;                
                                                  
                   }
                   | for_stmt {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"forStmt",$1);  $$ = obj;                
                                                  
                   }
                   | while_stmt {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"whileStmt",$1);  $$ = obj;  
                                                                
                   }
                   | call_stmt {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)3)); 
                       dyn::field(obj,"callStmt",$1);  $$ = obj;                
                                                  
                   }
                   | begin logical_block KW_END {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)4)); 
                       dyn::field(obj,"begin",$1); 
                       dyn::field(obj,"logicalBlock",$2); 
                       dyn::field(obj,"End",$3);  $$ = obj;                
                                                  
                   }
                   | KW_SLEEP int_expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)5)); 
                       dyn::field(obj,"Sleep",$1); 
                       dyn::field(obj,"intExpr",$2);  $$ = obj;                
                                                  
                   }
                   | KW_RUN opt_client expr opt_form_line_mode opt_waiting
                   opt_returning_int {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)6)); 
                       dyn::field(obj,"Run",$1); 
                       dyn::field(obj,"optClient",$2); 
                       dyn::field(obj,"expr",$3); 
                       dyn::field(obj,"optFormLineMode",$4); 
                       dyn::field(obj,"optWaiting",$5); 
                       dyn::field(obj,"optReturningInt",$6);  $$ = obj;  
                                                                
                   }
                   | foreach_stmt {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)7)); 
                       dyn::field(obj,"foreachStmt",$1);  $$ = obj;  
                                                                
                   }
                   | case_stmt {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)8)); 
                       dyn::field(obj,"caseStmt",$1);  $$ = obj;                
                                                  
                   }
                   | goto_stmt {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)9)); 
                       dyn::field(obj,"gotoStmt",$1);  $$ = obj;                
                                                  
                   }
                   | label_stmt {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)10)); 
                       dyn::field(obj,"labelStmt",$1);  $$ = obj;  
                                                                
                   }
                   | try_stmt {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)11)); 
                       dyn::field(obj,"tryStmt",$1);  $$ = obj;                
                                                  
                   }
                   ;
opt_client:      {
                     $$ = dyn::nil();                              
                                  
                 }
                 | KW_CLIENT {
                     $$ = $1;                                            
                 }
                 ;
if_stmt:      if expr KW_THEN logical_block opt_else endstmt {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"if",$1);  dyn::field(obj,"expr",$2); 
                  dyn::field(obj,"Then",$3);  dyn::field(obj,"logicalBlock",$4);
                   dyn::field(obj,"optElse",$5);  dyn::field(obj,"endstmt",$6); 
                  $$ = obj;                                            
              }
              ;
opt_else:      {
                   $$ = dyn::nil();                                            
               }
               | else logical_block {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"els",$1);  dyn::field(obj,"logicalBlock",$2);
                    $$ = obj;                                            
               }
               ;
else:      KW_ELSE {
               $$ = $1;                                            
           }
           ;
for_stmt:      for lvalue KW_EQ expr KW_TO expr opt_step logical_block endstmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"for",$1);  dyn::field(obj,"lvalue",$2); 
                   dyn::field(obj,"Eq",$3);  dyn::field(obj,"expr",$4); 
                   dyn::field(obj,"To",$5);  dyn::field(obj,"expr1",$6); 
                   dyn::field(obj,"optStep",$7); 
                   dyn::field(obj,"logicalBlock",$8); 
                   dyn::field(obj,"endstmt",$9);  $$ = obj;                
                                              
               }
               ;
opt_step:      {
                   $$ = dyn::nil();                                            
               }
               | KW_STEP expr {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"Step",$1);  dyn::field(obj,"expr",$2); 
                   $$ = obj;                                            
               }
               ;
while_stmt:      while expr logical_block endstmt {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"while",$1);  dyn::field(obj,"expr",$2); 
                     dyn::field(obj,"logicalBlock",$3); 
                     dyn::field(obj,"endstmt",$4);  $$ = obj;                
                                                
                 }
                 ;
foreach_stmt:      foreach cursor_expr opt_using opt_into opt_withreopt
                   logical_block endstmt {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"foreach",$1); 
                       dyn::field(obj,"cursorExpr",$2); 
                       dyn::field(obj,"optUsing",$3); 
                       dyn::field(obj,"optInto",$4); 
                       dyn::field(obj,"optWithreopt",$5); 
                       dyn::field(obj,"logicalBlock",$6); 
                       dyn::field(obj,"endstmt",$7);  $$ = obj;                
                                                  
                   }
                   ;
opt_withreopt:      {
                        $$ = dyn::nil();                              
                                     
                    }
                    | KW_WITH KW_REOPTIMIZATION {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"With",$1); 
                        dyn::field(obj,"Reoptimization",$2);  $$ = obj;  
                                                                 
                    }
                    ;
opt_form_line_mode:      {
                             $$ = dyn::nil();                              
                                          
                         }
                         | KW_IN KW_FORM KW_MODE {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"In",$1); 
                             dyn::field(obj,"Form",$2); 
                             dyn::field(obj,"Mode",$3);  $$ = obj;  
                                                                      
                         }
                         | KW_IN KW_LINE KW_MODE {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)2)); 
                             dyn::field(obj,"In",$1); 
                             dyn::field(obj,"Line",$2); 
                             dyn::field(obj,"Mode",$3);  $$ = obj;  
                                                                      
                         }
                         ;
opt_waiting:      {
                      $$ = dyn::nil();                              
                                   
                  }
                  | KW_WITHOUT KW_WAITING {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Without",$1); 
                      dyn::field(obj,"Waiting",$2);  $$ = obj;                
                                                 
                  }
                  ;
opt_returning_int:      {
                            $$ = dyn::nil();                              
                                         
                        }
                        | KW_RETURNING lvalue {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"Returning",$1); 
                            dyn::field(obj,"lvalue",$2);  $$ = obj;  
                                                                     
                        }
                        ;
case_stmt:      case opt_expr block_start when_list endstmt {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"case",$1);  dyn::field(obj,"optExpr",$2); 
                    dyn::field(obj,"blockStart",$3); 
                    dyn::field(obj,"whenList",$4); 
                    dyn::field(obj,"endstmt",$5);  $$ = obj;                
                                               
                }
                ;
when_list:      {
                    $$ = dyn::nil();                                            
                }
                | when_list when_option {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"whenList",$1); 
                    dyn::field(obj,"whenOption",$2);  $$ = obj;                
                                               
                }
                ;
when_option:      when_condition statement_list {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"whenCondition",$1); 
                      dyn::field(obj,"statementList",$2);  $$ = obj;  
                                                               
                  }
                  ;
when_condition:      KW_WHEN expr {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"When",$1);  dyn::field(obj,"expr",$2); 
                         $$ = obj;                                            
                     }
                     | KW_OTHERWISE {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Otherwise",$1);  $$ = obj;  
                                                                  
                     }
                     ;
try_stmt:      try logical_block opt_catch endstmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"try",$1);  dyn::field(obj,"logicalBlock",$2);
                    dyn::field(obj,"optCatch",$3); 
                   dyn::field(obj,"endstmt",$4);  $$ = obj;                
                                              
               }
               ;
opt_catch:      {
                    $$ = dyn::nil();                                            
                }
                | catch logical_block {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"catch",$1); 
                    dyn::field(obj,"logicalBlock",$2);  $$ = obj;  
                                                             
                }
                ;
catch:      KW_CATCH {
                $$ = $1;                                            
            }
            ;
coords:      expr KW_COMMA expr {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"expr",$1);  dyn::field(obj,"Comma",$2); 
                 dyn::field(obj,"expr1",$3);  $$ = obj;                
                                            
             }
             ;
data_stmt:      KW_LOCATE lvalue_list blob_loc {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"Locate",$1); 
                    dyn::field(obj,"lvalueList",$2); 
                    dyn::field(obj,"blobLoc",$3);  $$ = obj;                
                                               
                }
                | KW_ALLOCATE_ARRAY identifier '[' expr_list ']' {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"AllocateArray",$1); 
                    dyn::field(obj,"identifier",$2); 
                    dyn::field(obj,"LeftSquareParen",$3); 
                    dyn::field(obj,"exprList",$4); 
                    dyn::field(obj,"RightSquareParen",$5);  $$ = obj;  
                                                             
                }
                | KW_DEALLOCATE_ARRAY identifier {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)2)); 
                    dyn::field(obj,"DeallocateArray",$1); 
                    dyn::field(obj,"identifier",$2);  $$ = obj;                
                                               
                }
                | KW_RESIZE_ARRAY identifier '[' expr_list ']' {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)3)); 
                    dyn::field(obj,"ResizeArray",$1); 
                    dyn::field(obj,"identifier",$2); 
                    dyn::field(obj,"LeftSquareParen",$3); 
                    dyn::field(obj,"exprList",$4); 
                    dyn::field(obj,"RightSquareParen",$5);  $$ = obj;  
                                                             
                }
                ;
blob_loc:      KW_IN_FILE %prec KW_LOWEST {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"InFile",$1);  $$ = obj;                
                                              
               }
               | KW_IN_FILE string_expr {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"InFile",$1); 
                   dyn::field(obj,"stringExpr",$2);  $$ = obj;                
                                              
               }
               | KW_IN_MEMORY {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)2)); 
                   dyn::field(obj,"InMemory",$1);  $$ = obj;                
                                              
               }
               | KW_EXPRESSION string_expr {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)3)); 
                   dyn::field(obj,"Expression",$1); 
                   dyn::field(obj,"stringExpr",$2);  $$ = obj;                
                                              
               }
               ;
display_stmt:      KW_DISPLAY opt_expr_list opt_semi {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"Display",$1); 
                       dyn::field(obj,"optExprList",$2); 
                       dyn::field(obj,"optSemi",$3);  $$ = obj;                
                                                  
                   }
                   | KW_DISPLAY expr_list KW_AT coords
                   opt_color_style_attributes opt_semi {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Display",$1); 
                       dyn::field(obj,"exprList",$2);  dyn::field(obj,"At",$3); 
                       dyn::field(obj,"coords",$4); 
                       dyn::field(obj,"optColorStyleAttributes",$5); 
                       dyn::field(obj,"optSemi",$6);  $$ = obj;                
                                                  
                   }
                   | KW_DISPLAY expr_list KW_TO field_list
                   opt_color_style_attributes {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"Display",$1); 
                       dyn::field(obj,"exprList",$2);  dyn::field(obj,"To",$3); 
                       dyn::field(obj,"fieldList",$4); 
                       dyn::field(obj,"optColorStyleAttributes",$5);  $$ = obj; 
                                                                 
                   }
                   | KW_DISPLAY expr_list KW_INTO expr_list {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)3)); 
                       dyn::field(obj,"Display",$1); 
                       dyn::field(obj,"exprList",$2); 
                       dyn::field(obj,"Into",$3); 
                       dyn::field(obj,"exprList1",$4);  $$ = obj;  
                                                                
                   }
                   | KW_DISPLAY KW_BY_NAME expr_list opt_color_style_attributes
                   opt_semi {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)4)); 
                       dyn::field(obj,"Display",$1); 
                       dyn::field(obj,"ByName",$2); 
                       dyn::field(obj,"exprList",$3); 
                       dyn::field(obj,"optColorStyleAttributes",$4); 
                       dyn::field(obj,"optSemi",$5);  $$ = obj;                
                                                  
                   }
                   | KW_ERROR expr_list opt_color_style_attributes opt_semi {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)5)); 
                       dyn::field(obj,"Error",$1); 
                       dyn::field(obj,"exprList",$2); 
                       dyn::field(obj,"optColorStyleAttributes",$3); 
                       dyn::field(obj,"optSemi",$4);  $$ = obj;                
                                                  
                   }
                   | KW_MESSAGE expr_list opt_color_style_attributes opt_semi {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)6)); 
                       dyn::field(obj,"Message",$1); 
                       dyn::field(obj,"exprList",$2); 
                       dyn::field(obj,"optColorStyleAttributes",$3); 
                       dyn::field(obj,"optSemi",$4);  $$ = obj;                
                                                  
                   }
                   | KW_CLEAR field_list opt_semi {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)7)); 
                       dyn::field(obj,"Clear",$1); 
                       dyn::field(obj,"fieldList",$2); 
                       dyn::field(obj,"optSemi",$3);  $$ = obj;                
                                                  
                   }
                   ;
exit_stmt:      KW_EXIT_MAIN {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"ExitMain",$1);  $$ = obj;                
                                               
                }
                | KW_EXIT_FUNCTION {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"ExitFunction",$1);  $$ = obj;  
                                                             
                }
                | KW_EXIT_WHILE {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)2)); 
                    dyn::field(obj,"ExitWhile",$1);  $$ = obj;                
                                               
                }
                | KW_EXIT_FOR {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)3)); 
                    dyn::field(obj,"ExitFor",$1);  $$ = obj;                
                                               
                }
                | KW_EXIT_DISPLAY {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)4)); 
                    dyn::field(obj,"ExitDisplay",$1);  $$ = obj;                
                                               
                }
                | KW_EXIT_INPUT {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)5)); 
                    dyn::field(obj,"ExitInput",$1);  $$ = obj;                
                                               
                }
                | KW_EXIT_PROMPT {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)6)); 
                    dyn::field(obj,"ExitPrompt",$1);  $$ = obj;                
                                               
                }
                | KW_EXIT_CONSTRUCT {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)7)); 
                    dyn::field(obj,"ExitConstruct",$1);  $$ = obj;  
                                                             
                }
                | KW_EXIT_MENU {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)8)); 
                    dyn::field(obj,"ExitMenu",$1);  $$ = obj;                
                                               
                }
                | KW_EXIT_PROGRAM %prec KW_LOWEST {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)9)); 
                    dyn::field(obj,"ExitProgram",$1);  $$ = obj;                
                                               
                }
                | KW_EXIT_PROGRAM int_expr {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)10)); 
                    dyn::field(obj,"ExitProgram",$1); 
                    dyn::field(obj,"intExpr",$2);  $$ = obj;                
                                               
                }
                | KW_EXIT_FOREACH {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)11)); 
                    dyn::field(obj,"ExitForeach",$1);  $$ = obj;                
                                               
                }
                | KW_EXIT_CASE {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)12)); 
                    dyn::field(obj,"ExitCase",$1);  $$ = obj;                
                                               
                }
                | KW_CONTINUE_FOREACH {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)13)); 
                    dyn::field(obj,"ContinueForeach",$1);  $$ = obj;  
                                                             
                }
                | KW_CONTINUE_WHILE {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)14)); 
                    dyn::field(obj,"ContinueWhile",$1);  $$ = obj;  
                                                             
                }
                | KW_CONTINUE_FOR {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)15)); 
                    dyn::field(obj,"ContinueFor",$1);  $$ = obj;                
                                               
                }
                | KW_CONTINUE_DISPLAY {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)16)); 
                    dyn::field(obj,"ContinueDisplay",$1);  $$ = obj;  
                                                             
                }
                | KW_CONTINUE_INPUT {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)17)); 
                    dyn::field(obj,"ContinueInput",$1);  $$ = obj;  
                                                             
                }
                | KW_CONTINUE_PROMPT {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)18)); 
                    dyn::field(obj,"ContinuePrompt",$1);  $$ = obj;  
                                                             
                }
                | KW_CONTINUE_CONSTRUCT {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)19)); 
                    dyn::field(obj,"ContinueConstruct",$1);  $$ = obj;  
                                                             
                }
                | KW_CONTINUE_MENU {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)20)); 
                    dyn::field(obj,"ContinueMenu",$1);  $$ = obj;  
                                                             
                }
                | KW_RETURN opt_expr_list {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)21)); 
                    dyn::field(obj,"Ret",$1);  dyn::field(obj,"optExprList",$2);
                     $$ = obj;                                            
                }
                | KW_RETURN ext_4glexpr {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)22)); 
                    dyn::field(obj,"Ret",$1);  dyn::field(obj,"ext4glexpr",$2); 
                    $$ = obj;                                            
                }
                | KW_EXIT_REPORT {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)23)); 
                    dyn::field(obj,"ExitReport",$1);  $$ = obj;                
                                               
                }
                | KW_EXIT KW_DIALOG {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)24)); 
                    dyn::field(obj,"Exit",$1);  dyn::field(obj,"Dialog",$2); 
                    $$ = obj;                                            
                }
                | KW_CONTINUE KW_DIALOG {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)25)); 
                    dyn::field(obj,"Continue",$1);  dyn::field(obj,"Dialog",$2);
                     $$ = obj;                                            
                }
                | KW_ACCEPT KW_DIALOG {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)26)); 
                    dyn::field(obj,"Accept",$1);  dyn::field(obj,"Dialog",$2); 
                    $$ = obj;                                            
                }
                | KW_ACCEPT KW_INPUT {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)27)); 
                    dyn::field(obj,"Accept",$1);  dyn::field(obj,"Input",$2); 
                    $$ = obj;                                            
                }
                | KW_ACCEPT_CONSTRUCT {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)28)); 
                    dyn::field(obj,"AcceptConstruct",$1);  $$ = obj;  
                                                             
                }
                | KW_ACCEPT_DISPLAY {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)29)); 
                    dyn::field(obj,"AcceptDisplay",$1);  $$ = obj;  
                                                             
                }
                | KW_EXIT KW_STREAM {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)30)); 
                    dyn::field(obj,"Exit",$1);  dyn::field(obj,"Stream",$2); 
                    $$ = obj;                                            
                }
                ;
file_stmt:      KW_OPEN KW_FILE lvalue KW_FROM string_expr KW_OPTIONS
                KW_LPARENTHESIS file_attributes_list KW_RPARENTHESIS {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"Open",$1);  dyn::field(obj,"File",$2); 
                    dyn::field(obj,"lvalue",$3);  dyn::field(obj,"From",$4); 
                    dyn::field(obj,"stringExpr",$5); 
                    dyn::field(obj,"Options",$6); 
                    dyn::field(obj,"Lparenthesis",$7); 
                    dyn::field(obj,"fileAttributesList",$8); 
                    dyn::field(obj,"Rparenthesis",$9);  $$ = obj;  
                                                             
                }
                | KW_CLOSE KW_FILE lvalue {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Close",$1);  dyn::field(obj,"File",$2); 
                    dyn::field(obj,"lvalue",$3);  $$ = obj;                
                                               
                }
                | KW_READ KW_FROM lvalue KW_INTO lvalue_list {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)2)); 
                    dyn::field(obj,"Read",$1);  dyn::field(obj,"From",$2); 
                    dyn::field(obj,"lvalue",$3);  dyn::field(obj,"Into",$4); 
                    dyn::field(obj,"lvalueList",$5);  $$ = obj;                
                                               
                }
                | KW_WRITE KW_TO lvalue KW_USING lvalue_list {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)3)); 
                    dyn::field(obj,"Write",$1);  dyn::field(obj,"To",$2); 
                    dyn::field(obj,"lvalue",$3);  dyn::field(obj,"Using",$4); 
                    dyn::field(obj,"lvalueList",$5);  $$ = obj;                
                                               
                }
                | KW_SEEK KW_ON lvalue KW_TO int_expr opt_from_seek opt_into {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)4)); 
                    dyn::field(obj,"Seek",$1);  dyn::field(obj,"On",$2); 
                    dyn::field(obj,"lvalue",$3);  dyn::field(obj,"To",$4); 
                    dyn::field(obj,"intExpr",$5); 
                    dyn::field(obj,"optFromSeek",$6); 
                    dyn::field(obj,"optInto",$7);  $$ = obj;                
                                               
                }
                ;
file_attributes_list:      file_attribute {
                               dyn::ptr_t obj = dyn::createObject(); 
                               dyn::field(obj,"fileAttribute",$1);  $$ = obj;  
                                                                        
                           }
                           | file_attributes_list KW_COMMA file_attribute {
                               dyn::ptr_t obj = dyn::createObject(); 
                               dyn::field(obj,"$",dyn::val((int)1)); 
                               dyn::field(obj,"fileAttributesList",$1); 
                               dyn::field(obj,"Comma",$2); 
                               dyn::field(obj,"fileAttribute",$3);  $$ = obj;  
                                                                        
                           }
                           ;
opt_from_seek:      {
                        $$ = dyn::nil();                              
                                     
                    }
                    | KW_FROM seek_pos {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"From",$1); 
                        dyn::field(obj,"seekPos",$2);  $$ = obj;                
                                                   
                    }
                    ;
seek_pos:      KW_START {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"Start",$1);  $$ = obj;                
                                              
               }
               | KW_LAST {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"Last",$1);  $$ = obj;                
                                              
               }
               | KW_CURRENT {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)2)); 
                   dyn::field(obj,"Current",$1);  $$ = obj;                
                                              
               }
               ;
file_attribute:      KW_READ {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"Read",$1);  $$ = obj;                
                                                    
                     }
                     | KW_WRITE {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Write",$1);  $$ = obj;                
                                                    
                     }
                     | KW_APPEND {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"Append",$1);  $$ = obj;                
                                                    
                     }
                     | KW_CREATE {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)3)); 
                         dyn::field(obj,"Create",$1);  $$ = obj;                
                                                    
                     }
                     | KW_EXCLUSIVE {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)4)); 
                         dyn::field(obj,"Exclusive",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_FORMAT KW_EQ string_expr_nolist {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)5)); 
                         dyn::field(obj,"Format",$1);  dyn::field(obj,"Eq",$2); 
                         dyn::field(obj,"stringExprNolist",$3);  $$ = obj;  
                                                                  
                     }
                     | KW_DELIMITER KW_EQ string_expr_nolist {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)6)); 
                         dyn::field(obj,"Delimiter",$1); 
                         dyn::field(obj,"Eq",$2); 
                         dyn::field(obj,"stringExprNolist",$3);  $$ = obj;  
                                                                  
                     }
                     ;
window_stmt:      KW_OPEN_WINDOW window_name opt_location opt_into_clause size
                  opt_open_window_attributes {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"OpenWindow",$1); 
                      dyn::field(obj,"windowName",$2); 
                      dyn::field(obj,"optLocation",$3); 
                      dyn::field(obj,"optIntoClause",$4); 
                      dyn::field(obj,"size",$5); 
                      dyn::field(obj,"optOpenWindowAttributes",$6);  $$ = obj;  
                                                               
                  }
                  | KW_OPEN_WINDOW window_name opt_location opt_into_clause
                  with_form opt_open_window_attributes {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"OpenWindow",$1); 
                      dyn::field(obj,"windowName",$2); 
                      dyn::field(obj,"optLocation",$3); 
                      dyn::field(obj,"optIntoClause",$4); 
                      dyn::field(obj,"withForm",$5); 
                      dyn::field(obj,"optOpenWindowAttributes",$6);  $$ = obj;  
                                                               
                  }
                  | KW_CURRENT_WINDOW KW_IS window_expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"CurrentWindow",$1); 
                      dyn::field(obj,"Is",$2);  dyn::field(obj,"windowExpr",$3);
                       $$ = obj;                                            
                  }
                  | KW_LOCATE_WINDOW window_expr KW_AT coords {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)3)); 
                      dyn::field(obj,"LocateWindow",$1); 
                      dyn::field(obj,"windowExpr",$2);  dyn::field(obj,"At",$3);
                       dyn::field(obj,"coords",$4);  $$ = obj;                
                                                 
                  }
                  | KW_OPEN_FORM form_name KW_FROM string_expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)4)); 
                      dyn::field(obj,"OpenForm",$1); 
                      dyn::field(obj,"formName",$2);  dyn::field(obj,"From",$3);
                       dyn::field(obj,"stringExpr",$4);  $$ = obj;  
                                                               
                  }
                  | KW_DISPLAY_FORM form_expr opt_color_style_attributes {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)5)); 
                      dyn::field(obj,"DisplayForm",$1); 
                      dyn::field(obj,"formExpr",$2); 
                      dyn::field(obj,"optColorStyleAttributes",$3);  $$ = obj;  
                                                               
                  }
                  | KW_CLOSE_WINDOW window_expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)6)); 
                      dyn::field(obj,"CloseWindow",$1); 
                      dyn::field(obj,"windowExpr",$2);  $$ = obj;  
                                                               
                  }
                  | KW_CLOSE_FORM form_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)7)); 
                      dyn::field(obj,"CloseForm",$1); 
                      dyn::field(obj,"formName",$2);  $$ = obj;                
                                                 
                  }
                  | KW_CLEAR_WINDOW window_expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)8)); 
                      dyn::field(obj,"ClearWindow",$1); 
                      dyn::field(obj,"windowExpr",$2);  $$ = obj;  
                                                               
                  }
                  | KW_CLEAR_SCREEN {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)9)); 
                      dyn::field(obj,"ClearScreen",$1);  $$ = obj;  
                                                               
                  }
                  | KW_CLEAR_FORM {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)10)); 
                      dyn::field(obj,"ClearForm",$1);  $$ = obj;                
                                                 
                  }
                  ;
with_form:      KW_WITH_FORM string_expr {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"WithForm",$1); 
                    dyn::field(obj,"stringExpr",$2);  $$ = obj;                
                                               
                }
                ;
size:      KW_WITH int_expr KW_ROWS KW_COMMA int_expr KW_COLUMNS {
               dyn::ptr_t obj = dyn::createObject();  dyn::field(obj,"With",$1);
                dyn::field(obj,"intExpr",$2);  dyn::field(obj,"Rows",$3); 
               dyn::field(obj,"Comma",$4);  dyn::field(obj,"intExpr1",$5); 
               dyn::field(obj,"Columns",$6);  $$ = obj;                
                                          
           }
           ;
opt_location:      KW_AT coords {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"At",$1);  dyn::field(obj,"coords",$2); 
                       $$ = obj;                                            
                   }
                   | {
                       $$ = dyn::nil();                              
                                    
                   }
                   ;
opt_into_clause:      KW_INTO expr {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"Into",$1);  dyn::field(obj,"expr",$2);
                           $$ = obj;                                            
                      }
                      | {
                          $$ = dyn::nil();                              
                                       
                      }
                      ;
global_database_stmt:      database_or_schema database_id opt_semi {
                               dyn::ptr_t obj = dyn::createObject(); 
                               dyn::field(obj,"databaseOrSchema",$1); 
                               dyn::field(obj,"databaseId",$2); 
                               dyn::field(obj,"optSemi",$3);  $$ = obj;  
                                                                        
                           }
                           ;
database_or_schema:      KW_SCHEMA {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"Schema",$1);  $$ = obj;  
                                                                      
                         }
                         | KW_DATABASE {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"Database",$1);  $$ = obj;  
                                                                      
                         }
                         ;
goto_kw:      KW_GO KW_TO {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"Go",$1);  dyn::field(obj,"To",$2);  $$ = obj; 
                                                            
              }
              | KW_GOTO {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)1)); 
                  dyn::field(obj,"Goto",$1);  $$ = obj;                
                                             
              }
              ;
goto_label:      opt_colon identifier opt_colon {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"optColon",$1); 
                     dyn::field(obj,"identifier",$2); 
                     dyn::field(obj,"optColon1",$3);  $$ = obj;                
                                                
                 }
                 ;
opt_colon:      {
                    $$ = dyn::nil();                                            
                }
                | ':' {
                    $$ = $1;                                            
                }
                ;
goto_stmt:      goto_kw goto_label {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"gotoKw",$1); 
                    dyn::field(obj,"gotoLabel",$2);  $$ = obj;                
                                               
                }
                ;
label_stmt:      KW_LABEL goto_label {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"Label",$1); 
                     dyn::field(obj,"gotoLabel",$2);  $$ = obj;                
                                                
                 }
                 ;
let_stmt:      KW_LET lvalue KW_EQ expr_list {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"Let",$1);  dyn::field(obj,"lvalue",$2); 
                   dyn::field(obj,"Eq",$3);  dyn::field(obj,"exprList",$4); 
                   $$ = obj;                                            
               }
               | KW_LET lvalue KW_EQ ext_4glexpr {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"Let",$1);  dyn::field(obj,"lvalue",$2); 
                   dyn::field(obj,"Eq",$3);  dyn::field(obj,"ext4glexpr",$4); 
                   $$ = obj;                                            
               }
               | KW_LET lvalue KW_EQ yield_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)2)); 
                   dyn::field(obj,"Let",$1);  dyn::field(obj,"lvalue",$2); 
                   dyn::field(obj,"Eq",$3);  dyn::field(obj,"yieldStmt",$4); 
                   $$ = obj;                                            
               }
               | KW_LET lvalue KW_THRU lvalue KW_EQ expr_list {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)3)); 
                   dyn::field(obj,"Let",$1);  dyn::field(obj,"lvalue",$2); 
                   dyn::field(obj,"Thru",$3);  dyn::field(obj,"lvalue1",$4); 
                   dyn::field(obj,"Eq",$5);  dyn::field(obj,"exprList",$6); 
                   $$ = obj;                                            
               }
               | KW_LET lvalue KW_THROUGH lvalue KW_EQ expr_list {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)4)); 
                   dyn::field(obj,"Let",$1);  dyn::field(obj,"lvalue",$2); 
                   dyn::field(obj,"Through",$3);  dyn::field(obj,"lvalue1",$4); 
                   dyn::field(obj,"Eq",$5);  dyn::field(obj,"exprList",$6); 
                   $$ = obj;                                            
               }
               | KW_INITIALIZE lvalue_list KW_TO KW_NULL {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)5)); 
                   dyn::field(obj,"Initialize",$1); 
                   dyn::field(obj,"lvalueList",$2);  dyn::field(obj,"To",$3); 
                   dyn::field(obj,"Null",$4);  $$ = obj;                
                                              
               }
               | KW_INITIALIZE lvalue_list KW_LIKE column_like_list {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)6)); 
                   dyn::field(obj,"Initialize",$1); 
                   dyn::field(obj,"lvalueList",$2);  dyn::field(obj,"Like",$3); 
                   dyn::field(obj,"columnLikeList",$4);  $$ = obj;  
                                                            
               }
               | KW_VALIDATE lvalue_list KW_LIKE column_like_list {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)7)); 
                   dyn::field(obj,"Validate",$1); 
                   dyn::field(obj,"lvalueList",$2);  dyn::field(obj,"Like",$3); 
                   dyn::field(obj,"columnLikeList",$4);  $$ = obj;  
                                                            
               }
               ;
column_like:      table_id KW_DOTSTAR {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"tableId",$1); 
                      dyn::field(obj,"Dotstar",$2);  $$ = obj;                
                                                 
                  }
                  | column_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"columnName",$1);  $$ = obj;  
                                                               
                  }
                  ;
column_like_list:      column_like {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"columnLike",$1);  $$ = obj;  
                                                                    
                       }
                       | column_like_list KW_COMMA column_like {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"columnLikeList",$1); 
                           dyn::field(obj,"Comma",$2); 
                           dyn::field(obj,"columnLike",$3);  $$ = obj;  
                                                                    
                       }
                       ;
misc_stmt:      KW_WHENEVER opt_any opt_scope whenever_event error_call {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"Whenever",$1);  dyn::field(obj,"optAny",$2);
                     dyn::field(obj,"optScope",$3); 
                    dyn::field(obj,"wheneverEvent",$4); 
                    dyn::field(obj,"errorCall",$5);  $$ = obj;                
                                               
                }
                ;
opt_any:      {
                  $$ = dyn::nil();                                            
              }
              | KW_ANY {
                  $$ = $1;                                            
              }
              ;
opt_scope:      {
                    $$ = dyn::nil();                                            
                }
                | KW_GLOBAL {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Global",$1);  $$ = obj;                
                                               
                }
                | KW_MODULE {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)2)); 
                    dyn::field(obj,"Module",$1);  $$ = obj;                
                                               
                }
                | KW_LOCAL {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)3)); 
                    dyn::field(obj,"Local",$1);  $$ = obj;                
                                               
                }
                ;
whenever_event:      KW_ERROR {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"Error",$1);  $$ = obj;                
                                                    
                     }
                     | KW_WARNING {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Warning",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_NOT_FOUND {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"NotFound",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_ARGUMENT_ERROR {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)3)); 
                         dyn::field(obj,"ArgumentError",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_RETURN_ERROR {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)4)); 
                         dyn::field(obj,"ReturnError",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_UNDEFINED_FUNCTION {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)5)); 
                         dyn::field(obj,"UndefinedFunction",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_INTERRUPT {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)6)); 
                         dyn::field(obj,"Interrupt",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_QUIT {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)7)); 
                         dyn::field(obj,"Quit",$1);  $$ = obj;                
                                                    
                     }
                     | KW_FATAL_ERROR {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)8)); 
                         dyn::field(obj,"FatalError",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_SOAP_FAULT {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)9)); 
                         dyn::field(obj,"SoapFault",$1);  $$ = obj;  
                                                                  
                     }
                     | identifier {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)10)); 
                         dyn::field(obj,"identifier",$1);  $$ = obj;  
                                                                  
                     }
                     ;
error_call:      KW_CONTINUE {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"Continue",$1);  $$ = obj;                
                                                
                 }
                 | KW_STOP {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"Stop",$1);  $$ = obj;                
                                                
                 }
                 | KW_CALL identifier {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)2)); 
                     dyn::field(obj,"Call",$1); 
                     dyn::field(obj,"identifier",$2);  $$ = obj;                
                                                
                 }
                 | KW_RAISE {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)3)); 
                     dyn::field(obj,"Raise",$1);  $$ = obj;                
                                                
                 }
                 | goto_kw goto_label {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)4)); 
                     dyn::field(obj,"gotoKw",$1); 
                     dyn::field(obj,"gotoLabel",$2);  $$ = obj;                
                                                
                 }
                 ;
option_stmt:      KW_OPTIONS options_list %prec KW_LOWEST {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Options",$1); 
                      dyn::field(obj,"optionsList",$2);  $$ = obj;  
                                                               
                  }
                  | KW_DEFER defer_signal_list {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Defer",$1); 
                      dyn::field(obj,"deferSignalList",$2);  $$ = obj;  
                                                               
                  }
                  ;
defer_signal_list:      {
                            $$ = dyn::nil();                              
                                         
                        }
                        | defer_signal_list defer_signal {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"deferSignalList",$1); 
                            dyn::field(obj,"deferSignal",$2);  $$ = obj;  
                                                                     
                        }
                        ;
defer_signal:      KW_INTERRUPT {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"Interrupt",$1);  $$ = obj;  
                                                                
                   }
                   | KW_QUIT {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Quit",$1);  $$ = obj;                
                                                  
                   }
                   | KW_EXPRESSION expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"Expression",$1); 
                       dyn::field(obj,"expr",$2);  $$ = obj;                
                                                  
                   }
                   ;
print_stmt:      KW_PRINT_SELECT {
                          dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)0)); 
                         dyn::field(obj,"PrintSelect",$1);  $$ = obj;
                         ClearPending();
                         AddPendingToken( KW_SELECT, "select" );
                 }
                 | KW_PRINT print_expr_list opt_semi {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"Print",$1); 
                     dyn::field(obj,"printExprList",$2); 
                     dyn::field(obj,"optSemi",$3);  $$ = obj;                
                                                
                 }
                 | KW_PRINT KW_FILE string_expr {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)2)); 
                     dyn::field(obj,"Print",$1);  dyn::field(obj,"File",$2); 
                     dyn::field(obj,"stringExpr",$3);  $$ = obj;                
                                                
                 }
                 | KW_SKIP int_expr lines {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)3)); 
                     dyn::field(obj,"Skip",$1);  dyn::field(obj,"intExpr",$2); 
                     dyn::field(obj,"lines",$3);  $$ = obj;                
                                                
                 }
                 | KW_SKIP KW_TO KW_TOP_OF_PAGE {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)4)); 
                     dyn::field(obj,"Skip",$1);  dyn::field(obj,"To",$2); 
                     dyn::field(obj,"TopOfPage",$3);  $$ = obj;                
                                                
                 }
                 | KW_PAUSE string_expr {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)5)); 
                     dyn::field(obj,"Pause",$1); 
                     dyn::field(obj,"stringExpr",$2);  $$ = obj;                
                                                
                 }
                 | KW_NEED int_expr lines {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)6)); 
                     dyn::field(obj,"Need",$1);  dyn::field(obj,"intExpr",$2); 
                     dyn::field(obj,"lines",$3);  $$ = obj;                
                                                
                 }
                 | KW_PRINTX xml_tag_name_opt expr_list {
                     dyn::ptr_t obj = dyn::createObject();
                     dyn::field(obj,"$",dyn::val((int)7));
                     dyn::field(obj,"Printx",$1);
                     dyn::field(obj,"xmlTagNameOpt",$2);
                     dyn::field(obj,"exprList",$3);
                     $$ = obj;
                 }
                 ;
xml_tag_name_opt:{
                     $$ = dyn::nil();
                 }
                 | KW_NAME KW_EQ identifier {
                     dyn::ptr_t obj = dyn::createObject();
                     dyn::field(obj,"$",dyn::val((int)1));
                     dyn::field(obj,"Name",$1);
                     dyn::field(obj,"Eq",$2);
                     dyn::field(obj,"identifier",$3);
                     $$ = obj;
                 }
                 ;
lines:      KW_LINE {
                dyn::ptr_t obj = dyn::createObject(); 
                dyn::field(obj,"Line",$1);  $$ = obj;                
                                           
            }
            | KW_LINES {
                dyn::ptr_t obj = dyn::createObject(); 
                dyn::field(obj,"$",dyn::val((int)1)); 
                dyn::field(obj,"Lines",$1);  $$ = obj;                
                                           
            }
            ;
print_expr_list:      %prec KW_LOWEST {
                          $$ = dyn::nil();                              
                                       
                      }
                      | print_expr_list1 {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"printExprList1",$1);  $$ = obj;  
                                                                   
                      }
                      | print_expr_list2 {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"printExprList2",$1);  $$ = obj;  
                                                                   
                      }
                      ;
print_expr_list1:      expr_list {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"exprList",$1);  $$ = obj;  
                                                                    
                       }
                       | expr_list KW_COMMA print_expr_list2 {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"exprList",$1); 
                           dyn::field(obj,"Comma",$2); 
                           dyn::field(obj,"printExprList2",$3);  $$ = obj;  
                                                                    
                       }
                       ;
print_expr_list2:      color_style_attributes {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"colorStyleAttributes",$1);  $$ = obj;
                                                                      
                       }
                       | color_style_attributes KW_COMMA print_expr_list1 {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"colorStyleAttributes",$1); 
                           dyn::field(obj,"Comma",$2); 
                           dyn::field(obj,"printExprList1",$3);  $$ = obj;  
                                                                    
                       }
                       ;
statement:      statement_main opt_semi {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"statementMain",$1); 
                    dyn::field(obj,"optSemi",$2);  $$ = obj;                
                                               
                }
                | statement_semi {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"statementSemi",$1);  $$ = obj;  
                                                             
                }
                ;
statement_main:      let_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"letStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | control_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"controlStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | exit_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"exitStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | window_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)3)); 
                         dyn::field(obj,"windowStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | input_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)4)); 
                         dyn::field(obj,"inputStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | option_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)5)); 
                         dyn::field(obj,"optionStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | sql_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)6)); 
                         dyn::field(obj,"sqlStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | report_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)7)); 
                         dyn::field(obj,"reportStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | menu_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)8)); 
                         dyn::field(obj,"menuStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | data_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)9)); 
                         dyn::field(obj,"dataStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | misc_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)10)); 
                         dyn::field(obj,"miscStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | file_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)11)); 
                         dyn::field(obj,"fileStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | error {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)12)); 
                         dyn::field(obj,"ErrorNode",$1);  $$ = obj;  
                                                                  
                     }
                     ;
statement_semi:      print_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"printStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | display_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"displayStmt",$1);  $$ = obj;  
                                                                  
                     }
                     | yield_stmt {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"yieldStmt",$1);  $$ = obj;  
                                                                  
                     }
                     ;
yield_stmt:      KW_YIELD expr {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"Yield",$1);  dyn::field(obj,"expr",$2); 
                     $$ = obj;                                            
                 }
                 | KW_YIELD KW_CALL expr {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"Yield",$1);  dyn::field(obj,"Call",$2); 
                     dyn::field(obj,"expr",$3);  $$ = obj;                
                                                
                 }
                 | KW_YIELD KW_CALL stream_expr {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)2)); 
                     dyn::field(obj,"Yield",$1);  dyn::field(obj,"Call",$2); 
                     dyn::field(obj,"streamExpr",$3);  $$ = obj;                
                                                
                 }
                 ;
before_after_field_event_declaration:      KW_BEFORE KW_FIELD field_list {
                                               dyn::ptr_t obj = dyn::createObject();
                                                dyn::field(obj,"Before",$1); 
                                               dyn::field(obj,"Field",$2); 
                                               dyn::field(obj,"fieldList",$3); 
                                               $$ = obj;                
                                                                          
                                           }
                                           | KW_AFTER KW_FIELD field_list {
                                               dyn::ptr_t obj = dyn::createObject();
                                               
                                               dyn::field(obj,"$",dyn::val((int)1));
                                                dyn::field(obj,"After",$1); 
                                               dyn::field(obj,"Field",$2); 
                                               dyn::field(obj,"fieldList",$3); 
                                               $$ = obj;                
                                                                          
                                           }
                                           ;
before_after_input:      KW_BEFORE KW_INPUT {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"Before",$1); 
                             dyn::field(obj,"Input",$2);  $$ = obj;  
                                                                      
                         }
                         | KW_AFTER KW_INPUT {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"After",$1); 
                             dyn::field(obj,"Input",$2);  $$ = obj;  
                                                                      
                         }
                         ;
before_after_row:      KW_BEFORE KW_ROW {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"Before",$1); 
                           dyn::field(obj,"Row",$2);  $$ = obj;                
                                                      
                       }
                       | KW_AFTER KW_ROW {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"After",$1); 
                           dyn::field(obj,"Row",$2);  $$ = obj;                
                                                      
                       }
                       ;
common_events:      KW_ON KW_ACTION action_or_action_list opt_infield
                    opt_local_block_attributes {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"On",$1);  dyn::field(obj,"Action",$2); 
                        dyn::field(obj,"actionOrActionList",$3); 
                        dyn::field(obj,"optInfield",$4); 
                        dyn::field(obj,"optLocalBlockAttributes",$5);  $$ = obj;
                                                                   
                    }
                    | KW_ON KW_KEY KW_LPARENTHESIS key_list KW_RPARENTHESIS
                    opt_qxinfield opt_local_block_attributes {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"On",$1);  dyn::field(obj,"Key",$2); 
                        dyn::field(obj,"Lparenthesis",$3); 
                        dyn::field(obj,"keyList",$4); 
                        dyn::field(obj,"Rparenthesis",$5); 
                        dyn::field(obj,"optQxinfield",$6); 
                        dyn::field(obj,"optLocalBlockAttributes",$7);  $$ = obj;
                                                                   
                    }
                    | KW_ON KW_IDLE expr {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)2)); 
                        dyn::field(obj,"On",$1);  dyn::field(obj,"Idle",$2); 
                        dyn::field(obj,"expr",$3);  $$ = obj;                
                                                   
                    }
                    | KW_ON KW_TIMER int_expr {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)3)); 
                        dyn::field(obj,"On",$1);  dyn::field(obj,"Timer",$2); 
                        dyn::field(obj,"intExpr",$3);  $$ = obj;                
                                                   
                    }
                    ;
opt_infield:      {
                      $$ = dyn::nil();                              
                                   
                  }
                  | KW_INFIELD field_list {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Infield",$1); 
                      dyn::field(obj,"fieldList",$2);  $$ = obj;                
                                                 
                  }
                  ;
opt_qxinfield:      {
                        $$ = dyn::nil();                              
                                     
                    }
                    | KW_INFIELD KW_LPARENTHESIS field_list KW_RPARENTHESIS {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Infield",$1); 
                        dyn::field(obj,"Lparenthesis",$2); 
                        dyn::field(obj,"fieldList",$3); 
                        dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                 
                    }
                    ;
construct_event_list:      construct_event_stmt {
                               dyn::ptr_t obj = dyn::createObject(); 
                               dyn::field(obj,"constructEventStmt",$1); 
                               $$ = obj;                              
                                            
                           }
                           | construct_event_list construct_event_stmt {
                               dyn::ptr_t obj = dyn::createObject(); 
                               dyn::field(obj,"$",dyn::val((int)1)); 
                               dyn::field(obj,"constructEventList",$1); 
                               dyn::field(obj,"constructEventStmt",$2); 
                               $$ = obj;                              
                                            
                           }
                           ;
construct_event_stmt:      construct_event_declaration statement_list {
                               dyn::ptr_t obj = dyn::createObject(); 
                               dyn::field(obj,"constructEventDeclaration",$1); 
                               dyn::field(obj,"statementList",$2);  $$ = obj;  
                                                                        
                           }
                           ;
construct_event_declaration:      KW_BEFORE KW_CONSTRUCT {
                                      dyn::ptr_t obj = dyn::createObject(); 
                                      dyn::field(obj,"Before",$1); 
                                      dyn::field(obj,"Construct",$2);  $$ = obj;
                                                                   
                                                   
                                  }
                                  | KW_AFTER KW_CONSTRUCT {
                                      dyn::ptr_t obj = dyn::createObject(); 
                                      dyn::field(obj,"$",dyn::val((int)1)); 
                                      dyn::field(obj,"After",$1); 
                                      dyn::field(obj,"Construct",$2);  $$ = obj;
                                                                   
                                                   
                                  }
                                  | before_after_field_event_declaration {
                                      dyn::ptr_t obj = dyn::createObject(); 
                                      dyn::field(obj,"$",dyn::val((int)2)); 
                                      dyn::field(obj,"beforeAfterFieldEventDeclaration",$1);
                                       $$ = obj;                              
                                                   
                                  }
                                  | common_events {
                                      dyn::ptr_t obj = dyn::createObject(); 
                                      dyn::field(obj,"$",dyn::val((int)3)); 
                                      dyn::field(obj,"commonEvents",$1); 
                                      $$ = obj;                              
                                                   
                                  }
                                  ;
dialog_event_declaration:      KW_COMMAND opt_commandkeylist string_expr
                               opt_comment opt_help opt_local_block_attributes {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"Command",$1); 
                                   dyn::field(obj,"optCommandkeylist",$2); 
                                   dyn::field(obj,"stringExpr",$3); 
                                   dyn::field(obj,"optComment",$4); 
                                   dyn::field(obj,"optHelp",$5); 
                                   dyn::field(obj,"optLocalBlockAttributes",$6);
                                    $$ = obj;                              
                                                
                               }
                               ;
opt_comment:      %prec KW_LOWEST {
                      $$ = dyn::nil();                              
                                   
                  }
                  | string_expr {
                      $$ = $1;                                            
                  }
                  ;
opt_commandkeylist:      %prec KW_LOWEST {
                             $$ = dyn::nil();                              
                                          
                         }
                         | KW_KEY KW_LPARENTHESIS key_list KW_RPARENTHESIS {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"Key",$1); 
                             dyn::field(obj,"Lparenthesis",$2); 
                             dyn::field(obj,"keyList",$3); 
                             dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                      
                         }
                         ;
dialog_event_stmt:      dialog_event_declaration statement_list {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"dialogEventDeclaration",$1); 
                            dyn::field(obj,"statementList",$2);  $$ = obj;  
                                                                     
                        }
                        | dialog_stmt {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"dialogStmt",$1);  $$ = obj;  
                                                                     
                        }
                        ;
dialog_stmt:      dialog_stmt_declaration statement_list {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"dialogStmtDeclaration",$1); 
                      dyn::field(obj,"statementList",$2);  $$ = obj;  
                                                               
                  }
                  ;
dialog_stmt_declaration:      KW_BEFORE KW_DIALOG {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"Before",$1); 
                                  dyn::field(obj,"Dialog",$2);  $$ = obj;  
                                                                           
                              }
                              | KW_AFTER KW_DIALOG {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)1)); 
                                  dyn::field(obj,"After",$1); 
                                  dyn::field(obj,"Dialog",$2);  $$ = obj;  
                                                                           
                              }
                              | common_events {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)2)); 
                                  dyn::field(obj,"commonEvents",$1);  $$ = obj; 
                                                                            
                              }
                              | on_async_actions {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)3)); 
                                  dyn::field(obj,"onAsyncActions",$1); 
                                  $$ = obj;                              
                                               
                              }
                              | on_zmq_actions {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)4)); 
                                  dyn::field(obj,"onZmqActions",$1);  $$ = obj; 
                                                                            
                              }
                              ;
display_array_event_list:      display_array_event_stmt {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"displayArrayEventStmt",$1); 
                                   $$ = obj;                              
                                                
                               }
                               | display_array_event_list
                               display_array_event_stmt {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)1)); 
                                   dyn::field(obj,"displayArrayEventList",$1); 
                                   dyn::field(obj,"displayArrayEventStmt",$2); 
                                   $$ = obj;                              
                                                
                               }
                               ;
display_array_event_stmt:      display_array_event_declaration statement_list {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"displayArrayEventDeclaration",$1);
                                    dyn::field(obj,"statementList",$2); 
                                   $$ = obj;                              
                                                
                               }
                               ;
display_array_event_declaration:      common_events {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"commonEvents",$1); 
                                          $$ = obj;                
                                                                     
                                      }
                                      | KW_BEFORE KW_DISPLAY {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)1)); 
                                          dyn::field(obj,"Before",$1); 
                                          dyn::field(obj,"Display",$2); 
                                          $$ = obj;                
                                                                     
                                      }
                                      | KW_AFTER KW_DISPLAY {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)2)); 
                                          dyn::field(obj,"After",$1); 
                                          dyn::field(obj,"Display",$2); 
                                          $$ = obj;                
                                                                     
                                      }
                                      | KW_ON KW_SORT {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)3)); 
                                          dyn::field(obj,"On",$1); 
                                          dyn::field(obj,"Sort",$2);  $$ = obj; 
                                                                      
                                                       
                                      }
                                      | before_after_row {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)4)); 
                                          dyn::field(obj,"beforeAfterRow",$1); 
                                          $$ = obj;                
                                                                     
                                      }
                                      | on_fill_buffer {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)5)); 
                                          dyn::field(obj,"onFillBuffer",$1); 
                                          $$ = obj;                
                                                                     
                                      }
                                      | on_modified_actions {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)6)); 
                                          dyn::field(obj,"onModifiedActions",$1);
                                           $$ = obj;                
                                                                     
                                      }
                                      | on_drag_actions {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)7)); 
                                          dyn::field(obj,"onDragActions",$1); 
                                          $$ = obj;                
                                                                     
                                      }
                                      | on_zmq_actions {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)8)); 
                                          dyn::field(obj,"onZmqActions",$1); 
                                          $$ = obj;                
                                                                     
                                      }
                                      | on_async_actions {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)9)); 
                                          dyn::field(obj,"onAsyncActions",$1); 
                                          $$ = obj;                
                                                                     
                                      }
                                      ;
event_stmt:      event_declaration statement_list {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"eventDeclaration",$1); 
                     dyn::field(obj,"statementList",$2);  $$ = obj;  
                                                              
                 }
                 ;
event_declaration:      KW_BEFORE event_list {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"Before",$1); 
                            dyn::field(obj,"eventList",$2);  $$ = obj;  
                                                                     
                        }
                        | KW_AFTER event_list {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"After",$1); 
                            dyn::field(obj,"eventList",$2);  $$ = obj;  
                                                                     
                        }
                        | on_change_actions {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)2)); 
                            dyn::field(obj,"onChangeActions",$1);  $$ = obj;  
                                                                     
                        }
                        | common_events {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)3)); 
                            dyn::field(obj,"commonEvents",$1);  $$ = obj;  
                                                                     
                        }
                        | before_after_field_event_declaration {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)4)); 
                            dyn::field(obj,"beforeAfterFieldEventDeclaration",$1);
                             $$ = obj;                              
                                         
                        }
                        | on_fill_buffer {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)5)); 
                            dyn::field(obj,"onFillBuffer",$1);  $$ = obj;  
                                                                     
                        }
                        | on_modified_actions {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)6)); 
                            dyn::field(obj,"onModifiedActions",$1);  $$ = obj;  
                                                                     
                        }
                        | on_drag_actions {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)7)); 
                            dyn::field(obj,"onDragActions",$1);  $$ = obj;  
                                                                     
                        }
                        | on_zmq_actions {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)8)); 
                            dyn::field(obj,"onZmqActions",$1);  $$ = obj;  
                                                                     
                        }
                        | on_async_actions {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)9)); 
                            dyn::field(obj,"onAsyncActions",$1);  $$ = obj;  
                                                                     
                        }
                        ;
event_list:      field_list {
                     $$ = $1;                                            
                 }
                 ;
input_stmt:      input_option {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"inputOption",$1);  $$ = obj;  
                                                              
                 }
                 | prompt expr_list opt_color_style_attributes KW_FOR opt_char
                 lvalue opt_help opt_prompt_control_attributes
                 opt_prompt_statement_block {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"prompt",$1); 
                     dyn::field(obj,"exprList",$2); 
                     dyn::field(obj,"optColorStyleAttributes",$3); 
                     dyn::field(obj,"For",$4);  dyn::field(obj,"optChar",$5); 
                     dyn::field(obj,"lvalue",$6);  dyn::field(obj,"optHelp",$7);
                      dyn::field(obj,"optPromptControlAttributes",$8); 
                     dyn::field(obj,"optPromptStatementBlock",$9);  $$ = obj;  
                                                              
                 }
                 | KW_NEXT_FIELD KW_NEXT {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)2)); 
                     dyn::field(obj,"NextField",$1);  dyn::field(obj,"Next",$2);
                      $$ = obj;                                            
                 }
                 | KW_NEXT_FIELD KW_PREVIOUS {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)3)); 
                     dyn::field(obj,"NextField",$1); 
                     dyn::field(obj,"Previous",$2);  $$ = obj;                
                                                
                 }
                 | KW_NEXT_FIELD_CURRENT {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)4)); 
                     dyn::field(obj,"NextFieldCurrent",$1);  $$ = obj;  
                                                              
                 }
                 | KW_NEXT_FIELD input_field {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)5)); 
                     dyn::field(obj,"NextField",$1); 
                     dyn::field(obj,"inputField",$2);  $$ = obj;                
                                                
                 }
                 | KW_CANCEL KW_INSERT {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)6)); 
                     dyn::field(obj,"Cancel",$1);  dyn::field(obj,"Insert",$2); 
                     $$ = obj;                                            
                 }
                 | KW_CANCEL KW_DELETE {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)7)); 
                     dyn::field(obj,"Cancel",$1);  dyn::field(obj,"Delete",$2); 
                     $$ = obj;                                            
                 }
                 | KW_SCROLL field_list scroll_direction {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)8)); 
                     dyn::field(obj,"Scroll",$1); 
                     dyn::field(obj,"fieldList",$2); 
                     dyn::field(obj,"scrollDirection",$3);  $$ = obj;  
                                                              
                 }
                 | KW_DIALOG opt_dialog_attributes list_dialog_block
                 opt_dialog_block KW_END KW_DIALOG {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)9)); 
                     dyn::field(obj,"Dialog",$1); 
                     dyn::field(obj,"optDialogAttributes",$2); 
                     dyn::field(obj,"listDialogBlock",$3); 
                     dyn::field(obj,"optDialogBlock",$4); 
                     dyn::field(obj,"End",$5);  dyn::field(obj,"Dialog1",$6); 
                     $$ = obj;                                            
                 }
                 ;
input_option:      input KW_BY_NAME lvalue_list opt_defaults
                   opt_input_attributes opt_help opt_input_statement_block {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"input",$1);  dyn::field(obj,"ByName",$2);
                        dyn::field(obj,"lvalueList",$3); 
                       dyn::field(obj,"optDefaults",$4); 
                       dyn::field(obj,"optInputAttributes",$5); 
                       dyn::field(obj,"optHelp",$6); 
                       dyn::field(obj,"optInputStatementBlock",$7);  $$ = obj;  
                                                                
                   }
                   | input lvalue_list opt_defaults KW_FROM field_list
                   opt_input_attributes opt_help opt_input_statement_block {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"input",$1); 
                       dyn::field(obj,"lvalueList",$2); 
                       dyn::field(obj,"optDefaults",$3); 
                       dyn::field(obj,"From",$4); 
                       dyn::field(obj,"fieldList",$5); 
                       dyn::field(obj,"optInputAttributes",$6); 
                       dyn::field(obj,"optHelp",$7); 
                       dyn::field(obj,"optInputStatementBlock",$8);  $$ = obj;  
                                                                
                   }
                   | construct lvalue KW_ON field_list KW_FROM field_list
                   opt_construct_attributes opt_help
                   opt_construct_statement_block {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"construct",$1); 
                       dyn::field(obj,"lvalue",$2);  dyn::field(obj,"On",$3); 
                       dyn::field(obj,"fieldList",$4); 
                       dyn::field(obj,"From",$5); 
                       dyn::field(obj,"fieldList1",$6); 
                       dyn::field(obj,"optConstructAttributes",$7); 
                       dyn::field(obj,"optHelp",$8); 
                       dyn::field(obj,"optConstructStatementBlock",$9); 
                       $$ = obj;                                            
                   }
                   | construct KW_BY_NAME lvalue KW_ON field_list
                   opt_construct_attributes opt_help
                   opt_construct_statement_block {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)3)); 
                       dyn::field(obj,"construct",$1); 
                       dyn::field(obj,"ByName",$2); 
                       dyn::field(obj,"lvalue",$3);  dyn::field(obj,"On",$4); 
                       dyn::field(obj,"fieldList",$5); 
                       dyn::field(obj,"optConstructAttributes",$6); 
                       dyn::field(obj,"optHelp",$7); 
                       dyn::field(obj,"optConstructStatementBlock",$8); 
                       $$ = obj;                                            
                   }
                   | input KW_ARRAY lvalue opt_defaults KW_FROM field_list
                   opt_input_array_attributes opt_help
                   opt_input_array_statement_block {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)4)); 
                       dyn::field(obj,"input",$1);  dyn::field(obj,"Array",$2); 
                       dyn::field(obj,"lvalue",$3); 
                       dyn::field(obj,"optDefaults",$4); 
                       dyn::field(obj,"From",$5); 
                       dyn::field(obj,"fieldList",$6); 
                       dyn::field(obj,"optInputArrayAttributes",$7); 
                       dyn::field(obj,"optHelp",$8); 
                       dyn::field(obj,"optInputArrayStatementBlock",$9); 
                       $$ = obj;                                            
                   }
                   | display KW_ARRAY lvalue KW_TO field_list
                   opt_display_array_attributes opt_help opt_woscroll
                   opt_display_statement_block {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)5)); 
                       dyn::field(obj,"display",$1); 
                       dyn::field(obj,"Array",$2);  dyn::field(obj,"lvalue",$3);
                        dyn::field(obj,"To",$4); 
                       dyn::field(obj,"fieldList",$5); 
                       dyn::field(obj,"optDisplayArrayAttributes",$6); 
                       dyn::field(obj,"optHelp",$7); 
                       dyn::field(obj,"optWoscroll",$8); 
                       dyn::field(obj,"optDisplayStatementBlock",$9);  $$ = obj;
                                                                  
                   }
                   ;
opt_dialog_attributes:      {
                                $$ = dyn::nil();                              
                                             
                            }
                            | KW_ATTRIBUTE KW_LPARENTHESIS
                            dialog_control_attributes KW_RPARENTHESIS {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"Attribute",$1); 
                                dyn::field(obj,"Lparenthesis",$2); 
                                dyn::field(obj,"dialogControlAttributes",$3); 
                                dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                         
                            }
                            | KW_ATTRIBUTES KW_LPARENTHESIS
                            dialog_control_attributes KW_RPARENTHESIS {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)2)); 
                                dyn::field(obj,"Attributes",$1); 
                                dyn::field(obj,"Lparenthesis",$2); 
                                dyn::field(obj,"dialogControlAttributes",$3); 
                                dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                         
                            }
                            ;
dialog_control_attributes:      dialog_control_attribute {
                                    dyn::ptr_t obj = dyn::createObject(); 
                                    dyn::field(obj,"dialogControlAttribute",$1);
                                     $$ = obj;                              
                                                 
                                }
                                | dialog_control_attributes KW_COMMA
                                dialog_control_attribute {
                                    dyn::ptr_t obj = dyn::createObject(); 
                                    dyn::field(obj,"$",dyn::val((int)1)); 
                                    dyn::field(obj,"dialogControlAttributes",$1);
                                     dyn::field(obj,"Comma",$2); 
                                    dyn::field(obj,"dialogControlAttribute",$3);
                                     $$ = obj;                              
                                                 
                                }
                                ;
dialog_control_attribute:      KW_FIELD KW_ORDER KW_FORM {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"Field",$1); 
                                   dyn::field(obj,"Order",$2); 
                                   dyn::field(obj,"Form",$3);  $$ = obj;  
                                                                            
                               }
                               | KW_UNBUFFERED opt_unbuffered {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)1)); 
                                   dyn::field(obj,"Unbuffered",$1); 
                                   dyn::field(obj,"optUnbuffered",$2); 
                                   $$ = obj;                              
                                                
                               }
                               ;
opt_unbuffered:      {
                         $$ = dyn::nil();                              
                                      
                     }
                     | KW_EQ int_expr {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Eq",$1);  dyn::field(obj,"intExpr",$2);
                          $$ = obj;                                            
                     }
                     ;
list_dialog_block:      dialog_block_action {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"dialogBlockAction",$1);  $$ = obj;  
                                                                     
                        }
                        | list_dialog_block dialog_block_action {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"listDialogBlock",$1); 
                            dyn::field(obj,"dialogBlockAction",$2);  $$ = obj;  
                                                                     
                        }
                        ;
dialog_block_action:      input KW_BY_NAME lvalue_list opt_defaults
                          opt_input_attributes opt_help opt_input_dialog_block
                          KW_END KW_INPUT {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"input",$1); 
                              dyn::field(obj,"ByName",$2); 
                              dyn::field(obj,"lvalueList",$3); 
                              dyn::field(obj,"optDefaults",$4); 
                              dyn::field(obj,"optInputAttributes",$5); 
                              dyn::field(obj,"optHelp",$6); 
                              dyn::field(obj,"optInputDialogBlock",$7); 
                              dyn::field(obj,"End",$8); 
                              dyn::field(obj,"Input",$9);  $$ = obj;  
                                                                       
                          }
                          | input lvalue_list opt_defaults KW_FROM field_list
                          opt_input_attributes opt_help opt_input_dialog_block
                          KW_END KW_INPUT {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)1)); 
                              dyn::field(obj,"input",$1); 
                              dyn::field(obj,"lvalueList",$2); 
                              dyn::field(obj,"optDefaults",$3); 
                              dyn::field(obj,"From",$4); 
                              dyn::field(obj,"fieldList",$5); 
                              dyn::field(obj,"optInputAttributes",$6); 
                              dyn::field(obj,"optHelp",$7); 
                              dyn::field(obj,"optInputDialogBlock",$8); 
                              dyn::field(obj,"End",$9); 
                              dyn::field(obj,"Input",$10);  $$ = obj;  
                                                                       
                          }
                          | construct lvalue KW_ON field_list KW_FROM field_list
                          opt_construct_attributes opt_help
                          opt_input_dialog_block KW_END KW_CONSTRUCT {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)2)); 
                              dyn::field(obj,"construct",$1); 
                              dyn::field(obj,"lvalue",$2); 
                              dyn::field(obj,"On",$3); 
                              dyn::field(obj,"fieldList",$4); 
                              dyn::field(obj,"From",$5); 
                              dyn::field(obj,"fieldList1",$6); 
                              dyn::field(obj,"optConstructAttributes",$7); 
                              dyn::field(obj,"optHelp",$8); 
                              dyn::field(obj,"optInputDialogBlock",$9); 
                              dyn::field(obj,"End",$10); 
                              dyn::field(obj,"Construct",$11);  $$ = obj;  
                                                                       
                          }
                          | construct KW_BY_NAME lvalue KW_ON field_list
                          opt_construct_attributes opt_help
                          opt_input_dialog_block KW_END KW_CONSTRUCT {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)3)); 
                              dyn::field(obj,"construct",$1); 
                              dyn::field(obj,"ByName",$2); 
                              dyn::field(obj,"lvalue",$3); 
                              dyn::field(obj,"On",$4); 
                              dyn::field(obj,"fieldList",$5); 
                              dyn::field(obj,"optConstructAttributes",$6); 
                              dyn::field(obj,"optHelp",$7); 
                              dyn::field(obj,"optInputDialogBlock",$8); 
                              dyn::field(obj,"End",$9); 
                              dyn::field(obj,"Construct",$10);  $$ = obj;  
                                                                       
                          }
                          | input KW_ARRAY lvalue opt_defaults KW_FROM
                          field_list opt_input_array_attributes opt_help
                          opt_input_dialog_block KW_END KW_INPUT {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)4)); 
                              dyn::field(obj,"input",$1); 
                              dyn::field(obj,"Array",$2); 
                              dyn::field(obj,"lvalue",$3); 
                              dyn::field(obj,"optDefaults",$4); 
                              dyn::field(obj,"From",$5); 
                              dyn::field(obj,"fieldList",$6); 
                              dyn::field(obj,"optInputArrayAttributes",$7); 
                              dyn::field(obj,"optHelp",$8); 
                              dyn::field(obj,"optInputDialogBlock",$9); 
                              dyn::field(obj,"End",$10); 
                              dyn::field(obj,"Input",$11);  $$ = obj;  
                                                                       
                          }
                          | display KW_ARRAY lvalue KW_TO field_list
                          opt_display_array_attributes opt_help opt_woscroll
                          opt_input_dialog_block KW_END KW_DISPLAY {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)5)); 
                              dyn::field(obj,"display",$1); 
                              dyn::field(obj,"Array",$2); 
                              dyn::field(obj,"lvalue",$3); 
                              dyn::field(obj,"To",$4); 
                              dyn::field(obj,"fieldList",$5); 
                              dyn::field(obj,"optDisplayArrayAttributes",$6); 
                              dyn::field(obj,"optHelp",$7); 
                              dyn::field(obj,"optWoscroll",$8); 
                              dyn::field(obj,"optInputDialogBlock",$9); 
                              dyn::field(obj,"End",$10); 
                              dyn::field(obj,"Display",$11);  $$ = obj;  
                                                                       
                          }
                          ;
opt_defaults:      {
                       $$ = dyn::nil();                              
                                    
                   }
                   | KW_WITHOUT_DEFAULTS %prec KW_LOWEST {
                       $$ = $1;                                            
                   }
                   ;
opt_woscroll:      {
                       $$ = dyn::nil();                              
                                    
                   }
                   | KW_WITHOUT_SCROLL %prec KW_LOWEST {
                       $$ = $1;                                            
                   }
                   ;
opt_input_dialog_block:      {
                                 $$ = dyn::nil();                              
                                              
                             }
                             | input_dialog_event_list {
                                 $$ = $1;                              
                                              
                             }
                             ;
opt_dialog_block:      {
                           $$ = dyn::nil();                              
                                        
                       }
                       | dialog_event_list {
                           $$ = $1;                                            
                       }
                       ;
opt_input_statement_block:      %prec KW_LOWEST {
                                    $$ = dyn::nil();                
                                                               
                                }
                                | input_event_list KW_END_INPUT {
                                    dyn::ptr_t obj = dyn::createObject(); 
                                    dyn::field(obj,"$",dyn::val((int)1)); 
                                    dyn::field(obj,"inputEventList",$1); 
                                    dyn::field(obj,"EndInput",$2);  $$ = obj;  
                                                                             
                                }
                                | KW_END_INPUT {
                                    dyn::ptr_t obj = dyn::createObject(); 
                                    dyn::field(obj,"$",dyn::val((int)2)); 
                                    dyn::field(obj,"EndInput",$1);  $$ = obj;  
                                                                             
                                }
                                ;
opt_input_array_statement_block:      %prec KW_LOWEST {
                                          $$ = dyn::nil();                
                                                                     
                                      }
                                      | input_array_event_list KW_END_INPUT {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)1)); 
                                          dyn::field(obj,"inputArrayEventList",$1);
                                           dyn::field(obj,"EndInput",$2); 
                                          $$ = obj;                
                                                                     
                                      }
                                      | KW_END_INPUT {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)2)); 
                                          dyn::field(obj,"EndInput",$1); 
                                          $$ = obj;                
                                                                     
                                      }
                                      ;
opt_construct_statement_block:      %prec KW_LOWEST {
                                        $$ = dyn::nil();                
                                                                   
                                    }
                                    | construct_event_list KW_END_CONSTRUCT {
                                        dyn::ptr_t obj = dyn::createObject(); 
                                        dyn::field(obj,"$",dyn::val((int)1)); 
                                        dyn::field(obj,"constructEventList",$1);
                                         dyn::field(obj,"EndConstruct",$2); 
                                        $$ = obj;                              
                                                     
                                    }
                                    ;
opt_display_statement_block:      %prec KW_LOWEST {
                                      $$ = dyn::nil();                
                                                                 
                                  }
                                  | display_array_event_list KW_END_DISPLAY {
                                      dyn::ptr_t obj = dyn::createObject(); 
                                      dyn::field(obj,"$",dyn::val((int)1)); 
                                      dyn::field(obj,"displayArrayEventList",$1);
                                       dyn::field(obj,"EndDisplay",$2); 
                                      $$ = obj;                              
                                                   
                                  }
                                  | KW_END_DISPLAY {
                                      dyn::ptr_t obj = dyn::createObject(); 
                                      dyn::field(obj,"$",dyn::val((int)2)); 
                                      dyn::field(obj,"EndDisplay",$1); 
                                      $$ = obj;                              
                                                   
                                  }
                                  ;
opt_prompt_statement_block:      %prec KW_LOWEST {
                                     $$ = dyn::nil();                
                                                                
                                 }
                                 | prompt_event_list KW_END_PROMPT {
                                     dyn::ptr_t obj = dyn::createObject(); 
                                     dyn::field(obj,"$",dyn::val((int)1)); 
                                     dyn::field(obj,"promptEventList",$1); 
                                     dyn::field(obj,"EndPrompt",$2);  $$ = obj; 
                                                                               
                                 }
                                 ;
input_event_list:      event_stmt {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"eventStmt",$1);  $$ = obj;  
                                                                    
                       }
                       | input_event_list event_stmt {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"inputEventList",$1); 
                           dyn::field(obj,"eventStmt",$2);  $$ = obj;  
                                                                    
                       }
                       ;
dialog_event_list:      dialog_event_stmt {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"dialogEventStmt",$1);  $$ = obj;  
                                                                     
                        }
                        | dialog_event_list dialog_event_stmt {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"dialogEventList",$1); 
                            dyn::field(obj,"dialogEventStmt",$2);  $$ = obj;  
                                                                     
                        }
                        ;
input_dialog_event_list:      dialog_event_stmt2 {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"dialogEventStmt2",$1); 
                                  $$ = obj;                              
                                               
                              }
                              | input_dialog_event_list dialog_event_stmt2 {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)1)); 
                                  dyn::field(obj,"inputDialogEventList",$1); 
                                  dyn::field(obj,"dialogEventStmt2",$2); 
                                  $$ = obj;                              
                                               
                              }
                              ;
dialog_event_stmt2:      dialog_event_declaration statement_list {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"dialogEventDeclaration",$1); 
                             dyn::field(obj,"statementList",$2);  $$ = obj;  
                                                                      
                         }
                         | event_stmt {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"eventStmt",$1);  $$ = obj;  
                                                                      
                         }
                         ;
opt_char:      {
                   $$ = dyn::nil();                                            
               }
               | KW_CHAR {
                   $$ = $1;                                            
               }
               ;
scroll_direction:      direction {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"direction",$1);  $$ = obj;  
                                                                    
                       }
                       | direction KW_BY expr {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"direction",$1); 
                           dyn::field(obj,"By",$2);  dyn::field(obj,"expr",$3); 
                           $$ = obj;                                            
                       }
                       | KW_EXPRESSION expr {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)2)); 
                           dyn::field(obj,"Expression",$1); 
                           dyn::field(obj,"expr",$2);  $$ = obj;                
                                                      
                       }
                       ;
direction:      KW_DOWN {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"Down",$1);  $$ = obj;                
                                               
                }
                | KW_UP {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Up",$1);  $$ = obj;                
                                               
                }
                ;
input_array_event_list:      input_array_event_stmt {
                                 dyn::ptr_t obj = dyn::createObject(); 
                                 dyn::field(obj,"inputArrayEventStmt",$1); 
                                 $$ = obj;                              
                                              
                             }
                             | input_array_event_list input_array_event_stmt {
                                 dyn::ptr_t obj = dyn::createObject(); 
                                 dyn::field(obj,"$",dyn::val((int)1)); 
                                 dyn::field(obj,"inputArrayEventList",$1); 
                                 dyn::field(obj,"inputArrayEventStmt",$2); 
                                 $$ = obj;                              
                                              
                             }
                             ;
input_array_event_stmt:      input_array_event_declaration statement_list {
                                 dyn::ptr_t obj = dyn::createObject(); 
                                 dyn::field(obj,"inputArrayEventDeclaration",$1);
                                  dyn::field(obj,"statementList",$2);  $$ = obj;
                                                                            
                             }
                             ;
input_array_event_declaration:      KW_BEFORE input_array_action_list {
                                        dyn::ptr_t obj = dyn::createObject(); 
                                        dyn::field(obj,"Before",$1); 
                                        dyn::field(obj,"inputArrayActionList",$2);
                                         $$ = obj;                              
                                                     
                                    }
                                    | KW_AFTER input_array_action_list {
                                        dyn::ptr_t obj = dyn::createObject(); 
                                        dyn::field(obj,"$",dyn::val((int)1)); 
                                        dyn::field(obj,"After",$1); 
                                        dyn::field(obj,"inputArrayActionList",$2);
                                         $$ = obj;                              
                                                     
                                    }
                                    | KW_ON KW_SORT {
                                        dyn::ptr_t obj = dyn::createObject(); 
                                        dyn::field(obj,"$",dyn::val((int)2)); 
                                        dyn::field(obj,"On",$1); 
                                        dyn::field(obj,"Sort",$2);  $$ = obj;  
                                                                   
                                                     
                                    }
                                    | on_change_actions {
                                        dyn::ptr_t obj = dyn::createObject(); 
                                        dyn::field(obj,"$",dyn::val((int)3)); 
                                        dyn::field(obj,"onChangeActions",$1); 
                                        $$ = obj;                              
                                                     
                                    }
                                    | before_after_input {
                                        dyn::ptr_t obj = dyn::createObject(); 
                                        dyn::field(obj,"$",dyn::val((int)4)); 
                                        dyn::field(obj,"beforeAfterInput",$1); 
                                        $$ = obj;                              
                                                     
                                    }
                                    | before_after_field_event_declaration {
                                        dyn::ptr_t obj = dyn::createObject(); 
                                        dyn::field(obj,"$",dyn::val((int)5)); 
                                        dyn::field(obj,"beforeAfterFieldEventDeclaration",$1);
                                         $$ = obj;                              
                                                     
                                    }
                                    | common_events {
                                        dyn::ptr_t obj = dyn::createObject(); 
                                        dyn::field(obj,"$",dyn::val((int)6)); 
                                        dyn::field(obj,"commonEvents",$1); 
                                        $$ = obj;                              
                                                     
                                    }
                                    ;
input_array_action_list:      input_array_action_keywords {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"inputArrayActionKeywords",$1);
                                   $$ = obj;                              
                                               
                              }
                              | input_array_action_list KW_COMMA
                              input_array_action_keywords {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)1)); 
                                  dyn::field(obj,"inputArrayActionList",$1); 
                                  dyn::field(obj,"Comma",$2); 
                                  dyn::field(obj,"inputArrayActionKeywords",$3);
                                   $$ = obj;                              
                                               
                              }
                              ;
input_array_action_keywords:      KW_INSERT {
                                      dyn::ptr_t obj = dyn::createObject(); 
                                      dyn::field(obj,"Insert",$1);  $$ = obj;  
                                                                               
                                  }
                                  | KW_DELETE {
                                      dyn::ptr_t obj = dyn::createObject(); 
                                      dyn::field(obj,"$",dyn::val((int)1)); 
                                      dyn::field(obj,"Delete",$1);  $$ = obj;  
                                                                               
                                  }
                                  | KW_ROW {
                                      dyn::ptr_t obj = dyn::createObject(); 
                                      dyn::field(obj,"$",dyn::val((int)2)); 
                                      dyn::field(obj,"Row",$1);  $$ = obj;  
                                                                               
                                  }
                                  ;
on_async_actions:      KW_ON async_event_param KW_LPARENTHESIS identifier
                       KW_RPARENTHESIS {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"On",$1); 
                           dyn::field(obj,"asyncEventParam",$2); 
                           dyn::field(obj,"Lparenthesis",$3); 
                           dyn::field(obj,"identifier",$4); 
                           dyn::field(obj,"Rparenthesis",$5);  $$ = obj;  
                                                                    
                       }
                       ;
async_event_param:      KW_DONE {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"Done",$1);  $$ = obj;  
                                                                     
                        }
                        | KW_DATA {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"Data",$1);  $$ = obj;  
                                                                     
                        }
                        ;
on_change_actions:      KW_ON KW_ROW KW_CHANGE {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"On",$1);  dyn::field(obj,"Row",$2); 
                            dyn::field(obj,"Change",$3);  $$ = obj;  
                                                                     
                        }
                        | KW_ON KW_CHANGE field_list {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"On",$1); 
                            dyn::field(obj,"Change",$2); 
                            dyn::field(obj,"fieldList",$3);  $$ = obj;  
                                                                     
                        }
                        ;
on_drag_actions:      KW_ON event_id_param KW_LPARENTHESIS identifier
                      KW_RPARENTHESIS {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"On",$1); 
                          dyn::field(obj,"eventIdParam",$2); 
                          dyn::field(obj,"Lparenthesis",$3); 
                          dyn::field(obj,"identifier",$4); 
                          dyn::field(obj,"Rparenthesis",$5);  $$ = obj;  
                                                                   
                      }
                      ;
event_id_param:      KW_DRAG_START {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"DragStart",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_DRAG_FINISHED {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"DragFinished",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_DRAG_ENTER {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"DragEnter",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_DRAG_OVER {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)3)); 
                         dyn::field(obj,"DragOver",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_DROP {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)4)); 
                         dyn::field(obj,"Drop",$1);  $$ = obj;                
                                                    
                     }
                     | KW_COLLAPSE {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)5)); 
                         dyn::field(obj,"Collapse",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_EXPAND {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)6)); 
                         dyn::field(obj,"Expand",$1);  $$ = obj;                
                                                    
                     }
                     ;
on_fill_buffer:      KW_ON KW_FILL KW_BUFFER {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"On",$1);  dyn::field(obj,"Fill",$2); 
                         dyn::field(obj,"Buffer",$3);  $$ = obj;                
                                                    
                     }
                     ;
on_modified_actions:      KW_ON events_no_params {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"On",$1); 
                              dyn::field(obj,"eventsNoParams",$2);  $$ = obj;  
                                                                       
                          }
                          ;
events_no_params:      KW_APPEND {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"Append",$1);  $$ = obj;  
                                                                    
                       }
                       | KW_INSERT {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"Insert",$1);  $$ = obj;  
                                                                    
                       }
                       | KW_UPDATE {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)2)); 
                           dyn::field(obj,"Update",$1);  $$ = obj;  
                                                                    
                       }
                       | KW_DELETE {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)3)); 
                           dyn::field(obj,"Delete",$1);  $$ = obj;  
                                                                    
                       }
                       ;
on_zmq_actions:      KW_ON zmq_event_param KW_LPARENTHESIS identifier
                     KW_RPARENTHESIS {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"On",$1); 
                         dyn::field(obj,"zmqEventParam",$2); 
                         dyn::field(obj,"Lparenthesis",$3); 
                         dyn::field(obj,"identifier",$4); 
                         dyn::field(obj,"Rparenthesis",$5);  $$ = obj;  
                                                                  
                     }
                     ;
zmq_event_param:      KW_MESSAGE {
                          $$ = $1;                                            
                      }
                      ;
prompt_event_list:      prompt_event_stmt {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"promptEventStmt",$1);  $$ = obj;  
                                                                     
                        }
                        | prompt_event_list prompt_event_stmt {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"promptEventList",$1); 
                            dyn::field(obj,"promptEventStmt",$2);  $$ = obj;  
                                                                     
                        }
                        ;
prompt_event_stmt:      prompt_event_declaration statement_list {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"promptEventDeclaration",$1); 
                            dyn::field(obj,"statementList",$2);  $$ = obj;  
                                                                     
                        }
                        ;
prompt_event_declaration:      KW_BEFORE KW_PROMPT {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"Before",$1); 
                                   dyn::field(obj,"Prompt",$2);  $$ = obj;  
                                                                            
                               }
                               | KW_AFTER KW_PROMPT {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)1)); 
                                   dyn::field(obj,"After",$1); 
                                   dyn::field(obj,"Prompt",$2);  $$ = obj;  
                                                                            
                               }
                               | common_events {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)2)); 
                                   dyn::field(obj,"commonEvents",$1);  $$ = obj;
                                                                              
                               }
                               | on_zmq_actions {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)3)); 
                                   dyn::field(obj,"onZmqActions",$1);  $$ = obj;
                                                                              
                               }
                               | on_async_actions {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)4)); 
                                   dyn::field(obj,"onAsyncActions",$1); 
                                   $$ = obj;                              
                                                
                               }
                               ;
alter_stmt:      KW_ALTER KW_INDEX table_name KW_TO not KW_CLUSTER {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"Alter",$1);  dyn::field(obj,"Index",$2); 
                     dyn::field(obj,"tableName",$3);  dyn::field(obj,"To",$4); 
                     dyn::field(obj,"not",$5);  dyn::field(obj,"Cluster",$6); 
                     $$ = obj;                                            
                 }
                 | KW_ALTER KW_TABLE table_name alter_list {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"Alter",$1);  dyn::field(obj,"Table",$2); 
                     dyn::field(obj,"tableName",$3); 
                     dyn::field(obj,"alterList",$4);  $$ = obj;                
                                                
                 }
                 ;
not:      {
              $$ = dyn::nil();                                            
          }
          | KW_NOT {
              $$ = $1;                                            
          }
          ;
alter_list:      alter_item {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"alterItem",$1);  $$ = obj;                
                                                
                 }
                 | alter_list KW_COMMA alter_item {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"alterList",$1); 
                     dyn::field(obj,"Comma",$2); 
                     dyn::field(obj,"alterItem",$3);  $$ = obj;                
                                                
                 }
                 ;
alter_item:      KW_ADD coladd {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"Add",$1);  dyn::field(obj,"coladd",$2); 
                     $$ = obj;                                            
                 }
                 | KW_ADD shadow_columns {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"Add",$1); 
                     dyn::field(obj,"shadowColumns",$2);  $$ = obj;  
                                                              
                 }
                 | KW_ADD KW_LPARENTHESIS coladd_list KW_RPARENTHESIS {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)2)); 
                     dyn::field(obj,"Add",$1); 
                     dyn::field(obj,"Lparenthesis",$2); 
                     dyn::field(obj,"coladdList",$3); 
                     dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                              
                 }
                 | KW_DROP lcase_identifier {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)3)); 
                     dyn::field(obj,"Drop",$1); 
                     dyn::field(obj,"lcaseIdentifier",$2);  $$ = obj;  
                                                              
                 }
                 | KW_DROP shadow_columns {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)4)); 
                     dyn::field(obj,"Drop",$1); 
                     dyn::field(obj,"shadowColumns",$2);  $$ = obj;  
                                                              
                 }
                 | KW_DROP KW_LPARENTHESIS coldrop_list KW_RPARENTHESIS {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)5)); 
                     dyn::field(obj,"Drop",$1); 
                     dyn::field(obj,"Lparenthesis",$2); 
                     dyn::field(obj,"coldropList",$3); 
                     dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                              
                 }
                 | KW_MODIFY colmod {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)6)); 
                     dyn::field(obj,"Modify",$1);  dyn::field(obj,"colmod",$2); 
                     $$ = obj;                                            
                 }
                 | KW_MODIFY KW_LPARENTHESIS colmod_list KW_RPARENTHESIS {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)7)); 
                     dyn::field(obj,"Modify",$1); 
                     dyn::field(obj,"Lparenthesis",$2); 
                     dyn::field(obj,"colmodList",$3); 
                     dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                              
                 }
                 | KW_ADD KW_CONSTRAINT table_constraint {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)8)); 
                     dyn::field(obj,"Add",$1);  dyn::field(obj,"Constraint",$2);
                      dyn::field(obj,"tableConstraint",$3);  $$ = obj;  
                                                              
                 }
                 | KW_ADD KW_CONSTRAINT KW_LPARENTHESIS constraintadd_list
                 KW_RPARENTHESIS {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)9)); 
                     dyn::field(obj,"Add",$1);  dyn::field(obj,"Constraint",$2);
                      dyn::field(obj,"Lparenthesis",$3); 
                     dyn::field(obj,"constraintaddList",$4); 
                     dyn::field(obj,"Rparenthesis",$5);  $$ = obj;  
                                                              
                 }
                 | KW_DROP KW_CONSTRAINT lcase_identifier {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)10)); 
                     dyn::field(obj,"Drop",$1); 
                     dyn::field(obj,"Constraint",$2); 
                     dyn::field(obj,"lcaseIdentifier",$3);  $$ = obj;  
                                                              
                 }
                 | KW_DROP KW_CONSTRAINT KW_LPARENTHESIS coldrop_list
                 KW_RPARENTHESIS {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)11)); 
                     dyn::field(obj,"Drop",$1); 
                     dyn::field(obj,"Constraint",$2); 
                     dyn::field(obj,"Lparenthesis",$3); 
                     dyn::field(obj,"coldropList",$4); 
                     dyn::field(obj,"Rparenthesis",$5);  $$ = obj;  
                                                              
                 }
                 | KW_ADD KW_TYPE {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)12)); 
                     dyn::field(obj,"Add",$1);  dyn::field(obj,"Type",$2); 
                     $$ = obj;                                            
                 }
                 | KW_MODIFY KW_NEXT_SIZE int_expr {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)13)); 
                     dyn::field(obj,"Modify",$1); 
                     dyn::field(obj,"NextSize",$2); 
                     dyn::field(obj,"intExpr",$3);  $$ = obj;                
                                                
                 }
                 | KW_LOCK_MODE KW_LPARENTHESIS lock_mode_case KW_RPARENTHESIS {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)14)); 
                     dyn::field(obj,"LockMode",$1); 
                     dyn::field(obj,"Lparenthesis",$2); 
                     dyn::field(obj,"lockModeCase",$3); 
                     dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                              
                 }
                 | KW_ADD KW_ROWIDS {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)15)); 
                     dyn::field(obj,"Add",$1);  dyn::field(obj,"Rowids",$2); 
                     $$ = obj;                                            
                 }
                 | KW_DROP KW_ROWIDS {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)16)); 
                     dyn::field(obj,"Drop",$1);  dyn::field(obj,"Rowids",$2); 
                     $$ = obj;                                            
                 }
                 ;
lock_mode_case:      KW_PAGE {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"Page",$1);  $$ = obj;                
                                                    
                     }
                     | KW_ROW {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Row",$1);  $$ = obj;                
                                                    
                     }
                     ;
shadow_columns:      KW_REPLCHECK {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"Replcheck",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_CRCOLS {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Crcols",$1);  $$ = obj;                
                                                    
                     }
                     | KW_ERKEY {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"Erkey",$1);  $$ = obj;                
                                                    
                     }
                     ;
coladd_list:      coladd {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"coladd",$1);  $$ = obj;                
                                                 
                  }
                  | coladd_list KW_COMMA coladd {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"coladdList",$1); 
                      dyn::field(obj,"Comma",$2);  dyn::field(obj,"coladd",$3); 
                      $$ = obj;                                            
                  }
                  ;
coladd:      identifier datatype column_default column_constraint coladd_before
             {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"identifier",$1); 
                 dyn::field(obj,"datatype",$2); 
                 dyn::field(obj,"columnDefault",$3); 
                 dyn::field(obj,"columnConstraint",$4); 
                 dyn::field(obj,"coladdBefore",$5);  $$ = obj;                
                                            
             }
             ;
coladd_before:      %prec KW_LOWEST {
                        $$ = dyn::nil();                              
                                     
                    }
                    | KW_BEFORE identifier {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Before",$1); 
                        dyn::field(obj,"identifier",$2);  $$ = obj;  
                                                                 
                    }
                    ;
colmod:      identifier datatype column_default column_constraint {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"identifier",$1); 
                 dyn::field(obj,"datatype",$2); 
                 dyn::field(obj,"columnDefault",$3); 
                 dyn::field(obj,"columnConstraint",$4);  $$ = obj;  
                                                          
             }
             ;
colmod_list:      colmod {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"colmod",$1);  $$ = obj;                
                                                 
                  }
                  | colmod_list KW_COMMA colmod {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"colmodList",$1); 
                      dyn::field(obj,"Comma",$2);  dyn::field(obj,"colmod",$3); 
                      $$ = obj;                                            
                  }
                  ;
coldrop_list:      lcase_identifier {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"lcaseIdentifier",$1);  $$ = obj;  
                                                                
                   }
                   | coldrop_list KW_COMMA lcase_identifier {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"coldropList",$1); 
                       dyn::field(obj,"Comma",$2); 
                       dyn::field(obj,"lcaseIdentifier",$3);  $$ = obj;  
                                                                
                   }
                   ;
constraintadd_list:      table_constraint {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"tableConstraint",$1);  $$ = obj;  
                                                                      
                         }
                         | constraintadd_list KW_COMMA table_constraint {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"constraintaddList",$1); 
                             dyn::field(obj,"Comma",$2); 
                             dyn::field(obj,"tableConstraint",$3);  $$ = obj;  
                                                                      
                         }
                         ;
column_default:      {
                         $$ = dyn::nil();                              
                                      
                     }
                     | KW_DEFAULT_NULL {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"DefaultNull",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_DEFAULT default_vals {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"Default",$1); 
                         dyn::field(obj,"defaultVals",$2);  $$ = obj;  
                                                                  
                     }
                     ;
default_vals:      literal_default {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"literalDefault",$1);  $$ = obj;  
                                                                
                   }
                   | KW_USER {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"User",$1);  $$ = obj;                
                                                  
                   }
                   | KW_TODAY {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"Today",$1);  $$ = obj;                
                                                  
                   }
                   | KW_SITENAME {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)3)); 
                       dyn::field(obj,"Sitename",$1);  $$ = obj;                
                                                  
                   }
                   | KW_DBSERVERNAME {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)4)); 
                       dyn::field(obj,"Dbservername",$1);  $$ = obj;  
                                                                
                   }
                   | KW_CURRENT dtime_qual {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)5)); 
                       dyn::field(obj,"Current",$1); 
                       dyn::field(obj,"dtimeQual",$2);  $$ = obj;  
                                                                
                   }
                   ;
literal_default:      lvalue_or_const {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"lvalueOrConst",$1);  $$ = obj;  
                                                                   
                      }
                      | '+' lvalue_or_const {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"PlusSign",$1); 
                          dyn::field(obj,"lvalueOrConst",$2);  $$ = obj;  
                                                                   
                      }
                      | '-' lvalue_or_const {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"MinusSign",$1); 
                          dyn::field(obj,"lvalueOrConst",$2);  $$ = obj;  
                                                                   
                      }
                      ;
coldef_list:      coldef {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"coldef",$1);  $$ = obj;                
                                                 
                  }
                  | coldef_list KW_COMMA coldef {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"coldefList",$1); 
                      dyn::field(obj,"Comma",$2);  dyn::field(obj,"coldef",$3); 
                      $$ = obj;                                            
                  }
                  | coldef_list KW_COMMA table_constraint {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"coldefList",$1); 
                      dyn::field(obj,"Comma",$2); 
                      dyn::field(obj,"tableConstraint",$3);  $$ = obj;  
                                                               
                  }
                  ;
coldef:      identifier datatype column_default column_constraint {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"identifier",$1); 
                 dyn::field(obj,"datatype",$2); 
                 dyn::field(obj,"columnDefault",$3); 
                 dyn::field(obj,"columnConstraint",$4);  $$ = obj;  
                                                          
             }
             ;
column_constraint:      not_null unique_distinct_primary references check
                        constraint_name constraint_mode {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"notNull",$1); 
                            dyn::field(obj,"uniqueDistinctPrimary",$2); 
                            dyn::field(obj,"references",$3); 
                            dyn::field(obj,"check",$4); 
                            dyn::field(obj,"constraintName",$5); 
                            dyn::field(obj,"constraintMode",$6);  $$ = obj;  
                                                                     
                        }
                        ;
not_null:      {
                   $$ = dyn::nil();                                            
               }
               | KW_NOT_NULL {
                   $$ = $1;                                            
               }
               ;
unique_distinct_primary:      {
                                  $$ = dyn::nil();                              
                                               
                              }
                              | KW_UNIQUE {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)1)); 
                                  dyn::field(obj,"Unique",$1);  $$ = obj;  
                                                                           
                              }
                              | KW_DISTINCT {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)2)); 
                                  dyn::field(obj,"Distinct",$1);  $$ = obj;  
                                                                           
                              }
                              | KW_PRIMARY_KEY {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)3)); 
                                  dyn::field(obj,"PrimaryKey",$1);  $$ = obj;  
                                                                           
                              }
                              ;
check:      {
                $$ = dyn::nil();                                            
            }
            | KW_CHECK KW_LPARENTHESIS expr KW_RPARENTHESIS {
                dyn::ptr_t obj = dyn::createObject(); 
                dyn::field(obj,"$",dyn::val((int)1)); 
                dyn::field(obj,"Check",$1);  dyn::field(obj,"Lparenthesis",$2); 
                dyn::field(obj,"expr",$3);  dyn::field(obj,"Rparenthesis",$4); 
                $$ = obj;                                            
            }
            ;
connection_stmt:      KW_DATABASE database_id_or_var {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"Database",$1); 
                          dyn::field(obj,"databaseIdOrVar",$2);  $$ = obj;  
                                                                   
                      }
                      | KW_DATABASE database_id_or_var KW_EXCLUSIVE {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Database",$1); 
                          dyn::field(obj,"databaseIdOrVar",$2); 
                          dyn::field(obj,"Exclusive",$3);  $$ = obj;  
                                                                   
                      }
                      | KW_CLOSE KW_DATABASE {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"Close",$1); 
                          dyn::field(obj,"Database",$2);  $$ = obj;  
                                                                   
                      }
                      | KW_CREATE KW_DATABASE database_id_or_var opt_in_dbspace
                      opt_with_log {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)3)); 
                          dyn::field(obj,"Create",$1); 
                          dyn::field(obj,"Database",$2); 
                          dyn::field(obj,"databaseIdOrVar",$3); 
                          dyn::field(obj,"optInDbspace",$4); 
                          dyn::field(obj,"optWithLog",$5);  $$ = obj;  
                                                                   
                      }
                      | KW_DROP KW_DATABASE database_id_or_var {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)4)); 
                          dyn::field(obj,"Drop",$1); 
                          dyn::field(obj,"Database",$2); 
                          dyn::field(obj,"databaseIdOrVar",$3);  $$ = obj;  
                                                                   
                      }
                      | KW_CONNECT KW_TO string_expr opt_connect_as_clause
                      opt_connect_user_clause opt_with_concurrent_transaction {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)5)); 
                          dyn::field(obj,"Connect",$1); 
                          dyn::field(obj,"To",$2); 
                          dyn::field(obj,"stringExpr",$3); 
                          dyn::field(obj,"optConnectAsClause",$4); 
                          dyn::field(obj,"optConnectUserClause",$5); 
                          dyn::field(obj,"optWithConcurrentTransaction",$6); 
                          $$ = obj;                                            
                      }
                      | KW_CONNECT KW_TO KW_DEFAULT opt_connect_as_clause
                      opt_connect_user_clause opt_with_concurrent_transaction {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)6)); 
                          dyn::field(obj,"Connect",$1); 
                          dyn::field(obj,"To",$2); 
                          dyn::field(obj,"Default",$3); 
                          dyn::field(obj,"optConnectAsClause",$4); 
                          dyn::field(obj,"optConnectUserClause",$5); 
                          dyn::field(obj,"optWithConcurrentTransaction",$6); 
                          $$ = obj;                                            
                      }
                      | KW_SET KW_CONNECTION connection_name opt_dormant {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)7)); 
                          dyn::field(obj,"Set",$1); 
                          dyn::field(obj,"Connection",$2); 
                          dyn::field(obj,"connectionName",$3); 
                          dyn::field(obj,"optDormant",$4);  $$ = obj;  
                                                                   
                      }
                      | KW_SET KW_CONNECTION KW_DEFAULT opt_dormant {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)8)); 
                          dyn::field(obj,"Set",$1); 
                          dyn::field(obj,"Connection",$2); 
                          dyn::field(obj,"Default",$3); 
                          dyn::field(obj,"optDormant",$4);  $$ = obj;  
                                                                   
                      }
                      | KW_SET KW_CONNECTION KW_CURRENT opt_dormant {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)9)); 
                          dyn::field(obj,"Set",$1); 
                          dyn::field(obj,"Connection",$2); 
                          dyn::field(obj,"Current",$3); 
                          dyn::field(obj,"optDormant",$4);  $$ = obj;  
                                                                   
                      }
                      | KW_DISCONNECT KW_CURRENT {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)10)); 
                          dyn::field(obj,"Disconnect",$1); 
                          dyn::field(obj,"Current",$2);  $$ = obj;  
                                                                   
                      }
                      | KW_DISCONNECT KW_DEFAULT {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)11)); 
                          dyn::field(obj,"Disconnect",$1); 
                          dyn::field(obj,"Default",$2);  $$ = obj;  
                                                                   
                      }
                      | KW_DISCONNECT KW_ALL {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)12)); 
                          dyn::field(obj,"Disconnect",$1); 
                          dyn::field(obj,"All",$2);  $$ = obj;                
                                                     
                      }
                      | KW_DISCONNECT connection_name {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)13)); 
                          dyn::field(obj,"Disconnect",$1); 
                          dyn::field(obj,"connectionName",$2);  $$ = obj;  
                                                                   
                      }
                      ;
opt_in_dbspace:      {
                         $$ = dyn::nil();                              
                                      
                     }
                     | KW_IN identifier {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"In",$1); 
                         dyn::field(obj,"identifier",$2);  $$ = obj;  
                                                                  
                     }
                     ;
opt_with_log:      {
                       $$ = dyn::nil();                              
                                    
                   }
                   | KW_WITH KW_LOG {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"With",$1);  dyn::field(obj,"Log",$2); 
                       $$ = obj;                                            
                   }
                   | KW_WITH KW_BUFFERED KW_LOG {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"With",$1); 
                       dyn::field(obj,"Buffered",$2);  dyn::field(obj,"Log",$3);
                        $$ = obj;                                            
                   }
                   | KW_WITH KW_LOG KW_MODE KW_ANSI {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)3)); 
                       dyn::field(obj,"With",$1);  dyn::field(obj,"Log",$2); 
                       dyn::field(obj,"Mode",$3);  dyn::field(obj,"Ansi",$4); 
                       $$ = obj;                                            
                   }
                   ;
connection_name:      string_param {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"stringParam",$1);  $$ = obj;  
                                                                   
                      }
                      | identifier {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"identifier",$1);  $$ = obj;  
                                                                   
                      }
                      ;
opt_dormant:      {
                      $$ = dyn::nil();                              
                                   
                  }
                  | KW_DORMANT {
                      $$ = $1;                                            
                  }
                  ;
opt_with_concurrent_transaction:      {
                                          $$ = dyn::nil();                
                                                                     
                                      }
                                      | KW_WITH KW_CONCURRENT KW_TRANSACTION {
                                          dyn::ptr_t obj = dyn::createObject(); 
                                          dyn::field(obj,"$",dyn::val((int)1)); 
                                          dyn::field(obj,"With",$1); 
                                          dyn::field(obj,"Concurrent",$2); 
                                          dyn::field(obj,"Transaction",$3); 
                                          $$ = obj;                
                                                                     
                                      }
                                      ;
opt_connect_as_clause:      {
                                $$ = dyn::nil();                              
                                             
                            }
                            | KW_AS string_expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"As",$1); 
                                dyn::field(obj,"stringExpr",$2);  $$ = obj;  
                                                                         
                            }
                            ;
opt_connect_user_clause:      {
                                  $$ = dyn::nil();                              
                                               
                              }
                              | KW_USER expr {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)1)); 
                                  dyn::field(obj,"User",$1); 
                                  dyn::field(obj,"expr",$2);  $$ = obj;  
                                                                           
                              }
                              ;
database_id_or_var:      lvalue {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"lvalue",$1);  $$ = obj;  
                                                                      
                         }
                         | KW_STRCON {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"Strcon",$1);  $$ = obj;  
                                                                      
                         }
                         ;
constraint_mode:      {
                          $$ = dyn::nil();                              
                                       
                      }
                      | KW_DISABLED {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Disabled",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_ENABLED {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"Enabled",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_FILTERING KW_WITH KW_ERROR {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)3)); 
                          dyn::field(obj,"Filtering",$1); 
                          dyn::field(obj,"With",$2); 
                          dyn::field(obj,"Error",$3);  $$ = obj;                
                                                     
                      }
                      | KW_FILTERING KW_WITHOUT KW_ERROR {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)4)); 
                          dyn::field(obj,"Filtering",$1); 
                          dyn::field(obj,"Without",$2); 
                          dyn::field(obj,"Error",$3);  $$ = obj;                
                                                     
                      }
                      | KW_FILTERING {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)5)); 
                          dyn::field(obj,"Filtering",$1);  $$ = obj;  
                                                                   
                      }
                      ;
constraint_name:      {
                          $$ = dyn::nil();                              
                                       
                      }
                      | KW_CONSTRAINT lcase_identifier {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Constraint",$1); 
                          dyn::field(obj,"lcaseIdentifier",$2);  $$ = obj;  
                                                                   
                      }
                      | KW_CONSTRAINT lcase_identifier '.' lcase_identifier {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"Constraint",$1); 
                          dyn::field(obj,"lcaseIdentifier",$2); 
                          dyn::field(obj,"DotSign",$3); 
                          dyn::field(obj,"lcaseIdentifier1",$4);  $$ = obj;  
                                                                   
                      }
                      | KW_CONSTRAINT KW_STRCON '.' lcase_identifier {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)3)); 
                          dyn::field(obj,"Constraint",$1); 
                          dyn::field(obj,"Strcon",$2); 
                          dyn::field(obj,"DotSign",$3); 
                          dyn::field(obj,"lcaseIdentifier",$4);  $$ = obj;  
                                                                   
                      }
                      ;
create_stmt:      create_table {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"createTable",$1);  $$ = obj;  
                                                               
                  }
                  | create_synonym {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"createSynonym",$1);  $$ = obj;  
                                                               
                  }
                  | create_view {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"createView",$1);  $$ = obj;  
                                                               
                  }
                  | create_index_def {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)3)); 
                      dyn::field(obj,"createIndexDef",$1);  $$ = obj;  
                                                               
                  }
                  ;
create_index_def:      KW_CREATE unique cluster KW_INDEX table_name KW_ON
                       table_name KW_LPARENTHESIS order_expr_list
                       KW_RPARENTHESIS {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"Create",$1); 
                           dyn::field(obj,"unique",$2); 
                           dyn::field(obj,"cluster",$3); 
                           dyn::field(obj,"Index",$4); 
                           dyn::field(obj,"tableName",$5); 
                           dyn::field(obj,"On",$6); 
                           dyn::field(obj,"tableName1",$7); 
                           dyn::field(obj,"Lparenthesis",$8); 
                           dyn::field(obj,"orderExprList",$9); 
                           dyn::field(obj,"Rparenthesis",$10);  $$ = obj;  
                                                                    
                       }
                       ;
cluster:      {
                  $$ = dyn::nil();                                            
              }
              | KW_CLUSTER {
                  $$ = $1;                                            
              }
              ;
create_table:      KW_CREATE temporary KW_TABLE create_table_name
                   KW_LPARENTHESIS coldef_list KW_RPARENTHESIS log_option
                   storage with_replcheck_opt {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"Create",$1); 
                       dyn::field(obj,"temporary",$2); 
                       dyn::field(obj,"Table",$3); 
                       dyn::field(obj,"createTableName",$4); 
                       dyn::field(obj,"Lparenthesis",$5); 
                       dyn::field(obj,"coldefList",$6); 
                       dyn::field(obj,"Rparenthesis",$7); 
                       dyn::field(obj,"logOption",$8); 
                       dyn::field(obj,"storage",$9); 
                       dyn::field(obj,"withReplcheckOpt",$10);  $$ = obj;  
                                                                
                   }
                   ;
create_table_name:      table_name {
                            $$ = $1;                                            
                        }
                        ;
with_replcheck_opt:      {
                             $$ = dyn::nil();                              
                                          
                         }
                         | KW_WITH KW_REPLCHECK {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"With",$1); 
                             dyn::field(obj,"Replcheck",$2);  $$ = obj;  
                                                                      
                         }
                         ;
temporary:      {
                    $$ = dyn::nil();                                            
                }
                | KW_TEMPORARY {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Temporary",$1);  $$ = obj;                
                                               
                }
                | KW_TEMP {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)2)); 
                    dyn::field(obj,"Temp",$1);  $$ = obj;                
                                               
                }
                ;
log_option:      {
                     $$ = dyn::nil();                              
                                  
                 }
                 | KW_WITH_NO_LOG {
                     $$ = $1;                                            
                 }
                 ;
storage:      {
                  $$ = dyn::nil();                                            
              }
              | storage storage_spec {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)1)); 
                  dyn::field(obj,"storage",$1); 
                  dyn::field(obj,"storageSpec",$2);  $$ = obj;                
                                             
              }
              ;
storage_spec:      KW_IN lcase_identifier {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"In",$1); 
                       dyn::field(obj,"lcaseIdentifier",$2);  $$ = obj;  
                                                                
                   }
                   | extent_clause {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"extentClause",$1);  $$ = obj;  
                                                                
                   }
                   | lock_mode {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"lockMode",$1);  $$ = obj;                
                                                  
                   }
                   ;
extent_clause:      KW_EXTENT_SIZE int_expr {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"ExtentSize",$1); 
                        dyn::field(obj,"intExpr",$2);  $$ = obj;                
                                                   
                    }
                    | KW_EXTENT_SIZE int_expr KW_NEXT_SIZE int_expr {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"ExtentSize",$1); 
                        dyn::field(obj,"intExpr",$2); 
                        dyn::field(obj,"NextSize",$3); 
                        dyn::field(obj,"intExpr1",$4);  $$ = obj;  
                                                                 
                    }
                    ;
create_view:      KW_CREATE KW_VIEW table_name opt_column_list KW_AS select_stmt
                  opt_check_option {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Create",$1);  dyn::field(obj,"View",$2); 
                      dyn::field(obj,"tableName",$3); 
                      dyn::field(obj,"optColumnList",$4); 
                      dyn::field(obj,"As",$5);  dyn::field(obj,"selectStmt",$6);
                       dyn::field(obj,"optCheckOption",$7);  $$ = obj;  
                                                               
                  }
                  | KW_CREATE KW_VIEW table_name KW_OF KW_TYPE identifier KW_AS
                  select_stmt opt_check_option {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Create",$1);  dyn::field(obj,"View",$2); 
                      dyn::field(obj,"tableName",$3);  dyn::field(obj,"Of",$4); 
                      dyn::field(obj,"Type",$5); 
                      dyn::field(obj,"identifier",$6);  dyn::field(obj,"As",$7);
                       dyn::field(obj,"selectStmt",$8); 
                      dyn::field(obj,"optCheckOption",$9);  $$ = obj;  
                                                               
                  }
                  ;
opt_check_option:      {
                           $$ = dyn::nil();                              
                                        
                       }
                       | KW_WITH KW_CHECK KW_OPTION {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"With",$1); 
                           dyn::field(obj,"Check",$2); 
                           dyn::field(obj,"Option",$3);  $$ = obj;  
                                                                    
                       }
                       ;
db_privilege:      KW_CONNECT {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"Connect",$1);  $$ = obj;                
                                                  
                   }
                   | KW_RESOURCE {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Resource",$1);  $$ = obj;                
                                                  
                   }
                   | KW_DBA {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"Dba",$1);  $$ = obj;                
                                                  
                   }
                   ;
ddl_stmt:      drop_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"dropStmt",$1);  $$ = obj;                
                                              
               }
               | create_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"createStmt",$1);  $$ = obj;                
                                              
               }
               | alter_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)2)); 
                   dyn::field(obj,"alterStmt",$1);  $$ = obj;                
                                              
               }
               | grant_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)3)); 
                   dyn::field(obj,"grantStmt",$1);  $$ = obj;                
                                              
               }
               | revoke_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)4)); 
                   dyn::field(obj,"revokeStmt",$1);  $$ = obj;                
                                              
               }
               | misc_ddl_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)5)); 
                   dyn::field(obj,"miscDdlStmt",$1);  $$ = obj;                
                                              
               }
               | rename_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)6)); 
                   dyn::field(obj,"renameStmt",$1);  $$ = obj;                
                                              
               }
               ;
delete_stmt:      KW_DELETE KW_FROM begin_sql table_name where_clause {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Delete",$1);  dyn::field(obj,"From",$2); 
                      dyn::field(obj,"beginSql",$3); 
                      dyn::field(obj,"tableName",$4); 
                      dyn::field(obj,"whereClause",$5);  $$ = obj;  
                                                 SetSqlTokens(0);              
                  }
                  ;
drop_stmt:      KW_DROP KW_TABLE table_name {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"Drop",$1);  dyn::field(obj,"Table",$2); 
                    dyn::field(obj,"tableName",$3);  $$ = obj;                
                                               
                }
                | KW_DROP KW_VIEW table_name {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Drop",$1);  dyn::field(obj,"View",$2); 
                    dyn::field(obj,"tableName",$3);  $$ = obj;                
                                               
                }
                | KW_DROP KW_INDEX table_name {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)2)); 
                    dyn::field(obj,"Drop",$1);  dyn::field(obj,"Index",$2); 
                    dyn::field(obj,"tableName",$3);  $$ = obj;                
                                               
                }
                | KW_DROP KW_SYNONYM table_name {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)3)); 
                    dyn::field(obj,"Drop",$1);  dyn::field(obj,"Synonym",$2); 
                    dyn::field(obj,"tableName",$3);  $$ = obj;                
                                               
                }
                ;
execute_procedure_stmt:      KW_EXECUTE KW_PROCEDURE function_call opt_into {
                                 dyn::ptr_t obj = dyn::createObject(); 
                                 dyn::field(obj,"Execute",$1); 
                                 dyn::field(obj,"Procedure",$2); 
                                 dyn::field(obj,"functionCall",$3); 
                                 dyn::field(obj,"optInto",$4);  $$ = obj;  
                                                                          
                             }
                             ;
grant_stmt:      KW_GRANT db_privilege KW_TO user_list {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"Grant",$1); 
                     dyn::field(obj,"dbPrivilege",$2);  dyn::field(obj,"To",$3);
                      dyn::field(obj,"userList",$4);  $$ = obj;                
                                                
                 }
                 | KW_GRANT table_privilege KW_ON table_id KW_TO user_list
                 opt_with_grant_option opt_grantor {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"Grant",$1); 
                     dyn::field(obj,"tablePrivilege",$2); 
                     dyn::field(obj,"On",$3);  dyn::field(obj,"tableId",$4); 
                     dyn::field(obj,"To",$5);  dyn::field(obj,"userList",$6); 
                     dyn::field(obj,"optWithGrantOption",$7); 
                     dyn::field(obj,"optGrantor",$8);  $$ = obj;                
                                                
                 }
                 | KW_GRANT opt_execute_on lcase_identifier KW_TO user_list
                 opt_with_grant_option {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)2)); 
                     dyn::field(obj,"Grant",$1); 
                     dyn::field(obj,"optExecuteOn",$2); 
                     dyn::field(obj,"lcaseIdentifier",$3); 
                     dyn::field(obj,"To",$4);  dyn::field(obj,"userList",$5); 
                     dyn::field(obj,"optWithGrantOption",$6);  $$ = obj;  
                                                              
                 }
                 ;
opt_with_grant_option:      {
                                $$ = dyn::nil();                              
                                             
                            }
                            | KW_WITH KW_GRANT KW_OPTION {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"With",$1); 
                                dyn::field(obj,"Grant",$2); 
                                dyn::field(obj,"Option",$3);  $$ = obj;  
                                                                         
                            }
                            ;
opt_grantor:      {
                      $$ = dyn::nil();                              
                                   
                  }
                  | KW_AS identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"As",$1);  dyn::field(obj,"identifier",$2);
                       $$ = obj;                                            
                  }
                  ;
insert_stmt:      KW_INSERT KW_INTO table_name select_stmt {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Insert",$1);  dyn::field(obj,"Into",$2); 
                      dyn::field(obj,"tableName",$3); 
                      dyn::field(obj,"selectStmt",$4);  $$ = obj;  
                                                               
                  }
                  | KW_INSERT KW_INTO table_name KW_LPARENTHESIS column_list
                  KW_RPARENTHESIS select_stmt {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Insert",$1);  dyn::field(obj,"Into",$2); 
                      dyn::field(obj,"tableName",$3); 
                      dyn::field(obj,"Lparenthesis",$4); 
                      dyn::field(obj,"columnList",$5); 
                      dyn::field(obj,"Rparenthesis",$6); 
                      dyn::field(obj,"selectStmt",$7);  $$ = obj;  
                                                               
                  }
                  | KW_INSERT KW_INTO table_name KW_VALUES KW_LPARENTHESIS
                  expr_list KW_RPARENTHESIS {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"Insert",$1);  dyn::field(obj,"Into",$2); 
                      dyn::field(obj,"tableName",$3); 
                      dyn::field(obj,"Values",$4); 
                      dyn::field(obj,"Lparenthesis",$5); 
                      dyn::field(obj,"exprList",$6); 
                      dyn::field(obj,"Rparenthesis",$7);  $$ = obj;  
                                                               
                  }
                  | KW_INSERT KW_INTO table_name KW_LPARENTHESIS column_list
                  KW_RPARENTHESIS KW_VALUES KW_LPARENTHESIS expr_list
                  KW_RPARENTHESIS {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)3)); 
                      dyn::field(obj,"Insert",$1);  dyn::field(obj,"Into",$2); 
                      dyn::field(obj,"tableName",$3); 
                      dyn::field(obj,"Lparenthesis",$4); 
                      dyn::field(obj,"columnList",$5); 
                      dyn::field(obj,"Rparenthesis",$6); 
                      dyn::field(obj,"Values",$7); 
                      dyn::field(obj,"Lparenthesis1",$8); 
                      dyn::field(obj,"exprList",$9); 
                      dyn::field(obj,"Rparenthesis1",$10);  $$ = obj;  
                                                               
                  }
                  ;
load_unload_stmt:      KW_LOAD KW_FROM string_expr delimiter load_insert {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"Load",$1); 
                           dyn::field(obj,"From",$2); 
                           dyn::field(obj,"stringExpr",$3); 
                           dyn::field(obj,"delimiter",$4); 
                           dyn::field(obj,"loadInsert",$5);  $$ = obj;  
                                                                    
                       }
                       | KW_UNLOAD KW_TO string_expr delimiter
                       unload_select_stmt {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"Unload",$1); 
                           dyn::field(obj,"To",$2); 
                           dyn::field(obj,"stringExpr",$3); 
                           dyn::field(obj,"delimiter",$4); 
                           dyn::field(obj,"unloadSelectStmt",$5);  $$ = obj;  
                                                                    
                       }
                       ;
delimiter:      {
                    $$ = dyn::nil();                                            
                }
                | KW_DELIMITER string_expr {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Delimiter",$1); 
                    dyn::field(obj,"stringExpr",$2);  $$ = obj;                
                                               
                }
                ;
load_insert:      KW_INSERT KW_INTO table_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Insert",$1);  dyn::field(obj,"Into",$2); 
                      dyn::field(obj,"tableName",$3);  $$ = obj;                
                                                 
                  }
                  | KW_INSERT KW_INTO table_name KW_LPARENTHESIS column_list
                  KW_RPARENTHESIS {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Insert",$1);  dyn::field(obj,"Into",$2); 
                      dyn::field(obj,"tableName",$3); 
                      dyn::field(obj,"Lparenthesis",$4); 
                      dyn::field(obj,"columnList",$5); 
                      dyn::field(obj,"Rparenthesis",$6);  $$ = obj;  
                                                               
                  }
                  | expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"expr",$1);  $$ = obj;                
                                                 
                  }
                  ;
unload_select_stmt:      select_stmt {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"selectStmt",$1);  $$ = obj;  
                                                                      
                         }
                         | expr {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"expr",$1);  $$ = obj;  
                                                                      
                         }
                         ;
lock_mode:      KW_LOCK_MODE KW_PAGE {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"LockMode",$1);  dyn::field(obj,"Page",$2); 
                    $$ = obj;                                            
                }
                | KW_LOCK_MODE KW_ROW {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"LockMode",$1);  dyn::field(obj,"Row",$2); 
                    $$ = obj;                                            
                }
                ;
misc_ddl_stmt:      KW_UPDATE_STATISTICS update_stats_level update_stats_table
                    update_stats_resolution {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"UpdateStatistics",$1); 
                        dyn::field(obj,"updateStatsLevel",$2); 
                        dyn::field(obj,"updateStatsTable",$3); 
                        dyn::field(obj,"updateStatsResolution",$4);  $$ = obj;  
                                                                 
                    }
                    ;
update_stats_level:      {
                             $$ = dyn::nil();                              
                                          
                         }
                         | KW_LOW {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"Low",$1);  $$ = obj;  
                                                                      
                         }
                         | KW_MEDIUM {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)2)); 
                             dyn::field(obj,"Medium",$1);  $$ = obj;  
                                                                      
                         }
                         | KW_HIGH {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)3)); 
                             dyn::field(obj,"High",$1);  $$ = obj;  
                                                                      
                         }
                         ;
update_stats_table:      {
                             $$ = dyn::nil();                              
                                          
                         }
                         | KW_FOR_TABLE opt_only table_name opt_column_list {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"ForTable",$1); 
                             dyn::field(obj,"optOnly",$2); 
                             dyn::field(obj,"tableName",$3); 
                             dyn::field(obj,"optColumnList",$4);  $$ = obj;  
                                                                      
                         }
                         ;
opt_only:      {
                   $$ = dyn::nil();                                            
               }
               | KW_ONLY {
                   $$ = $1;                                            
               }
               ;
update_stats_resolution:      {
                                  $$ = dyn::nil();                              
                                               
                              }
                              | KW_DROP_DISTRIBUTIONS {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)1)); 
                                  dyn::field(obj,"DropDistributions",$1); 
                                  $$ = obj;                              
                                               
                              }
                              | KW_RESOLUTION const_dec_expr opt_const_dec_expr
                              opt_distributions {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)2)); 
                                  dyn::field(obj,"Resolution",$1); 
                                  dyn::field(obj,"constDecExpr",$2); 
                                  dyn::field(obj,"optConstDecExpr",$3); 
                                  dyn::field(obj,"optDistributions",$4); 
                                  $$ = obj;                              
                                               
                              }
                              ;
opt_distributions:      {
                            $$ = dyn::nil();                              
                                         
                        }
                        | KW_DISTRIBUTIONS_ONLY {
                            $$ = $1;                                            
                        }
                        ;
opt_column_list:      {
                          $$ = dyn::nil();                              
                                       
                      }
                      | KW_LPARENTHESIS column_list KW_RPARENTHESIS {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Lparenthesis",$1); 
                          dyn::field(obj,"columnList",$2); 
                          dyn::field(obj,"Rparenthesis",$3);  $$ = obj;  
                                                                   
                      }
                      ;
opt_execute_on:      {
                         $$ = dyn::nil();                              
                                      
                     }
                     | KW_EXECUTE KW_ON {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Execute",$1);  dyn::field(obj,"On",$2);
                          $$ = obj;                                            
                     }
                     ;
references:      {
                     $$ = dyn::nil();                              
                                  
                 }
                 | KW_REFERENCES table_name opt_col_list opt_on_delete {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"References",$1); 
                     dyn::field(obj,"tableName",$2); 
                     dyn::field(obj,"optColList",$3); 
                     dyn::field(obj,"optOnDelete",$4);  $$ = obj;  
                                                              
                 }
                 ;
opt_on_delete:      {
                        $$ = dyn::nil();                              
                                     
                    }
                    | KW_ON_DELETE_CASCADE {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"OnDeleteCascade",$1);  $$ = obj;  
                                                                 
                    }
                    | KW_ON_DELETE_RESTRICT {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)2)); 
                        dyn::field(obj,"OnDeleteRestrict",$1);  $$ = obj;  
                                                                 
                    }
                    ;
opt_col_list:      {
                       $$ = dyn::nil();                              
                                    
                   }
                   | KW_LPARENTHESIS column_list KW_RPARENTHESIS {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Lparenthesis",$1); 
                       dyn::field(obj,"columnList",$2); 
                       dyn::field(obj,"Rparenthesis",$3);  $$ = obj;  
                                                                
                   }
                   ;
rename_stmt:      KW_RENAME KW_COLUMN column_id KW_TO identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Rename",$1);  dyn::field(obj,"Column",$2);
                       dyn::field(obj,"columnId",$3);  dyn::field(obj,"To",$4); 
                      dyn::field(obj,"identifier",$5);  $$ = obj;  
                                                               
                  }
                  | KW_RENAME KW_TABLE identifier KW_TO identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Rename",$1);  dyn::field(obj,"Table",$2); 
                      dyn::field(obj,"identifier",$3);  dyn::field(obj,"To",$4);
                       dyn::field(obj,"identifier1",$5);  $$ = obj;  
                                                               
                  }
                  | KW_RENAME KW_DATABASE database_id KW_TO database_id {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"Rename",$1); 
                      dyn::field(obj,"Database",$2); 
                      dyn::field(obj,"databaseId",$3);  dyn::field(obj,"To",$4);
                       dyn::field(obj,"databaseId1",$5);  $$ = obj;  
                                                               
                  }
                  ;
revoke_stmt:      KW_REVOKE db_privilege KW_FROM user_list {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Revoke",$1); 
                      dyn::field(obj,"dbPrivilege",$2); 
                      dyn::field(obj,"From",$3);  dyn::field(obj,"userList",$4);
                       $$ = obj;                                            
                  }
                  | KW_REVOKE table_privilege KW_ON table_id KW_FROM user_list
                  revoke_options {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Revoke",$1); 
                      dyn::field(obj,"tablePrivilege",$2); 
                      dyn::field(obj,"On",$3);  dyn::field(obj,"tableId",$4); 
                      dyn::field(obj,"From",$5);  dyn::field(obj,"userList",$6);
                       dyn::field(obj,"revokeOptions",$7);  $$ = obj;  
                                                               
                  }
                  | KW_REVOKE opt_execute_on lcase_identifier KW_FROM user_list
                  {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"Revoke",$1); 
                      dyn::field(obj,"optExecuteOn",$2); 
                      dyn::field(obj,"lcaseIdentifier",$3); 
                      dyn::field(obj,"From",$4);  dyn::field(obj,"userList",$5);
                       $$ = obj;                                            
                  }
                  ;
revoke_options:      {
                         $$ = dyn::nil();                              
                                      
                     }
                     | KW_CASCADE {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Cascade",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_RESTRICT {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"Restrict",$1);  $$ = obj;  
                                                                  
                     }
                     ;
sql_block:      KW_SQL sql_block_body KW_END_SQL {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"Sql",$1); 
                    dyn::field(obj,"sqlBlockBody",$2); 
                    dyn::field(obj,"EndSql",$3);  $$ = obj;                
                                               
                }
                ;
sql_block_body:      most_tokens {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"mostTokens",$1);  $$ = obj;  
                                                                  
                     }
                     | sql_block_body most_tokens {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"sqlBlockBody",$1); 
                         dyn::field(obj,"mostTokens",$2);  $$ = obj;  
                                                                  
                     }
                     | sql_block_body KW_INTO {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"sqlBlockBody",$1); 
                         dyn::field(obj,"Into",$2);  $$ = obj;                
                                                    
                     }
                     | sql_block_body KW_INTO sql_block_bind_list {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)3)); 
                         dyn::field(obj,"sqlBlockBody",$1); 
                         dyn::field(obj,"Into",$2); 
                         dyn::field(obj,"sqlBlockBindList",$3);  $$ = obj;  
                                                                  
                     }
                     | sql_block_body '$' lvalue {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)4)); 
                         dyn::field(obj,"sqlBlockBody",$1); 
                         dyn::field(obj,"DollarSign",$2); 
                         dyn::field(obj,"lvalue",$3);  $$ = obj;                
                                                    
                     }
                     | sql_block_body '?' {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)5)); 
                         dyn::field(obj,"sqlBlockBody",$1); 
                         dyn::field(obj,"QuestionSign",$2);  $$ = obj;  
                                                                  
                     }
                     ;
most_tokens:      '<' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"LessthanSign",$1);  $$ = obj;  
                                                               
                  }
                  | KW_EQ {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Eq",$1);  $$ = obj;                
                                                 
                  }
                  | '>' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"GreaterthanSign",$1);  $$ = obj;  
                                                               
                  }
                  | '-' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)3)); 
                      dyn::field(obj,"MinusSign",$1);  $$ = obj;                
                                                 
                  }
                  | ';' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)4)); 
                      dyn::field(obj,"SemicolonSign",$1);  $$ = obj;  
                                                               
                  }
                  | ':' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)5)); 
                      dyn::field(obj,"ColonSign",$1);  $$ = obj;                
                                                 
                  }
                  | KW_DIV {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)6)); 
                      dyn::field(obj,"Div",$1);  $$ = obj;                
                                                 
                  }
                  | '.' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)7)); 
                      dyn::field(obj,"DotSign",$1);  $$ = obj;                
                                                 
                  }
                  | KW_LPARENTHESIS {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)8)); 
                      dyn::field(obj,"Lparenthesis",$1);  $$ = obj;  
                                                               
                  }
                  | KW_RPARENTHESIS {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)9)); 
                      dyn::field(obj,"Rparenthesis",$1);  $$ = obj;  
                                                               
                  }
                  | '[' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)10)); 
                      dyn::field(obj,"LeftSquareParen",$1);  $$ = obj;  
                                                               
                  }
                  | ']' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)11)); 
                      dyn::field(obj,"RightSquareParen",$1);  $$ = obj;  
                                                               
                  }
                  | '@' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)12)); 
                      dyn::field(obj,"AtSign",$1);  $$ = obj;                
                                                 
                  }
                  | '*' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)13)); 
                      dyn::field(obj,"MultiplicationSign",$1);  $$ = obj;  
                                                               
                  }
                  | '+' {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)14)); 
                      dyn::field(obj,"PlusSign",$1);  $$ = obj;                
                                                 
                  }
                  | KW_COMMA {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)15)); 
                      dyn::field(obj,"Comma",$1);  $$ = obj;                
                                                 
                  }
                  | KW_GE {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)16)); 
                      dyn::field(obj,"Ge",$1);  $$ = obj;                
                                                 
                  }
                  | KW_LE {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)17)); 
                      dyn::field(obj,"Le",$1);  $$ = obj;                
                                                 
                  }
                  | KW_NE {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)18)); 
                      dyn::field(obj,"Ne",$1);  $$ = obj;                
                                                 
                  }
                  | KW_STRCAT {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)19)); 
                      dyn::field(obj,"Strcat",$1);  $$ = obj;                
                                                 
                  }
                  | KW_POW {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)20)); 
                      dyn::field(obj,"Pow",$1);  $$ = obj;                
                                                 
                  }
                  | KW_HINT {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)21)); 
                      dyn::field(obj,"Hint",$1);  $$ = obj;                
                                                 
                  }
                  | KW_STRCON {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)22)); 
                      dyn::field(obj,"Strcon",$1);  $$ = obj;                
                                                 
                  }
                  | KW_DECCON {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)23)); 
                      dyn::field(obj,"Deccon",$1);  $$ = obj;                
                                                 
                  }
                  | KW_INTCON {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)24)); 
                      dyn::field(obj,"Intcon",$1);  $$ = obj;                
                                                 
                  }
                  | identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)25)); 
                      dyn::field(obj,"identifier",$1);  $$ = obj;  
                                                               
                  }
                  ;
sql_hostvar:      '$' lvalue {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"DollarSign",$1); 
                      dyn::field(obj,"lvalue",$2);  $$ = obj;                
                                                 
                  }
                  ;
sql_block_bind_list:      sql_hostvar {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"sqlHostvar",$1);  $$ = obj;  
                                                                       
                          }
                          | sql_block_bind_list KW_COMMA sql_hostvar {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)1)); 
                              dyn::field(obj,"sqlBlockBindList",$1); 
                              dyn::field(obj,"Comma",$2); 
                              dyn::field(obj,"sqlHostvar",$3);  $$ = obj;  
                                                                       
                          }
                          ;
sqlcore:      sqlcore_def {
                  $$ = $1;                                            
              }
              ;
sqlcore_def:      select_stmt {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"selectStmt",$1);  $$ = obj;  
                                                               
                  }
                  | insert_stmt {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"insertStmt",$1);  $$ = obj;  
                                                               
                  }
                  | update_stmt {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"updateStmt",$1);  $$ = obj;  
                                                               
                  }
                  | transaction_stmt {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)3)); 
                      dyn::field(obj,"transactionStmt",$1);  $$ = obj;  
                                                               
                  }
                  | ddl_stmt {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)4)); 
                      dyn::field(obj,"ddlStmt",$1);  $$ = obj;                
                                                 
                  }
                  | delete_stmt {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)5)); 
                      dyn::field(obj,"deleteStmt",$1);  $$ = obj;  
                                                               
                  }
                  | execute_procedure_stmt {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)6)); 
                      dyn::field(obj,"executeProcedureStmt",$1);  $$ = obj;  
                                                               
                  }
                  | sql_block {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)7)); 
                      dyn::field(obj,"sqlBlock",$1);  $$ = obj;                
                                                 
                  }
                  ;
create_synonym:      KW_CREATE public KW_SYNONYM table_name KW_FOR table_name {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"Create",$1); 
                         dyn::field(obj,"public",$2); 
                         dyn::field(obj,"Synonym",$3); 
                         dyn::field(obj,"tableName",$4); 
                         dyn::field(obj,"For",$5); 
                         dyn::field(obj,"tableName1",$6);  $$ = obj;  
                                                                  
                     }
                     ;
public:      {
                 $$ = dyn::nil();                                            
             }
             | KW_PUBLIC {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)1)); 
                 dyn::field(obj,"Public",$1);  $$ = obj;                
                                            
             }
             | KW_PRIVATE {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)2)); 
                 dyn::field(obj,"Private",$1);  $$ = obj;                
                                            
             }
             ;
table_constraint:      KW_FOREIGN KW_KEY KW_LPARENTHESIS column_list
                       KW_RPARENTHESIS references constraint_name
                       constraint_mode {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"Foreign",$1); 
                           dyn::field(obj,"Key",$2); 
                           dyn::field(obj,"Lparenthesis",$3); 
                           dyn::field(obj,"columnList",$4); 
                           dyn::field(obj,"Rparenthesis",$5); 
                           dyn::field(obj,"references",$6); 
                           dyn::field(obj,"constraintName",$7); 
                           dyn::field(obj,"constraintMode",$8);  $$ = obj;  
                                                                    
                       }
                       | KW_PRIMARY KW_KEY KW_LPARENTHESIS column_list
                       KW_RPARENTHESIS constraint_name constraint_mode {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"Primary",$1); 
                           dyn::field(obj,"Key",$2); 
                           dyn::field(obj,"Lparenthesis",$3); 
                           dyn::field(obj,"columnList",$4); 
                           dyn::field(obj,"Rparenthesis",$5); 
                           dyn::field(obj,"constraintName",$6); 
                           dyn::field(obj,"constraintMode",$7);  $$ = obj;  
                                                                    
                       }
                       | KW_UNIQUE KW_LPARENTHESIS column_list KW_RPARENTHESIS
                       constraint_name constraint_mode {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)2)); 
                           dyn::field(obj,"Unique",$1); 
                           dyn::field(obj,"Lparenthesis",$2); 
                           dyn::field(obj,"columnList",$3); 
                           dyn::field(obj,"Rparenthesis",$4); 
                           dyn::field(obj,"constraintName",$5); 
                           dyn::field(obj,"constraintMode",$6);  $$ = obj;  
                                                                    
                       }
                       | KW_DISTINCT KW_LPARENTHESIS column_list KW_RPARENTHESIS
                       constraint_name constraint_mode {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)3)); 
                           dyn::field(obj,"Distinct",$1); 
                           dyn::field(obj,"Lparenthesis",$2); 
                           dyn::field(obj,"columnList",$3); 
                           dyn::field(obj,"Rparenthesis",$4); 
                           dyn::field(obj,"constraintName",$5); 
                           dyn::field(obj,"constraintMode",$6);  $$ = obj;  
                                                                    
                       }
                       | KW_CHECK KW_LPARENTHESIS expr KW_RPARENTHESIS
                       constraint_name constraint_mode {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)4)); 
                           dyn::field(obj,"Check",$1); 
                           dyn::field(obj,"Lparenthesis",$2); 
                           dyn::field(obj,"expr",$3); 
                           dyn::field(obj,"Rparenthesis",$4); 
                           dyn::field(obj,"constraintName",$5); 
                           dyn::field(obj,"constraintMode",$6);  $$ = obj;  
                                                                    
                       }
                       ;
table_privilege:      KW_ALL opt_privilege {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"All",$1); 
                          dyn::field(obj,"optPrivilege",$2);  $$ = obj;  
                                                                   
                      }
                      | priv_list {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"privList",$1);  $$ = obj;  
                                                                   
                      }
                      ;
opt_privilege:      {
                        $$ = dyn::nil();                              
                                     
                    }
                    | KW_PRIVILEGES {
                        $$ = $1;                                            
                    }
                    ;
priv_list:      privilege_type {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"privilegeType",$1);  $$ = obj;  
                                                             
                }
                | priv_list KW_COMMA privilege_type {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"privList",$1);  dyn::field(obj,"Comma",$2); 
                    dyn::field(obj,"privilegeType",$3);  $$ = obj;  
                                                             
                }
                ;
privilege_type:      KW_INSERT {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"Insert",$1);  $$ = obj;                
                                                    
                     }
                     | KW_DELETE {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Delete",$1);  $$ = obj;                
                                                    
                     }
                     | KW_SELECT opt_column_list {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"Select",$1); 
                         dyn::field(obj,"optColumnList",$2);  $$ = obj;  
                                                                  
                     }
                     | KW_UPDATE opt_column_list {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)3)); 
                         dyn::field(obj,"Update",$1); 
                         dyn::field(obj,"optColumnList",$2);  $$ = obj;  
                                                                  
                     }
                     | KW_REFERENCES opt_column_list {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)4)); 
                         dyn::field(obj,"References",$1); 
                         dyn::field(obj,"optColumnList",$2);  $$ = obj;  
                                                                  
                     }
                     | KW_INDEX {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)5)); 
                         dyn::field(obj,"Index",$1);  $$ = obj;                
                                                    
                     }
                     | KW_ALTER {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)6)); 
                         dyn::field(obj,"Alter",$1);  $$ = obj;                
                                                    
                     }
                     ;
transaction_stmt:      KW_BEGIN KW_WORK {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"Begin",$1); 
                           dyn::field(obj,"Work",$2);  $$ = obj;                
                                                      
                       }
                       | KW_COMMIT KW_WORK {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"Commit",$1); 
                           dyn::field(obj,"Work",$2);  $$ = obj;                
                                                      
                       }
                       | KW_ROLLBACK KW_WORK {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)2)); 
                           dyn::field(obj,"Rollback",$1); 
                           dyn::field(obj,"Work",$2);  $$ = obj;                
                                                      
                       }
                       | KW_SAVEPOINT KW_IDENTIFIER opt_sp_unique {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)3)); 
                           dyn::field(obj,"Savepoint",$1); 
                           dyn::field(obj,"Identifier",$2); 
                           dyn::field(obj,"optSpUnique",$3);  $$ = obj;  
                                                                    
                       }
                       | KW_ROLLBACK KW_WORK KW_TO KW_SAVEPOINT opt_spname {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)4)); 
                           dyn::field(obj,"Rollback",$1); 
                           dyn::field(obj,"Work",$2);  dyn::field(obj,"To",$3); 
                           dyn::field(obj,"Savepoint",$4); 
                           dyn::field(obj,"optSpname",$5);  $$ = obj;  
                                                                    
                       }
                       | KW_RELEASE KW_SAVEPOINT KW_IDENTIFIER {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)5)); 
                           dyn::field(obj,"Release",$1); 
                           dyn::field(obj,"Savepoint",$2); 
                           dyn::field(obj,"Identifier",$3);  $$ = obj;  
                                                                    
                       }
                       | KW_SET KW_LOCK_MODE KW_TO lock_stat {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)6)); 
                           dyn::field(obj,"Set",$1); 
                           dyn::field(obj,"LockMode",$2); 
                           dyn::field(obj,"To",$3); 
                           dyn::field(obj,"lockStat",$4);  $$ = obj;  
                                                                    
                       }
                       | KW_LOCK KW_TABLE table_name KW_IN lock_type KW_MODE {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)7)); 
                           dyn::field(obj,"Lock",$1); 
                           dyn::field(obj,"Table",$2); 
                           dyn::field(obj,"tableName",$3); 
                           dyn::field(obj,"In",$4); 
                           dyn::field(obj,"lockType",$5); 
                           dyn::field(obj,"Mode",$6);  $$ = obj;                
                                                      
                       }
                       | KW_UNLOCK KW_TABLE table_name {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)8)); 
                           dyn::field(obj,"Unlock",$1); 
                           dyn::field(obj,"Table",$2); 
                           dyn::field(obj,"tableName",$3);  $$ = obj;  
                                                                    
                       }
                       | KW_SET KW_EXPLAIN on_off {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)9)); 
                           dyn::field(obj,"Set",$1); 
                           dyn::field(obj,"Explain",$2); 
                           dyn::field(obj,"onOff",$3);  $$ = obj;  
                                                                    
                       }
                       | KW_SET KW_ISOLATION KW_TO isol_level {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)10)); 
                           dyn::field(obj,"Set",$1); 
                           dyn::field(obj,"Isolation",$2); 
                           dyn::field(obj,"To",$3); 
                           dyn::field(obj,"isolLevel",$4);  $$ = obj;  
                                                                    
                       }
                       ;
opt_sp_unique:      {
                        $$ = dyn::nil();                              
                                     
                    }
                    | KW_UNIQUE {
                        $$ = $1;                                            
                    }
                    ;
opt_spname:      {
                     $$ = dyn::nil();                              
                                  
                 }
                 | KW_IDENTIFIER {
                     $$ = $1;                                            
                 }
                 ;
lock_stat:      KW_WAIT %prec KW_LOWEST {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"Wait",$1);  $$ = obj;                
                                               
                }
                | KW_WAIT const_int_expr {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Wait",$1); 
                    dyn::field(obj,"constIntExpr",$2);  $$ = obj;  
                                                             
                }
                | KW_NOT KW_WAIT {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)2)); 
                    dyn::field(obj,"Not",$1);  dyn::field(obj,"Wait",$2); 
                    $$ = obj;                                            
                }
                ;
lock_type:      KW_SHARE {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"Share",$1);  $$ = obj;                
                                               
                }
                | KW_EXCLUSIVE {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Exclusive",$1);  $$ = obj;                
                                               
                }
                ;
on_off:      KW_ON {
                 dyn::ptr_t obj = dyn::createObject();  dyn::field(obj,"On",$1);
                  $$ = obj;                                            
             }
             | KW_OFF {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)1)); 
                 dyn::field(obj,"Off",$1);  $$ = obj;                
                                            
             }
             ;
isol_level:      KW_DIRTY KW_READ {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"Dirty",$1);  dyn::field(obj,"Read",$2); 
                     $$ = obj;                                            
                 }
                 | KW_COMMITTED KW_READ {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"Committed",$1);  dyn::field(obj,"Read",$2);
                      $$ = obj;                                            
                 }
                 | KW_CURSOR KW_STABILITY {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)2)); 
                     dyn::field(obj,"Cursor",$1); 
                     dyn::field(obj,"Stability",$2);  $$ = obj;                
                                                
                 }
                 | KW_REPEATABLE KW_READ {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)3)); 
                     dyn::field(obj,"Repeatable",$1); 
                     dyn::field(obj,"Read",$2);  $$ = obj;                
                                                
                 }
                 ;
unique:      {
                 $$ = dyn::nil();                                            
             }
             | KW_UNIQUE {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)1)); 
                 dyn::field(obj,"Unique",$1);  $$ = obj;                
                                            
             }
             | KW_DISTINCT {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)2)); 
                 dyn::field(obj,"Distinct",$1);  $$ = obj;                
                                            
             }
             ;
update_stmt:      KW_UPDATE begin_sql table_name KW_SET update_action
                  where_clause {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Update",$1); 
                      dyn::field(obj,"beginSql",$2); 
                      dyn::field(obj,"tableName",$3);  dyn::field(obj,"Set",$4);
                       dyn::field(obj,"updateAction",$5); 
                      dyn::field(obj,"whereClause",$6);  $$ = obj;  
                                                 SetSqlTokens(0);              
                  }
                  ;
update_action:      mupdate_setval_list {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"mupdateSetvalList",$1);  $$ = obj;  
                                                                 
                    }
                    | update_setval_list {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"updateSetvalList",$1);  $$ = obj;  
                                                                 
                    }
                    ;
mupdate_setval_list:      mupdate_lvalue KW_EQ mupdate_rvalue {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"mupdateLvalue",$1); 
                              dyn::field(obj,"Eq",$2); 
                              dyn::field(obj,"mupdateRvalue",$3);  $$ = obj;  
                                                                       
                          }
                          ;
update_setval_list:      update_setval_list_entry {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"updateSetvalListEntry",$1); 
                             $$ = obj;                              
                                          
                         }
                         | update_setval_list KW_COMMA update_setval_list_entry
                         {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"updateSetvalList",$1); 
                             dyn::field(obj,"Comma",$2); 
                             dyn::field(obj,"updateSetvalListEntry",$3); 
                             $$ = obj;                              
                                          
                         }
                         ;
update_setval_list_entry:      update_lvalue KW_EQ update_rvalue {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"updateLvalue",$1); 
                                   dyn::field(obj,"Eq",$2); 
                                   dyn::field(obj,"updateRvalue",$3);  $$ = obj;
                                                                              
                               }
                               ;
update_lvalue:      column_id opt_index {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"columnId",$1); 
                        dyn::field(obj,"optIndex",$2);  $$ = obj;  
                                                                 
                    }
                    ;
update_rvalue:      expr %prec KW_HIGHEST {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"expr",$1);  $$ = obj;                
                                                   
                    }
                    | select_stmt {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"selectStmt",$1);  $$ = obj;  
                                                                 
                    }
                    ;
update_lvalue_list:      update_lvalue_list KW_COMMA update_lvalue {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"updateLvalueList",$1); 
                             dyn::field(obj,"Comma",$2); 
                             dyn::field(obj,"updateLvalue",$3);  $$ = obj;  
                                                                      
                         }
                         | update_lvalue {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"$",dyn::val((int)1)); 
                             dyn::field(obj,"updateLvalue",$1);  $$ = obj;  
                                                                      
                         }
                         ;
mupdate_lvalue:      KW_LPARENTHESIS update_lvalue_list KW_RPARENTHESIS {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"Lparenthesis",$1); 
                         dyn::field(obj,"updateLvalueList",$2); 
                         dyn::field(obj,"Rparenthesis",$3);  $$ = obj;  
                                                                  
                     }
                     | '*' {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"MultiplicationSign",$1);  $$ = obj;  
                                                                  
                     }
                     | lcase_identifier KW_DOTSTAR {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"lcaseIdentifier",$1); 
                         dyn::field(obj,"Dotstar",$2);  $$ = obj;  
                                                                  
                     }
                     ;
mupdate_rvalue:      lvalue {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"lvalue",$1);  $$ = obj;                
                                                    
                     }
                     | lvalue KW_THRU lvalue {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"lvalue",$1); 
                         dyn::field(obj,"Thru",$2); 
                         dyn::field(obj,"lvalue1",$3);  $$ = obj;  
                                                                  
                     }
                     | KW_LPARENTHESIS expr_list KW_RPARENTHESIS {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"Lparenthesis",$1); 
                         dyn::field(obj,"exprList",$2); 
                         dyn::field(obj,"Rparenthesis",$3);  $$ = obj;  
                                                                  
                     }
                     ;
opt_index:      {
                    $$ = dyn::nil();                                            
                }
                | '[' expr_list ']' {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"LeftSquareParen",$1); 
                    dyn::field(obj,"exprList",$2); 
                    dyn::field(obj,"RightSquareParen",$3);  $$ = obj;  
                                                             
                }
                ;
user_list:      KW_PUBLIC {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"Public",$1);  $$ = obj;                
                                               
                }
                | user_name_list {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"userNameList",$1);  $$ = obj;  
                                                             
                }
                ;
user_name_list:      user_name {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"userName",$1);  $$ = obj;  
                                                                  
                     }
                     | user_name_list KW_COMMA user_name {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"userNameList",$1); 
                         dyn::field(obj,"Comma",$2); 
                         dyn::field(obj,"userName",$3);  $$ = obj;  
                                                                  
                     }
                     ;
user_name:      identifier {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"identifier",$1);  $$ = obj;                
                                               
                }
                | KW_STRCON {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"Strcon",$1);  $$ = obj;                
                                               
                }
                ;
create_procedure_from_stmt:      KW_CREATE KW_PROCEDURE KW_FROM string_expr {
                                     dyn::ptr_t obj = dyn::createObject(); 
                                     dyn::field(obj,"Create",$1); 
                                     dyn::field(obj,"Procedure",$2); 
                                     dyn::field(obj,"From",$3); 
                                     dyn::field(obj,"stringExpr",$4);  $$ = obj;
                                                                                
                                 }
                                 ;
cursor_stmt:      KW_OPEN cursor_expr opt_using {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Open",$1); 
                      dyn::field(obj,"cursorExpr",$2); 
                      dyn::field(obj,"optUsing",$3);  $$ = obj;                
                                                 
                  }
                  | KW_CLOSE cursor_expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Close",$1); 
                      dyn::field(obj,"cursorExpr",$2);  $$ = obj;  
                                                               
                  }
                  | KW_FETCH opt_fetch_type cursor_expr opt_into {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"Fetch",$1); 
                      dyn::field(obj,"optFetchType",$2); 
                      dyn::field(obj,"cursorExpr",$3); 
                      dyn::field(obj,"optInto",$4);  $$ = obj;                
                                                 
                  }
                  | execute_stmt {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)3)); 
                      dyn::field(obj,"executeStmt",$1);  $$ = obj;  
                                                               
                  }
                  | KW_PUT cursor_expr opt_from {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)4)); 
                      dyn::field(obj,"Put",$1); 
                      dyn::field(obj,"cursorExpr",$2); 
                      dyn::field(obj,"optFrom",$3);  $$ = obj;                
                                                 
                  }
                  | KW_FLUSH cursor_expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)5)); 
                      dyn::field(obj,"Flush",$1); 
                      dyn::field(obj,"cursorExpr",$2);  $$ = obj;  
                                                               
                  }
                  | KW_FREE expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)6)); 
                      dyn::field(obj,"Free",$1);  dyn::field(obj,"expr",$2); 
                      $$ = obj;                                            
                  }
                  | KW_FREE KW_OBJECT KW_LPARENTHESIS cursor_expr
                  KW_RPARENTHESIS {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)7)); 
                      dyn::field(obj,"Free",$1);  dyn::field(obj,"Object",$2); 
                      dyn::field(obj,"Lparenthesis",$3); 
                      dyn::field(obj,"cursorExpr",$4); 
                      dyn::field(obj,"Rparenthesis",$5);  $$ = obj;  
                                                               
                  }
                  | KW_EXECUTE KW_IMMEDIATE string_expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)8)); 
                      dyn::field(obj,"Execute",$1); 
                      dyn::field(obj,"Immediate",$2); 
                      dyn::field(obj,"stringExpr",$3);  $$ = obj;  
                                                               
                  }
                  ;
execute_stmt:      KW_EXECUTE execute_cursor_expr into_ex using_ex {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"Execute",$1); 
                       dyn::field(obj,"executeCursorExpr",$2); 
                       dyn::field(obj,"intoEx",$3); 
                       dyn::field(obj,"usingEx",$4);  $$ = obj;                
                                                  
                   }
                   | KW_EXECUTE execute_cursor_expr using_ex into_ex {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Execute",$1); 
                       dyn::field(obj,"executeCursorExpr",$2); 
                       dyn::field(obj,"usingEx",$3); 
                       dyn::field(obj,"intoEx",$4);  $$ = obj;                
                                                  
                   }
                   | KW_EXECUTE execute_cursor_expr into_ex {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"Execute",$1); 
                       dyn::field(obj,"executeCursorExpr",$2); 
                       dyn::field(obj,"intoEx",$3);  $$ = obj;                
                                                  
                   }
                   | KW_EXECUTE execute_cursor_expr using_ex {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)3)); 
                       dyn::field(obj,"Execute",$1); 
                       dyn::field(obj,"executeCursorExpr",$2); 
                       dyn::field(obj,"usingEx",$3);  $$ = obj;                
                                                  
                   }
                   | KW_EXECUTE execute_cursor_expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)4)); 
                       dyn::field(obj,"Execute",$1); 
                       dyn::field(obj,"executeCursorExpr",$2);  $$ = obj;  
                                                                
                   }
                   ;
into_ex:      KW_INTO lvalue_list {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"Into",$1);  dyn::field(obj,"lvalueList",$2); 
                  $$ = obj;                                            
              }
              ;
using_ex:      KW_USING expr_list {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"Using",$1);  dyn::field(obj,"exprList",$2); 
                   $$ = obj;                                            
               }
               ;
opt_fetch_type:      {
                         $$ = dyn::nil();                              
                                      
                     }
                     | KW_FIRST {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"First",$1);  $$ = obj;                
                                                    
                     }
                     | KW_CURRENT {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"Current",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_LAST {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)3)); 
                         dyn::field(obj,"Last",$1);  $$ = obj;                
                                                    
                     }
                     | KW_NEXT {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)4)); 
                         dyn::field(obj,"Next",$1);  $$ = obj;                
                                                    
                     }
                     | KW_PREVIOUS {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)5)); 
                         dyn::field(obj,"Previous",$1);  $$ = obj;  
                                                                  
                     }
                     | KW_PRIOR {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)6)); 
                         dyn::field(obj,"Prior",$1);  $$ = obj;                
                                                    
                     }
                     | KW_RELATIVE int_expr {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)7)); 
                         dyn::field(obj,"Relative",$1); 
                         dyn::field(obj,"intExpr",$2);  $$ = obj;  
                                                                  
                     }
                     | KW_ABSOLUTE int_expr {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)8)); 
                         dyn::field(obj,"Absolute",$1); 
                         dyn::field(obj,"intExpr",$2);  $$ = obj;  
                                                                  
                     }
                     ;
declare_stmt:      KW_DECLARE cursor_expr opt_native opt_scroll KW_CURSOR
                   opt_hold KW_FOR prepare_expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"Declare",$1); 
                       dyn::field(obj,"cursorExpr",$2); 
                       dyn::field(obj,"optNative",$3); 
                       dyn::field(obj,"optScroll",$4); 
                       dyn::field(obj,"Cursor",$5); 
                       dyn::field(obj,"optHold",$6);  dyn::field(obj,"For",$7); 
                       dyn::field(obj,"prepareExpr",$8);  $$ = obj;  
                                                                
                   }
                   | KW_DECLARE cursor_expr opt_native opt_scroll KW_CURSOR
                   opt_hold KW_FOR sqlcore {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Declare",$1); 
                       dyn::field(obj,"cursorExpr",$2); 
                       dyn::field(obj,"optNative",$3); 
                       dyn::field(obj,"optScroll",$4); 
                       dyn::field(obj,"Cursor",$5); 
                       dyn::field(obj,"optHold",$6);  dyn::field(obj,"For",$7); 
                       dyn::field(obj,"sqlcore",$8);  $$ = obj;                
                                                  
                   }
                   | KW_DECLARE cursor_expr opt_native opt_scroll KW_CURSOR
                   opt_hold KW_FROM string_expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"Declare",$1); 
                       dyn::field(obj,"cursorExpr",$2); 
                       dyn::field(obj,"optNative",$3); 
                       dyn::field(obj,"optScroll",$4); 
                       dyn::field(obj,"Cursor",$5); 
                       dyn::field(obj,"optHold",$6);  dyn::field(obj,"From",$7);
                        dyn::field(obj,"stringExpr",$8);  $$ = obj;  
                                                                
                   }
                   ;
opt_native:      {
                     $$ = dyn::nil();                              
                                  
                 }
                 | KW_NATIVE {
                     $$ = $1;                                            
                 }
                 ;
opt_scroll:      {
                     $$ = dyn::nil();                              
                                  
                 }
                 | KW_SCROLL {
                     $$ = $1;                                            
                 }
                 ;
opt_hold:      {
                   $$ = dyn::nil();                                            
               }
               | KW_WITH KW_HOLD {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"With",$1);  dyn::field(obj,"Hold",$2); 
                   $$ = obj;                                            
               }
               ;
opt_from:      {
                   $$ = dyn::nil();                                            
               }
               | from {
                   $$ = $1;                                            
               }
               ;
from:      KW_FROM expr_list {
               dyn::ptr_t obj = dyn::createObject();  dyn::field(obj,"From",$1);
                dyn::field(obj,"exprList",$2);  $$ = obj;                
                                          
           }
           ;
prepare_stmt:      KW_PREPARE opt_native_prepare prepare_name KW_FROM
                   string_expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"Prepare",$1); 
                       dyn::field(obj,"optNativePrepare",$2); 
                       dyn::field(obj,"prepareName",$3); 
                       dyn::field(obj,"From",$4); 
                       dyn::field(obj,"stringExpr",$5);  $$ = obj;  
                                                                
                   }
                   ;
opt_native_prepare:      {
                             $$ = dyn::nil();                              
                                          
                         }
                         | KW_NATIVE {
                             $$ = $1;                              
                                          
                         }
                         ;
sql_stmt:      declare_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"declareStmt",$1);  $$ = obj;                
                                              
               }
               | prepare_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"prepareStmt",$1);  $$ = obj;                
                                              
               }
               | cursor_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)2)); 
                   dyn::field(obj,"cursorStmt",$1);  $$ = obj;                
                                              
               }
               | sqlcore {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)3)); 
                   dyn::field(obj,"sqlcore",$1);  $$ = obj;                
                                              
               }
               | connection_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)4)); 
                   dyn::field(obj,"connectionStmt",$1);  $$ = obj;  
                                                            
               }
               | load_unload_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)5)); 
                   dyn::field(obj,"loadUnloadStmt",$1);  $$ = obj;  
                                                            
               }
               | create_procedure_from_stmt {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)6)); 
                   dyn::field(obj,"createProcedureFromStmt",$1);  $$ = obj;  
                                                            
               }
               ;
accept_cancel:      KW_ACCEPT opt_attrint {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"Accept",$1); 
                        dyn::field(obj,"optAttrint",$2);  $$ = obj;  
                                                                 
                    }
                    | KW_CANCEL opt_attrint {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Cancel",$1); 
                        dyn::field(obj,"optAttrint",$2);  $$ = obj;  
                                                                 
                    }
                    ;
options_elem:      KW_ON KW_CLOSE KW_APPLICATION close_action {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"On",$1);  dyn::field(obj,"Close",$2); 
                       dyn::field(obj,"Application",$3); 
                       dyn::field(obj,"closeAction",$4);  $$ = obj;  
                                                                
                   }
                   | KW_ON sig_name KW_SIGNAL KW_CALL identifier {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"On",$1);  dyn::field(obj,"sigName",$2); 
                       dyn::field(obj,"Signal",$3);  dyn::field(obj,"Call",$4); 
                       dyn::field(obj,"identifier",$5);  $$ = obj;  
                                                                
                   }
                   | KW_HELP KW_FILE expr %prec KW_LOWEST {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"Help",$1);  dyn::field(obj,"File",$2); 
                       dyn::field(obj,"expr",$3);  $$ = obj;                
                                                  
                   }
                   | KW_FIELD KW_ORDER KW_CONSTRAINED {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)3)); 
                       dyn::field(obj,"Field",$1);  dyn::field(obj,"Order",$2); 
                       dyn::field(obj,"Constrained",$3);  $$ = obj;  
                                                                
                   }
                   | KW_FIELD KW_ORDER KW_UNCONSTRAINED {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)4)); 
                       dyn::field(obj,"Field",$1);  dyn::field(obj,"Order",$2); 
                       dyn::field(obj,"Unconstrained",$3);  $$ = obj;  
                                                                
                   }
                   | KW_INPUT KW_WRAP {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)5)); 
                       dyn::field(obj,"Input",$1);  dyn::field(obj,"Wrap",$2); 
                       $$ = obj;                                            
                   }
                   | KW_INPUT KW_NO KW_WRAP {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)6)); 
                       dyn::field(obj,"Input",$1);  dyn::field(obj,"No",$2); 
                       dyn::field(obj,"Wrap",$3);  $$ = obj;                
                                                  
                   }
                   | KW_SQL KW_INTERRUPT KW_ON {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)7)); 
                       dyn::field(obj,"Sql",$1); 
                       dyn::field(obj,"Interrupt",$2);  dyn::field(obj,"On",$3);
                        $$ = obj;                                            
                   }
                   | KW_SQL KW_INTERRUPT KW_OFF {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)8)); 
                       dyn::field(obj,"Sql",$1); 
                       dyn::field(obj,"Interrupt",$2); 
                       dyn::field(obj,"Off",$3);  $$ = obj;                
                                                  
                   }
                   | KW_AUTOREFRESH int_expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)9)); 
                       dyn::field(obj,"Autorefresh",$1); 
                       dyn::field(obj,"intExpr",$2);  $$ = obj;                
                                                  
                   }
                   | logical_key KW_KEY input_field {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)10)); 
                       dyn::field(obj,"logicalKey",$1); 
                       dyn::field(obj,"Key",$2); 
                       dyn::field(obj,"inputField",$3);  $$ = obj;  
                                                                
                   }
                   | KW_DISPLAY KW_ATTRIBUTE KW_LPARENTHESIS attr_clause_value
                   KW_RPARENTHESIS {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)11)); 
                       dyn::field(obj,"Display",$1); 
                       dyn::field(obj,"Attribute",$2); 
                       dyn::field(obj,"Lparenthesis",$3); 
                       dyn::field(obj,"attrClauseValue",$4); 
                       dyn::field(obj,"Rparenthesis",$5);  $$ = obj;  
                                                                
                   }
                   | KW_INPUT KW_ATTRIBUTE KW_LPARENTHESIS attr_clause_value
                   KW_RPARENTHESIS {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)12)); 
                       dyn::field(obj,"Input",$1); 
                       dyn::field(obj,"Attribute",$2); 
                       dyn::field(obj,"Lparenthesis",$3); 
                       dyn::field(obj,"attrClauseValue",$4); 
                       dyn::field(obj,"Rparenthesis",$5);  $$ = obj;  
                                                                
                   }
                   | KW_PROMPT KW_LINE line_expr %prec KW_LOWEST {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)13)); 
                       dyn::field(obj,"Prompt",$1);  dyn::field(obj,"Line",$2); 
                       dyn::field(obj,"lineExpr",$3);  $$ = obj;                
                                                  
                   }
                   | KW_MESSAGE KW_LINE message_dest {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)14)); 
                       dyn::field(obj,"Message",$1);  dyn::field(obj,"Line",$2);
                        dyn::field(obj,"messageDest",$3);  $$ = obj;  
                                                                
                   }
                   | KW_MENU KW_LINE line_expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)15)); 
                       dyn::field(obj,"Menu",$1);  dyn::field(obj,"Line",$2); 
                       dyn::field(obj,"lineExpr",$3);  $$ = obj;                
                                                  
                   }
                   | KW_FORM KW_LINE line_expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)16)); 
                       dyn::field(obj,"Form",$1);  dyn::field(obj,"Line",$2); 
                       dyn::field(obj,"lineExpr",$3);  $$ = obj;                
                                                  
                   }
                   | KW_FIELD KW_ORDER KW_FORM {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)17)); 
                       dyn::field(obj,"Field",$1);  dyn::field(obj,"Order",$2); 
                       dyn::field(obj,"Form",$3);  $$ = obj;                
                                                  
                   }
                   | KW_ERROR KW_LINE message_dest {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)18)); 
                       dyn::field(obj,"Error",$1);  dyn::field(obj,"Line",$2); 
                       dyn::field(obj,"messageDest",$3);  $$ = obj;  
                                                                
                   }
                   | KW_COMMENT KW_LINE message_dest {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)19)); 
                       dyn::field(obj,"Comment",$1);  dyn::field(obj,"Line",$2);
                        dyn::field(obj,"messageDest",$3);  $$ = obj;  
                                                                
                   }
                   | KW_ACTIVATION KW_MODE activation_mode {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)20)); 
                       dyn::field(obj,"Activation",$1); 
                       dyn::field(obj,"Mode",$2); 
                       dyn::field(obj,"activationMode",$3);  $$ = obj;  
                                                                
                   }
                   ;
activation_mode:      KW_AUTO {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"Auto",$1);  $$ = obj;                
                                                     
                      }
                      | KW_DISABLED {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Disabled",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_ENABLED {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"Enabled",$1);  $$ = obj;  
                                                                   
                      }
                      ;
sig_name:      KW_TERMINATE {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"Terminate",$1);  $$ = obj;                
                                              
               }
               | KW_HANGUP {
                   dyn::ptr_t obj = dyn::createObject(); 
                   dyn::field(obj,"$",dyn::val((int)1)); 
                   dyn::field(obj,"Hangup",$1);  $$ = obj;                
                                              
               }
               ;
use_attr_from:      KW_FORM {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"Form",$1);  $$ = obj;                
                                                   
                    }
                    | KW_WINDOW {
                        dyn::ptr_t obj = dyn::createObject(); 
                        dyn::field(obj,"$",dyn::val((int)1)); 
                        dyn::field(obj,"Window",$1);  $$ = obj;                
                                                   
                    }
                    ;
color_list:      color_val {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"colorVal",$1);  $$ = obj;                
                                                
                 }
                 | color_list KW_COMMA color_val {
                     dyn::ptr_t obj = dyn::createObject(); 
                     dyn::field(obj,"$",dyn::val((int)1)); 
                     dyn::field(obj,"colorList",$1); 
                     dyn::field(obj,"Comma",$2);  dyn::field(obj,"colorVal",$3);
                      $$ = obj;                                            
                 }
                 ;
attr_clause_value:      color_list {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"colorList",$1);  $$ = obj;  
                                                                     
                        }
                        | use_attr_from {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"useAttrFrom",$1);  $$ = obj;  
                                                                     
                        }
                        ;
color_style_attr_list:      color_val {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"colorVal",$1);  $$ = obj;  
                                                                         
                            }
                            | color_style_attr_list KW_COMMA color_val {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"colorStyleAttrList",$1); 
                                dyn::field(obj,"Comma",$2); 
                                dyn::field(obj,"colorVal",$3);  $$ = obj;  
                                                                         
                            }
                            ;
color_style_attr_list_or_null:      %prec KW_LOWEST {
                                        $$ = dyn::nil();                
                                                                   
                                    }
                                    | color_style_attr_list {
                                        $$ = $1;                              
                                                     
                                    }
                                    ;
subset_attribute1:      KW_HELP KW_EQ int_expr {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"Help",$1);  dyn::field(obj,"Eq",$2);
                             dyn::field(obj,"intExpr",$3);  $$ = obj;  
                                                                     
                        }
                        | accept_cancel {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"acceptCancel",$1);  $$ = obj;  
                                                                     
                        }
                        ;
subset_attribute2:      KW_FIELD KW_ORDER KW_FORM {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"Field",$1); 
                            dyn::field(obj,"Order",$2); 
                            dyn::field(obj,"Form",$3);  $$ = obj;  
                                                                     
                        }
                        | KW_UNBUFFERED opt_unbuffered2 {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"Unbuffered",$1); 
                            dyn::field(obj,"optUnbuffered2",$2);  $$ = obj;  
                                                                     
                        }
                        ;
color_style_attributes:      KW_ATTRIBUTE KW_LPARENTHESIS
                             color_style_attr_list_or_null KW_RPARENTHESIS {
                                 dyn::ptr_t obj = dyn::createObject(); 
                                 dyn::field(obj,"Attribute",$1); 
                                 dyn::field(obj,"Lparenthesis",$2); 
                                 dyn::field(obj,"colorStyleAttrListOrNull",$3); 
                                 dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                          
                             }
                             | KW_ATTRIBUTES KW_LPARENTHESIS
                             color_style_attr_list_or_null KW_RPARENTHESIS {
                                 dyn::ptr_t obj = dyn::createObject(); 
                                 dyn::field(obj,"$",dyn::val((int)1)); 
                                 dyn::field(obj,"Attributes",$1); 
                                 dyn::field(obj,"Lparenthesis",$2); 
                                 dyn::field(obj,"colorStyleAttrListOrNull",$3); 
                                 dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                          
                             }
                             ;
close_action:      KW_STOP {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"Stop",$1);  $$ = obj;                
                                                  
                   }
                   | KW_CONTINUE {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Continue",$1);  $$ = obj;                
                                                  
                   }
                   | KW_CALL identifier {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"Call",$1); 
                       dyn::field(obj,"identifier",$2);  $$ = obj;  
                                                                
                   }
                   | KW_KEY input_field {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)3)); 
                       dyn::field(obj,"Key",$1); 
                       dyn::field(obj,"inputField",$2);  $$ = obj;  
                                                                
                   }
                   ;
color_attribute:      KW_BLACK {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"Black",$1);  $$ = obj;                
                                                     
                      }
                      | KW_BLUE {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Blue",$1);  $$ = obj;                
                                                     
                      }
                      | KW_CYAN {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"Cyan",$1);  $$ = obj;                
                                                     
                      }
                      | KW_GREEN {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)3)); 
                          dyn::field(obj,"Green",$1);  $$ = obj;                
                                                     
                      }
                      | KW_MAGENTA {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)4)); 
                          dyn::field(obj,"Magenta",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_RED {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)5)); 
                          dyn::field(obj,"Red",$1);  $$ = obj;                
                                                     
                      }
                      | KW_WHITE {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)6)); 
                          dyn::field(obj,"White",$1);  $$ = obj;                
                                                     
                      }
                      | KW_YELLOW {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)7)); 
                          dyn::field(obj,"Yellow",$1);  $$ = obj;  
                                                                   
                      }
                      ;
color_val:      color_attribute {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"colorAttribute",$1);  $$ = obj;  
                                                             
                }
                | style_attribute {
                    dyn::ptr_t obj = dyn::createObject(); 
                    dyn::field(obj,"$",dyn::val((int)1)); 
                    dyn::field(obj,"styleAttribute",$1);  $$ = obj;  
                                                             
                }
                ;
construct_attribute:      KW_NAME KW_EQ expr {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"Name",$1); 
                              dyn::field(obj,"Eq",$2); 
                              dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                       
                          }
                          | KW_FIELD KW_ORDER KW_FORM {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)1)); 
                              dyn::field(obj,"Field",$1); 
                              dyn::field(obj,"Order",$2); 
                              dyn::field(obj,"Form",$3);  $$ = obj;  
                                                                       
                          }
                          | subset_attribute1 {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)2)); 
                              dyn::field(obj,"subsetAttribute1",$1);  $$ = obj; 
                                                                        
                          }
                          | color_attribute {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)3)); 
                              dyn::field(obj,"colorAttribute",$1);  $$ = obj;  
                                                                       
                          }
                          | style_attribute {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)4)); 
                              dyn::field(obj,"styleAttribute",$1);  $$ = obj;  
                                                                       
                          }
                          ;
construct_attr_list:      construct_attribute {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"constructAttribute",$1); 
                              $$ = obj;                              
                                           
                          }
                          | construct_attr_list KW_COMMA construct_attribute {
                              dyn::ptr_t obj = dyn::createObject(); 
                              dyn::field(obj,"$",dyn::val((int)1)); 
                              dyn::field(obj,"constructAttrList",$1); 
                              dyn::field(obj,"Comma",$2); 
                              dyn::field(obj,"constructAttribute",$3); 
                              $$ = obj;                              
                                           
                          }
                          ;
construct_attr_list_or_null:      %prec KW_LOWEST {
                                      $$ = dyn::nil();                
                                                                 
                                  }
                                  | construct_attr_list {
                                      $$ = $1;                              
                                                   
                                  }
                                  ;
construct_attributes:      KW_ATTRIBUTE KW_LPARENTHESIS
                           construct_attr_list_or_null KW_RPARENTHESIS {
                               dyn::ptr_t obj = dyn::createObject(); 
                               dyn::field(obj,"Attribute",$1); 
                               dyn::field(obj,"Lparenthesis",$2); 
                               dyn::field(obj,"constructAttrListOrNull",$3); 
                               dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                        
                           }
                           | KW_ATTRIBUTES KW_LPARENTHESIS
                           construct_attr_list_or_null KW_RPARENTHESIS {
                               dyn::ptr_t obj = dyn::createObject(); 
                               dyn::field(obj,"$",dyn::val((int)1)); 
                               dyn::field(obj,"Attributes",$1); 
                               dyn::field(obj,"Lparenthesis",$2); 
                               dyn::field(obj,"constructAttrListOrNull",$3); 
                               dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                        
                           }
                           ;
display_array_attribute:      KW_UNBUFFERED opt_unbuffered2 {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"Unbuffered",$1); 
                                  dyn::field(obj,"optUnbuffered2",$2); 
                                  $$ = obj;                              
                                               
                              }
                              | KW_COUNT KW_EQ int_expr {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)1)); 
                                  dyn::field(obj,"Count",$1); 
                                  dyn::field(obj,"Eq",$2); 
                                  dyn::field(obj,"intExpr",$3);  $$ = obj;  
                                                                           
                              }
                              | KW_KEEP KW_CURRENT KW_ROW opt_attrint {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)2)); 
                                  dyn::field(obj,"Keep",$1); 
                                  dyn::field(obj,"Current",$2); 
                                  dyn::field(obj,"Row",$3); 
                                  dyn::field(obj,"optAttrint",$4);  $$ = obj;  
                                                                           
                              }
                              | KW_CURRENT KW_ROW KW_DISPLAY KW_EQ
                              string_expr_nolist {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)3)); 
                                  dyn::field(obj,"Current",$1); 
                                  dyn::field(obj,"Row",$2); 
                                  dyn::field(obj,"Display",$3); 
                                  dyn::field(obj,"Eq",$4); 
                                  dyn::field(obj,"stringExprNolist",$5); 
                                  $$ = obj;                              
                                               
                              }
                              | subset_attribute1 {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)4)); 
                                  dyn::field(obj,"subsetAttribute1",$1); 
                                  $$ = obj;                              
                                               
                              }
                              | color_attribute {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)5)); 
                                  dyn::field(obj,"colorAttribute",$1); 
                                  $$ = obj;                              
                                               
                              }
                              | style_attribute {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)6)); 
                                  dyn::field(obj,"styleAttribute",$1); 
                                  $$ = obj;                              
                                               
                              }
                              ;
display_array_attr_list:      display_array_attribute {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"displayArrayAttribute",$1); 
                                  $$ = obj;                              
                                               
                              }
                              | display_array_attr_list KW_COMMA
                              display_array_attribute {
                                  dyn::ptr_t obj = dyn::createObject(); 
                                  dyn::field(obj,"$",dyn::val((int)1)); 
                                  dyn::field(obj,"displayArrayAttrList",$1); 
                                  dyn::field(obj,"Comma",$2); 
                                  dyn::field(obj,"displayArrayAttribute",$3); 
                                  $$ = obj;                              
                                               
                              }
                              ;
display_array_attr_list_or_null:      %prec KW_LOWEST {
                                          $$ = dyn::nil();                
                                                                     
                                      }
                                      | display_array_attr_list {
                                          $$ = $1;                              
                                                       
                                      }
                                      ;
display_array_attributes:      KW_ATTRIBUTE KW_LPARENTHESIS
                               display_array_attr_list_or_null KW_RPARENTHESIS {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"Attribute",$1); 
                                   dyn::field(obj,"Lparenthesis",$2); 
                                   dyn::field(obj,"displayArrayAttrListOrNull",$3);
                                    dyn::field(obj,"Rparenthesis",$4); 
                                   $$ = obj;                              
                                                
                               }
                               | KW_ATTRIBUTES KW_LPARENTHESIS
                               display_array_attr_list_or_null KW_RPARENTHESIS {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)1)); 
                                   dyn::field(obj,"Attributes",$1); 
                                   dyn::field(obj,"Lparenthesis",$2); 
                                   dyn::field(obj,"displayArrayAttrListOrNull",$3);
                                    dyn::field(obj,"Rparenthesis",$4); 
                                   $$ = obj;                              
                                                
                               }
                               ;
input_array_attribute:      KW_WITHOUT_DEFAULTS opt_attrint {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"WithoutDefaults",$1); 
                                dyn::field(obj,"optAttrint",$2);  $$ = obj;  
                                                                         
                            }
                            | KW_COUNT KW_EQ int_expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"Count",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"intExpr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_MAXCOUNT KW_EQ int_expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)2)); 
                                dyn::field(obj,"Maxcount",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"intExpr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_APPEND KW_ROW opt_attrint {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)3)); 
                                dyn::field(obj,"Append",$1); 
                                dyn::field(obj,"Row",$2); 
                                dyn::field(obj,"optAttrint",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_INSERT KW_ROW opt_attrint {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)4)); 
                                dyn::field(obj,"Insert",$1); 
                                dyn::field(obj,"Row",$2); 
                                dyn::field(obj,"optAttrint",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_DELETE KW_ROW opt_attrint {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)5)); 
                                dyn::field(obj,"Delete",$1); 
                                dyn::field(obj,"Row",$2); 
                                dyn::field(obj,"optAttrint",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_AUTO KW_APPEND opt_attrint {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)6)); 
                                dyn::field(obj,"Auto",$1); 
                                dyn::field(obj,"Append",$2); 
                                dyn::field(obj,"optAttrint",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_KEEP KW_CURRENT KW_ROW opt_attrint {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)7)); 
                                dyn::field(obj,"Keep",$1); 
                                dyn::field(obj,"Current",$2); 
                                dyn::field(obj,"Row",$3); 
                                dyn::field(obj,"optAttrint",$4);  $$ = obj;  
                                                                         
                            }
                            | KW_CURRENT KW_ROW KW_DISPLAY KW_EQ
                            string_expr_nolist {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)8)); 
                                dyn::field(obj,"Current",$1); 
                                dyn::field(obj,"Row",$2); 
                                dyn::field(obj,"Display",$3); 
                                dyn::field(obj,"Eq",$4); 
                                dyn::field(obj,"stringExprNolist",$5); 
                                $$ = obj;                              
                                             
                            }
                            | subset_attribute1 {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)9)); 
                                dyn::field(obj,"subsetAttribute1",$1); 
                                $$ = obj;                              
                                             
                            }
                            | subset_attribute2 {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)10)); 
                                dyn::field(obj,"subsetAttribute2",$1); 
                                $$ = obj;                              
                                             
                            }
                            | color_attribute {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)11)); 
                                dyn::field(obj,"colorAttribute",$1);  $$ = obj; 
                                                                          
                            }
                            | style_attribute {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)12)); 
                                dyn::field(obj,"styleAttribute",$1);  $$ = obj; 
                                                                          
                            }
                            ;
input_array_attr_list:      input_array_attribute {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"inputArrayAttribute",$1); 
                                $$ = obj;                              
                                             
                            }
                            | input_array_attr_list KW_COMMA
                            input_array_attribute {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"inputArrayAttrList",$1); 
                                dyn::field(obj,"Comma",$2); 
                                dyn::field(obj,"inputArrayAttribute",$3); 
                                $$ = obj;                              
                                             
                            }
                            ;
input_array_attr_list_or_null:      %prec KW_LOWEST {
                                        $$ = dyn::nil();                
                                                                   
                                    }
                                    | input_array_attr_list {
                                        $$ = $1;                              
                                                     
                                    }
                                    ;
input_array_attributes:      KW_ATTRIBUTE KW_LPARENTHESIS
                             input_array_attr_list_or_null KW_RPARENTHESIS {
                                 dyn::ptr_t obj = dyn::createObject(); 
                                 dyn::field(obj,"Attribute",$1); 
                                 dyn::field(obj,"Lparenthesis",$2); 
                                 dyn::field(obj,"inputArrayAttrListOrNull",$3); 
                                 dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                          
                             }
                             | KW_ATTRIBUTES KW_LPARENTHESIS
                             input_array_attr_list_or_null KW_RPARENTHESIS {
                                 dyn::ptr_t obj = dyn::createObject(); 
                                 dyn::field(obj,"$",dyn::val((int)1)); 
                                 dyn::field(obj,"Attributes",$1); 
                                 dyn::field(obj,"Lparenthesis",$2); 
                                 dyn::field(obj,"inputArrayAttrListOrNull",$3); 
                                 dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                          
                             }
                             ;
input_attribute:      KW_NAME KW_EQ expr {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"Name",$1);  dyn::field(obj,"Eq",$2); 
                          dyn::field(obj,"expr",$3);  $$ = obj;                
                                                     
                      }
                      | KW_WITHOUT_DEFAULTS opt_attrint {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"WithoutDefaults",$1); 
                          dyn::field(obj,"optAttrint",$2);  $$ = obj;  
                                                                   
                      }
                      | subset_attribute1 {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"subsetAttribute1",$1);  $$ = obj;  
                                                                   
                      }
                      | subset_attribute2 {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)3)); 
                          dyn::field(obj,"subsetAttribute2",$1);  $$ = obj;  
                                                                   
                      }
                      | color_attribute {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)4)); 
                          dyn::field(obj,"colorAttribute",$1);  $$ = obj;  
                                                                   
                      }
                      | style_attribute {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)5)); 
                          dyn::field(obj,"styleAttribute",$1);  $$ = obj;  
                                                                   
                      }
                      ;
input_attr_list:      input_attribute {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"inputAttribute",$1);  $$ = obj;  
                                                                   
                      }
                      | input_attr_list KW_COMMA input_attribute {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"inputAttrList",$1); 
                          dyn::field(obj,"Comma",$2); 
                          dyn::field(obj,"inputAttribute",$3);  $$ = obj;  
                                                                   
                      }
                      ;
input_attr_list_or_null:      %prec KW_LOWEST {
                                  $$ = dyn::nil();                              
                                               
                              }
                              | input_attr_list {
                                  $$ = $1;                              
                                               
                              }
                              ;
input_attributes:      KW_ATTRIBUTE KW_LPARENTHESIS input_attr_list_or_null
                       KW_RPARENTHESIS {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"Attribute",$1); 
                           dyn::field(obj,"Lparenthesis",$2); 
                           dyn::field(obj,"inputAttrListOrNull",$3); 
                           dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                    
                       }
                       | KW_ATTRIBUTES KW_LPARENTHESIS input_attr_list_or_null
                       KW_RPARENTHESIS {
                           dyn::ptr_t obj = dyn::createObject(); 
                           dyn::field(obj,"$",dyn::val((int)1)); 
                           dyn::field(obj,"Attributes",$1); 
                           dyn::field(obj,"Lparenthesis",$2); 
                           dyn::field(obj,"inputAttrListOrNull",$3); 
                           dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                    
                       }
                       ;
local_block_attribute:      KW_TEXT KW_EQ expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"Text",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_COMMENT KW_EQ expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"Comment",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_IMAGE KW_EQ expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)2)); 
                                dyn::field(obj,"Image",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_VALIDATE KW_EQ yes_no {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)3)); 
                                dyn::field(obj,"Validate",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"yesNo",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_ACCELERATOR KW_EQ expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)4)); 
                                dyn::field(obj,"Accelerator",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_ACCELERATOR2 KW_EQ expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)5)); 
                                dyn::field(obj,"Accelerator2",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_ACCELERATOR3 KW_EQ expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)6)); 
                                dyn::field(obj,"Accelerator3",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_ACCELERATOR4 KW_EQ expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)7)); 
                                dyn::field(obj,"Accelerator4",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_CONTEXTMENU {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)8)); 
                                dyn::field(obj,"Contextmenu",$1);  $$ = obj;  
                                                                         
                            }
                            | KW_CONTEXTMENU KW_EQ yes_no_auto {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)9)); 
                                dyn::field(obj,"Contextmenu",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"yesNoAuto",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_DEFAULTVIEW {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)10)); 
                                dyn::field(obj,"Defaultview",$1);  $$ = obj;  
                                                                         
                            }
                            | KW_DEFAULTVIEW KW_EQ yes_no_auto {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)11)); 
                                dyn::field(obj,"Defaultview",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"yesNoAuto",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_DISCLOSUREINDICATOR {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)12)); 
                                dyn::field(obj,"Disclosureindicator",$1); 
                                $$ = obj;                              
                                             
                            }
                            | KW_ROWBOUND {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)13)); 
                                dyn::field(obj,"Rowbound",$1);  $$ = obj;  
                                                                         
                            }
                            ;
yes_no:      KW_YES {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"Yes",$1);  $$ = obj;                
                                            
             }
             | KW_NO {
                 dyn::ptr_t obj = dyn::createObject(); 
                 dyn::field(obj,"$",dyn::val((int)1));  dyn::field(obj,"No",$1);
                  $$ = obj;                                            
             }
             ;
yes_no_auto:      yes_no {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"yesNo",$1);  $$ = obj;                
                                                 
                  }
                  | KW_AUTO {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Auto",$1);  $$ = obj;                
                                                 
                  }
                  ;
local_block_attributes_list:      local_block_attribute {
                                      dyn::ptr_t obj = dyn::createObject(); 
                                      dyn::field(obj,"localBlockAttribute",$1); 
                                      $$ = obj;                              
                                                   
                                  }
                                  | local_block_attributes_list KW_COMMA
                                  local_block_attribute {
                                      dyn::ptr_t obj = dyn::createObject(); 
                                      dyn::field(obj,"$",dyn::val((int)1)); 
                                      dyn::field(obj,"localBlockAttributesList",$1);
                                       dyn::field(obj,"Comma",$2); 
                                      dyn::field(obj,"localBlockAttribute",$3); 
                                      $$ = obj;                              
                                                   
                                  }
                                  ;
local_block_attributes_attributes:      KW_ATTRIBUTE KW_LPARENTHESIS
                                        local_block_attributes_list_or_null
                                        KW_RPARENTHESIS {
                                            dyn::ptr_t obj = dyn::createObject();
                                             dyn::field(obj,"Attribute",$1); 
                                            dyn::field(obj,"Lparenthesis",$2); 
                                            dyn::field(obj,"localBlockAttributesListOrNull",$3);
                                             dyn::field(obj,"Rparenthesis",$4); 
                                            $$ = obj;                
                                                                       
                                        }
                                        | KW_ATTRIBUTES KW_LPARENTHESIS
                                        local_block_attributes_list_or_null
                                        KW_RPARENTHESIS {
                                            dyn::ptr_t obj = dyn::createObject();
                                            
                                            dyn::field(obj,"$",dyn::val((int)1));
                                             dyn::field(obj,"Attributes",$1); 
                                            dyn::field(obj,"Lparenthesis",$2); 
                                            dyn::field(obj,"localBlockAttributesListOrNull",$3);
                                             dyn::field(obj,"Rparenthesis",$4); 
                                            $$ = obj;                
                                                                       
                                        }
                                        ;
local_block_attributes_list_or_null:      {
                                              $$ = dyn::nil();                
                                                                         
                                          }
                                          | local_block_attributes_list {
                                              $$ = $1;                
                                                                         
                                          }
                                          ;
menu_attribute:      KW_STYLE KW_EQ expr {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"Style",$1);  dyn::field(obj,"Eq",$2); 
                         dyn::field(obj,"expr",$3);  $$ = obj;                
                                                    
                     }
                     | KW_IMAGE KW_EQ expr {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"Image",$1);  dyn::field(obj,"Eq",$2); 
                         dyn::field(obj,"expr",$3);  $$ = obj;                
                                                    
                     }
                     | KW_COMMENT KW_EQ expr {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)2)); 
                         dyn::field(obj,"Comment",$1);  dyn::field(obj,"Eq",$2);
                          dyn::field(obj,"expr",$3);  $$ = obj;                
                                                    
                     }
                     ;
menu_attr_list:      menu_attribute {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"menuAttribute",$1);  $$ = obj;  
                                                                  
                     }
                     | menu_attr_list KW_COMMA menu_attribute {
                         dyn::ptr_t obj = dyn::createObject(); 
                         dyn::field(obj,"$",dyn::val((int)1)); 
                         dyn::field(obj,"menuAttrList",$1); 
                         dyn::field(obj,"Comma",$2); 
                         dyn::field(obj,"menuAttribute",$3);  $$ = obj;  
                                                                  
                     }
                     ;
menu_attr_list_or_null:      %prec KW_LOWEST {
                                 $$ = dyn::nil();                              
                                              
                             }
                             | menu_attr_list {
                                 $$ = $1;                              
                                              
                             }
                             ;
menu_attributes:      KW_ATTRIBUTE KW_LPARENTHESIS menu_attr_list_or_null
                      KW_RPARENTHESIS {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"Attribute",$1); 
                          dyn::field(obj,"Lparenthesis",$2); 
                          dyn::field(obj,"menuAttrListOrNull",$3); 
                          dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                   
                      }
                      | KW_ATTRIBUTES KW_LPARENTHESIS menu_attr_list_or_null
                      KW_RPARENTHESIS {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Attributes",$1); 
                          dyn::field(obj,"Lparenthesis",$2); 
                          dyn::field(obj,"menuAttrListOrNull",$3); 
                          dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                   
                      }
                      ;
message_dest:      line_expr {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"lineExpr",$1);  $$ = obj;                
                                                  
                   }
                   | KW_MESSAGEBOX {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"Messagebox",$1);  $$ = obj;  
                                                                
                   }
                   | KW_STATUSBAR {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)2)); 
                       dyn::field(obj,"Statusbar",$1);  $$ = obj;  
                                                                
                   }
                   | KW_ALTSTATUSBAR {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)3)); 
                       dyn::field(obj,"Altstatusbar",$1);  $$ = obj;  
                                                                
                   }
                   ;
open_window_attribute:      KW_TEXT KW_EQ expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"Text",$1); 
                                dyn::field(obj,"Eq",$2); 
                                dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_BORDER {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"Border",$1);  $$ = obj;  
                                                                         
                            }
                            | KW_PROMPT KW_LINE line_expr %prec KW_LOWEST {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)3)); 
                                dyn::field(obj,"Prompt",$1); 
                                dyn::field(obj,"Line",$2); 
                                dyn::field(obj,"lineExpr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_FORM KW_LINE line_expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)4)); 
                                dyn::field(obj,"Form",$1); 
                                dyn::field(obj,"Line",$2); 
                                dyn::field(obj,"lineExpr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_MENU KW_LINE line_expr {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)5)); 
                                dyn::field(obj,"Menu",$1); 
                                dyn::field(obj,"Line",$2); 
                                dyn::field(obj,"lineExpr",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_MESSAGE KW_LINE message_dest {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)6)); 
                                dyn::field(obj,"Message",$1); 
                                dyn::field(obj,"Line",$2); 
                                dyn::field(obj,"messageDest",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_ERROR KW_LINE message_dest {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)7)); 
                                dyn::field(obj,"Error",$1); 
                                dyn::field(obj,"Line",$2); 
                                dyn::field(obj,"messageDest",$3);  $$ = obj;  
                                                                         
                            }
                            | KW_COMMENT KW_LINE message_dest {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)8)); 
                                dyn::field(obj,"Comment",$1); 
                                dyn::field(obj,"Line",$2); 
                                dyn::field(obj,"messageDest",$3);  $$ = obj;  
                                                                         
                            }
                            | color_attribute {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)9)); 
                                dyn::field(obj,"colorAttribute",$1);  $$ = obj; 
                                                                          
                            }
                            | style_attribute {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)10)); 
                                dyn::field(obj,"styleAttribute",$1);  $$ = obj; 
                                                                          
                            }
                            ;
open_window_attr_list:      open_window_attribute {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"openWindowAttribute",$1); 
                                $$ = obj;                              
                                             
                            }
                            | open_window_attr_list KW_COMMA
                            open_window_attribute {
                                dyn::ptr_t obj = dyn::createObject(); 
                                dyn::field(obj,"$",dyn::val((int)1)); 
                                dyn::field(obj,"openWindowAttrList",$1); 
                                dyn::field(obj,"Comma",$2); 
                                dyn::field(obj,"openWindowAttribute",$3); 
                                $$ = obj;                              
                                             
                            }
                            ;
open_window_attr_list_or_null:      %prec KW_LOWEST {
                                        $$ = dyn::nil();                
                                                                   
                                    }
                                    | open_window_attr_list {
                                        $$ = $1;                              
                                                     
                                    }
                                    ;
open_window_attributes:      KW_ATTRIBUTE KW_LPARENTHESIS
                             open_window_attr_list_or_null KW_RPARENTHESIS {
                                 dyn::ptr_t obj = dyn::createObject(); 
                                 dyn::field(obj,"Attribute",$1); 
                                 dyn::field(obj,"Lparenthesis",$2); 
                                 dyn::field(obj,"openWindowAttrListOrNull",$3); 
                                 dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                          
                             }
                             | KW_ATTRIBUTES KW_LPARENTHESIS
                             open_window_attr_list_or_null KW_RPARENTHESIS {
                                 dyn::ptr_t obj = dyn::createObject(); 
                                 dyn::field(obj,"$",dyn::val((int)1)); 
                                 dyn::field(obj,"Attributes",$1); 
                                 dyn::field(obj,"Lparenthesis",$2); 
                                 dyn::field(obj,"openWindowAttrListOrNull",$3); 
                                 dyn::field(obj,"Rparenthesis",$4);  $$ = obj;  
                                                                          
                             }
                             ;
opt_color_style_attributes:      {
                                     $$ = dyn::nil();                
                                                                
                                 }
                                 | color_style_attributes {
                                     $$ = $1;                              
                                                  
                                 }
                                 ;
opt_attrint:      {
                      $$ = dyn::nil();                              
                                   
                  }
                  | KW_EQ int_expr {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Eq",$1);  dyn::field(obj,"intExpr",$2); 
                      $$ = obj;                                            
                  }
                  ;
opt_construct_attributes:      {
                                   $$ = dyn::nil();                
                                                              
                               }
                               | construct_attributes {
                                   $$ = $1;                              
                                                
                               }
                               ;
opt_display_array_attributes:      {
                                       $$ = dyn::nil();                
                                                                  
                                   }
                                   | display_array_attributes {
                                       $$ = $1;                              
                                                    
                                   }
                                   ;
opt_input_array_attributes:      {
                                     $$ = dyn::nil();                
                                                                
                                 }
                                 | input_array_attributes {
                                     $$ = $1;                              
                                                  
                                 }
                                 ;
opt_input_attributes:      {
                               $$ = dyn::nil();                              
                                            
                           }
                           | input_attributes {
                               $$ = $1;                              
                                            
                           }
                           ;
opt_local_block_attributes:      {
                                     $$ = dyn::nil();                
                                                                
                                 }
                                 | local_block_attributes_attributes {
                                     $$ = $1;                              
                                                  
                                 }
                                 ;
opt_menu_attributes:      {
                              $$ = dyn::nil();                              
                                           
                          }
                          | menu_attributes {
                              $$ = $1;                              
                                           
                          }
                          ;
opt_open_window_attributes:      {
                                     $$ = dyn::nil();                
                                                                
                                 }
                                 | open_window_attributes {
                                     $$ = $1;                              
                                                  
                                 }
                                 ;
opt_prompt_control_attributes:      {
                                        $$ = dyn::nil();                
                                                                   
                                    }
                                    | prompt_control_attributes {
                                        $$ = $1;                              
                                                     
                                    }
                                    ;
opt_unbuffered2:      {
                          $$ = dyn::nil();                              
                                       
                      }
                      | KW_EQ int_expr {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Eq",$1); 
                          dyn::field(obj,"intExpr",$2);  $$ = obj;  
                                                                   
                      }
                      ;
options_list:      options_elem {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"optionsElem",$1);  $$ = obj;  
                                                                
                   }
                   | options_list KW_COMMA options_elem {
                       dyn::ptr_t obj = dyn::createObject(); 
                       dyn::field(obj,"$",dyn::val((int)1)); 
                       dyn::field(obj,"optionsList",$1); 
                       dyn::field(obj,"Comma",$2); 
                       dyn::field(obj,"optionsElem",$3);  $$ = obj;  
                                                                
                   }
                   ;
prompt_control_attribute:      subset_attribute1 {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"subsetAttribute1",$1); 
                                   $$ = obj;                              
                                                
                               }
                               | KW_CENTURY KW_EQ string_expr_nolist {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)1)); 
                                   dyn::field(obj,"Century",$1); 
                                   dyn::field(obj,"Eq",$2); 
                                   dyn::field(obj,"stringExprNolist",$3); 
                                   $$ = obj;                              
                                                
                               }
                               | KW_FORMAT KW_EQ string_expr_nolist {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)2)); 
                                   dyn::field(obj,"Format",$1); 
                                   dyn::field(obj,"Eq",$2); 
                                   dyn::field(obj,"stringExprNolist",$3); 
                                   $$ = obj;                              
                                                
                               }
                               | KW_PICTURE KW_EQ expr {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)3)); 
                                   dyn::field(obj,"Picture",$1); 
                                   dyn::field(obj,"Eq",$2); 
                                   dyn::field(obj,"expr",$3);  $$ = obj;  
                                                                            
                               }
                               | KW_SHIFT KW_EQ KW_STRCON {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)4)); 
                                   dyn::field(obj,"Shift",$1); 
                                   dyn::field(obj,"Eq",$2); 
                                   dyn::field(obj,"Strcon",$3);  $$ = obj;  
                                                                            
                               }
                               | KW_WITHOUT_DEFAULTS opt_attrint {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)5)); 
                                   dyn::field(obj,"WithoutDefaults",$1); 
                                   dyn::field(obj,"optAttrint",$2);  $$ = obj;  
                                                                            
                               }
                               | KW_UNBUFFERED opt_unbuffered2 {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)6)); 
                                   dyn::field(obj,"Unbuffered",$1); 
                                   dyn::field(obj,"optUnbuffered2",$2); 
                                   $$ = obj;                              
                                                
                               }
                               | color_val {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)7)); 
                                   dyn::field(obj,"colorVal",$1);  $$ = obj;  
                                                                            
                               }
                               ;
prompt_control_attr_list:      prompt_control_attribute {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"promptControlAttribute",$1); 
                                   $$ = obj;                              
                                                
                               }
                               | prompt_control_attr_list KW_COMMA
                               prompt_control_attribute {
                                   dyn::ptr_t obj = dyn::createObject(); 
                                   dyn::field(obj,"$",dyn::val((int)1)); 
                                   dyn::field(obj,"promptControlAttrList",$1); 
                                   dyn::field(obj,"Comma",$2); 
                                   dyn::field(obj,"promptControlAttribute",$3); 
                                   $$ = obj;                              
                                                
                               }
                               ;
prompt_control_attr_list_or_null:      %prec KW_LOWEST {
                                           $$ = dyn::nil();                
                                                                      
                                       }
                                       | prompt_control_attr_list {
                                           $$ = $1;                
                                                                      
                                       }
                                       ;
prompt_control_attributes:      KW_ATTRIBUTE KW_LPARENTHESIS
                                prompt_control_attr_list_or_null KW_RPARENTHESIS
                                {
                                    dyn::ptr_t obj = dyn::createObject(); 
                                    dyn::field(obj,"Attribute",$1); 
                                    dyn::field(obj,"Lparenthesis",$2); 
                                    dyn::field(obj,"promptControlAttrListOrNull",$3);
                                     dyn::field(obj,"Rparenthesis",$4); 
                                    $$ = obj;                              
                                                 
                                }
                                | KW_ATTRIBUTES KW_LPARENTHESIS
                                prompt_control_attr_list_or_null KW_RPARENTHESIS
                                {
                                    dyn::ptr_t obj = dyn::createObject(); 
                                    dyn::field(obj,"$",dyn::val((int)1)); 
                                    dyn::field(obj,"Attributes",$1); 
                                    dyn::field(obj,"Lparenthesis",$2); 
                                    dyn::field(obj,"promptControlAttrListOrNull",$3);
                                     dyn::field(obj,"Rparenthesis",$4); 
                                    $$ = obj;                              
                                                 
                                }
                                ;
style_attribute:      KW_REVERSE {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"Reverse",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_BLINK {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"Blink",$1);  $$ = obj;                
                                                     
                      }
                      | KW_UNDERLINE {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"Underline",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_BOLD {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)3)); 
                          dyn::field(obj,"Bold",$1);  $$ = obj;                
                                                     
                      }
                      | KW_DIM {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)4)); 
                          dyn::field(obj,"Dim",$1);  $$ = obj;                
                                                     
                      }
                      | KW_INVISIBLE {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)5)); 
                          dyn::field(obj,"Invisible",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_NORMAL {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)6)); 
                          dyn::field(obj,"Normal",$1);  $$ = obj;  
                                                                   
                      }
                      | KW_LEFT {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)7)); 
                          dyn::field(obj,"Left",$1);  $$ = obj;                
                                                     
                      }
                      | KW_STYLE KW_EQ expr {
                         dyn::ptr_t obj = dyn::createObject();
                         dyn::field(obj,"Style",$1);
                         dyn::field(obj,"Eq",$2);
                         dyn::field(obj,"expr",$3);  $$ = obj;
                      }
                      ;
global_definition:      KW_GLOBALS set_global definition_list end_global
                        KW_END_GLOBALS {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"Globals",$1); 
                            dyn::field(obj,"setGlobal",$2); 
                            dyn::field(obj,"definitionList",$3); 
                            dyn::field(obj,"endGlobal",$4); 
                            dyn::field(obj,"EndGlobals",$5);  $$ = obj;  
                                                                     
                        }
                        | definition_list_entry {
                            dyn::ptr_t obj = dyn::createObject(); 
                            dyn::field(obj,"$",dyn::val((int)1)); 
                            dyn::field(obj,"definitionListEntry",$1);  $$ = obj;
                                                                       
                        }
                        ;
set_global:      {
                     $$ = dyn::nil();                              
                                  
                 }
                 ;
end_global:      {
                     $$ = dyn::nil();                              
                                  
                 }
                 ;
global_file:      KW_GLOBALS KW_STRCON {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Globals",$1); 
                      dyn::field(obj,"Strcon",$2);  $$ = obj;                
                                                 
                  }
                  ;
import_stmt:      KW_IMPORT KW_JAVA type_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"Import",$1);  dyn::field(obj,"Java",$2); 
                      dyn::field(obj,"typeName",$3);  $$ = obj;                
                                                 
                  }
                  | KW_IMPORT KW_SWAGGER KW_STRCON KW_AS type_name {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)1)); 
                      dyn::field(obj,"Import",$1); 
                      dyn::field(obj,"Swagger",$2); 
                      dyn::field(obj,"Strcon",$3);  dyn::field(obj,"As",$4); 
                      dyn::field(obj,"typeName",$5);  $$ = obj;                
                                                 
                  }
                  | KW_IMPORT opt_is4gl identifier {
                      dyn::ptr_t obj = dyn::createObject(); 
                      dyn::field(obj,"$",dyn::val((int)2)); 
                      dyn::field(obj,"Import",$1); 
                      dyn::field(obj,"optIs4gl",$2); 
                      dyn::field(obj,"identifier",$3);  $$ = obj;  
                                                               
                  }
                  ;
opt_is4gl:      {
                    $$ = dyn::nil();                                            
                }
                | KW_FGL {
                    $$ = $1;                                            
                }
                ;
preproc_definition:      '$' KW_LINE KW_INTCON KW_STRCON {
                             dyn::ptr_t obj = dyn::createObject(); 
                             dyn::field(obj,"DollarSign",$1); 
                             dyn::field(obj,"Line",$2); 
                             dyn::field(obj,"Intcon",$3); 
                             dyn::field(obj,"Strcon",$4);  $$ = obj;  
                                                                      
                         }
                         ;
program:      {
                  $$ = dyn::nil();                                            
              }
              | program program_element {
                  dyn::ptr_t obj = dyn::createObject(); 
                  dyn::field(obj,"$",dyn::val((int)1)); 
                  dyn::field(obj,"program",$1); 
                  dyn::field(obj,"programElement",$2);  $$ = obj;  
                                                           
              }
              ;
program_element:      global_definition {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"globalDefinition",$1);  $$ = obj;  
                                                                   
                      }
                      | global_file {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)1)); 
                          dyn::field(obj,"globalFile",$1);  $$ = obj;  
                                                                   
                      }
                      | function_definition {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)2)); 
                          dyn::field(obj,"functionDefinition",$1);  $$ = obj;  
                                                                   
                      }
                      | main_definition {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)3)); 
                          dyn::field(obj,"mainDefinition",$1);  $$ = obj;  
                                                                   
                      }
                      | report_definition {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)4)); 
                          dyn::field(obj,"reportDefinition",$1);  $$ = obj;  
                                                                   
                      }
                      | global_database_stmt {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)5)); 
                          dyn::field(obj,"globalDatabaseStmt",$1);  $$ = obj;  
                                                                   
                      }
                      | import_stmt {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)6)); 
                          dyn::field(obj,"importStmt",$1);  $$ = obj;  
                                                                   
                      }
                      | preproc_definition {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)7)); 
                          dyn::field(obj,"preprocDefinition",$1);  $$ = obj;  
                                                                   
                      }
                      | error {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)8)); 
                          dyn::field(obj,"ErrorNode",$1);  $$ = obj;  
                                                                   
                      }
                      | method_definition {
                          dyn::ptr_t obj = dyn::createObject(); 
                          dyn::field(obj,"$",dyn::val((int)7)); 
                          dyn::field(obj,"preprocDefinition",$1);  $$ = obj;  
                                                                   
                      }
                      ;
%%

