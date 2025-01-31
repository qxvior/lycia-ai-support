MAIN
  DEFINE context ZMQ.Context
  DEFINE socket_responder ZMQ.Socket
  DEFINE request, reply STRING

	LET socket_responder = context.Socket("ZMQ.REP") #REP=Response Declare Socket to talk to clients	
	CALL socket_responder.bind("tcp://*:5556") #Bind socket to Port 5556

	DISPLAY "##############################################"
	DISPLAY "# Server is ready for ZeroMQ communication   #"
	DISPLAY "##############################################"

	WHILE TRUE

	  DISPLAY "Wait for next request from the client"
	  LET request = socket_responder.recv()
	  DISPLAY "Received: ", request

		# Do some 'work'
	  SLEEP 1
	   
	  # Send reply back to client
	  LET reply = "World reply!"
	  CALL socket_responder.send(reply)
  END WHILE
  
	CALL socket_responder.close()
	CALL context.term()
END MAIN