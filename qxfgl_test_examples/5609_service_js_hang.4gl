MAIN
  DEFINE str string
  CALL ui.interface.frontcall("html5","scriptImport",["qx://application/scripts/messages.js","nowait"],[])  


  PROMPT "Input the value:" FOR str

  DISPLAY "PASSED"
  
END MAIN