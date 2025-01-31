MAIN
DEFINE lc_dir      CHAR(200)
DEFINE lc_dir1      CHAR(200)
DEFINE lc_dir2      CHAR(200)
DEFINE lc_dir3      CHAR(200)
DEFINE ln_len      INTEGER

        LET ln_len = length(lc_dir)
        DISPLAY ln_len

        INITIALIZE lc_dir1 TO NULL
        LET ln_len = length(lc_dir1)
        DISPLAY ln_len

        LET lc_dir2=""
        LET ln_len = length(lc_dir2)
        DISPLAY ln_len

        LET lc_dir3=" "
        LET ln_len = length(lc_dir3)
        DISPLAY ln_len

END MAIN
