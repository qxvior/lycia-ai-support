MAIN
	DEFINE context ZMQ.Context
	DEFINE socket_requester ZMQ.Socket
	DEFINE request, reply STRING
	DEFINE requestNbr INT

	# Socket to talk to server
	DISPLAY "Connecting to hello world server..."

	LET socket_requester = context.Socket("ZMQ.REQ")
	CALL socket_requester.connect("tcp://localhost:5556")

	FOR requestNbr = 0 TO 10
		LET request = "Friendly Hello, from client"
		DISPLAY "Sending Hello: ", requestNbr		
		CALL socket_requester.send(request)
		
		LET reply = socket_requester.recv()
		DISPLAY "Received: ", reply CLIPPED, " ", requestNbr
	END FOR

	CALL socket_requester.close()
	CALL context.term()
END MAIN