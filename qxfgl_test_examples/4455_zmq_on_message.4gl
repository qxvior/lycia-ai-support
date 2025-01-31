# Project: lyc1000
# Filename: 4455_zmq_on_message.4gl
# Created By: alch
# Creation Date: Oct 30, 2019

MAIN
	DEFINE m_context ZMQ.Context
	DEFINE responder, requester ZMQ.Socket
	DEFINE req1, req2 STRING
	
	LET responder = open_server_socket()
	LET m_context = responder.getContext()
	LET requester = open_client_socket(get_port_by_socket(responder), m_context)
	
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

FUNCTION open_server_socket()
	DEFINE context ZMQ.Context
	DEFINE l_responder ZMQ.Socket

	LET l_responder = context.Socket("ZMQ.REP")
	CALL l_responder.bind("tcp://*:0")
	RETURN l_responder
END FUNCTION

FUNCTION open_client_socket(port_num, l_context)
	DEFINE port_num INTEGER
	DEFINE l_context ZMQ.Context
	DEFINE l_requester ZMQ.Socket
	DEFINE server_url web.URL

	LET l_requester = l_context.Socket("ZMQ.REQ")
	CALL server_url.setScheme("tcp")
	CALL server_url.setHost("localhost")
	CALL server_url.setPort(port_num)
	CALL l_requester.connect(server_url)
	
	RETURN l_requester
END FUNCTION

FUNCTION get_port_by_socket(zmq_socket)
	DEFINE zmq_socket ZMQ.Socket
	DEFINE zmq_socket_url web.URL
	DEFINE zmq_socket_port INTEGER

	LET zmq_socket_url = zmq_socket.GetLastEndpoint()
	LET zmq_socket_port = zmq_socket_url.getPort()

	RETURN zmq_socket_port
END FUNCTION