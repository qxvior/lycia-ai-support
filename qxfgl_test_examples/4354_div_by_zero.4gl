main
    define b bigint

    whenever any error continue

    let b = 1
    display status, ": ", "1 % 0: ", b MOD 0 -- no 'DIVIDE BY ZERO' error but some 'Unknown error'
end main