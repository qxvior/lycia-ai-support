# Project: lyc1000
# Filename: 4455_on_meesage_in_menu.4gl
# Created By: alch
# Creation Date: Oct 25, 2019

MAIN
	DEFINE context1, context2 ZMQ.Context
	DEFINE responder, requester ZMQ.Socket
	DEFINE req1, req2 STRING
	
	LET responder = context1.Socket("ZMQ.REP")
	CALL responder.bind("tcp://*:5555")
	
	LET requester = context2.Socket("ZMQ.REQ")
	CALL requester.connect("tcp://localhost:5555")
	
	MENU "zmq_menu"
		ON ACTION "Send"
			CALL requester.send("Hello") 
		ON ACTION "Exit"
			EXIT MENU
		ON MESSAGE(responder)
			LET req1 = responder.recv()
			DISPLAY "req1 - ",req1
			CALL responder.send("received")
		ON MESSAGE(requester)
			LET req2 = requester.recv()
			DISPLAY "req2 - ", req2
	END MENU
END MAIN