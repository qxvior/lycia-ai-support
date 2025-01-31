database stores
main
 
DEFINE 
i SMALLINT,
bl DECIMAL(10,2),
trand ARRAY[3000] OF RECORD 
     bdate date,
     balance decimal(12,2)
end record,
trand2 ARRAY[3000] OF RECORD 
     bdate date,
     balance decimal(12,2)
end record
create temp table art (
    bdate date,
    balance decimal(12,2)
)

let i=1
    let trand[i].bdate = "03/31/2019"
    insert into art values (trand[i].*) 
declare totar cursor for
  select * from art
   order by bdate desc

let bl = 0 
foreach totar into trand[i].*,trand2[i].*
  let bl = bl + trand[i].balance 
  let i = i + 1 
end foreach
display "ok"
end main