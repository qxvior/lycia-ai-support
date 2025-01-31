# Project: lyc1000
# Filename: 4454_returning_zmqsocket.4gl
# Created By: alch
# Creation Date: Oct 28, 2019

MAIN
	DEFINE responder ZMQ.Socket

	LET responder = open_socket()
	DISPLAY responder.GetLastEndpoint()
END MAIN

FUNCTION open_socket()
	DEFINE context ZMQ.Context
	DEFINE l_responder ZMQ.Socket

	LET l_responder = context.Socket("ZMQ.REP")
	CALL l_responder.bind("tcp://*:5555")
	RETURN l_responder
END FUNCTION