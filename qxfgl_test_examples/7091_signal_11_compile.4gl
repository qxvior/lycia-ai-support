main
declare totar cursor for
  select * from art
   order by bdate desc

foreach totar into  tran[i].*
end foreach
END MAIN