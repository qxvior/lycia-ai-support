TYPE tstringMax10 STRING ATTRIBUTE(XSDMaxLength="10",XSTypeName="stringMax10",XSTypeNamespace="https://irium/")
TYPE tstringMax30 STRING ATTRIBUTE(XSDMaxLength="30",XSTypeName="stringMax30",XSTypeNamespace="https://irium/")
TYPE tstringMax45 STRING ATTRIBUTE(XSDMaxLength="45",XSTypeName="stringMax45",XSTypeNamespace="https://irium/")
TYPE geo_tAddress RECORD
  AddressLine1 STRING ,
  AddressLine2 tstringMax45 ,
  AddressLine3 tstringMax45 ,
  City tstringMax45 ,
  Country tstringMax30 ,
  ZipCode tstringMax10
END RECORD

FUNCTION GetDistanceEntreDepartDestination()
WHENEVER ERROR CONTINUE
END FUNCTION

FUNCTION AffichageCarteGeo()
DEFINE	pt_address geo_tAddress
END FUNCTION  