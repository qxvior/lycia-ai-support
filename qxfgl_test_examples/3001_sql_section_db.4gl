DATABASE stores
MAIN
WHENEVER ERROR CONTINUE
drop table bridge
create table bridge(
ckz char(10),
    porc smallint)
WHENEVER ERROR STOP
DISPLAY STATUS
INSERT INTO bridge VALUES ("lookfor",1)
DISPLAY STATUS
END MAIN