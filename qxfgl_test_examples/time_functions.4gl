database tpv2

globals "main_00.4gl"
--globals "package/sat_00.4gl"
#####################
function week1_old(datpotv)
#####################
define datpotv date
define datum1 date
define rozd int
define den1 int
define tyzden int

if datpotv is null then
	let tyzden = null
	return tyzden
end if

let datum1 = mdy(01,01,year(datpotv))
let den1 = weekday(datum1)
if den1 = 0 then
	let den1 = 7
end if
let rozd = datpotv - datum1
let tyzden = (rozd + den1 )
if tyzden mod 7  > 0 then
	let  tyzden = tyzden/7 + 1
else
	let  tyzden = tyzden/7 
end if
return tyzden
end function
#####################
function inter_old(tyzden,rok)
#####################
define datpotv date
define datum1,datum2 date
define rozd int
define rok int
define den1 int
define tyzden int
define datzac,datkon date

	let datzac = null
	let datkon = null

let datum1 = mdy(01,01,rok)
let datum2 = mdy(12,31,rok)
let den1 = weekday(datum1)
if den1 = 0 then
	let den1 = 7
end if
let datzac = ((tyzden - 1) * 7 ) - den1 + 1  + datum1
let datkon = (tyzden * 7 - 1 ) - den1 + 1  + datum1
if datzac < datum1 then
	let datzac = datum1
end if
if datkon > datum2 then
	let datkon = datum2
end if
return datzac,datkon
end function
########################
FUNCTION tyzdne(tyzden1,rok1)
########################
define tyzden1 int
define tyzden2 int
define tyzden3 int
define rok1 int
define rok2 int
define rok3 int
define datzac date
define datkon date
define pom_datkon1 date
define pom_datkon2 date
define i int
define j int

call inter(tyzden1,rok1) returning datzac,datkon
let pom_datkon1 = datkon + 1 units day
let pom_datkon2 = datkon + 8 units day
call week1(pom_datkon1) returning tyzden2
call week1(pom_datkon2) returning tyzden3
let rok2 = year_of_week(pom_datkon1) 
let rok3 = year_of_week(pom_datkon2) 

return tyzden2,tyzden3,rok2,rok3
end function

{
--funkcia bole presunuta do packages/utilities/utilities.4gl
########################
FUNCTION tyzden_spat(tyzden1,rok1)
########################
define tyzden0 int
define tyzden1 int
define rok0 int
define rok1 int
define datzac date
define datkon date
define pom_datkon date
define i int
define j int

call inter(tyzden1,rok1) returning datzac,datkon
let pom_datkon = datzac - 1 units day
call week1(pom_datkon) returning tyzden0
let rok0 = year_of_week(pom_datkon) 
return tyzden0,rok0
end function
}

#######################
function cyklus(datum)
#######################
define datum,datum1 date
define datzac,datkon date
define cyklus,rok smallint
let datum1 = datum + 3 units day
call week1(datum1) returning cyklus
let rok = year_of_week(datum)
return cyklus,rok
end function

#######################
function inter_cyklus(cyklus,rok)
#######################
define cyklus,rok smallint
define datzac0,datkon0 date
define datzac,datkon date
call inter(cyklus,rok) returning datzac0,datkon0
let datzac = datzac0 - 3 units day
let datkon = datkon0 - 3 units day
return datzac,datkon
end function

#######################
function datum_cyklu(den,cyklus,rok)
#######################
define datzac,datkon date
define den,cyklus,rok smallint
define datum date
call inter_cyklus(cyklus,rok) returning datzac,datkon
let datum = datzac + den - 1
return datum
end function

#######################
function datum_tyzdna(den,cyklus,rok)
#######################
define datzac,datkon date
define den,cyklus,rok smallint
define datum date
call inter(cyklus,rok) returning datzac,datkon
let datum = datzac + den - 1
return datum
end function


