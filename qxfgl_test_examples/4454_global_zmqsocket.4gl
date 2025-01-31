# Project: lyc1000
# Filename: 4454_global_zmqsocket.4gl
# Created By: alch
# Creation Date: Oct 28, 2019

GLOBALS
	DEFINE responder ZMQ.Socket
END GLOBALS
MAIN
	CALL open_socket()
	DISPLAY responder.GetLastEndpoint()
END MAIN

FUNCTION open_socket()
	DEFINE context ZMQ.Context

	LET responder = context.Socket("ZMQ.REP")
	CALL responder.bind("tcp://*:5555")
END FUNCTION