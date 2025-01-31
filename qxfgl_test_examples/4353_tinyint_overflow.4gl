main
    define i tinyint
    define m money( 32 )
    define d decimal

    whenever any error continue

    let i = 100 -- this is required to ensure value is not overwritten after error occurs

    let d = 9223372036854775808 -- bigint max + 1
    display status, ": ", "decimal: ", d

    let m = d
    display status, ": ", "money: ", m

    let i = m
    display status, ": ", "tiny: ", i -- wrong overflow error (-1284 instead of -8097) and 100 is still displayed
end main