-------------15.12.04-varka novych funcii --------------------
{
--funkcie boli presunute do packages/utilities/utilities.4gl
###############
function week1(datum)
###############
define datum date
define den1 date --prvy den v roku
define por_den1 smallint --poradie prveho dna v roku
define den1_tyzdna1 date --prvy den v prvom tyzdni
define tyzden smallint
define rozdiel smallint

if datum is null then
	let tyzden = null
	return tyzden
end if

let den1 = mdy(1,1,year(datum))
let por_den1 = weekday(den1)
if por_den1 = 0 then 
	let por_den1 = 7
end if

if por_den1 <= 4 then
	let den1_tyzdna1 = den1 - (por_den1 - 1) units day
else
	let den1_tyzdna1 = den1 + (7 - por_den1 + 1) units day
end if
let rozdiel = datum - den1_tyzdna1 + 1
if rozdiel > 0 then
	if (rozdiel mod 7) = 0 then
		let tyzden = rozdiel/7
	else
		let tyzden = (rozdiel/7) + 1
	end if
else
	call week1(mdy(12,31,year(datum)-1)) returning tyzden
end if
if tyzden = 53 and weekday(mdy(12,31,year(datum))) <= 3 then
	let tyzden = 1
end if
return tyzden
end function

############################
function year_of_week(datum)
############################
define datum date
define rok smallint

if datum is null then
       let rok = null
       return rok
end if

let rok = year(datum)
case 
	when month(datum) = 12 and
	     week1(datum) = 1 and
	     (weekday(mdy(12,31,year(datum))) <= 3 and
	     weekday(mdy(12,31,year(datum))) <> 0)
		let rok = rok + 1

	when month(datum) = 1 and
	     week1(datum) >= 52 and
	     (weekday(mdy(1,1,year(datum))) >= 5 or
	     weekday(mdy(1,1,year(datum))) = 0) 
		let rok = rok - 1
end case
return rok
end function


#####################
function inter(tyzden,rok)
#####################
define tyzden,rok smallint
define den1 date
define den1_tyzdna1 date
define por_den1 smallint
define datzac,datkon date

let datzac = null
let datkon = null

let den1 = mdy(1,1,rok)
let por_den1 = weekday(den1)
if por_den1 = 0 then 
	let por_den1 = 7
end if

if por_den1 <= 4 then
	let den1_tyzdna1 = den1 - (por_den1 - 1) units day
else
	let den1_tyzdna1 = den1 + (7 - por_den1 + 1) units day
end if
let datzac = den1_tyzdna1 + (7*(tyzden - 1)) units day
let datkon = datzac + 6 units day
return datzac,datkon 
end function

--pridana funkcia 30.5.06
##############
function day_of_week(datum)
##############
define datum date
define den smallint

let den = weekday(datum) 
if den = 0 then
	let den = 7
end if
return den
end function
}

##################
function perioda_old(cas)
##################
define cas datetime year to minute
define perioda smallint
define den smallint
define dlzka_periody interval hour(3) to hour
define cas_periody datetime hour to hour
define cas_dna datetime hour to hour

let dlzka_periody = 84 
let den = weekday(cas)
if den = 0 then
	let den = 7
end if
if den >= 2 and den <= 5 then
	if den = 5 then
		--let cas_dna = extend(cas)
		if extend(cas) < extend("12:00") then
			let perioda = 1
		else
			let perioda = 2
		end if
	end if
else
	let perioda = 2
end if

return perioda
end function


##################
function perioda(cas)
##################
define cas datetime year to minute
define rok,tyzden,perioda smallint
define zac_posun_tyz like pl_perioda.zac_posun_tyz


whenever error continue
select 
	p.perioda
into
	perioda
from pl_perioda p
where
p.perioda <> 0 and
cas >= 
extend(
   p.zac_posun_tyz + 
   extend(
	firstdayweek(
	   year_of_week(date(cas-p.zac_posun_tyz)),
	   week(date(cas-p.zac_posun_tyz))
	),year to minute
   ),year to minute
) and
cas < 
extend(
   p.kon_posun_tyz + 
   extend(
	firstdayweek(
	   year_of_week(date(cas-p.zac_posun_tyz)),
	   week(date(cas-p.zac_posun_tyz))
	),year to minute
   ),year to minute
)
if sqlca.sqlcode = 0 then
   ---Zistenie posunu pre spravny vypocet roku a tyzdna
   select 
	p.zac_posun_tyz
   into
	zac_posun_tyz
   from pl_perioda p
   where
   p.perioda = perioda
end if
whenever error stop


if sqlca.sqlcode = 0 then
	call year_of_week(date(cas - zac_posun_tyz)) returning rok
	call week1(date(cas - zac_posun_tyz)) returning tyzden
else
	let rok = null
	let tyzden = null
	let perioda = null
end if
return rok,tyzden,perioda
end function

############################################
function hranice_periody(rok,tyzden,perioda)
############################################
define rok,tyzden,perioda smallint
define cas_zac,cas_kon datetime year to minute
define zac_posun_tyz like pl_perioda.zac_posun_tyz
define kon_posun_tyz like pl_perioda.kon_posun_tyz
define datzac,datkon date

call inter(tyzden,rok) returning datzac,datkon
whenever error continue
select 
	p.zac_posun_tyz,
	p.kon_posun_tyz
