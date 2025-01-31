main
define f_desc integer
define fname CHAR(60)
define in_line char(150)
define read_status integer
let fname = "testfile"
open file f_desc from fname options (read,format="text")
read from f_desc into in_line
let read_status = status
display "inital status=",read_status
while read_status = 0
    display in_line clipped
    read from f_desc into in_line
    let read_status = status
    display "status=",read_status
end while
close file f_desc
end main
