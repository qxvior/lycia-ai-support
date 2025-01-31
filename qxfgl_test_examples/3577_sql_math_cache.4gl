DATABASE tpv2
MAIN
define idpo_stroje like pl_harmpolozka.idpo_stroje
define interval_ods interval hour(9) to minute
define zac_miesta datetime year to minute
define kon_miesta datetime year to minute
LET idpo_stroje = 375
LET zac_miesta = "2019-06-18 00:00"
LET kon_miesta = "2019-06-21 12:00"
		select
		    sum(pl_kapkalendar.kon_useku - pl_kapkalendar.zac_useku)
		into
		    interval_ods
		from pl_kapkalendar
		where
		pl_kapkalendar.kod_useku = "O" and
		pl_kapkalendar.idpo_stroje = idpo_stroje and --375
		pl_kapkalendar.zac_useku >= zac_miesta and  --2019-06-18 00:00
		pl_kapkalendar.kon_useku <= kon_miesta  --2019-06-21 12:00

DISPLAY interval_ods		
END MAIN