into
	zac_posun_tyz,
	kon_posun_tyz
from pl_perioda p
where
p.perioda = perioda
whenever error stop

if sqlca.sqlcode = 0 then
	let cas_zac  = extend(datzac) + zac_posun_tyz
	let cas_kon  = extend(datzac) + kon_posun_tyz
else
	let cas_zac  = null
	let cas_kon  = null
end if

return cas_zac,cas_kon
end function

##################################################
function perioda_posun(rok,tyzden,perioda,priznak)
##################################################
define rok,tyzden,perioda smallint
define tyzden3,rok3 smallint
define priznak char
case
	when priznak = "+"
	if perioda = 1 then
		let perioda = perioda + 1
	else
		call tyzdne(tyzden,rok) returning tyzden,tyzden3,rok,rok3
		let perioda = 1
	end if

	when priznak = "-"
	if perioda = 2 then
		let perioda = perioda - 1
	else
		call tyzden_spat(tyzden,rok) returning tyzden,rok
		let perioda = 2
	end if
end case
return rok,tyzden,perioda
end function

##################################################
function perioda_posun2(rok,tyzden,perioda,priznak,posun)
##################################################
define rok,tyzden,perioda smallint
define priznak char
define posun,i smallint
if posun > 0 then
   for i = 1 to posun
	call perioda_posun(rok,tyzden,perioda,priznak) returning rok,tyzden,perioda	
   end for
end if
return rok,tyzden,perioda
end function

###############
function week1(datum)
###############
define datum date
define den1 date --prvy den v roku
define por_den1 smallint --poradie prveho dna v roku
define den1_tyzdna1 date --prvy den v prvom tyzdni
define tyzden smallint
define rozdiel smallint

if datum is null then
        let tyzden = null
        return tyzden
end if

let den1 = mdy(1,1,year(datum))
let por_den1 = weekday(den1)
if por_den1 = 0 then
        let por_den1 = 7
end if

if por_den1 <= 4 then
        let den1_tyzdna1 = den1 - (por_den1 - 1) units day
else
        let den1_tyzdna1 = den1 + (7 - por_den1 + 1) units day
end if
let rozdiel = datum - den1_tyzdna1 + 1
if rozdiel > 0 then
        if (rozdiel mod 7) = 0 then
      let tyzden = rozdiel/7
        else
                let tyzden = (rozdiel/7) + 1
        end if
else
        call week1(mdy(12,31,year(datum)-1)) returning tyzden
end if
if tyzden = 53 and weekday(mdy(12,31,year(datum))) <= 3 then
        let tyzden = 1
end if
return tyzden
end function

############################
function year_of_week(datum)
############################
define datum date
define rok smallint

if datum is null then
       let rok = null
       return rok
end if

let rok = year(datum)
case
        when month(datum) = 12 and
             week1(datum) = 1 and
             (weekday(mdy(12,31,year(datum))) <= 3 and
             weekday(mdy(12,31,year(datum))) <> 0)
                let rok = rok + 1

        when month(datum) = 1 and
             week1(datum) >= 52 and
             (weekday(mdy(1,1,year(datum))) >= 5 or
             weekday(mdy(1,1,year(datum))) = 0)
                let rok = rok - 1
end case
return rok
end function

#####################
function inter(tyzden,rok)
#####################
define tyzden,rok smallint
define den1 date
define den1_tyzdna1 date
define por_den1 smallint
define datzac,datkon date

let datzac = null
let datkon = null

let den1 = mdy(1,1,rok)
let por_den1 = weekday(den1)
if por_den1 = 0 then
        let por_den1 = 7
end if

if por_den1 <= 4 then
        let den1_tyzdna1 = den1 - (por_den1 - 1) units day
else
        let den1_tyzdna1 = den1 + (7 - por_den1 + 1) units day
end if
let datzac = den1_tyzdna1 + (7*(tyzden - 1)) units day
let datkon = datzac + 6 units day
return datzac,datkon
end function

########################
FUNCTION tyzden_spat(tyzden1,rok1)
########################
define tyzden0 int
define tyzden1 int
define rok0 int
define rok1 int
define datzac date
define datkon date
define pom_datkon date
define i int
define j int

call inter(tyzden1,rok1) returning datzac,datkon
let pom_datkon = datzac - 1 units day
call week1(pom_datkon) returning tyzden0
let rok0 = year_of_week(pom_datkon)
return tyzden0,rok0
end function

##############
function day_of_week(datum)
##############
define datum date
define den smallint

let den = weekday(datum)
if den = 0 then
        let den = 7
end if
return den
end function


