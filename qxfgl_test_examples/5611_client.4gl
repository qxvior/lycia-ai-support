MAIN

   DEFINE  ses WEB.SESSION
   DEFINE  rq, answer WEB.Request
   DEFINE  rs WEB.Response
   DEFINE  url web.URL
   DEFINE  prefix, instance, app STRING
   DEFINE  result DYNAMIC ARRAY OF INT
   

   CAll  url.setHost("localhost")
   CAll  url.setPort(9090)
   LET  prefix = "LyciaWeb/esapi/"
   LET  instance = "run/default"
   LET  app = "5611_service_fgl_get_property_hangs"
   CAll  url.setPath(prefix || instance || "/" || app)
   
   CALL  rq.setMethod("POST")
   CALL rq.setContentType("application/json")
   DISPLAY rq.getContentType()
   DISPLAY "URL : ", url.getURL()
   CAll  rq.setURL(url)
   CALL ses.perform(rq) RETURNING rs
   DISPLAY rs.GetHTTPCode()
   --DISPLAY rs.getBody()
   
   CALL  answer.setMethod("POST")
   CAll  url.setPath(prefix || "answer")
   DISPLAY "URL : ", url.getURL()
   CAll  answer.setURL(url)
   CALL  answer.param("value", "[\"c:\\temp\"]")
   CALL ses.perform(answer) RETURNING rs
   DISPLAY rs.GetHTTPCode()
   DISPLAY rs.getBody()

   CAll  url.setPath(prefix || "action/cancel")
   CAll rq.setURL(url)
   DISPLAY "URL : ", url.getURL()
   CALL ses.perform(rq) RETURNING rs
   DISPLAY rs.GetHTTPCode()
   DISPLAY rs.getBody()

END MAIN

