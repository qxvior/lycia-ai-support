
#@@001
database tpv 
#@@001

--globals "package/sat_00.4gl"
globals


define  g_vrat record
	data1 char(100),
	data2 char(100),
	data3 char(100),
	data4 char(100),
	data5 char(100),
	data6 char(100),
	data7 char(100),
	data8 char(100),
	data9 char(100),
	data10 char(100),
	data11 char(100),
	data12 char(100),
	data13 char(100),
	data14 char(100),
	data15 char(100),
	data16 char(100),
	data17 char(100),
	data18 char(100),
	data19 char(100),
	data20 char(100),
	data21 char(100),
	data22 char(100),
	data23 char(100),
	data24 char(100),
	data25 char(100),
	data26 char(100),
	data27 char(100),
	data28 char(100),
	data29 char(100),
	data30 char(100),
	data31 char(100),
	data32 char(100),
	data33 char(100),
	data34 char(100),
	data35 char(100),
	data36 char(100),
	data37 char(100),
	data38 char(100),
	data39 char(100),
	data40 char(100),
	data41 char(100),
	data42 char(100),
	data43 char(100),
	data44 char(100),
	data45 char(100),
	data46 char(100),
	data47 char(100),
	data48 char(100),
	data49 char(100),
	data50 char(100),
	data51 char(100),
	data52 char(100),
	data53 char(100),
	data54 char(100),
	data55 char(100),
	data56 char(100),
	data57 char(100),
	data58 char(100),
	data59 char(100),
	data60 char(100),
	data61 char(100),
	data62 char(100),
	data63 char(100),
	data64 char(100),
	data65 char(100),
	data66 char(100),
	data67 char(100),
	data68 char(100),
	data69 char(100),
	data70 char(100),
	data71 char(100),
	data72 char(100),
	data73 char(100),
	data74 char(100),
	data75 char(100),
	data76 char(100),
	data77 char(100),
	data78 char(100),
	data79 char(100),
	data80 char(100),
	data81 char(100),
	data82 char(100),
	data83 char(100),
	data84 char(100),
	data85 char(100),
	data86 char(100),
	data87 char(100),
	data88 char(100),
	data89 char(100),
	data90 char(100),
	data91 char(100),
	data92 char(100),
	data93 char(100),
	data94 char(100),
	data95 char(100),
	data96 char(100),
	data97 char(100),
	data98 char(100),
	data99 char(100),
	data100 char(100)
end record


define gparam record --veta pre vyber parametrov
        id       char(100), --like kalkul:zk_paramoper.id ,
        datplat          char(100), --like kalkul:zk_paramoper.datplat ,
        podv     char(100), --like kalkul:zk_paramoper.podv ,
        cov      char(100), --like kalkul:zk_paramoper.cov ,
        kodsps   char(100), --like kalkul:zk_paramoper.kodsps ,
        csv      char(100), --like kalkul:zk_paramoper.csv ,
        cisoper          char(100), --like kalkul:zk_paramoper.cisoper ,
        gramod   char(100), --like kalkul:zk_paramoper.gramod ,
        gramdo   char(100), --like kalkul:zk_paramoper.gramdo ,
        hrubkaod         char(100), --like kalkul:zk_paramoper.hrubkaod ,
        hrubkado         char(100), --like kalkul:zk_paramoper.hrubkado ,
        rychlost         char(100), --like kalkul:zk_paramoper.rychlost ,
        mjrychlost       char(100), --like kalkul:zk_paramoper.mjrychlost ,
        casmontazzak     char(100), --like kalkul:zk_paramoper.casmontazzak ,
        casmontazfar     char(100), --like kalkul:zk_paramoper.casmontazfar ,
        caszabehzak      char(100), --like kalkul:zk_paramoper.caszabehzak ,
        caszabehfar      char(100), --like kalkul:zk_paramoper.caszabehfar ,
        casmiesaniezak   char(100), --like kalkul:zk_paramoper.casmiesaniezak ,
        casmiesaniefar   char(100), --like kalkul:zk_paramoper.casmiesaniefar ,
        casdemontazzak   char(100), --like kalkul:zk_paramoper.casdemontazzak ,
        casdemontazfar   char(100), --like kalkul:zk_paramoper.casdemontazfar ,
        cascisteniezak   char(100), --like kalkul:zk_paramoper.cascisteniezak ,
        cascisteniefar   char(100), --like kalkul:zk_paramoper.cascisteniefar ,
        casbobinabm      char(100), --like kalkul:zk_paramoper.casbobinabm ,
        casubehmin       char(100), --like kalkul:zk_paramoper.casubehmin ,
        casnaobsluhu     char(100), --like kalkul:zk_paramoper.casnaobsluhu ,
        percodpad        char(100), --like kalkul:zk_paramoper.percodpad ,
        pridavokmaterzak char(100), --like kalkul:zk_paramoper.pridavokmaterzak ,
        pridavokmaterzfar  char(100), --like kalkul:zk_paramoper.pridavokmaterzfar ,
        pobobinabm       char(100), --like kalkul:zk_paramoper.pobobinabm ,
        pridavokbehbm    char(100), --like kalkul:zk_paramoper.pridavokbehbm ,
        pridavokfarby    char(100), --like kalkul:zk_paramoper.pridavokfarby ,
        liehnaumytie     char(100), --like kalkul:zk_paramoper.liehnaumytie ,
        ckpolprip1       char(100), --like kalkul:zk_paramoper.ckpolprip1 ,
        ckpolprip2       char(100), --like kalkul:zk_paramoper.ckpolprip2 ,
        ckpolprip3       char(100), --like kalkul:zk_paramoper.ckpolprip3 ,
        ckpolbeh1        char(100), --like kalkul:zk_paramoper.ckpolbeh1 ,
        ckpolbeh2        char(100), --like kalkul:zk_paramoper.ckpolbeh2 ,
        ckpolbeh3        char(100), --like kalkul:zk_paramoper.ckpolbeh3 ,
        sadzbaprip1      char(100), --like kalkul:zk_paramoper.sadzbaprip1 ,
        sadzbaprip2      char(100), --like kalkul:zk_paramoper.sadzbaprip2 ,
        sadzbaprip3      char(100), --like kalkul:zk_paramoper.sadzbaprip3 ,
        sadzbabeh1       char(100), --like kalkul:zk_paramoper.sadzbabeh1 ,
        sadzbabeh2       char(100), --like kalkul:zk_paramoper.sadzbabeh2 ,
        sadzbabeh3       char(100), --like kalkul:zk_paramoper.sadzbabeh3 ,
        poznamka         char(100), --like kalkul:zk_paramoper.poznamka ,
        novecsv          char(100), --like kalkul:sort.novecsv ,
        ckpolprip4       char(100), --like kalkul:zk_paramoper.ckpolprip4 ,
        ckpolprip5       char(100), --like kalkul:zk_paramoper.ckpolprip5 ,
        ckpolprip6       char(100), --like kalkul:zk_paramoper.ckpolprip6 ,
        ckpolbeh4        char(100), --like kalkul:zk_paramoper.ckpolbeh4 ,
        ckpolbeh5        char(100), --like kalkul:zk_paramoper.ckpolbeh5 ,
        ckpolbeh6        char(100), --like kalkul:zk_paramoper.ckpolbeh6 ,
        sadzbaprip4      char(100), --like kalkul:zk_paramoper.sadzbaprip4 ,
        sadzbaprip5      char(100), --like kalkul:zk_paramoper.sadzbaprip5 ,
        sadzbaprip6      char(100), --like kalkul:zk_paramoper.sadzbaprip6 ,
        sadzbabeh4       char(100), --like kalkul:zk_paramoper.sadzbabeh4 ,
        sadzbabeh5       char(100), --like kalkul:zk_paramoper.sadzbabeh5 ,
        sadzbabeh6       char(100) --like kalkul:zk_paramoper.sadzbabeh6
 end record


define gautor_02 char(30),
	gautor_03 char(30),
	gautor_04 char(30),
	gautor_05 char(30),
	gautor_06 char(30),
	gautor_07 char(30),
	gautor_08 char(30),
	gautor_09 char(30),
	gautor_10 char(30),
	gautor_11 char(30),
	gautor_12 char(30),
	gautor_13 char(30),
	gautor_14 char(30),
	gautor_15 char(30),
	gautor_16 char(30),
	gautor_17 char(30),
	gautor_18 char(30),
	gautor_19 char(30),
	gautor_20 char(30),
	gautor_21 char(30),
	gautor_22 char(30),
	gautor_23 char(30),
	gautor_24 char(30),
	gautor_25 char(30),
	gautor_26 char(30),
	gautor_27 char(30),
	gautor_28 char(30),
	gautor_29 char(30),
	gautor_30 char(30),
	gautor_31 char(30),
	gautor_32 char(30),
	gautor_33 char(30),
	gautor_34 char(30),
	gautor_35 char(30),
	gautor_36 char(30),
	gautor_37 char(30),
	gautor_38 char(30),
	gautor_39 char(30),
	gautor_40 char(30),
	gautor_41 char(30),
	gautor_45 char(30),
	gautor_46 char(30),
	gautor_47 char(30),
	gautor_48 char(30),
	gautor_49 char(30),
	gautor_50 char(30),
	gautor_51 char(30),
	gautor_52 char(30),
	gautor_53 char(30),
	gautor_54 char(30),
	gautor_55 char(30),
	gautor_56 char(30),
	gautor_57 char(30),
	gautor_58 char(30),
	gautor_59 char(30)

define guzivcond_02,
	guzivcond_03,
	guzivcond_04,
	guzivcond_05,
	guzivcond_06,
	guzivcond_07,
	guzivcond_08,
	guzivcond_09,
	guzivcond_10,
	guzivcond_11,
	guzivcond_12,
	guzivcond_13,
	guzivcond_14,
	guzivcond_15,
	guzivcond_16,
	guzivcond_17,
	guzivcond_18,
	guzivcond_19,
	guzivcond_20,
	guzivcond_21,
	guzivcond_22,
	guzivcond_23,
	guzivcond_24,
	guzivcond_25,
	guzivcond_26,
	guzivcond_27,
	guzivcond_28,
	guzivcond_29,
	guzivcond_30,
	guzivcond_31,
	guzivcond_32,
	guzivcond_33,
	guzivcond_34,
	guzivcond_35,
	guzivcond_36,
	guzivcond_37,
	guzivcond_38,
	guzivcond_39,
	guzivcond_40,
	guzivcond_41,
	guzivcond_42,
	guzivcond_43,
	guzivcond_44,
	guzivcond_45,
	guzivcond_46,
	guzivcond_47,
	guzivcond_48,
	guzivcond_49,
	guzivcond_50,
	guzivcond_51,
	guzivcond_52,
	guzivcond_53,
	guzivcond_54,
	guzivcond_55,
	guzivcond_56,
	guzivcond_57,
	guzivcond_58,
	guzivcond_59
	 char(1000)


#@@039
##@@18
define pp_18 record 
		id 	 char(100), --like pl_dostup_zdroja.id ,
		idpl_poziad_progn 	 char(100), --like pl_dostup_zdroja.idpl_poziad_progn ,
		idpl_vyuz_zdroj 	 char(100), --like pl_dostup_zdroja.idpl_vyuz_zdroj ,
		verzia 	 char(100), --like pl_dostup_zdroja.verzia ,
		platnost 	 char(100), --like pl_dostup_zdroja.platnost ,
		cpv 	 char(100), --like pl_vyuz_zdroj.cpv ,
		cov 	 char(100), --like pl_vyuz_zdroj.cov ,
		coo 	 char(100), --like vp_polot.cov ,
		datplat 	 char(100), --like pl_vyuz_zdroj.datplat ,
		csv 	 char(100), --like pl_vyuz_zdroj.csv ,
		ckpol 	 char(100), --like pl_vyuz_zdroj.ckpol ,
		idsh_material 	 char(100), --like pl_vyuz_zdroj.idsh_material ,
		cissklad 	 char(100), --like is_1:sh_material.cissklad ,
		evidcis 	 char(100), --like is_1:sh_material.evidcis ,
		nazovmat 	 char(100), --like is_1:sh_material.nazovmat ,
		termin_dodania 	 char(100), --like pl_dostup_zdroja.termin_dodania ,
		c_potv 	 char(100), --like pl_dostup_zdroja.c_potv ,
		idpotvrdil 	 char(100), --like pl_dostup_zdroja.idpotvrdil ,
		priezvisko 	 CHAR(50) ,
		meno 	 CHAR(20) ,
		sirka 	 char(100), --like pl_vyuz_zdroj.sirka ,
		gram 	 char(100), --like pl_vyuz_zdroj.gram ,
		mikron 	 char(100), --like pl_vyuz_zdroj.mikron ,
		mnoz_kg 	 char(100), --like pl_vyuz_zdroj.mnoz_kg ,
		mnoz_mj 	 char(100), --like pl_vyuz_zdroj.mnoz_mj ,
		mj 	 char(100), --like pl_vyuz_zdroj.mj ,
		nahrad 	 char(100), --like kalkul:kalpol.nahrad ,
		nazov 	 CHAR(35) ,
		idpl_sledpolozka 	 char(100), --like pl_vyuz_zdroj.idpl_sledpolozka ,
		idpl_typzdroja 	 char(100), --like pl_vyuz_zdroj.idpl_typzdroja ,
		sirka_gener 	 char(100), --like pl_vyuz_zdroj.sirka_gener ,
		mnoz_kg_gener 	 char(100), --like pl_vyuz_zdroj.mnoz_kg_gener ,
		mnoz_mj_gener 	 char(100), --like pl_vyuz_zdroj.mnoz_mj_gener ,
		gener 	 char(100), --like pl_vyuz_zdroj.gener ,
		termin_poz_uv 	 char(100), --like pl_poziad_progn.termin_poz_uv ,
		cso 	 char(100), --like vp_polot.csv ,
		kod_oper 	 char(100), --like pl_oper.kod_oper ,
		sirka_odober 	 char(100), --like vp_polot.sirka ,
		mnoz_m2_odober 	 char(100), --like vp_polot.mnoz_m2_vst ,
		vrstva 	 char(100), --like pl_vyuz_zdroj.vrstva ,
		tlacena_vrstva 	 CHAR(1) 
	 end record 
##@@18
##@@03
define pp_03 record 
		id 	 char(100), --like pl_paramstroj.id ,
		cpv 	 char(100), --like pl_paramstroj.cpv ,
		cov 	 char(100), --like pl_paramstroj.cov ,
		cstroj 	 char(100), --like pl_paramstroj.cstroj ,
		nazstroja 	 char(100), --like polot:po_stroje.nazstroja ,
		idpo_stroje 	 char(100), --like pl_paramstroj.idpo_stroje ,
		idzmenil 	 char(100), --like pl_paramstroj.idzmenil ,
		zaklvyroba 	 char(100), --like pl_paramstroj.zaklvyroba ,
		tlac 	 char(100), --like pl_paramstroj.tlac ,
		rezanie 	 char(100), --like pl_paramstroj.rezanie ,
		konfekcia 	 char(100), --like pl_paramstroj.konfekcia ,
		kasirovanie 	 char(100), --like pl_paramstroj.kasirovanie ,
		min_vst_sirka 	 char(100), --like pl_paramstroj.min_vst_sirka ,
		max_vst_sirka 	 char(100), --like pl_paramstroj.max_vst_sirka ,
		min_vst_hrubka 	 char(100), --like pl_paramstroj.min_vst_hrubka ,
		max_vst_hrubka 	 char(100), --like pl_paramstroj.max_vst_hrubka ,
		min_vys_sirka 	 char(100), --like pl_paramstroj.min_vys_sirka ,
		max_vys_sirka 	 char(100), --like pl_paramstroj.max_vys_sirka ,
		min_vys_dlzka 	 char(100), --like pl_paramstroj.min_vys_dlzka ,
		max_vys_dlzka 	 char(100), --like pl_paramstroj.max_vys_dlzka ,
		korona_nevodiva 	 char(100), --like pl_paramstroj.korona_nevodiva ,
		korona_vodiva 	 char(100), --like pl_paramstroj.korona_vodiva ,
		korona_umiest 	 char(100), --like pl_paramstroj.korona_umiest ,
		coldseal_pozdlz 	 char(100), --like pl_paramstroj.coldseal_pozdlz ,
		coldseal_umiest 	 char(100), --like pl_paramstroj.coldseal_umiest ,
		unikat_kody 	 char(100), --like pl_paramstroj.unikat_kody ,
		rychlost_unikod 	 char(100), --like pl_paramstroj.rychlost_unikod ,
		mjrychlost_unikod 	 char(100), --like pl_paramstroj.mjrychlost_unikod ,
		max_pocval 	 char(100), --like pl_paramstroj.max_pocval ,
		min_tl_sirka 	 char(100), --like pl_paramstroj.min_tl_sirka ,
		max_tl_sirka 	 char(100), --like pl_paramstroj.max_tl_sirka ,
		min_obvodval 	 char(100), --like pl_paramstroj.min_obvodval ,
		max_obvodval 	 char(100), --like pl_paramstroj.max_obvodval ,
		presnyraport 	 char(100), --like pl_paramstroj.presnyraport ,
		poc_obracacov 	 char(100), --like pl_paramstroj.poc_obracacov ,
		kratka_vod_draha 	 char(100), --like pl_paramstroj.kratka_vod_draha ,
		esa 	 char(100), --like pl_paramstroj.esa ,
		min_prie_navinu 	 char(100), --like pl_paramstroj.min_prie_navinu ,
		max_prie_navinu 	 char(100), --like pl_paramstroj.max_prie_navinu ,
		min_dutinka 	 char(100), --like pl_paramstroj.min_dutinka ,
		max_dutinka 	 char(100), --like pl_paramstroj.max_dutinka ,
		laser_perfor 	 char(100), --like pl_paramstroj.laser_perfor ,
		vzduch_otvory 	 char(100), --like pl_paramstroj.vzduch_otvory ,
		umiest_pozdl_zlep 	 char(100), --like pl_paramstroj.umiest_pozdl_zlep ,
		priezvisko 	 CHAR(50) ,
		meno 	 CHAR(20) ,
		c_zmeny 	 char(100) --like pl_paramstroj.c_zmeny 
	 end record 
##@@03
##@@14
define pp_14 record 
		id 	 char(100), --like pl_poziad_progn.id ,
		ckz 	 char(100), --like pl_poziad_progn.ckz ,
		porc 	 char(100), --like pl_poziad_progn.porc ,
		stav 	 char(100), --like pl_poziad_progn.stav ,
		status_gen_vp 	 char(100), --like pl_poziad_progn.status_gen_vp ,
		stav_terminy 	 CHAR(1) ,
		pr_ziada_term 	 char(100), --like pl_poziad_progn.pr_ziada_term ,
		idkzmluvy 	 char(100), --like pl_poziad_progn.idkzmluvy ,
		idkpolozky 	 char(100), --like pl_poziad_progn.idkpolozky ,
		cislo_vp 	 char(100), --like pl_poziad_progn.cislo_vp ,
		idv_prikazy 	 char(100), --like pl_poziad_progn.idv_prikazy ,
		termin_poz_uv 	 char(100), --like pl_poziad_progn.termin_poz_uv ,
		termin_prog_uv 	 char(100), --like pl_poziad_progn.termin_prog_uv ,
		nazof 	 char(100), --like v_prikazy.nazof ,
		pozn_predaja 	 CHAR(1) ,
		sirka 	 char(100), --like v_prikazy.sirka ,
		csort 	 char(100), --like v_prikazy.csort ,
		nazsort 	 char(100), --like v_prikazy.nazsort ,
		gram 	 char(100), --like vyrobky:fivy.gram ,
		mikron 	 char(100), --like vyrobky:fivy.mikron ,
		mnozkg 	 char(100), --like v_prikazy.mnozkg ,
		mnozks 	 char(100), --like v_prikazy.mnozks ,
		mj_ks 	 char(100), --like v_prikazy.mj_ks ,
		crefv 	 char(100), --like v_prikazy.crefv ,
		kodzmen 	 char(100), --like v_prikazy.kodzmen ,
		pocval 	 char(100), --like v_p_motiv.pocval ,
		oznac 	 char(100), --like v_prikazy.oznac ,
		d_poziad 	 char(100), --like pl_poziad_progn.d_poziad ,
		c_poziad 	 char(100), --like pl_poziad_progn.c_poziad ,
		idpozadoval 	 char(100), --like pl_poziad_progn.idpozadoval ,
		priezvisko 	 CHAR(50) ,
		meno 	 CHAR(20) ,
		d_prognoz 	 char(100), --like pl_poziad_progn.d_prognoz ,
		c_prognoz 	 char(100), --like pl_poziad_progn.c_prognoz ,
		idprognozoval 	 char(100), --like pl_poziad_progn.idprognozoval ,
		priez_prog 	 CHAR(50) ,
		meno_prog 	 CHAR(20) ,
		d_potvrdenia 	 char(100), --like pl_poziad_progn.d_potvrdenia ,
		c_potvrdenia 	 char(100), --like pl_poziad_progn.c_potvrdenia ,
		idpotvrdil 	 char(100), --like pl_poziad_progn.idpotvrdil ,
		priez_potv 	 CHAR(50) ,
		meno_potv 	 CHAR(20) ,
		d_poziad_stor 	 char(100), --like pl_poziad_progn.d_poziad_stor ,
		c_poziad_stor 	 char(100), --like pl_poziad_progn.c_poziad_stor ,
		idpoziad_stor 	 char(100), --like pl_poziad_progn.idpoziad_stor ,
		priez_stor 	 CHAR(50) ,
		meno_stor 	 CHAR(20) ,
		d_uplynutia 	 char(100), --like pl_poziad_progn.d_uplynutia ,
		c_uplynutia 	 char(100), --like pl_poziad_progn.c_uplynutia ,
		d_akceptacie 	 char(100), --like pl_poziad_progn.d_akceptacie ,
		c_akceptacie 	 char(100), --like pl_poziad_progn.c_akceptacie ,
		idakceptoval 	 char(100), --like pl_poziad_progn.idakceptoval ,
		priez_akcept 	 CHAR(50) ,
		meno_akcept 	 CHAR(20) ,
		kod_gfp_1st 	 char(100), --like k_zmluvy:kpolozky.kod_gfp_1st ,
		kod_storna 	 char(100), --like k_zmluvy:kpolozky.kod_storna ,
		stav_prik 	 char(100), --like v_prikazy.stav_prik ,
		ins_dostup_zdr 	 char(100), --like pl_poziad_progn.ins_dostup_zdr ,
		pozn 	 char(100), --like k_zmluvy:poznamky.pozn ,
		pozn_log 	 char(100), --like k_zmluvy:poznamky.pozn ,
		verzia_vp 	 char(100), --like v_prikazy.verzia ,
		verzia 	 char(100), --like pl_poziad_progn.verzia ,
		ukonc_gfp 	 char(100), --like v_prikazy.ukonc_gfp ,
		termin_prog_uv_s 	 char(100), --like pl_poziad_progn.termin_prog_uv_s ,
		vzorka 	 char(100), --like v_prikazy.vzorka ,
		pcrefv 	 char(100), --like v_prikazy.pcrefv ,
		podv 	 char(100), --like v_prikazy.podv ,
		c_odosl_na_logist 	 char(100), --like pl_poziad_progn.c_odosl_na_logist ,
		idodosl_na_logist 	 char(100), --like pl_poziad_progn.idodosl_na_logist ,
		priez_logist 	 CHAR(50) ,
		meno_logist 	 CHAR(20) ,
		varianta 	 char(100), --like v_prikazy.varianta ,
		zl_laky_szvar 	 char(100), --like v_prikazy.zl_laky_szvar ,
		kodvyvoja 	 char(100), --like v_prikazy.kodvyvoja ,
		archiv 	 CHAR(1) ,
		typ_vynimky 	 CHAR(1) ,
		typ_vynimky_popis 	 CHAR(13) ,
		termin_vynimky 	 DATE ,
		termin_zmluv_uv 	 char(100), --like pl_poziad_progn.termin_zmluv_uv ,
		termin_prog_natlac 	 char(100), --like pl_poziad_progn.termin_prog_natlac ,
		tlac1 	 char(100), --like pl_poziad_progn.tlac1 ,
		c_suhlasil_sirky 	 char(100), --like pl_poziad_progn.c_suhlasil_sirky ,
		idsuhlasil_sirky 	 char(100), --like pl_poziad_progn.idsuhlasil_sirky ,
		priez_suhlas_sirky 	 CHAR(50) ,
		meno_suhlas_sirky 	 CHAR(20) ,
		priznak_sirky 	 CHAR(1) ,
		pocet_planov 	 SMALLINT ,
		pocet_family 	 SMALLINT 
	 end record 
##@@14
##@@02
define pp_02 record 
		id 	 char(100), --like pl_dobyzrenia.id ,
		cpv 	 char(100), --like pl_dobyzrenia.cpv ,
		csv 	 char(100), --like pl_dobyzrenia.csv ,
		nazov 	 char(100), --like kalkul:sort.nazov ,
		ctoper 	 char(100), --like pl_dobyzrenia.ctoper ,
		cisoper 	 char(100), --like pl_tech_zl.cisoper ,
		nazoper 	 char(100), --like pl_oper.nazoper ,
		platnostod 	 char(100), --like pl_dobyzrenia.platnostod ,
		platnostdo 	 char(100), --like pl_dobyzrenia.platnostdo ,
		caszrenia 	 char(100), --like pl_dobyzrenia.caszrenia ,
		techn_spracov 	 char(100), --like pl_dobyzrenia.techn_spracov ,
		ctv 	 char(100), --like tech_sort.ctv ,
		naztech 	 char(100), --like technologie.naztech ,
		c_zmeny 	 char(100), --like pl_dobyzrenia.c_zmeny ,
		idzmenil 	 char(100), --like pl_dobyzrenia.idzmenil ,
		cov2 	 char(100), --like kalkul:sort.cov ,
		priezvisko 	 CHAR(50) ,
		meno 	 CHAR(20) ,
		cov 	 char(100), --like pl_dobyzrenia.cov ,
		coo 	 char(100), --like pl_dobyzrenia.coo ,
		idfivy 	 char(100) --like pl_dobyzrenia.idfivy 
	 end record 
##@@02
##@@46
define pp_46 record 
		id 	 char(100), --like pl_rezerv_kapacita.id ,
		idpl_kalend_obd 	 char(100), --like pl_rezerv_kapacita.idpl_kalend_obd ,
		cpv 	 char(100), --like pl_rezerv_kapacita.cpv ,
		cov 	 char(100), --like pl_rezerv_kapacita.cov ,
		obdobie 	 char(100), --like pl_rezerv_kapacita.obdobie ,
		idpo_stroje 	 char(100), --like pl_rezerv_kapacita.idpo_stroje ,
		cstroj 	 char(100), --like polot:po_stroje.cstroj ,
		nazstroja 	 char(100), --like polot:po_stroje.nazstroja ,
		idnad_spol1 	 char(100), --like pl_rezerv_kapacita.idnad_spol1 ,
		snazf 	 char(100), --like vyrobky:firma.snazf ,
		pref_tlac1 	 char(100), --like exp_kalk:nad_spol1.pref_tlac1 ,
		rezerv_kapacita 	 char(100), --like pl_rezerv_kapacita.rezerv_kapacita ,
		rez_kap_per 	 DEC(4,1) ,
		plan_napln 	 INTERVAL DAY(3) TO MINUTE ,
		pouzita 	 INTERVAL DAY(3) TO MINUTE ,
		rez_kap_v 	 INTERVAL DAY(3) TO MINUTE ,
		sklz 	 INTERVAL DAY(3) TO MINUTE ,
		vyrobene_plan 	 INTERVAL DAY(3) TO MINUTE ,
		obchodny_plan 	 INTERVAL DAY(3) TO MINUTE ,
		podiel_sklzu 	 INTERVAL DAY(3) TO MINUTE ,
		celk_kap_stroj 	 INTERVAL DAY(3) TO MINUTE ,
		platnost 	 char(100), --like pl_rezerv_kapacita.platnost ,
		cas_zmeny 	 char(100), --like pl_rezerv_kapacita.cas_zmeny ,
		priezvisko 	 CHAR(50) ,
		meno 	 CHAR(20) ,
		idzmenil 	 char(100) --like pl_rezerv_kapacita.idzmenil 
	 end record 
##@@46
##@@59
define pp_59 record 
		id 	 char(100), --like tp_hlavicka.id ,
		cpf 	 char(100), --like tp_hlavicka.cpf ,
		csf 	 char(100), --like tp_hlavicka.csf ,
		cof 	 char(100), --like tp_hlavicka.cof ,
		nazov 	 char(100), --like kalkul:sort.nazov ,
		popis 	 char(100), --like kalkul:kodsort.popis ,
		varianta 	 char(100), --like tp_hlavicka.varianta ,
		gramf 	 char(100), --like tp_hlavicka.gramf ,
		mikronf 	 char(100), --like tp_hlavicka.mikronf ,
		jemnostf 	 char(100), --like tp_hlavicka.jemnostf ,
		idft_typzdruzf 	 char(100), --like tp_hlavicka.idft_typzdruzf ,
		typ 	 char(100), --like polot:ft_typzdruz.typ ,
		pocetfibrilf 	 char(100), --like tp_hlavicka.pocetfibrilf ,
		idft_smerzakrutf 	 char(100), --like tp_hlavicka.idft_smerzakrutf ,
		kod 	 char(100), --like polot:ft_smerzakrut.kod ,
		skaci_zakrutf 	 char(100), --like tp_hlavicka.skaci_zakrutf ,
		idfarbypopf 	 char(100), --like tp_hlavicka.idfarbypopf ,
		kodfar 	 char(100), --like vyrobky:farbypop.kodfar ,
		nazmelir 	 char(100), --like vyrobky:farbypop.nazmelir ,
		idprofilvlf 	 char(100), --like tp_hlavicka.idprofilvlf ,
		skratka 	 char(100), --like vlakna:profilvl.skratka ,
		nazslov 	 char(100), --like vlakna:profilvl.nazslov ,
		variant_vyroby 	 char(100), --like tp_hlavicka.variant_vyroby ,
		platnost 	 char(100), --like tp_hlavicka.platnost ,
		idzmenil 	 char(100), --like tp_hlavicka.idzmenil ,
		cas_zmeny 	 char(100), --like tp_hlavicka.cas_zmeny ,
		celemeno 	 CHAR(100) ,
		novecsv 	 char(100) --like kalkul:sort.novecsv 
	 end record 
##@@59
##@@55
define pp_55 record 
		id 	 char(100), --like pl_poziad_progn.id ,
		ckz 	 char(100), --like pl_poziad_progn.ckz ,
		porc 	 char(100), --like pl_poziad_progn.porc ,
		stav 	 char(100), --like pl_poziad_progn.stav ,
		status_gen_vp 	 char(100), --like pl_poziad_progn.status_gen_vp ,
		stav_terminy 	 CHAR(1) ,
		pr_ziada_term 	 char(100), --like pl_poziad_progn.pr_ziada_term ,
		idkzmluvy 	 char(100), --like pl_poziad_progn.idkzmluvy ,
		idkpolozky 	 char(100), --like pl_poziad_progn.idkpolozky ,
		cislo_vp 	 char(100), --like pl_poziad_progn.cislo_vp ,
		idv_prikazy 	 char(100), --like pl_poziad_progn.idv_prikazy ,
		termin_poz_uv 	 char(100), --like pl_poziad_progn.termin_poz_uv ,
		termin_prog_uv 	 char(100), --like pl_poziad_progn.termin_prog_uv ,
		nazof 	 char(100), --like vyrobky:firma.nazof ,
		pozn_predaja 	 CHAR(1) ,
		csv 	 char(100), --like kalkul:sort.csv ,
		nazov 	 char(100), --like kalkul:sort.nazov ,
		celkks 	 char(100), --like vptab.celkks ,
		merjed 	 char(100), --like vptab.merjed ,
		cref 	 char(100), --like vptab.cref ,
		kodzmen 	 char(100), --like vptab.kodzmen ,
		d_poziad 	 char(100), --like pl_poziad_progn.d_poziad ,
		c_poziad 	 char(100), --like pl_poziad_progn.c_poziad ,
		idpozadoval 	 char(100), --like pl_poziad_progn.idpozadoval ,
		priezvisko 	 CHAR(50) ,
		meno 	 CHAR(20) ,
		d_prognoz 	 char(100), --like pl_poziad_progn.d_prognoz ,
		c_prognoz 	 char(100), --like pl_poziad_progn.c_prognoz ,
		idprognozoval 	 char(100), --like pl_poziad_progn.idprognozoval ,
		priez_prog 	 CHAR(50) ,
		meno_prog 	 CHAR(20) ,
		d_potvrdenia 	 char(100), --like pl_poziad_progn.d_potvrdenia ,
		c_potvrdenia 	 char(100), --like pl_poziad_progn.c_potvrdenia ,
		idpotvrdil 	 char(100), --like pl_poziad_progn.idpotvrdil ,
		priez_potv 	 CHAR(50) ,
		meno_potv 	 CHAR(20) ,
		d_poziad_stor 	 char(100), --like pl_poziad_progn.d_poziad_stor ,
		c_poziad_stor 	 char(100), --like pl_poziad_progn.c_poziad_stor ,
		idpoziad_stor 	 char(100), --like pl_poziad_progn.idpoziad_stor ,
		priez_stor 	 CHAR(50) ,
		meno_stor 	 CHAR(20) ,
		d_uplynutia 	 char(100), --like pl_poziad_progn.d_uplynutia ,
		c_uplynutia 	 char(100), --like pl_poziad_progn.c_uplynutia ,
		d_akceptacie 	 char(100), --like pl_poziad_progn.d_akceptacie ,
		c_akceptacie 	 char(100), --like pl_poziad_progn.c_akceptacie ,
		idakceptoval 	 char(100), --like pl_poziad_progn.idakceptoval ,
		priez_akcept 	 CHAR(50) ,
		meno_akcept 	 CHAR(20) ,
		kod_storna 	 char(100), --like vlakna:vpolozky.kod_storna ,
		stav_prik 	 char(100), --like vptab.stav_prik ,
		ins_dostup_zdr 	 char(100), --like pl_poziad_progn.ins_dostup_zdr ,
		pozn 	 char(100), --like vlakna:poznamky.pozn ,
		pozn_log 	 char(100), --like vlakna:poznamky.pozn ,
		verzia_vp 	 char(100), --like vptab.verzia ,
		verzia 	 char(100), --like pl_poziad_progn.verzia ,
		termin_prog_uv_s 	 char(100), --like pl_poziad_progn.termin_prog_uv_s ,
		pcrefv 	 char(100), --like vlakna:vpolozky.pcrefv ,
		podnik 	 char(100), --like vptab.podnik ,
		c_odosl_na_logist 	 char(100), --like pl_poziad_progn.c_odosl_na_logist ,
		idodosl_na_logist 	 char(100), --like pl_poziad_progn.idodosl_na_logist ,
		priez_logist 	 CHAR(50) ,
		meno_logist 	 CHAR(20) ,
		kodvyvoja 	 char(100), --like kalkul:sort.kodvyvoja ,
		typ_vynimky 	 CHAR(1) ,
		typ_vynimky_popis 	 CHAR(13) ,
		termin_vynimky 	 DATE ,
		termin_zmluv_uv 	 char(100), --like pl_poziad_progn.termin_zmluv_uv ,
		termin_prog_natlac 	 char(100), --like pl_poziad_progn.termin_prog_natlac ,
		tlac1 	 char(100), --like pl_poziad_progn.tlac1 ,
		c_suhlasil_sirky 	 char(100), --like pl_poziad_progn.c_suhlasil_sirky ,
		idsuhlasil_sirky 	 char(100), --like pl_poziad_progn.idsuhlasil_sirky ,
		priez_suhlas_sirky 	 CHAR(50) ,
		meno_suhlas_sirky 	 CHAR(20) ,
		dtex_nazov 	 char(100), --like vptab.dtex_nazov ,
		specifv 	 char(100), --like vptab.specifv ,
		dtex_velkost 	 CHAR(20) ,
		farba 	 char(100), --like vptab.farba ,
		menom 	 char(100), --like vptab.menom ,
		mel_nazov 	 char(100), --like vptab.mel_nazov ,
		melir_menovz 	 CHAR(15) ,
		nazovvyr 	 char(100), --like vptab.nazovvyr ,
		kod 	 char(100), --like polot:ft_smerzakrut.kod ,
		idvzmluvy 	 char(100), --like pl_poziad_progn.idvzmluvy ,
		idvpolozky 	 char(100), --like pl_poziad_progn.idvpolozky ,
		idvptab 	 char(100), --like pl_poziad_progn.idvptab ,
		cpv 	 char(100), --like pl_poziad_progn.cpv ,
		cpf 	 char(100), --like pl_poziad_progn.cpf ,
		csf 	 char(100), --like pl_poziad_progn.csf ,
		varianta 	 char(100), --like pl_poziad_progn.varianta ,
		gramf 	 char(100), --like pl_poziad_progn.gramf ,
		mikronf 	 char(100), --like pl_poziad_progn.mikronf ,
		jemnostf 	 char(100), --like pl_poziad_progn.jemnostf ,
		idft_typzdruzf 	 char(100), --like pl_poziad_progn.idft_typzdruzf ,
		pocetfibrilf 	 char(100), --like pl_poziad_progn.pocetfibrilf ,
		idft_smerzakrutf 	 char(100), --like pl_poziad_progn.idft_smerzakrutf ,
		skaci_zakrutf 	 char(100), --like pl_poziad_progn.skaci_zakrutf ,
		idfarbypopf 	 char(100), --like pl_poziad_progn.idfarbypopf ,
		idprofilvlf 	 char(100), --like pl_poziad_progn.idprofilvlf ,
		variant_vyroby 	 char(100), --like pl_poziad_progn.variant_vyroby ,
		c_urcil_variant 	 char(100), --like pl_poziad_progn.c_urcil_variant ,
		urcil_variant 	 char(100), --like pl_poziad_progn.urcil_variant ,
		priez_urc_variant 	 CHAR(50) ,
		meno_urc_variant 	 CHAR(20) 
	 end record 
##@@55
##@@58
define pp_58 record 
		pod 	 char(100), --like ciselniky:str.pod ,
		str 	 char(100), --like ciselniky:str.str ,
		nazov 	 char(100), --like ciselniky:str.nazov ,
		id 	 char(100), --like polot:po_stroje.id ,
		cstroj 	 char(100), --like polot:po_stroje.cstroj ,
		nazstroja 	 char(100) --like polot:po_stroje.nazstroja 
	 end record 
##@@58
##@@57
define pp_57 record 
		id 	 char(100), --like pl_rezerv_odd.id ,
		cpv 	 char(100), --like pl_rezerv_odd.cpv ,
		cov 	 char(100), --like pl_rezerv_odd.cov ,
		nazov 	 char(100), --like ciselniky:str.nazov ,
		platnost 	 char(100), --like pl_rezerv_odd.platnost ,
		cas_zmeny 	 char(100), --like pl_rezerv_odd.cas_zmeny ,
		zmenil 	 char(100), --like pl_rezerv_odd.zmenil ,
		celemeno 	 CHAR(100) 
	 end record 
##@@57
##@@56
define pp_56 record 
		ckz 	 char(100), --like v_prikazy.ckz ,
		porc 	 char(100), --like v_prikazy.porc ,
		cislo_vp 	 char(100), --like v_prikazy.cislo_vp ,
		datpotv 	 char(100), --like v_prikazy.datpotv ,
		mnozkg 	 char(100), --like v_prikazy.mnozkg ,
		oznac 	 char(100), --like v_prikazy.oznac ,
		snazf 	 char(100), --like vyrobky:firma.snazf ,
		mnoz_kg 	 char(100), --like vp_polot.mnoz_kg ,
		vyrkg 	 char(100) --like polot:ht_vpvyr.vyrkg 
	 end record 
##@@56
##@@44
define pp_44 record 
		cislo_vp 	 char(100), --like v_prikazy.cislo_vp ,
		ckz 	 char(100), --like v_prikazy.ckz ,
		porc 	 char(100), --like v_prikazy.porc ,
		nazof 	 char(100), --like v_prikazy.nazof ,
		cov 	 char(100), --like vp_polot.cov ,
		cisoper 	 char(100), --like vp_polot.cisoper ,
		d_plnenia 	 char(100), --like vp_polot.d_plnenia ,
		suma_zdrojov 	 DEC(9,2) ,
		mnoz_kg 	 char(100), --like vp_polot.mnoz_kg ,
		cstroj 	 char(100), --like denne_plany.cstroj ,
		poradie 	 char(100), --like denne_plany.poradie ,
		termin_zaciatku 	 DATETIME YEAR TO MINUTE ,
		pozn 	 char(100), --like denne_plany.pozn ,
		vstup_polot 	 CHAR(1) ,
		idsh_material 	 char(100), --like pl_vyuz_zdroj.idsh_material ,
		idvp_polot 	 char(100) --like pl_sledpolozka.idvp_polot 
	 end record 
##@@44
##@@34
define pp_34 record 
		typ_materialu 	 CHAR(9) ,
		datprijmu 	 DATE ,
		str 	 char(100), --like polot:ht_skladprod.str ,
		kg 	 char(100), --like polot:ht_skladprod.kg ,
		doba_skladovania 	 INTEGER ,
		sirka 	 char(100) --like is_1:sh_popis.sirka 
	 end record 
##@@34
##@@19
define pp_19 record 
		priorita 	 SMALLINT ,
		skupinakp 	 CHAR(15) ,
		sirka 	 char(100), --like is_1:sh_popis.sirka ,
		hrubka 	 char(100), --like is_1:sh_popis.hrubka ,
		nazovmat 	 char(100), --like is_1:sh_material.nazovmat ,
		doba_skladovania 	 INTEGER ,
		stavmat 	 char(100), --like is_1:sh_stavy.stavmat ,
		mat_zdroje 	 DEC(12,3) ,
		mat_obj 	 DEC(12,3) ,
		mat_str 	 DEC(12,3) ,
		skrmj 	 char(100), --like is_1:sh_material.skrmj ,
		pod 	 char(100), --like is_1:sh_material.pod ,
		cissklad 	 char(100), --like is_1:sh_material.cissklad ,
		evidcis 	 char(100), --like is_1:sh_material.evidcis ,
		id 	 char(100), --like is_1:sh_material.id ,
		skrnaz 	 char(100), --like kalkul:kalpolskupina.skrnaz ,
		popis 	 CHAR(180) ,
		spracovatelnost 	 char(100), --like kalkul:kalpolskupina.spracovatelnost ,
		doba_skladovania2 	 INTEGER 
	 end record 
##@@19
##@@49
define pp_49 record 
		idnad_spol1 	 char(100), --like exp_kalk:nad_spol1.id ,
		str 	 char(100), --like ciselniky:str.str ,
		nsp1 	 char(100), --like exp_kalk:nad_spol1.nsp1 ,
		snazf 	 char(100), --like vyrobky:firma.snazf ,
		idpl_kalend_obd 	 char(100), --like pl_kalendar_obdobi.id ,
		obdobie 	 char(100), --like pl_kalendar_obdobi.obdobie ,
		rezerv_kapacita 	 char(100), --like pl_rezerv_kapacita.rezerv_kapacita ,
		rezerv_perc 	 DEC(4,1) ,
		dispon_kapacita 	 INTERVAL DAY(3) TO MINUTE ,
		plan_napln 	 INTERVAL DAY(3) TO MINUTE ,
		plan_vyr 	 INTERVAL DAY(3) TO MINUTE ,
		predstih_vyr 	 INTERVAL DAY(3) TO MINUTE ,
		sklz_vyr 	 INTERVAL DAY(3) TO MINUTE ,
		zac_obdobia 	 char(100), --like pl_kalendar_obdobi.zac_obdobia ,
		kon_obdobia 	 char(100), --like pl_kalendar_obdobi.kon_obdobia ,
		idpo_stroje 	 char(100) --like pl_rezerv_kapacita.idpo_stroje 
	 end record 
##@@49
##@@26
define pp_26 record 
		id 	 char(100), --like pl_parametre.id ,
		cpv 	 char(100), --like pl_parametre.cpv ,
		rezerva_per 	 char(100), --like pl_parametre.rezerva_per ,
		poc_per_vyvaz 	 char(100), --like pl_parametre.poc_per_vyvaz ,
		poc_per_prehl 	 char(100), --like pl_parametre.poc_per_prehl ,
		rezervacia_zapnuta 	 char(100) --like pl_parametre.rezervacia_zapnuta 
	 end record 
##@@26
##@@52
define pp_52 record 
		datprijmu 	 char(100), --like is_1:sh_stavy.datprijmu ,
		stavmat 	 char(100), --like is_1:sh_stavy.stavmat ,
		blokovmnozstvo 	 char(100), --like is_1:sh_stavy.blokovmnozstvo ,
		doba_skladovania 	 INTEGER 
	 end record 
##@@52
##@@05
define pp_05 record 
		id 	 char(100), --like pl_kapkalendar.id ,
		nazstroja 	 char(100), --like polot:po_stroje.nazstroja ,
		idpo_stroje 	 char(100), --like pl_kapkalendar.idpo_stroje ,
		cpv 	 char(100), --like pl_kapkalendar.cpv ,
		cov 	 char(100), --like pl_kapkalendar.cov ,
		cstroj 	 char(100), --like pl_kapkalendar.cstroj ,
		zac_useku 	 char(100), --like pl_kapkalendar.zac_useku ,
		kon_useku 	 char(100), --like pl_kapkalendar.kon_useku ,
		kod_useku 	 char(100), --like pl_kapkalendar.kod_useku ,
		den_tyz 	 char(100), --like pl_den_tyz.naz_dna ,
		dlzka_useku 	 char(100), --like pl_kapkalendar.dlzka_useku ,
		smennost 	 char(100), --like pl_kapkalendar.smennost ,
		popis 	 char(100), --like pl_smennost.popis ,
		idzmenil 	 char(100), --like pl_kapkalendar.idzmenil ,
		priezvisko 	 CHAR(50) ,
		meno 	 CHAR(20) ,
		c_zmeny 	 char(100), --like pl_kapkalendar.c_zmeny ,
		prestavka 	 SMALLINT 
	 end record 
##@@05
##@@53
define pp_53 record 
		id 	 char(100), --like pl_model_rezerv.id ,
		cpv 	 char(100), --like pl_model_rezerv.cpv ,
		obdobie 	 char(100), --like pl_model_rezerv.obdobie ,
		idnad_spol1 	 char(100), --like pl_model_rezerv.idnad_spol1 ,
		datplat 	 char(100), --like pl_model_rezerv.datplat ,
		csf 	 char(100), --like pl_model_rezerv.csf ,
		cov_tlace 	 char(100), --like pl_model_rezerv.cov_tlace ,
		plan_final_kg 	 char(100), --like pl_model_rezerv.plan_final_kg ,
		priem_gram 	 char(100), --like pl_model_rezerv.priem_gram ,
		priem_sirprod 	 char(100), --like pl_model_rezerv.priem_sirprod ,
		priem_zakazka 	 char(100), --like pl_model_rezerv.priem_zakazka ,
		priem_pocval 	 char(100), --like pl_model_rezerv.priem_pocval ,
		pr_perc_vyr_valce 	 char(100), --like pl_model_rezerv.pr_perc_vyr_valce ,
		nhod_tlac 	 char(100), --like pl_model_rezerv.nhod_tlac ,
		nhod_vyr_valce 	 char(100), --like pl_model_rezerv.nhod_vyr_valce ,
		idzmenil 	 char(100), --like pl_model_rezerv.idzmenil ,
		celemeno 	 CHAR(100) ,
		cas_zmeny 	 char(100) --like pl_model_rezerv.cas_zmeny 
	 end record 
##@@53
##@@54
define pp_54 record 
		obdobie 	 char(100), --like pl_kalendar_obdobi.obdobie ,
		priem_gram 	 DEC(6,2) ,
		priem_sirprod 	 DEC(8,2) ,
		priem_zakazka 	 DEC(7,2) ,
		priem_pocval 	 DEC(4,2) ,
		pr_perc_vyr_valce 	 DEC(5,2) ,
		plan_final_kg 	 DEC(9,2) ,
		plan_tlac_nhod 	 INTERVAL DAY(3) TO MINUTE 
	 end record 
##@@54
##@@42
define pp_42 record 
		cislo_vp 	 char(100), --like vp_polot.cislo_vp ,
		stl 	 char(100), --like vp_polot.stl ,
		riad 	 char(100), --like vp_polot.riad ,
		cisoper 	 char(100), --like vp_polot.cisoper ,
		cov 	 char(100), --like vp_polot.cov ,
		nazof 	 char(100), --like v_prikazy.nazof ,
		sidf 	 char(100), --like v_prikazy.sidf ,
		oznac 	 char(100), --like v_prikazy.oznac ,
		cstroj 	 char(100), --like denne_plany.cstroj ,
		nazstroja 	 char(100), --like polot:po_stroje.nazstroja ,
		poradie 	 char(100), --like denne_plany.poradie ,
		nazsort 	 char(100), --like vp_polot.nazsort ,
		mnoz_kg 	 char(100), --like vp_polot.mnoz_kg ,
		nhod 	 DEC(4,1) ,
		cas_odchylky 	 INTERVAL DAY(3) TO MINUTE ,
		cov_pred 	 char(100), --like vp_polot.cov ,
		cas_odchylky_pred 	 INTERVAL DAY(3) TO MINUTE 
	 end record 
##@@42
##@@51
define pp_51 record 
		id 	 char(100), --like exp_kalk:nad_spol1.id ,
		pref_tlac1 	 char(100), --like exp_kalk:nad_spol1.pref_tlac1 ,
		porf2 	 char(100), --like vyrobky:firma.porf2 ,
		snazf 	 char(100), --like vyrobky:firma.snazf ,
		nazof 	 char(100), --like vyrobky:firma.nazof ,
		sidf 	 char(100) --like vyrobky:firma.sidf 
	 end record 
##@@51
##@@50
define pp_50 record 
		id 	 char(100), --like pl_skup_stroj.id ,
		cpv 	 char(100), --like pl_skup_stroj.cpv ,
		cov 	 char(100), --like pl_skup_stroj.cov ,
		idpo_stroje_skup 	 char(100), --like pl_skup_stroj.idpo_stroje_skup ,
		cstroj_skup 	 char(100), --like polot:po_stroje.cstroj ,
		nazstroja_skup 	 char(100), --like polot:po_stroje.nazstroja ,
		idpo_stroje 	 char(100), --like pl_skup_stroj.idpo_stroje ,
		cstroj 	 char(100), --like polot:po_stroje.cstroj ,
		nazstroja 	 char(100), --like polot:po_stroje.nazstroja ,
		platnost 	 char(100), --like pl_skup_stroj.platnost ,
		cas_zmeny 	 char(100), --like pl_skup_stroj.cas_zmeny ,
		zmenil 	 char(100), --like pl_skup_stroj.zmenil ,
		priezvisko 	 CHAR(50) ,
		meno 	 CHAR(20) 
	 end record 
##@@50
##@@47
define pp_47 record 
		id 	 char(100), --like pl_kalendar_obdobi.id ,
		cpv 	 char(100), --like pl_kalendar_obdobi.cpv ,
		obdobie 	 char(100), --like pl_kalendar_obdobi.obdobie ,
		zac_obdobia 	 char(100), --like pl_kalendar_obdobi.zac_obdobia ,
		kon_obdobia 	 char(100), --like pl_kalendar_obdobi.kon_obdobia ,
		rezervovane 	 CHAR(3) ,
		cas_uzavretia 	 char(100), --like pl_rezerv_uzavretie.cas_uzavretia ,
		iduzavrel 	 char(100), --like pl_rezerv_uzavretie.iduzavrel ,
		priezvisko 	 CHAR(50) ,
		meno 	 CHAR(20) 
	 end record 
##@@47
##@@48
define pp_48 record 
		cstroj   char(100), --like polot:po_stroje.cstroj ,
		nazstroja        char(100), --like polot:po_stroje.nazstroja ,
		rezerv_kapacita          char(100), --like pl_rezerv_kapacita.rezerv_kapacita ,
		rez_kap_per      DEC(4,1) ,
		plan_napln       INTERVAL DAY(2) TO MINUTE ,
		rez_kap_v        INTERVAL DAY(2) TO MINUTE ,
		rez_kap_per_v    DEC(4,1) ,
		celk_kap_stroj   INTERVAL DAY(3) TO MINUTE
	 end record 
##@@48
##@@45
define pp_45 record 
		pod 	 char(100), --like ciselniky:organizacny.pod ,
		str 	 char(100), --like ciselniky:organizacny.str ,
		div 	 char(100), --like ciselniky:organizacny.div ,
		nazov 	 char(100) --like ciselniky:str.nazov 
	 end record 
##@@45
##@@43
define pp_43 record 
		rok_zac 	 char(100), --like pl_harm.rok_zac ,
		tyzden_zac 	 char(100), --like pl_harm.tyzden_zac ,
		perioda 	 char(100), --like pl_harm.perioda ,
		cov 	 char(100), --like pl_harm.cov ,
		kapacita_per 	 INTERVAL DAY TO MINUTE ,
		napln_vynimky 	 INTERVAL DAY TO MINUTE 
	 end record 
##@@43
##@@27
define pp_27 record 
		id 	 char(100), --like pl_vynimka.id ,
		cpv 	 char(100), --like pl_vynimka.cpv ,
		ckz 	 char(100), --like pl_vynimka_zak.ckz ,
		porc 	 char(100), --like pl_vynimka_zak.porc ,
		kod_storna 	 char(100), --like k_zmluvy:kpolozky.kod_storna ,
		druh_vynimky 	 char(100), --like pl_vynimka.druh_vynimky ,
		typ_vynimky 	 char(100), --like pl_vynimka.typ_vynimky ,
		cspred 	 char(100), --like pl_vynimka.cspred ,
		stav_vynimky 	 char(100), --like pl_vynimka.stav_vynimky ,
		dovod 	 char(100), --like pl_vynimka.dovod ,
		termin_poz_uv 	 char(100), --like pl_vynimka_zak.termin_poz_uv ,
		nazof 	 char(100), --like vyrobky:firma.nazof ,
		oznac 	 char(100), --like vyrobky:motiv.oznac ,
		popis 	 char(100), --like vyrobky:zlozenie.popis ,
		mnozkg 	 char(100), --like k_zmluvy:kpolozky.mnozkg ,
		pozadoval 	 char(100), --like pl_vynimka.pozadoval ,
		idvytvoril 	 char(100), --like pl_vynimka.idvytvoril ,
		cas_vytvorenia 	 char(100), --like pl_vynimka.cas_vytvorenia ,
		priez_vytv 	 CHAR(50) ,
		meno_vytv 	 CHAR(20) ,
		idschvalil 	 char(100), --like pl_vynimka.idschvalil ,
		cas_schvalenia 	 char(100), --like pl_vynimka.cas_schvalenia ,
		priez_schval 	 CHAR(50) ,
		meno_schval 	 CHAR(20) ,
		idstornoval 	 char(100), --like pl_vynimka.idstornoval ,
		cas_storna 	 char(100), --like pl_vynimka.cas_storna ,
		priez_stor 	 CHAR(50) ,
		meno_stor 	 CHAR(20) ,
		idkpolozky 	 char(100), --like pl_vynimka_zak.idkpolozky ,
		idkpolozky_fors 	 char(100), --like pl_vynimka_zak.idkpolozky_fors ,
		druh_zak 	 char(100), --like pl_vynimka_zak.druh_zak ,
		idpl_vynimka 	 char(100), --like pl_vynimka_zak.idpl_vynimka ,
		cislo_vp 	 char(100), --like v_prikazy.cislo_vp ,
		stav_prik 	 char(100) --like v_prikazy.stav_prik 
	 end record 
##@@27
##@@08
define pp_08 record 
		porf 	 char(100), --like vyrobky:firma.porf ,
		podnik 	 char(100), --like vyrobky:firma.podnik ,
		porf2 	 char(100), --like vyrobky:firma.porf2 ,
		snazf 	 char(100), --like vyrobky:firma.snazf ,
		nazof 	 char(100), --like vyrobky:firma.nazof ,
		sidf 	 char(100), --like vyrobky:firma.sidf ,
		ico 	 char(100), --like vyrobky:firma.ico ,
		cispred 	 char(100), --like k_zmluvy:obchpartneri.cispred ,
		pocpodm 	 SMALLINT 
	 end record 
##@@08
##@@40
define pp_40 record 
		podnik 	 char(100), --like vyrobky:firma.podnik ,
		porf2 	 char(100), --like vyrobky:firma.porf2 ,
		nazof 	 char(100), --like vyrobky:firma.nazof ,
		sidf 	 char(100), --like vyrobky:firma.sidf ,
		ico 	 char(100), --like vyrobky:firma.ico ,
		cispred 	 char(100), --like k_zmluvy:obchpartneri.cispred ,
		pocpodm 	 SMALLINT ,
		platnostz 	 char(100) --like exp_kalk:nad_spol1.platnostz 
	 end record 
##@@40
##@@41
define pp_41 record 
		cpr 	 char(100), --like k_zmluvy:ref_predaj.cpr ,
		titul 	 char(100), --like k_zmluvy:ref_predaj.titul ,
		meno 	 char(100), --like k_zmluvy:ref_predaj.meno ,
		priezv 	 char(100), --like k_zmluvy:ref_predaj.priezv ,
		popis 	 char(100) --like k_zmluvy:ref_predaj.popis 
	 end record 
##@@41
##@@07
define pp_07 record 
		id 	 char(100), --like pl_dodpodmfirmy.id ,
		cpv 	 char(100), --like pl_dodpodmfirmy.cpv ,
		cpr 	 char(100), --like pl_dodpodmfirmy.cpr ,
		porf2 	 char(100), --like pl_dodpodmfirmy.porf2 ,
		idfirma 	 char(100), --like pl_dodpodmfirmy.idfirma ,
		snazf 	 char(100), --like vyrobky:firma.snazf ,
		koncern 	 CHAR(1) ,
		nazof 	 char(100), --like vyrobky:firma.nazof ,
		sidf 	 char(100), --like vyrobky:firma.sidf ,
		ico 	 char(100), --like vyrobky:firma.ico ,
		idpl_kodzakazky 	 char(100), --like pl_dodpodmfirmy.idpl_kodzakazky ,
		kod_zakazky 	 char(100), --like pl_kodzakazky.kod_zakazky ,
		popis_zakazky 	 char(100), --like pl_kodzakazky.popis_zakazky ,
		idpl_skuptovaru 	 char(100), --like pl_dodpodmfirmy.idpl_skuptovaru ,
		popis_skupiny 	 char(100), --like pl_skupinatovaru.popis_skupiny ,
		idpl_startdatum 	 char(100), --like pl_dodpodmfirmy.idpl_startdatum ,
		popis_datumu 	 char(100), --like pl_startdatum.popis_datumu ,
		ramcova_kz 	 char(100), --like pl_dodpodmfirmy.ramcova_kz ,
		dni_dodania 	 char(100), --like pl_dodpodmfirmy.dni_dodania ,
		platnost 	 char(100), --like pl_dodpodmfirmy.platnost ,
		cas_zmeny 	 char(100), --like pl_dodpodmfirmy.cas_zmeny ,
		idzmenil 	 char(100), --like pl_dodpodmfirmy.idzmenil ,
		priezvisko 	 CHAR(50) ,
		meno 	 CHAR(20) 
	 end record 
##@@07
##@@39
define pp_39 record 
		id 	 char(100), --like pl_zlozenietovaru.id ,
		idpl_skupinatovaru 	 char(100), --like pl_zlozenietovaru.idpl_skupinatovaru ,
		popis_skupiny 	 char(100), --like pl_skupinatovaru.popis_skupiny ,
		kvyrobku 	 char(100), --like pl_zlozenietovaru.kvyrobku ,
		naztovar 	 char(100) --like vyrobky:tovar.naztovar 
	 end record 
##@@39
##@@38
define pp_38 record 
		kvyrobku 	 char(100), --like vyrobky:tovar.kvyrobku ,
		naztovar 	 char(100) --like vyrobky:tovar.naztovar 
	 end record 
##@@38
##@@37
define pp_37 record 
		id 	 char(100), --like pl_skupinatovaru.id ,
		popis_skupiny 	 char(100) --like pl_skupinatovaru.popis_skupiny 
	 end record 
##@@37
##@@35
define pp_35 record 
		id 	 char(100), --like pl_startdatum.id ,
		popis_datumu 	 char(100), --like pl_startdatum.popis_datumu ,
		databaza 	 char(100), --like pl_startdatum.databaza ,
		tabulka 	 char(100), --like pl_startdatum.tabulka ,
		stlpec 	 char(100) --like pl_startdatum.stlpec 
	 end record 
##@@35
##@@10
define pp_10 record 
		id 	 char(100), --like pl_kodzakazky.id ,
		kod_zakazky 	 char(100), --like pl_kodzakazky.kod_zakazky ,
		popis_zakazky 	 char(100) --like pl_kodzakazky.popis_zakazky 
	 end record 
##@@10
##@@36
define pp_36 record 
		cov 	 char(100), --like vp_polot.cov ,
		cisoper 	 char(100), --like vp_polot.cisoper ,
		rok_zac 	 char(100), --like pl_harm.rok_zac ,
		tyzden_zac 	 char(100), --like pl_harm.tyzden_zac ,
		perioda 	 char(100), --like pl_harm.perioda ,
		zac_plan 	 char(100), --like pl_harmpolozka.zac_plan ,
		kon_plan 	 char(100), --like pl_harmpolozka.kon_plan ,
		tyzden_kon 	 SMALLINT ,
		perioda_kon 	 SMALLINT ,
		cas_prace_plan 	 char(100) --like pl_harmpolozka.cas_prace_plan 
	 end record 
##@@36
##@@12
define pp_12 record 
		id 	 char(100), --like pl_pouzistroj.id ,
		cpv 	 char(100), --like pl_pouzistroj.cpv ,
		cov 	 char(100), --like pl_pouzistroj.cov ,
		csv 	 char(100), --like pl_pouzistroj.csv ,
		nazov 	 char(100), --like kalkul:sort.nazov ,
		ctv 	 char(100), --like technologie.ctv ,
		naztech 	 char(100), --like technologie.naztech ,
		idtechzl 	 char(100), --like pl_pouzistroj.idtechzl ,
		cisoper 	 char(100), --like pl_tech_zl.cisoper ,
		nazoper 	 char(100), --like pl_oper.nazoper ,
		idfivy 	 char(100), --like pl_pouzistroj.idfivy ,
		crefv 	 char(100), --like vyrobky:fivy.crefv ,
		kodzmen 	 char(100), --like vyrobky:fivy.kodzmen ,
		oznac 	 char(100), --like vyrobky:motiv.oznac ,
		cstroj 	 char(100), --like pl_pouzistroj.cstroj ,
		nazstroja 	 char(100), --like polot:po_stroje.nazstroja ,
		idpo_stroje 	 char(100), --like pl_pouzistroj.idpo_stroje ,
		priorita 	 char(100), --like pl_pouzistroj.priorita ,
		c_zmeny 	 char(100), --like pl_pouzistroj.c_zmeny ,
		priezvisko 	 CHAR(50) ,
		meno 	 CHAR(20) ,
		idzmenil 	 char(100) --like pl_pouzistroj.idzmenil 
	 end record 
##@@12
##@@32
define pp_32 record 
		csv 	 char(100), --like vp_polot.csv ,
		nazov 	 char(100), --like kalkul:sort.nazov ,
		mikron 	 char(100), --like vp_polot.mikron ,
		sirka 	 char(100), --like vp_polot.sirka ,
		coo 	 char(100), --like vp_polot.coo ,
		den_plany 	 CHAR(1) ,
		stav_prognoz 	 CHAR(1) ,
		ukonc_gfp 	 char(100), --like v_prikazy.ukonc_gfp ,
		mnoz_kg 	 DEC(9,0) 
	 end record 
##@@32
##@@20
define pp_20 record 
		extcisdkz 	 char(100), --like is_1:sh_nkzkmen.extcisdkz ,
		ciszasob 	 char(100), --like is_1:sh_nkzkmen.ciszasob ,
		datvystav 	 char(100), --like is_1:sh_nkzkmen.datvystav ,
		potvmnoz 	 char(100), --like is_1:sh_nkzpolo.potvmnoz ,
		dodmnoz 	 DEC(12,3) ,
		porcispoz 	 char(100), --like is_1:sh_poziadav.porcispoz ,
		datpotvrd 	 char(100), --like is_1:sh_poziadav.datpotvrd ,
		ziadmnoz 	 char(100), --like is_1:sh_poziadav.ziadmnoz ,
		cisloziad 	 char(100), --like is_1:sh_poziadav.cisloziad ,
		nazof 	 char(100), --like vyrobky:firma.nazof ,
		intcisdkz 	 char(100), --like is_1:sh_nkzkmen.intcisdkz ,
		sposdopr 	 char(100), --like is_1:sh_nkzkmen.sposdopr ,
		statdkz 	 char(100), --like is_1:sh_nkzkmen.statdkz ,
		datposlzm 	 char(100), --like is_1:sh_nkzkmen.datposlzm ,
		poznziad 	 char(100) --like is_1:sh_poziadav.poznziad 
	 end record 
##@@20
##@@30
define pp_30 record 
		ckz 	 char(100), --like k_zmluvy:kpolozky.ckz ,
		porc 	 char(100), --like k_zmluvy:kpolozky.porc ,
		datpoz 	 char(100), --like k_zmluvy:kzmluvy.datpoz ,
		oznac 	 char(100), --like vyrobky:motiv.oznac ,
		pocval 	 char(100), --like vyrobky:motiv.pocval ,
		sirprod 	 char(100), --like vyrobky:motiv.sirprod ,
		sortim 	 char(100), --like k_zmluvy:kpolozky.sortim ,
		skratnaz 	 char(100), --like polot:po_kratsor.skratnaz ,
		vzorkahrubka 	 char(100), --like k_zmluvy:kpolozky.vzorkahrubka ,
		vzorkagram 	 char(100), --like k_zmluvy:kpolozky.vzorkagram ,
		mnozkg 	 char(100), --like k_zmluvy:kpolozky.mnozkg ,
		nazof 	 char(100), --like vyrobky:firma.nazof ,
		crefv 	 char(100), --like vyrobky:fivy.crefv ,
		kodzmen 	 char(100) --like vyrobky:fivy.kodzmen 
	 end record 
##@@30
##@@31
define pp_31 record 
		porf 	 char(100), --like vyrobky:farbymot.porf ,
		strana 	 char(100), --like vyrobky:farbymot.strana ,
		lak 	 char(100), --like vyrobky:farbymot.lak ,
		novafarba 	 char(100), --like vyrobky:farbymot.novafarba ,
		farba 	 char(100), --like vyrobky:farbymot.farba ,
		panton 	 char(100), --like vyrobky:farbymot.panton ,
		krytie 	 char(100), --like vyrobky:farbymot.krytie ,
		kzakfar 	 char(100), --like vyrobky:farbymot.kzakfar ,
		raster 	 char(100), --like vyrobky:farbymot.raster ,
		digit_filmy 	 char(100), --like vyrobky:ftpval.digit_filmy ,
		plocho_kruh 	 char(100), --like vyrobky:ftpval.plocho_kruh ,
		poc_nahr 	 SMALLINT ,
		crefv 	 char(100) --like vyrobky:fivy.crefv 
	 end record 
##@@31
##@@25
define pp_25 record 
		cpv 	 char(100), --like pl_harm.cpv ,
		cov 	 char(100), --like pl_harm.cov ,
		rok_zac 	 char(100), --like pl_harm.rok_zac ,
		tyzden_zac 	 char(100), --like pl_harm.tyzden_zac ,
		perioda 	 char(100), --like pl_harm.perioda ,
		verzia 	 char(100), --like pl_harm.verzia ,
		cstroj 	 char(100), --like polot:po_stroje.cstroj ,
		idpo_stroje 	 char(100), --like pl_harmpolozka.idpo_stroje ,
		nazstroja 	 char(100), --like polot:po_stroje.nazstroja ,
		poradie 	 char(100), --like pl_harmpolozka.poradie ,
		cislo_vp 	 char(100), --like pl_prac_uloha.cislo_vp ,
		stl 	 char(100), --like pl_prac_uloha.stl ,
		riad 	 char(100), --like pl_prac_uloha.riad ,
		cisoper 	 char(100), --like pl_prac_uloha.cisoper ,
		zac_plan2 	 DATETIME MONTH TO MINUTE ,
		zac_plan 	 char(100), --like pl_harmpolozka.zac_plan ,
		kon_plan 	 char(100), --like pl_harmpolozka.kon_plan ,
		oznac 	 char(100), --like v_prikazy.oznac ,
		vyrnaz 	 char(100), --like polot:po_kratsor.vyrnaz ,
		csv 	 char(100), --like vp_polot.csv ,
		nazsort 	 char(100), --like vp_polot.nazsort ,
		nhod 	 DEC(5,2) ,
		pocval 	 char(100), --like v_p_motiv.pocval ,
		vzor 	 char(100), --like v_prikazy.vzor ,
		nhod_prip_plan 	 DEC(5,2) ,
		nhod_beh_plan 	 DEC(5,2) ,
		mnoz_kg_plan 	 char(100), --like pl_prac_uloha.mnoz_kg_plan ,
		mnoz_mj_plan 	 char(100), --like pl_prac_uloha.mnoz_mj_plan ,
		mj 	 char(100), --like pl_prac_uloha.mj ,
		mnoz_kg 	 char(100) --like vp_polot.mnoz_kg 
	 end record 
##@@25
##@@29
define pp_29 record 
		idpl_harm 	 char(100), --like pl_harmpolozka.idpl_harm ,
		idpo_stroje 	 char(100), --like pl_harmpolozka.idpo_stroje ,
		cstroj 	 char(100), --like polot:po_stroje.cstroj ,
		nazstroja 	 char(100), --like polot:po_stroje.nazstroja ,
		kapacita 	 INTERVAL DAY(2) TO MINUTE ,
		napln 	 INTERVAL DAY(2) TO MINUTE ,
		napln_perc 	 DEC(4,1) ,
		poc_zak 	 INTEGER 
	 end record 
##@@29
##@@28
define pp_28 record 
		rok_zac 	 char(100), --like pl_harm.rok_zac ,
		tyzden_zac 	 char(100), --like pl_harm.tyzden_zac ,
		perioda 	 char(100), --like pl_harm.perioda ,
		zac_periody 	 char(100), --like pl_harm.zac_periody ,
		kon_periody 	 char(100), --like pl_harm.kon_periody ,
		cov 	 char(100), --like pl_harm.cov ,
		poc_strojov 	 SMALLINT ,
		kapacita 	 INTERVAL DAY TO MINUTE ,
		napln 	 INTERVAL DAY TO MINUTE ,
		napln_na_stroj 	 INTERVAL DAY TO MINUTE ,
		napln_per 	 DEC(4,1) ,
		id 	 char(100) --like pl_harm.id 
	 end record 
##@@28
##@@23
define pp_23 record 
		perioda 	 char(100), --like pl_perioda.perioda ,
		den_zaciatku 	 char(100), --like pl_perioda.den_zaciatku ,
		cas_zaciatku 	 char(100), --like pl_perioda.cas_zaciatku ,
		dlzka_periody 	 char(100), --like pl_perioda.dlzka_periody ,
		zac_posun_tyz 	 char(100), --like pl_perioda.zac_posun_tyz ,
		kon_posun_tyz 	 char(100) --like pl_perioda.kon_posun_tyz 
	 end record 
##@@23
##@@24
define pp_24 record 
		id 	 char(100), --like pl_typprac_ulohy.id ,
		kod_ulohy 	 char(100), --like pl_typprac_ulohy.kod_ulohy ,
		popis_ulohy 	 char(100) --like pl_typprac_ulohy.popis_ulohy 
	 end record 
##@@24
##@@22
define pp_22 record 
		coo 	 char(100) --like kalkul:techpost.coo 
	 end record 
##@@22
##@@21
define pp_21 record 
		pod 	 char(100), --like is_1:sh_material.pod ,
		cissklad 	 char(100), --like is_1:sh_material.cissklad ,
		evidcis 	 char(100), --like is_1:sh_material.evidcis ,
		nazovmat 	 char(100), --like is_1:sh_material.nazovmat ,
		hrubka 	 char(100), --like is_1:sh_popis.hrubka ,
		sirka 	 char(100), --like is_1:sh_popis.sirka ,
		ckpol 	 char(100), --like kalkul:kalpol.ckpol ,
		nahrad 	 char(100), --like kalkul:kalpol.nahrad ,
		csn 	 char(100) --like kalkul:normy.csn 
	 end record 
##@@21
##@@17
define pp_17 record 
		cov 	 char(100), --like kalkul:sort.cov ,
		csv 	 char(100), --like kalkul:sort.csv ,
		nazov 	 char(100) --like kalkul:sort.nazov 
	 end record 
##@@17
##@@15
define pp_15 record 
		id 	 char(100), --like pl_sledpolozkadruh.id ,
		kod_polozky 	 char(100), --like pl_sledpolozkadruh.kod_polozky ,
		popis_polozky 	 char(100) --like pl_sledpolozkadruh.popis_polozky 
	 end record 
##@@15
##@@16
define pp_16 record 
		id 	 char(100), --like pl_typzdroja.id ,
		kod_zdroja 	 char(100), --like pl_typzdroja.kod_zdroja ,
		popis_zdroja 	 char(100) --like pl_typzdroja.popis_zdroja 
	 end record 
##@@16
##@@13
define pp_13 record 
		porc 	 char(100), --like vyrobky:fivy.porc ,
		crefv 	 char(100), --like vyrobky:fivy.crefv ,
		kodzmen 	 char(100), --like vyrobky:fivy.kodzmen ,
		plcsort 	 char(100), --like vyrobky:fivy.plcsort ,
		oznac 	 char(100), --like vyrobky:motiv.oznac ,
		obvodval 	 char(100), --like vyrobky:motiv.obvodval ,
		pocf 	 char(100) --like vyrobky:fivy.pocf 
	 end record 
##@@13
##@@11
define pp_11 record 
		smennost 	 char(100), --like pl_smennost.smennost ,
		popis 	 char(100) --like pl_smennost.popis 
	 end record 
##@@11
##@@09
define pp_09 record 
		id 	 char(100), --like pl_disponibil.id ,
		idpl_kapkalendar 	 char(100), --like pl_disponibil.idpl_kapkalendar ,
		cas_zac 	 char(100), --like pl_disponibil.cas_zac ,
		cas_kon 	 char(100) --like pl_disponibil.cas_kon 
	 end record 
##@@09
##@@06
define pp_06 record 
		den_tyz 	 char(100), --like pl_den_tyz.den_tyz ,
		naz_dna 	 char(100) --like pl_den_tyz.naz_dna 
	 end record 
##@@06
##@@04
define pp_04 record 
		id 	 char(100), --like polot:po_stroje.id ,
		cp 	 char(100), --like polot:po_stroje.cp ,
		co 	 char(100), --like polot:po_stroje.co ,
		cstroj 	 char(100), --like polot:po_stroje.cstroj ,
		nazstroja 	 char(100), --like polot:po_stroje.nazstroja ,
		kodstr 	 char(100), --like polot:po_stroje.kodstr ,
		cstrojippo 	 char(100), --like polot:po_stroje.cstrojippo ,
		kodss 	 char(100) --like polot:po_stroje.kodss 
	 end record 
##@@04
##@@33
define pp_33 record 
		id 	 char(100), --like tpv:pl_tech_zl.id ,
		cpv 	 char(100), --like tpv:pl_tech_zl.cpv ,
		ctv 	 char(100), --like tpv:pl_tech_zl.ctv ,
		cisoper 	 char(100), --like tpv:pl_tech_zl.cisoper ,
		ctoper 	 char(100), --like tpv:pl_tech_zl.ctoper ,
		nazoper 	 char(100), --like tpv:pl_oper.nazoper ,
		naztech 	 char(100) --like tpv:technologie.naztech 
	 end record 
##@@33
#@@039

define        ag0_48 array[100] of record   #bufer pre vyber
		cstroj   char(100), --like polot:po_stroje.cstroj ,
		nazstroja        char(100), --like polot:po_stroje.nazstroja ,
		rezerv_kapacita          char(100), --like pl_rezerv_kapacita.rezerv_kapacita ,
		rez_kap_per      DEC(4,1) ,
		plan_napln       INTERVAL DAY(2) TO MINUTE ,
		rez_kap_v        INTERVAL DAY(2) TO MINUTE ,
		rez_kap_per_v    DEC(4,1) ,
		celk_kap_stroj   INTERVAL DAY(3) TO MINUTE
end record
define poc_48 smallint


define gpravo SMALLINT            #priznak ci je pravo na lookup modul
define def_tlace RECORD like tpv:tlaciarne.*      #parametre tlaciarni
define tc_00 char(80)                           #text hlavicky reportu
define chyba1,chyba2 integer                   #kody chyb sql prikazov
define terminal char(20)         #terminal
define tdbpath char(60)              #cesta ku programu od /u/projekty
define txt1,txt2 char(80)                              #chybove hlasky
define rel integer                        #relativny skok v browsovani
define st integer                  #status sql prikazu vo fun.uspech()
define puziv char(15)                                  #meno uzivatela
define l_loginp char(10)                                #user
define pskupina integer                       #cislo skupiny uzivatela
define pprogram char(15)                          #nazov lookup modulu
define ppsubsyst char(4)                          #nazov podsystemu
define pprojekt char(15)                               #nazov projektu
define ppmenu char(15)                #nazov volby pre filter..04vyber
define pfilter char(50)                             #filter pre select
define pcislo integer        #max. mozny pocet poloziek jednym vyberom
define textchy,textchy1 char(2000)                    #pomocne premenne
define autor3 char(100)                               #pristupove prava
define gisf9 int       #ci uz je vybrane listovanie pri hlavic,polozka
define gisf9vloz int  #ci uz bola vlozena polozka nie pri hlav,polozka
define tsubor char(30)  #meno zostavy 
define pptsubor char(80)  #meno suboru zostavy 
define gcistlac int

define gdatplat char(100) --like kalkul:platnost.platnost
define gobdplat char(100) --like kalkul:platnost.platnost2
define gpodnik char(100) --like kalkul:platnost.pod
define gid_zam integer
define glast_modify char(100) --like pl_poziad_progn.last_modify
define gdruh_vynimky char(100) --like pl_vynimka.druh_vynimky
define ref_cas datetime year to minute --cas pre moznost aj spatneho preplanovania
define application_help_path char(100)
------------------------------------------------------------------
define glargebrowse smallint  --- cije netterm 132, 0 - 25x80,1-25x132,2-35x132,3-45x132
define gscreenxx int   --velkost obrazovky XX
define gscreenyy int   --velkost obrazovky YY
-------------------------------------------------------------------
define guser char(100) --like sysadm:users.user_id

end globals


#####definicie pre triedenie  modul 30

  define
		maxhld,maxsc integer ,
                yi,pocet integer ,
                pomyi integer ,
                zacstr integer ,

		prazd1 record
			 cis integer,
			 zost char,
			 text char(30)
		end record ,
		ag array[100] of record
			 cis integer,
			 zost char,
			 text char(30)
		end record
define scur,lastkey,pcur integer

########################definicie pre vyber tlaciarne modul40

  define
		maxhl66,maxsc66 integer ,
                yi66,pocet66 integer ,
                pomyi66 integer ,
                zacstr66 integer 
	define is_vybmj66 char
 define otaz2e , otazpoce , otaze  char(70),

		gpom66 ,prazd166 record
			porc char(100), --like tpv:tlaciarne.porc,
			nazov char(100) --like tpv:tlaciarne.nazov
		end record ,
		ag66 array[20] of record
			porc char(100), --like tpv:tlaciarne.porc,
			nazov char(100) --like tpv:tlaciarne.nazov
		end record

define scur66,lastk66,pcur66 integer



---main funkcia
main 
define bc int
define druh_vstupu char(1)
define vstup record
   idkpolozky char(100), --like k_zmluvy:kpolozky.id,
   pcrefv char(100), --like k_zmluvy:kpolozky.pcrefv,
   podnik char(100), --like k_zmluvy:kpolozky.podnik,
   sortim char(100), --like k_zmluvy:kpolozky.sortim,
   varianta char(100), --like tpv:v_prikazy.varianta,
   cso char(100), --like kalkul:normy.csn,
   ckpol char(100), --like kalkul:normy.ckpol,
   sirka char(100), --like vp_polot.sirka,
   mikron char(100) --like vp_polot.mikron
end record
define vstup2 record
   pod char(100), --like is_1:sh_material.pod,
   cissklad char(100), --like is_1:sh_material.cissklad,
   evidcis char(100), --like is_1:sh_material.evidcis,
   sirka char(100), --like is_1:sh_popis.sirka,
   hrubka char(100) --like is_1:sh_popis.hrubka
end record

--Lycia 
CALL fgl_setenv("QX_COMPAT", "Informix4GL")

let gpodnik = null



if  nast_00() then
	---------------------------
	if autor3[7] = "A" then
		let gautor_14[1,7]="AAAAAAA"
		let gautor_18[1,7]="AAAAAAA"
	else
		let gautor_14[1,7]="NNNAAAA"
		let gautor_18[1,7]="NNNAAAA"
	end if
	let guzivcond_14 = "prog.d_akceptacie is null and prog.cislo_vp[1] matches \"[0245678]\"" --zmena 20.11.14
	call lookup_14(0,0,0,0) returning bc
	---------------------------
else
	error txt1 clipped
	sleep 3
	exit program(0)
end if
clear screen

if gpravo then
	exit program(0)
else
	error "Nemate pravo pouzit tuto volbu."
	sleep 3
	exit program(0)
end if
end main

--ponuka pre externu(volanie inym programom) funkcionalitu prezerania stavu materialov
############################
function ponuka_materialov(vstup)
############################
define vstup record
   idkpolozky char(100), --like k_zmluvy:kpolozky.id,
   pcrefv char(100), --like k_zmluvy:kpolozky.pcrefv,
   podnik char(100), --like k_zmluvy:kpolozky.podnik,
   sortim char(100), --like k_zmluvy:kpolozky.sortim,
   varianta char(100), --like tpv:v_prikazy.varianta,
   cso char(100), --like kalkul:normy.csn,
   ckpol char(100), --like kalkul:normy.ckpol,
   sirka char(100), --like vp_polot.sirka,
   mikron char(100) --like vp_polot.mikron
end record
define bc smallint
define a char(1)

--6.4.10 call vytvor_docasmaterskup(0,vstup.pcrefv,gdatplat,vstup.podnik,vstup.sortim,1) returning a,txt1
call vytvor_docasmaterskup('PLATNE',vstup.idkpolozky,vstup.pcrefv,gdatplat,vstup.podnik,vstup.sortim,vstup.varianta,1) returning a,txt1
if a then
   let pp_18.cso = vstup.cso
   let pp_18.ckpol = vstup.ckpol
   let pp_18.sirka_gener = vstup.sirka
   let pp_18.mikron = vstup.mikron
   let pp_18.evidcis = null --dolezite pole pre rozlisenie specialneho volania
   ---potrebne pre volanie sablon v ponuke materialov---
   let pp_14.pcrefv = vstup.pcrefv
   let pp_14.csort = vstup.sortim
   let pp_14.idkpolozky = vstup.idkpolozky
   -----------------------------------------------------
   let guzivcond_19 =
   " sh_material.pod = ",vstup.podnik," and sh_material.cissklad in (19,22,33) and sh_material.evidcis in (select k.evidcis[1,7] from kalkul:kalpol k where k.datplat = ",gdatplat using "&&&&"," and k.pod = ",vstup.podnik," and k.ckpol = \"",vstup.ckpol,"\")"

   call lookup_19(0,1,0) returning bc
end if
end function

--ponuka pre externu(volanie inym programom) funkcionalitu prezerania stavu materialov pre sklad
############################
function ponuka_materialov_pre_sklad(vstup2)
############################
define vstup2 record
   pod char(100), --like is_1:sh_material.pod,
   cissklad char(100), --like is_1:sh_material.cissklad,
   evidcis char(100), --like is_1:sh_material.evidcis,
   sirka char(100), --like is_1:sh_popis.sirka,
   hrubka char(100) --like is_1:sh_popis.hrubka
end record
define bc smallint
define a char(1)

--6.4.10 call vytvor_docasmaterskup(0,vstup.pcrefv,gdatplat,vstup.podnik,vstup.sortim,1) returning a,txt1
call vytvor_docasmaterskup('PLATNE',0,0,gdatplat,vstup2.pod,"000000",1,1) returning a,txt1
if a then
   let pp_18.cso = "000000"
   let pp_18.ckpol = "000000"
   let pp_18.sirka_gener = vstup2.sirka
   let pp_18.mikron = vstup2.hrubka
   let pp_18.evidcis = vstup2.evidcis --dolezite pole pre rozlisenie specialneho volania
   ---potrebne pre volanie sablon v ponuke materialov---
   let pp_14.pcrefv = 0
   let pp_14.csort = "000000"
   let pp_14.idkpolozky = 0
   -----------------------------------------------------
   if vstup2.evidcis > 0 then
      let guzivcond_19 =
      " sh_material.pod = ",vstup2.pod," and sh_material.cissklad = ",vstup2.cissklad," and sh_material.evidcis = ",vstup2.evidcis
   else
      --12.3.14 specialna vetva pre prezeranie materialov podla mater.skupin za ucelom krytia internych PP
      let guzivcond_19 =
      " sh_material.pod = ",vstup2.pod," and sh_material.cissklad = ",vstup2.cissklad
   end if

   call lookup_19(0,1,0) returning bc
end if
end function

--ponuka pre internu funkcionalitu prezerania stavu materialov
############################
function ponuka_materialov_interna(podnik,cso,ckpol,sirka,mikron)
############################
define podnik char(100) --like k_zmluvy:kpolozky.podnik
define cso char(100) --like kalkul:normy.csn
define ckpol char(100) --like kalkul:normy.ckpol
define sirka char(100) --like vp_polot.sirka
define mikron char(100) --like vp_polot.mikron
define bc smallint
define a char(1)

let pp_18.cso = cso
let pp_18.ckpol = ckpol
let pp_18.sirka_gener = sirka
let pp_18.mikron = mikron
let guzivcond_19 =
" sh_material.pod = ",podnik," and sh_material.cissklad in (19,22,33) and sh_material.evidcis in (select k.evidcis[1,7] from kalkul:kalpol k where k.datplat = ",gdatplat using "&&&&"," and k.pod = ",podnik," and k.ckpol = \"",ckpol,"\")"

call lookup_19(0,1,0) returning bc
end function

---nastavenie parametrov programu
####################
function nast_00()
####################
define aa char
define puser char(100) --like sysadm:users.user_id
	options 
                --input attribute(reverse),
                accept key F2 ,
                input wrap

let aa = true
whenever error stop
set lock mode to wait 4
set isolation to dirty read
----#@@025
let ppsubsyst = "TPPR"  
let pprogram = "01AgrPlanovanie"  
let pprojekt = "tpv"  
----#@@025

let tdbpath = fgl_getenv("DBPATH")
let terminal = fgl_getenv("TERM")
let application_help_path = fgl_getenv("APPLICATION_HELP")
let ppmenu = "04vyber"
let autor3="NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN"
#????????????????????????????????????
let puziv = ""
--let l_loginp = fgl_getenv("USER")
--let l_loginp = "a11112"  ---pavlovicova
let pskupina = -1
---select cc.uzivname,cc.skupina into puziv,pskupina 
{
select cc.username,cc.skupina into puziv,pskupina 
		from satuziv:uzivatel cc
	 where cc.username = user 
}

--vyber skupiny je z tabulky projskupina, 
--preto pouzivatel musi mat priradenu skupinu pre projekt "tpv"!
----------------------------------------------------
select cc.uzivname,dd.skupina,user into puziv,pskupina,puser
from satuziv:uzivatel cc, outer satuziv:projskupina dd
--where cc.username = user
where cc.username = "lubos"
--where cc.username = l_loginp
and dd.uzivname = cc.uzivname
and dd.projekt = pprojekt
----------------------------------------------------

if puser is null then
	if gpodnik is not null then --pre externe volanie programu s parametrami
		let pskupina = 0
		let puser = "tpv"
	else
		--26.11.09
		let pskupina = 0
		
{
		let txt1 = "Nebola vam pridelena v projekte skupina!"
		let aa = false
		return aa
}
	end if
end if
#error puziv," - ",pskupina
--let puser=l_loginp

#????????????????????????????????????



call autorm(puziv,pprogram) returning autor3 
---pre _02 zatial na testovanie
---let autor3[2]="A"
{
whenever error continue
select bb.filter,bb.cislo into pfilter,pcislo
			from satuziv:skupina bb where 
	bb.projekt = pprojekt and 
        bb.program = pprogram and 
        bb.menu = ppmenu and 
        bb.skupina = pskupina

whenever error stop
if sqlca.sqlcode <> 0 then
##?????????????
	let pfilter = " 1 == 0  "
	let pfilter = " 1 == 1  "
	let pcislo = 0
	let pcislo = 99999999
end if
}
##?????????????
if not  ansiterm(3) then
	let txt1 = "Neviem nacitat parametre tlaciarne pre chybu:",
		chyba1
		let aa = false
end if
if aa then
	if puser = "lubos" or
	   puser = "querix" or
	   puser = "tpv" then
		let puser = "a11550" --Hucko Lubos
		let l_loginp=puser
		--let puser = "a10175" --Blasko Michal
	end if
	let guser = puser
	--if not vyb_id_zam(puser) then
	--	let txt1 = "Neviem nacitat Id v personalistike!",
	if not vyb_id_pouzivatel(puser) then
		let txt1 = "Neviem nacitat Id v pouzivateloch IS! ",chyba1
		let aa = false
	end if
end if

if aa then
   if gpodnik is null then
	call set_gpodnik() returning aa
{
	--26.11.09 zmena	
	let gpodnik = 6
}
   end if
   if aa then
	call set_gdatplat() returning aa
   end if
{
	if set_gpodnik() then
		if set_gdatplat() then
			---ok
		else
			let aa=false
		end if
	else
		let aa=false
	end if
}
end if
--------------na koniec funkcie nastav_00 v main_00.4gl --------------------
let gscreenxx = 80
let gscreenyy = 25
let glargebrowse = 0
--call resizeobr(glargebrowse)
--run "clear screen"
--------------na koniec funkcie nastav_00 v main_00.4gl --------------------

return aa
end function


#################################
function vyber_filter(p_menu)
#################################
define p_menu char(100) --like satuziv:skupina.menu
let pfilter = null
let pcislo = null
whenever error continue
select bb.filter,bb.cislo into pfilter,pcislo 
			from satuziv:skupina bb where 
	bb.projekt = pprojekt and 
        bb.program = pprogram and 
        bb.menu = p_menu and 
        bb.skupina = pskupina

whenever error stop
if sqlca.sqlcode <> 0 then
##?????????????
	if puziv="lubos" or puziv="dusan" or puziv="tpv" or puziv="polot" then
		let pfilter="is not null"
	else
		let pfilter = "is null"
	end if
	--let pfilter = " 1 == 1  "
	--let pcislo = 0
	let pcislo = 99999999
end if
end function


--LARGE BROWSE  MAIN_00.4GL FUNKCIA NA PRENASTAVENIE TERMINALU -----
############################
function netterm132(start)
############################
define start smallint
define txt3 chAR(100)
if terminal = "ansi" then
if start then
 let txt3 = ascii(27),"[?3h"
 let txt3 = "echo \'",txt3 clipped,"\'"
 run txt3 clipped

 ------let txt3 = ascii(27),"[132m"
 ------let txt3 = "echo \'",txt3 clipped,"\'"
 ------run txt3 clipped
 run "stty columns 132"
 let gscreenxx = 132
else

 let txt3 = "stty columns 80"
 run txt3 clipped

 let txt3 = ascii(27),"[?3l"
                        let txt3 = "echo \'",txt3 clipped,"\'"
                        run txt3 clipped
                        let gscreenxx = 80
end if
end if
end function

##############################
function resizeobr(iii)
##############################
define iii int
case iii
   when 1
        let gscreenxx = 132
        let gscreenyy = 25
   when 2
        let gscreenxx = 132
        let gscreenyy = 35
   when 3
        let gscreenxx = 132
        let gscreenyy = 45
otherwise
        let gscreenxx = 80
        let gscreenyy = 25
end   case
let textchy = "resize -s ",gscreenyy," ",gscreenxx
run textchy
run "clear screen"
end function
--LARGE BROWSE  MAIN_00.4GL FUNKCIA NA PRENASTAVENIE TERMINALU -----


---zobrazenie  podrebneho chyboveho vypisu
#####################
function chyba()
#####################
define aa char
	if chyba1 < 0 then
		let textchy = "finderr ",chyba1," | pg "
		run textchy 
		let textchy = "finderr ",chyba2," | pg "
		run textchy 
	else
		error "Nebola chyba!"
	end if
		display "                             <<S Q L C A>>"
		display ""
		display "SQLCODE = ",sqlca.sqlcode
		display "SQLERRM = ",sqlca.sqlerrm
		display "SQLERRP = ",sqlca.sqlerrp
		display "SQLERRD[1] = ",sqlca.sqlerrd[1],"       ( Je nevyuzite)"
		display "SQLERRD[2] = ",sqlca.sqlerrd[2],"       ( Serial hodnota alebo kod ISAM)"
		display "SQLERRD[3] = ",sqlca.sqlerrd[3],"       ( pocet spracovanych riadkov)"
		display "SQLERRD[4] = ",sqlca.sqlerrd[4],"       ( CPU naklady na vyhladavanie)"
		display "SQLERRD[5] = ",sqlca.sqlerrd[5],"       ( Ofset chyby SQL prikazu)"
		display "SQLERRD[6] = ",sqlca.sqlerrd[6],"       ( ROWID posledne spracovaneho riadku)"
		display "SQLAWARN = ",sqlca.sqlawarn



		display ""
		prompt "(EOF):" for char aa
end function


---nacitanie parametrov tlaciarne
##################
function ansiterm(zz)
#################
define zz integer
define a,wk char
let a = false
whenever error continue
select * into def_tlace.* from tpv:tlaciarne s
		where s.porc = zz

whenever error stop
if sqlca.sqlcode = 0 then
	let a = true
else
	let a = false
end if
let chyba1 = sqlca.sqlcode

return a
end function

---nacitanie id person:zam
##################
function vyb_id_zam(puser)
#################
define zz integer
define a,wk char
define puser char(100) --like sysadm:users.user_id
define p_rok,p_mes smallint
let a = false
if fgl_getenv("HOSTNAME") = "helios" then
	let p_rok = year(today-31)
	let p_mes = month(today-31)
else
	let p_rok = year(today)
	let p_mes = month(today)
end if

whenever error continue
select
	ser
into
	gid_zam
from person:zam z,sysadm:users u
where
	z.rok = p_rok and
	z.mes = p_mes and
	z.zam_num = u.osc and
	user_id = puser
whenever error stop
if sqlca.sqlcode = 0 then
	let a = true
else
	let a = false
end if
let chyba1 = sqlca.sqlcode
return a
end function

##################
function vyb_id_pouzivatel(puser)
#################
define zz integer
define a,wk char
define puser char(100) --like sysadm:users.user_id

let a = false

whenever error continue
select
	p.id
into
	gid_zam
from orion1:is_pouzivatel p
where
	p.login = puser
whenever error stop
if sqlca.sqlcode = 0 then
	let a = true
else
	let a = false
end if
let chyba1 = sqlca.sqlcode
return a
end function

---nacitanie poradia riadka pri relativnom skuku
##################
function citpol()
##################
define a char
define pomtxt1 char(20)
define ii int
open window win04a_00 at 5,19 with 7 rows,36 columns
call fgl_drawbox(7,36,1,1)
let pomtxt1 = ppsubsyst clipped,"main04_00"
let ii =  35 -  length(pomtxt1)
display pomtxt1 clipped at 1,ii attribute(cyan,reverse) 
open window win04_00 at 6,20 with 5 rows,34 columns
    attribute(
             form line first,
            prompt line last - 1,
            message line last - 1,
            comment line last - 1

      )
open form formax from 
			"main04_00"
display form formax
display "-Potvrd   -Prerus" at 5,4
display "F2" at 5,2
	attribute(reverse)       
display "F5" at 5,12
	attribute(reverse)       
let a = true
input by name  rel  attribute(reverse)
on key(F5,esc)
	let a = false
	exit input
end input
close window win04_00
close window win04a_00
return a
end function

---nacitanie poradia riadka pri relativnom skuku
---s prvou cislicou
##################
function citpol1(z)
##################
define a,z,b char,
       relch char(10)
define pomtxt1 char(20)
define ii int
open window win04a_00 at 5,19 with 7 rows,36 columns
call fgl_drawbox(7,36,1,1)
let pomtxt1 = ppsubsyst clipped,"main04_00"
let ii =  35 -  length(pomtxt1)
display pomtxt1 clipped at 1,ii attribute(cyan,reverse) 
open window win04_00 at 6,20 with 5 rows,34 columns
    attribute(
             form line first,
            prompt line last - 1,
            message line last - 1,
            comment line last - 1

      )
open form formaz from 
			"main04_00"
display form formaz
display "-Potvrd   -Prerus" at 5,4
display "F2" at 5,2
	attribute(reverse)       
display "F5" at 5,12
	attribute(reverse)       
#let relch[1] = z
let a = true
let b = true
display z at 2,22 attribute(reverse)
input relch without defaults from rel  attribute(reverse)
	after field rel
	   if b then
		display " " at 2,22 
		let relch = z,relch 
		let b = false
            end if
		whenever error continue
		let rel = relch
		whenever error stop
                if status <> 0 then
                	error "Chybny udaj"
			next field rel
		end if
on key(F5,esc)
	let a = false
	exit input
end input
close window win04_00
close window win04a_00
return a
end function

---nacitanie hlavicky reportu
##################
function hlavicka_00()
##################
define a char
define pomtxt1 char(20)
define ii int
open window win05a_00 at 9,1 with 8 rows,80 columns
call fgl_drawbox(8,80,1,1)
let pomtxt1 = ppsubsyst clipped,"main05_00"
let ii =  76 -  length(pomtxt1)
display pomtxt1 clipped at 1,ii attribute(cyan,reverse) 
open window win05_00 at 10,2 with 6 rows,78 columns
    attribute(
	     form line first,
	    prompt line last - 2,
	    message line last - 2,
	    comment line last - 1
	   )

open form forma3_00 from 
			"main05_00"
display form forma3_00
display "  -Potvrd   -Prerus" at 6,2
display "F2" at 6,2 attribute(reverse)
display "F5" at 6,12 attribute(reverse)
let tc_00 = "" 
let a = true
input by name tc_00 attribute(reverse)
	on key (f5,esc)
		let tc_00 = "" 
		let a = false
		exit input
end input
close window win05_00 
close window win05a_00 
return a
end function



#################_MODUL20 -vseobecny modul ####################

---dialog pre potvrdenie
---mozne klavesy    a,A   n,N
###########################
FUNCTION potvrd1(text)
###########################
DEFINE ot,t char,
        x,y SMALLINT,
     text,textchy char(73)
let t = true
while t
let t = false
let ot = " "
LET y = LENGTH(text) + 1
LET x = (78 - y)/2
OPEN WINDOW  sp AT 10,x  WITH  1 ROWS,y COLUMNS
        ATTRIBUTE(REVERSE,BORDER,
                   prompt line first)
prompt text clipped FOR CHAR ot attribute(reverse)
	on key("return")
		let t = true
   		let ot = " "
end prompt
CLOSE WINDOW sp
	if ot = "!" then
		let t = true
		call chyba()
	end if
if (upshift(ot) <> "A" and upshift(ot) <> "N" ) or ot is null THEN
	let t = true
	let ot = " "
end if
end while
if upshift(ot) == "A" THEN
    RETURN TRUE
ELSE 
    RETURN FALSE
END if
END FUNCTION


---dialog pre potvrdenie
---pri stlaceni lubovolnej klavesy okrem a,A vrati false
###########################
FUNCTION potvrd(text)
###########################
DEFINE ot,t char,
        x,y SMALLINT,
     text,textchy char(73)
let t = true
while t
let t = false
let ot = "N"
LET y = LENGTH(text) + 1
LET x = (78 - y)/2
OPEN WINDOW  sp AT 10,x  WITH  1 ROWS,y COLUMNS
        ATTRIBUTE(REVERSE,BORDER,
                   prompt line first)
prompt text clipped FOR CHAR ot attribute(reverse)
	on key("return")
		#let t = true
   		let ot = "N"
end prompt
CLOSE WINDOW sp
	if ot = "!" then
		let t = true
		call chyba()
	end if
	
end while
if upshift(ot) == "A" THEN
    RETURN TRUE
ELSE 
    RETURN FALSE
END if
END FUNCTION



---vypis dialogoveho 1.riadkoveho okna na 2 sekundy
###########################
FUNCTION sprava(text)
###########################
DEFINE ot char,
        x,y SMALLINT,
     text char(80)
LET y = LENGTH(text) + 1
LET x = (78 - y)/2
OPEN WINDOW  sp AT 10,x  WITH  1 ROWS,y COLUMNS
        ATTRIBUTE(REVERSE,BORDER,
                   prompt line first)
display text at 1,1
sleep 2
CLOSE WINDOW sp
END FUNCTION


---vypis dialogoveho 2.riadkoveho okna na stlacenie lubovol.klavesy
###########################
FUNCTION sprava3(text)
###########################
DEFINE ot,t char,
        x,y SMALLINT,
     text,textchy char(73)
define key smallint

let t = false
let ot = "N"
LET y = LENGTH(text) + 1
LET x = (78 - y)/2
OPEN WINDOW  sp AT 10,x  WITH  2 ROWS,y COLUMNS
        ATTRIBUTE(REVERSE,BORDER,
                   prompt line first)
display "Na pokracovanie stlacte klavesu Enter.                                        " at 2,1 attribute(reverse)
while true
   prompt text clipped FOR CHAR ot attribute(reverse)
	on key("return")
	   exit while
   end prompt
end while
CLOSE WINDOW sp
END FUNCTION

###########################
FUNCTION sprava2(text)
###########################
DEFINE ot char,
        x,y SMALLINT,
     text char(80)
LET y = LENGTH(text) + 1
LET x = (78 - y)/2
OPEN WINDOW  pracujem AT 10,x  WITH  1 ROWS,y COLUMNS
        ATTRIBUTE(REVERSE,BORDER,
                   prompt line first)
display text at 1,1
END FUNCTION

---zaciatok tranzakcie
##################
function beg_wk()
##################
define tx char(80)
whenever error continue
    begin work
whenever error stop
    if sqlca.sqlcode <> 0 then
      let tx =   "Chyba",sqlca.sqlcode,
       "na BEGIN WORK (isam#",sqlca.sqlerrd[2], ")"
       call sprava(tx)
       return false
     else
       return true
    end if
end function

---koniec tranzakcie
##################
function com_wk()
##################
define tx char(80)
whenever error continue
    commit work
whenever error stop
    if sqlca.sqlcode <> 0 then
      let tx =   "Chyba",sqlca.sqlcode,
       "na COMMIT WORK (isam#",sqlca.sqlerrd[2], ")"
       call sprava(tx)
       return false
     else
       return true
    end if
end function

---vycuvanie z tranzakcie
##################
function rol_wk()
##################
define tx char(80)
whenever error continue
    rollback work
whenever error stop
    if sqlca.sqlcode <> 0 then
      let tx =   "Chyba",sqlca.sqlcode,
       "na ROLLBACK WORK (isam#",sqlca.sqlerrd[2], ")"
       call sprava(tx)
       return false
     else
       return true
    end if
end function

--- test uspesnosti sql prikazu
#################
function uspech(a)
#################
define succes smallint,
     a char
if sqlca.sqlcode < 0  then
    if row_lock() then
      let succes = 1
     else
       let succes = -1
    end if
else
   if (SQLCA.SQLCODE = NOTFOUND) 
         OR (sqlca.sqlcode = 0 and SQLCA.SQLERRD[3] = 0 and a) then
    LET succes = NOTFOUND
   else
  let succes = 0
    end if
end if
return succes
end function

---ci je riadok uzamknuty
#################
function row_lock()
#################
define lock1 smallint
 case sqlca.sqlerrd[2]
    when -107
       let lock1 = TRUE
    when -113
       let lock1 = TRUE
    when -134
       let lock1 = TRUE
    when -143
       let lock1 = TRUE
    when -144
       let lock1 = TRUE
    when -154
       let lock1 = TRUE
   otherwise
       let lock1 = false
end case
return lock1
end function

## Zistenie privilegii pre tabulku tname
################
function autorm(puziv,pprogram)
################
define pamenu char(100) --like satuziv:privileg.menu 
define autor1 char(30),
	typ char,
	puziv char(15),
	pprogram char(15),
	aut array[20] of integer,
	i,j,k integer
let autor1 ="NNNNNNNNNNNNNNNNNNNNNNNNNNNNN"
declare kurz1_00 cursor for select unique cc.menu[1,2] from satuziv:privileg cc
	where ( cc.uzivname = puziv or cc.uzivname = "public" )
                    and cc.projekt = pprojekt
                    and cc.program = pprogram
		order by 1
let i = 1
foreach kurz1_00 into aut[i]
	let i = i + 1
end foreach
let i = i - 1
for j = 1 to i
	let k = aut[j]
	let autor1[k] = "A"
end for

return autor1
end function



----nahradenie retazca v retazci retazcom
#####################
function substretazec(retazec,zret,doret)
#####################
define pomret char(1000)
define retazec char(1000)
define zret char(100)
define doret char(100)
define i,j,k,a smallint
define zdlz,dodlz,retdlz smallint

let zdlz =  length( zret ) 
let dodlz =  length( doret ) 
let retdlz =  length( retazec ) 
let k = 1
if retdlz >= 1000 then
		error "Retazec bude useknuty!"
		sleep(5)
end if 
for i = 1 to retdlz
	let j = 1
	if retazec[i] = zret[j] then
		let a = true
		for j = 2 to zdlz
			if retazec[i + j -1 ] <> zret[j] then
				let a = false
				exit for
			end if
		end for
		if a then
			for j = 1 to dodlz
				let pomret[k] = doret[j]
				let k = k+1
			end for
			let i = i + zdlz -1
		else
			let pomret[k] = retazec[i]
			let k = k + 1
		end if
		
	else
		let pomret[k] = retazec[i]
		let k = k + 1
	end if
end for
return pomret

end function




----nahradenie matches retazca na ascii velky 
#####################
function sbretslovak(retazec,zret)
#####################
define pomret char(1000)
define retazec char(1000)
define zret char(100)
define oo char(100)
define i,j,k,a,z smallint
define zdlz,dlzoo,retdlz smallint
define jezatvorka int   ---ci je hranata zatvorka


let jezatvorka = false

let zdlz =  length( zret ) 
let retdlz =  length( retazec ) 
let k = 1
if retdlz >= 1000 then
		error "Retazec bude useknuty!"
		sleep(5)
end if 
for i = 1 to retdlz
	let j = 1
	if retazec[i] = zret[j] then
		let a = true
		for j = 2 to zdlz
			if retazec[i + j -1 ] <> zret[j] then
				let a = false
				exit for
			end if
		end for
		if a then
			-------let i = i+zdlz 
			while(i <= retdlz  and retazec[i] <> "\"" and retazec[i] <> "'" )
				if retazec[i] = "=" then
					let pomret[k] = " "
					let k = k+1
					let pomret[k] = "m"
					let k = k+1
					let pomret[k] = "a"
					let k = k+1
					let pomret[k] = "t"
					let k = k+1
					let pomret[k] = "c"
					let k = k+1
					let pomret[k] = "h"
					let k = k+1
					let pomret[k] = "e"
					let k = k+1
					let pomret[k] = "s"
					let k = k+1
					let pomret[k] = " "
					let k = k+1
				else
					let pomret[k] = retazec[i]
					let k = k+1
				end if
				let i = i + 1
			end while
			let pomret[k] = retazec[i]
			let k = k+1
			let i = i + 1
		
			while(i <= retdlz  and retazec[i] <> "\"" and retazec[i] <> "'" )
				if  retazec[i] <> " " and retazec[i] <> "[" and retazec[i] <> "]"  then 
					call slovretaz(retazec[i]) returning oo 
					let dlzoo = length(oo)
					if dlzoo > 1 and not jezatvorka then
						let pomret[k] = "["
						let k = k+1
					end if
					for z = 1 to dlzoo
						let pomret[k] = oo[z]
						let k = k+1
					end for
					if dlzoo > 1 and not jezatvorka then
						let pomret[k] = "]"
						let k = k+1
					end if
				else
					let pomret[k] = retazec[i]
					let k = k+1
					if  retazec[i] = "["  and retazec [i - 1] <> "\\"then 
						let jezatvorka  = true
					end if
					if  retazec[i] = "]"  and jezatvorka then 
						let jezatvorka  = false
					end if
				end if
				let i = i + 1
			end while
			let pomret[k] = retazec[i]
			let k = k+1

		else
			let pomret[k] = retazec[i]
			let k = k + 1
		end if
		
	else
		let pomret[k] = retazec[i]
		let k = k + 1
	end if
end for
return pomret

end function

#######################
function slovretaz(o)
#######################
define o char(1)
define oo char(2)
if ( o >= "a" and o <= "z") or (o >= "A" and o <= "Z") then
	if ( o >= "a" and o <= "z")  then
		let o = upshift(o)
	end if
	case  o
		when "A" return "AaÁáÄä"
		---when "B" return ""
		when "C" return "CcČč"
		when "D" return "DdĎď"
		when "E" return "EeÉéĚě"
		---when "F" return ""
		---when "G" return ""
		---when "H" return ""
		when "I" return "IiÍí"
		---when "J" return ""
		---when "K" return "Kk"
		when "L" return "LlĹĺĽľ"
		---when "M" return ""
		when "N" return "NnŇň"
		when "O" return "OoÓóÖöÔô"
		---when "P" return ""
		---when "Q" return ""
		when "R" return "RrŔŕŘř"
		when "S" return "SsŠš"
		when "T" return "TtŤť"
		when "U" return "UuÚúÜüŮů"
		---when "V" return ""
		---when "W" return ""
		---when "X" return ""
		when "Y" return "YyÝý"
		when "Z" return "ZzŽž"
		otherwise 
			let oo = o clipped,downshift(o)
			return oo
	end case
	
else
	return o
end if
end function

----koniec--------okomentova na toasciivelky


---ci bila stlacena klavesa vpravo
##################
---function vpravo()
function vpravo2()
#################
define  a char ,
	lastkey integer
let lastkey = fgl_lastkey()
if ( (lastkey <> fgl_keyval("up")) and
     (lastkey <> fgl_keyval("left"))  )
then
	let a = true
else
	let a = false
end if
return a
end function

---ci bila stlacena klavesa vpravo
##################
function vpravo1(lastkey)
#################
define  a char ,
	lastkey integer
if ( (lastkey <> fgl_keyval("up")) and
     (lastkey <> fgl_keyval("left"))  )
then
	let a = true
else
	let a = false
end if
return a
end function

####modul 30 triedenie

---okno pre listovanie v triedeni
################
function opw931()
################
define pomtxt1 char(20)
define ii int
open window win06a_00 at 3,37 with 21 rows,42 columns
call fgl_drawbox(21,42,1,1)
let pomtxt1 = ppsubsyst clipped,"main06_00"
let ii =  41 -  length(pomtxt1)
display pomtxt1 clipped at 1,ii attribute(cyan,reverse) 
open window win06_00 at 4,38 with 19 rows,40 columns
    attribute(
             form line first,
            prompt line last - 1,
            message line last - 1,
            comment line last - 1
           )

open form forma2093 from 
			"main06_00"
display form forma2093
display "  -Potvrd   -Prerus   -Oznac   -Desc" at 19,2
display "F2" at 19,2 attribute(reverse)
display "F5" at 19,12 attribute(reverse)
display "F7" at 19,22 attribute(reverse)
display "F8" at 19,31 attribute(reverse)
end function

---listovanie v triedeni
####################
function browse163()
####################
define zac,i,j,kon1  integer
let  zac  = pcur - scur + 1
if  zac + maxsc -1  > yi then 
	let kon1 =  yi - zac + 1
else
	let kon1 =  maxsc
end if
for i = 1 to kon1
           let j = zac + i - 1
   if i != scur then
	display ag[j].* to sc[i].* 
   else
	display ag[j].* to sc[i].* 
            attribute (reverse)
	#display ag[j].text to sc[i].text 
   end if
end for
let kon1 = kon1 + 1
for i = kon1 to maxsc
   if i != scur then
       display prazd1.* to sc[i].*
   else
       display prazd1.* to sc[i].*
           attribute(reverse)
   end if
end for
end function

---pocitadlo vo listovania  v triedenia
#########################
function pocitadlo163()
#########################
define porad,isa integer,
        text char(30),
        poctex char(10)
if pocet <> 0 then
	let porad = zacstr + pcur -1
else
	let porad = 0
        
end if
let poctex = pocet
let text = porad,"/",poctex
display text at 1,25
let isa = zacstr + yi - 1 
#display zacstr using "&&&&&"  ," ",isa using "&&&&&" at 1,30
end function

---vyber triedenia
###################
function triedenie(vyber)
###################
define o,pom1 integer
define vyber int
define   a char
define z char
define i,j integer
define txtord char(200)
let txtord = " order by "
initialize prazd1.* to null
let o = 0
let maxhld = 25
let maxsc = 14
let yi = 100
for i = 1 to yi
	let ag[i].* = prazd1.*
end for
	case vyber
#@@024
##@@18
		when 18 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Idpl_poziad_progn" 
		  let ag[3].text = "Idpl_vyuz_zdroj" 
		  let ag[4].text = "Verzia" 
		  let ag[5].text = "Platnost" 
		  let ag[6].text = "Cislo podniku" 
		  let ag[7].text = "Cislo oddelenia vyrabajuceho" 
		  let ag[8].text = "Cis.oddel.odoberajuceho" 
		  let ag[9].text = "Datum platnosti" 
		  let ag[10].text = "Cislo zakladneho sortimentu" 
		  let ag[11].text = "Cislo kalkulacnej polozky" 
		  let ag[12].text = "Idsh_material" 
		  let ag[13].text = "Cislo skladu" 
		  let ag[14].text = "Evidencne cislo materialu" 
		  let ag[15].text = "Nazov materialu" 
		  let ag[16].text = "Termin dodania" 
		  let ag[17].text = "Cas potvrdenia" 
		  let ag[18].text = "Idpotvrdil" 
		  let ag[19].text = "Priezvisko" 
		  let ag[20].text = "Meno" 
		  let ag[21].text = "Sirka" 
		  let ag[22].text = "Plosna hmotnost" 
		  let ag[23].text = "Hrubka" 
		  let ag[24].text = "Mnozstvo v KG" 
		  let ag[25].text = "Mnozstvo v MJ" 
		  let ag[26].text = "Mj" 
		  let ag[27].text = "Poradie nahraditelnosti" 
		  let ag[28].text = "Nazov kalkulacnej polozky" 
		  let ag[29].text = "Idpl_sledpolozka" 
		  let ag[30].text = "Idpl_typzdroja" 
		  let ag[31].text = "Sirka generovana" 
		  let ag[32].text = "Mnozstvo v KG generovane" 
		  let ag[33].text = "Mnozstvo v Mj generovane" 
		  let ag[34].text = "Generovane spolu s VP" 
		  let ag[35].text = "Termin pozadovaneho ukoncenia vyroby" 
		  let ag[36].text = "Cislo sortim.odoberajuceho" 
		  let ag[37].text = "Kod operacie" 
		  let ag[38].text = "Sirka odoberajuca" 
		  let ag[39].text = "Mnozstvo m2 odoberajuce" 
		  let ag[40].text = "Vrstva" 
		  let ag[41].text = "Tlacena vrstva" 
		  let yi = 41 
		  let pocet = 41 
		  let zacstr = 1 
##@@18
##@@03
		when 3 
		  let ag[1].text = "Id param.strojov" 
		  let ag[2].text = "Cislo podniku" 
		  let ag[3].text = "Cislo strediska" 
		  let ag[4].text = "Cislo stroja" 
		  let ag[5].text = "Nazov stroja" 
		  let ag[6].text = "Id po_stroje" 
		  let ag[7].text = "Id zmenil" 
		  let ag[8].text = "Zakladna vyroba" 
		  let ag[9].text = "Tlac" 
		  let ag[10].text = "Rezanie" 
		  let ag[11].text = "Konfekcia" 
		  let ag[12].text = "Kasirovanie" 
		  let ag[13].text = "Min.vst.sirka" 
		  let ag[14].text = "Max.vst.sirka" 
		  let ag[15].text = "Min.vst.hrubka" 
		  let ag[16].text = "Max.vst.hrubka" 
		  let ag[17].text = "Min.vyst.sirka" 
		  let ag[18].text = "Max.vyst.sirka" 
		  let ag[19].text = "Min.vyst.dlzka" 
		  let ag[20].text = "Max.vyst.dlzka" 
		  let ag[21].text = "Korona nevodiva" 
		  let ag[22].text = "Korona vodiva" 
		  let ag[23].text = "Korona umiest." 
		  let ag[24].text = "Coldseal pozdlz" 
		  let ag[25].text = "Coldseal umiest." 
		  let ag[26].text = "Unikat. kody" 
		  let ag[27].text = "Rychlost tlace pri unikodoch" 
		  let ag[28].text = "Merna jednotka rychlosti pri unikodoch" 
		  let ag[29].text = "Max.pocet valcov" 
		  let ag[30].text = "Min.tl.sirka" 
		  let ag[31].text = "Max.tl.sirka" 
		  let ag[32].text = "Min.obvod valca" 
		  let ag[33].text = "Max.obvod valca" 
		  let ag[34].text = "Presny raport" 
		  let ag[35].text = "Pocet obracacov" 
		  let ag[36].text = "Kratka vod.draha" 
		  let ag[37].text = "Esa" 
		  let ag[38].text = "Min.priemer navinu" 
		  let ag[39].text = "Max.priemer navinu" 
		  let ag[40].text = "Min.dutinka" 
		  let ag[41].text = "Max.dutinka" 
		  let ag[42].text = "Laserova perforacia" 
		  let ag[43].text = "Vzduch.otvory" 
		  let ag[44].text = "Umiestnenie pozdlneho zlepu" 
		  let ag[45].text = "Priezvisko" 
		  let ag[46].text = "Meno" 
		  let ag[47].text = "Datum a cas zmeny" 
		  let yi = 47 
		  let pocet = 47 
		  let zacstr = 1 
##@@03
##@@14
		when 14 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Cislo kupnej zmluvy" 
		  let ag[3].text = "Poradove cislo polozky KZ" 
		  let ag[4].text = "Stav poziadavky" 
		  let ag[5].text = "Status generovania VP" 
		  let ag[6].text = "Stav potvrdenia terminov" 
		  let ag[7].text = "Predaj ziada novy termin" 
		  let ag[8].text = "Id kupnej zmluvy" 
		  let ag[9].text = "Id polozky kupnej zmluvy" 
		  let ag[10].text = "Cislo vyrobneho prikazu" 
		  let ag[11].text = "ID vyrobneho prikazu" 
		  let ag[12].text = "Termin pozadovaneho ukoncenia vyroby" 
		  let ag[13].text = "Termin prognozovaneho ukoncenia vyroby" 
		  let ag[14].text = "Nazov firmy" 
		  let ag[15].text = "Informacia o poznamkach predajcu" 
		  let ag[16].text = "Sirka finalna" 
		  let ag[17].text = "Cislo finalneho sortimentu" 
		  let ag[18].text = "Nazov sortimentu" 
		  let ag[19].text = "Plosna hmotnost" 
		  let ag[20].text = "Hrubka" 
		  let ag[21].text = "Mnozstvo KG" 
		  let ag[22].text = "Mnozstvo v kusoch" 
		  let ag[23].text = "Merna jednotka" 
		  let ag[24].text = "Cislo referencneho vzoru" 
		  let ag[25].text = "Kod zmeny referenc.vzoru" 
		  let ag[26].text = "Pocet potlacovych valcov" 
		  let ag[27].text = "Nazov motivu" 
		  let ag[28].text = "Datum poziadavky" 
		  let ag[29].text = "Cac poziadavky" 
		  let ag[30].text = "Id pozadoval" 
		  let ag[31].text = "Pozadoval-priezvisko" 
		  let ag[32].text = "Pozadoval-meno" 
		  let ag[33].text = "Datum prognozovania" 
		  let ag[34].text = "Cas prognozovania" 
		  let ag[35].text = "ID prognozoval" 
		  let ag[36].text = "Prognozoval-priezvisko" 
		  let ag[37].text = "Prognozoval-meno" 
		  let ag[38].text = "Datum potvrdenia" 
		  let ag[39].text = "Cas potvrdenia" 
		  let ag[40].text = "Id potvrdil" 
		  let ag[41].text = "Potvrdil-priezvisko" 
		  let ag[42].text = "Potvrdil-meno" 
		  let ag[43].text = "Datup poziadavky storna" 
		  let ag[44].text = "Cas poziadavky storna" 
		  let ag[45].text = "Id pozadoval storno" 
		  let ag[46].text = "Potvrdil-priezvisko" 
		  let ag[47].text = "Potvrdil-meno" 
		  let ag[48].text = "Datum uplynutia casu na potvrdenie" 
		  let ag[49].text = "Cas uplynutia casu na prognozovanie" 
		  let ag[50].text = "Datum akceptacie" 
		  let ag[51].text = "Cas akceptacie" 
		  let ag[52].text = "Id akceptoval" 
		  let ag[53].text = "Potvrdil-priezvisko" 
		  let ag[54].text = "Potvrdil-meno" 
		  let ag[55].text = "Nova grafika" 
		  let ag[56].text = "Kod storna" 
		  let ag[57].text = "Stav vyrobneho prikazu" 
		  let ag[58].text = "Insert do tabulky pl_dostup_zdroja" 
		  let ag[59].text = "Poznamka TPV ku zakazke" 
		  let ag[60].text = "Poznamka TPV ku zakazke" 
		  let ag[61].text = "Verzia vyrobneho prikazu" 
		  let ag[62].text = "Verzia vyrobneho prikazu -historia" 
		  let ag[63].text = "Ukoncene graficke prace" 
		  let ag[64].text = "Termin prognoz.ukoncenia vyroby-system" 
		  let ag[65].text = "Vzorka" 
		  let ag[66].text = "Poradove cislo vyrobku" 
		  let ag[67].text = "Podnik" 
		  let ag[68].text = "Cas odoslania na logistiku" 
		  let ag[69].text = "Id odoslal na logistiku" 
		  let ag[70].text = "Odoslal na logistiku-priezvisko" 
		  let ag[71].text = "Odoslal na logistiku-meno" 
		  let ag[72].text = "Varianta sortimentu" 
		  let ag[73].text = "Zlozenie lakov a studeny zvar" 
		  let ag[74].text = "Kod vyvoja" 
		  let ag[75].text = "Stav archivu" 
		  let ag[76].text = "Typ vynimky" 
		  let ag[77].text = "Popis typu vynimky" 
		  let ag[78].text = "Pozadovany termin vynimky" 
		  let ag[79].text = "Termin vypocitany z dodacich podmienok" 
		  let ag[80].text = "Prognozovany termin natlacku" 
		  let ag[81].text = "Priznak druhu tlace" 
		  let ag[82].text = "Cas suhlasu tpv so sirkami" 
		  let ag[83].text = "Suhlasil so sirkami" 
		  let ag[84].text = "Suhlasil so sirkami-priezvisko" 
		  let ag[85].text = "Suhlasil so sirkami-meno" 
		  let ag[86].text = "Priznak sirky" 
		  let ag[87].text = "Pocet 3,5 planov" 
		  let ag[88].text = "Pocet family printing skupin" 
		  let yi = 88 
		  let pocet = 88 
		  let zacstr = 1 
##@@14
##@@02
		when 2 
		  let ag[1].text = "Id doby zrenia" 
		  let ag[2].text = "Cislo podniku" 
		  let ag[3].text = "Cislo sortimentu" 
		  let ag[4].text = "Nazov sortimentu" 
		  let ag[5].text = "Cislo technologickej operacie" 
		  let ag[6].text = "Poradie operacie" 
		  let ag[7].text = "Nazov operacie" 
		  let ag[8].text = "Platnost doby zrenia od" 
		  let ag[9].text = "Platnost doby zrenia do" 
		  let ag[10].text = "Cas zrenia" 
		  let ag[11].text = "Technologicka spracovatelnost" 
		  let ag[12].text = "Cislo technologie" 
		  let ag[13].text = "Nazov technologie" 
		  let ag[14].text = "Datum a cas zmeny" 
		  let ag[15].text = "Id zamestnanca" 
		  let ag[16].text = "Cislo strediska" 
		  let ag[17].text = "Priezvisko" 
		  let ag[18].text = "Meno" 
		  let ag[19].text = "Cislo strediska vyrabajuce" 
		  let ag[20].text = "Cislo strediska odoberajuce" 
		  let ag[21].text = "Cislo finalneho vyrobku" 
		  let yi = 21 
		  let pocet = 21 
		  let zacstr = 1 
##@@02
##@@46
		when 46 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Idpl_kalendar_obdobi" 
		  let ag[3].text = "Cislo podniku" 
		  let ag[4].text = "Cislo oddelenia" 
		  let ag[5].text = "Obdobie" 
		  let ag[6].text = "Idpo_stroje" 
		  let ag[7].text = "Cislo skupiny strojov" 
		  let ag[8].text = "Nazov skupiny strojov" 
		  let ag[9].text = "Idnad_spol1 -Id top firmy" 
		  let ag[10].text = "Skrateny nazov top firmy" 
		  let ag[11].text = "Preferovany sposob tlace" 
		  let ag[12].text = "Rezervovana kapacita (dd hh:mm)" 
		  let ag[13].text = "Rezer.kapacita -percento z disponibilnej" 
		  let ag[14].text = "Nevyrobene -plan + sklz (dd hh:mm)" 
		  let ag[15].text = "Vyrobene -pouzita kapacita (dd hh:mm)" 
		  let ag[16].text = "Volna rezervovana kapacita (dd hh:mm)" 
		  let ag[17].text = "Sklz -uz to malo bythotove (dd hh:mm)" 
		  let ag[18].text = "Vyrobene podla plan.nhod (dd hh:mm)" 
		  let ag[19].text = "Obchodny plan (dd hh:mm)" 
		  let ag[20].text = "Podiel sklzu top firiem (dd hh:mm)" 
		  let ag[21].text = "Celkova kapacita stroja (dd hh:mm)" 
		  let ag[22].text = "Platnost" 
		  let ag[23].text = "Cas zmeny" 
		  let ag[24].text = "Priezvisko" 
		  let ag[25].text = "Meno" 
		  let ag[26].text = "Idzmenil" 
		  let yi = 26 
		  let pocet = 26 
		  let zacstr = 1 
##@@46
##@@59
		when 59 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Cislo podniku finalneho" 
		  let ag[3].text = "Cislo sortimentu finalneho" 
		  let ag[4].text = "Cislo oddelenia finalneho" 
		  let ag[5].text = "Nazov sortimentu" 
		  let ag[6].text = "Popis" 
		  let ag[7].text = "Variant materialov" 
		  let ag[8].text = "Gramaz finalna" 
		  let ag[9].text = "Hrubka finalna" 
		  let ag[10].text = "Jemnost finalna" 
		  let ag[11].text = "Id typ zdruzovania" 
		  let ag[12].text = "Typ zdruzovania finalny" 
		  let ag[13].text = "Pocet fibril finalny" 
		  let ag[14].text = "Id smer zakrutu" 
		  let ag[15].text = "Smer zakrutu finalny" 
		  let ag[16].text = "Skaci zakrut" 
		  let ag[17].text = "Id farba" 
		  let ag[18].text = "Kod farby finalny" 
		  let ag[19].text = "Nazov farby" 
		  let ag[20].text = "Id profil" 
		  let ag[21].text = "Skratka profilu" 
		  let ag[22].text = "Nazov profilu" 
		  let ag[23].text = "Vyrobny variant" 
		  let ag[24].text = "Platnost" 
		  let ag[25].text = "Id zmenil" 
		  let ag[26].text = "Cas zmeny" 
		  let ag[27].text = "Zmenil" 
		  let ag[28].text = "Obchodne oznacenie" 
		  let yi = 28 
		  let pocet = 28 
		  let zacstr = 1 
##@@59
##@@55
		when 55 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Cislo kupnej zmluvy" 
		  let ag[3].text = "Poradove cislo polozky KZ" 
		  let ag[4].text = "Stav poziadavky" 
		  let ag[5].text = "Status generovania VP" 
		  let ag[6].text = "Stav potvrdenia terminov" 
		  let ag[7].text = "Predaj ziada novy termin" 
		  let ag[8].text = "Id kupnej zmluvy" 
		  let ag[9].text = "Id polozky kupnej zmluvy" 
		  let ag[10].text = "Cislo vyrobneho prikazu" 
		  let ag[11].text = "ID vyrobneho prikazu" 
		  let ag[12].text = "Termin pozadovaneho ukoncenia vyroby" 
		  let ag[13].text = "Termin prognozovaneho ukoncenia vyroby" 
		  let ag[14].text = "Nazof firmy" 
		  let ag[15].text = "Informacia o poznamkach predajcu" 
		  let ag[16].text = "Cislo sortimentu" 
		  let ag[17].text = "Nazov sortimentu" 
		  let ag[18].text = "Celkove mnozstvo v MJ" 
		  let ag[19].text = "Merna jednotka" 
		  let ag[20].text = "Cislo referencneho vzoru" 
		  let ag[21].text = "Kod zmeny" 
		  let ag[22].text = "Datum poziadavky" 
		  let ag[23].text = "Cac poziadavky" 
		  let ag[24].text = "Id pozadoval" 
		  let ag[25].text = "Pozadoval-priezvisko" 
		  let ag[26].text = "Pozadoval-meno" 
		  let ag[27].text = "Datum prognozovania" 
		  let ag[28].text = "Cas prognozovania" 
		  let ag[29].text = "ID prognozoval" 
		  let ag[30].text = "Prognozoval-priezvisko" 
		  let ag[31].text = "Prognozoval-meno" 
		  let ag[32].text = "Datum potvrdenia" 
		  let ag[33].text = "Cas potvrdenia" 
		  let ag[34].text = "Id potvrdil" 
		  let ag[35].text = "Potvrdil-priezvisko" 
		  let ag[36].text = "Potvrdil-meno" 
		  let ag[37].text = "Datup poziadavky storna" 
		  let ag[38].text = "Cas poziadavky storna" 
		  let ag[39].text = "Id pozadoval storno" 
		  let ag[40].text = "Potvrdil-priezvisko" 
		  let ag[41].text = "Potvrdil-meno" 
		  let ag[42].text = "Datum uplynutia casu na potvrdenie" 
		  let ag[43].text = "Cas uplynutia casu na prognozovanie" 
		  let ag[44].text = "Datum akceptacie" 
		  let ag[45].text = "Cas akceptacie" 
		  let ag[46].text = "Id akceptoval" 
		  let ag[47].text = "Potvrdil-priezvisko" 
		  let ag[48].text = "Potvrdil-meno" 
		  let ag[49].text = "kod storna" 
		  let ag[50].text = "Stav prikazu" 
		  let ag[51].text = "Insert do tabulky pl_dostup_zdroja" 
		  let ag[52].text = "Poznamka TPV ku zakazke" 
		  let ag[53].text = "Poznamka programovania vyroby" 
		  let ag[54].text = "Verzia vyrobneho prikazu" 
		  let ag[55].text = "Verzia vyrobneho prikazu -historia" 
		  let ag[56].text = "Termin prognoz.ukoncenia vyroby-system" 
		  let ag[57].text = "Cislo vyrobku" 
		  let ag[58].text = "Cislo podniku" 
		  let ag[59].text = "Cas odoslania na logistiku" 
		  let ag[60].text = "Id odoslal na logistiku" 
		  let ag[61].text = "Odoslal na logistiku-priezvisko" 
		  let ag[62].text = "Odoslal na logistiku-meno" 
		  let ag[63].text = "Kod vyvoja VZS" 
		  let ag[64].text = "Typ vynimky" 
		  let ag[65].text = "Popis typu vynimky" 
		  let ag[66].text = "Pozadovany termin vynimky" 
		  let ag[67].text = "Termin vypocitany z dodacich podmienok" 
		  let ag[68].text = "Prognozovany termin natlacku" 
		  let ag[69].text = "Priznak druhu tlace" 
		  let ag[70].text = "Cas suhlasu tpv so sirkami" 
		  let ag[71].text = "Suhlasil so sirkami" 
		  let ag[72].text = "Suhlasil so sirkami-priezvisko" 
		  let ag[73].text = "Suhlasil so sirkami-meno" 
		  let ag[74].text = "Dtex vlakna" 
		  let ag[75].text = "Velkost obuvi" 
		  let ag[76].text = "Dtex/velkost" 
		  let ag[77].text = "Farba" 
		  let ag[78].text = "Meno vzoru obuvi" 
		  let ag[79].text = "Nazov melirky" 
		  let ag[80].text = "Nazov melirky/meno vzoru" 
		  let ag[81].text = "Nazov vyrobku" 
		  let ag[82].text = "Smer zakrut" 
		  let ag[83].text = "Id KZ vlakna" 
		  let ag[84].text = "Id polozky KZ vlakna" 
		  let ag[85].text = "Id vptab" 
		  let ag[86].text = "Cislo podniku" 
		  let ag[87].text = "Cislo finalneho podniku" 
		  let ag[88].text = "Cislo finalneho sortimentu" 
		  let ag[89].text = "Varianta materialova" 
		  let ag[90].text = "Gramaz finalna" 
		  let ag[91].text = "Hrubka finalna" 
		  let ag[92].text = "Jemnost finalna" 
		  let ag[93].text = "Id typ zdruzovania" 
		  let ag[94].text = "Pocet fibril finalny" 
		  let ag[95].text = "Id smeru zakrutu" 
		  let ag[96].text = "Skaci zakrut" 
		  let ag[97].text = "Id farby" 
		  let ag[98].text = "Id profilu vlakna" 
		  let ag[99].text = "Variant vyroby" 
		  let ag[100].text = "Cas urcenia variantu" 
		  let ag[101].text = "Id urcil variant" 
		  let ag[102].text = "Suhlasil so sirkami-priezvisko" 
		  let ag[103].text = "Suhlasil so sirkami-meno" 
		  let yi = 103 
		  let pocet = 103 
		  let zacstr = 1 
##@@55
##@@58
		when 58 
		  let ag[1].text = "Podnik" 
		  let ag[2].text = "Oddelenie" 
		  let ag[3].text = "Nazov strediska" 
		  let ag[4].text = "Id stroja" 
		  let ag[5].text = "Cislo stroja" 
		  let ag[6].text = "Nazov stroja" 
		  let yi = 6 
		  let pocet = 6 
		  let zacstr = 1 
##@@58
##@@57
		when 57 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Cislo podniku" 
		  let ag[3].text = "Cislo oddelenia" 
		  let ag[4].text = "Nazov oddelenia" 
		  let ag[5].text = "Platnost" 
		  let ag[6].text = "Cas zmeny" 
		  let ag[7].text = "Id zmenil" 
		  let ag[8].text = "Zmenil" 
		  let yi = 8 
		  let pocet = 8 
		  let zacstr = 1 
##@@57
##@@56
		when 56 
		  let ag[1].text = "Cislo kupnej zmluvy" 
		  let ag[2].text = "Poradove cislo KZ" 
		  let ag[3].text = "Cislo vyrobneho prikazu" 
		  let ag[4].text = "Termin zavaz.uk.vyroby" 
		  let ag[5].text = "Mnozstvo finalne v KG" 
		  let ag[6].text = "Nazov motivu" 
		  let ag[7].text = "Skrateny nazov firmy" 
		  let ag[8].text = "Mnozstvo planovane 172" 
		  let ag[9].text = "Mnozstvo vyrobene 172" 
		  let yi = 9 
		  let pocet = 9 
		  let zacstr = 1 
##@@56
##@@44
		when 44 
		  let ag[1].text = "Cislo vyrobneho prikazu" 
		  let ag[2].text = "Cislo kupnej zmluvy" 
		  let ag[3].text = "Poradove cislo KZ" 
		  let ag[4].text = "Nazov firmy" 
		  let ag[5].text = "Cis.oddel.vyrabajuceho" 
		  let ag[6].text = "Cisoper" 
		  let ag[7].text = "Interny termin zac.vyroby" 
		  let ag[8].text = "suma zdrojov" 
		  let ag[9].text = "Mnozstvo v kg" 
		  let ag[10].text = "Cislo stroja v DP" 
		  let ag[11].text = "Poradie v DP" 
		  let ag[12].text = "Termin zaciatku v DP" 
		  let ag[13].text = "Cast poznamky v DP" 
		  let ag[14].text = "Vstupuje polotovar" 
		  let ag[15].text = "Idsh_material" 
		  let ag[16].text = "Id vp polot" 
		  let yi = 16 
		  let pocet = 16 
		  let zacstr = 1 
##@@44
##@@34
		when 34 
		  let ag[1].text = "Typ materialu" 
		  let ag[2].text = "Datum prijmu na sklad" 
		  let ag[3].text = "Stredisko skladujuce" 
		  let ag[4].text = "Mnozstvo kg" 
		  let ag[5].text = "Doba skladovania" 
		  let ag[6].text = "Skutocna sirka" 
		  let yi = 6 
		  let pocet = 6 
		  let zacstr = 1 
##@@34
##@@19
		when 19 
		  let ag[1].text = "Priorita" 
		  let ag[2].text = "Materialova skupina" 
		  let ag[3].text = "Sirka" 
		  let ag[4].text = "Hrubka" 
		  let ag[5].text = "Nazov materialu" 
		  let ag[6].text = "Maximalna doba skladovania na MTZ" 
		  let ag[7].text = "Stav materialu na sklade MTZ" 
		  let ag[8].text = "Material ako zdroje operacii" 
		  let ag[9].text = "Stav materialu na neprij.objednavkach" 
		  let ag[10].text = "Stav materialu na vyrobnych strediskach" 
		  let ag[11].text = "Skratka mernej jednotky" 
		  let ag[12].text = "Cislo podniku" 
		  let ag[13].text = "Cislo skladu" 
		  let ag[14].text = "Evidencne cislo materialu" 
		  let ag[15].text = "Id materialu" 
		  let ag[16].text = "Typ skupiny" 
		  let ag[17].text = "Popis skupiny" 
		  let ag[18].text = "Spracovatelnost" 
		  let ag[19].text = "Maximalna doba skladovania na stredisk." 
		  let yi = 19 
		  let pocet = 19 
		  let zacstr = 1 
##@@19
##@@49
		when 49 
		  let ag[1].text = "Id nad_spol1" 
		  let ag[2].text = "Oddelenie" 
		  let ag[3].text = "Poradadove cislo top firmy" 
		  let ag[4].text = "Skrateny nazov top firmy" 
		  let ag[5].text = "Id pl_kalendar_obdobi" 
		  let ag[6].text = "Obdobie rezervacie" 
		  let ag[7].text = "Rezervovana kapacita (dd hh:mm)" 
		  let ag[8].text = "Rezervovane percento" 
		  let ag[9].text = "Disponibilna kapacita (dd hh:mm)" 
		  let ag[10].text = "Slubena napln (dd hh:mm)" 
		  let ag[11].text = "Doteraz vyrobene (dd hh:mm)" 
		  let ag[12].text = "Predstih vyrobeny (dd hh:mm)" 
		  let ag[13].text = "Sklz (dd hh:mm)" 
		  let ag[14].text = "Zaciatok obdobia" 
		  let ag[15].text = "Koniec obdobia" 
		  let ag[16].text = "Idpo_stroje" 
		  let yi = 16 
		  let pocet = 16 
		  let zacstr = 1 
##@@49
##@@26
		when 26 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Cislo podniku" 
		  let ag[3].text = "Rezerva periody v %" 
		  let ag[4].text = "Pocet vyvazovanych period" 
		  let ag[5].text = "Pocet prehladavanych period" 
		  let ag[6].text = "Rezervacia zapnuta" 
		  let yi = 6 
		  let pocet = 6 
		  let zacstr = 1 
##@@26
##@@52
		when 52 
		  let ag[1].text = "Datum prijmu na sklad" 
		  let ag[2].text = "Stav mater.na zac.mesiaca" 
		  let ag[3].text = "Blokovane mnozstvo" 
		  let ag[4].text = "Doba skladovania" 
		  let yi = 4 
		  let pocet = 4 
		  let zacstr = 1 
##@@52
##@@05
		when 5 
		  let ag[1].text = "Id kap.kalendara" 
		  let ag[2].text = "Nazov stroja" 
		  let ag[3].text = "Id po_stroje" 
		  let ag[4].text = "Cislo podniku" 
		  let ag[5].text = "Cislo strediska" 
		  let ag[6].text = "Cislo stroja" 
		  let ag[7].text = "Zaciatok useku" 
		  let ag[8].text = "Koniec useku" 
		  let ag[9].text = "Kod useku" 
		  let ag[10].text = "Den v tyzdni" 
		  let ag[11].text = "Dlzka useku" 
		  let ag[12].text = "Smennost" 
		  let ag[13].text = "Popis smennosti" 
		  let ag[14].text = "Id zmenil" 
		  let ag[15].text = "Priezvisko" 
		  let ag[16].text = "Meno" 
		  let ag[17].text = "Cas a datum zmeny" 
		  let ag[18].text = "Prestavka" 
		  let yi = 18 
		  let pocet = 18 
		  let zacstr = 1 
##@@05
##@@53
		when 53 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Cislo podniku" 
		  let ag[3].text = "Obdobie" 
		  let ag[4].text = "Id top firmy" 
		  let ag[5].text = "Datum platnosti" 
		  let ag[6].text = "Cislo sortimentu finalne" 
		  let ag[7].text = "Cislo oddelenie tlace" 
		  let ag[8].text = "Planovane finalne mnozstvo v kg" 
		  let ag[9].text = "Priemerna gramaz" 
		  let ag[10].text = "Priemerna sirka produkcie" 
		  let ag[11].text = "Priemerna zakazka" 
		  let ag[12].text = "Priemerny pocet valcov" 
		  let ag[13].text = "Priemerne percento vyrabanych valcov" 
		  let ag[14].text = "Normohodiny tlac" 
		  let ag[15].text = "Normohodiny vyroby valcov" 
		  let ag[16].text = "Id zmenil" 
		  let ag[17].text = "Zmenil" 
		  let ag[18].text = "Cas poslednej zmeny" 
		  let yi = 18 
		  let pocet = 18 
		  let zacstr = 1 
##@@53
##@@54
		when 54 
		  let ag[1].text = "Obdobie" 
		  let ag[2].text = "Priemerna gramaz" 
		  let ag[3].text = "Priemerna sirka produkcie" 
		  let ag[4].text = "Priemerna zakazka" 
		  let ag[5].text = "Priemerny pocet valcov" 
		  let ag[6].text = "Priemerne percento vyrabanych valcov" 
		  let ag[7].text = "Planovane finalne mnozstvo v kg" 
		  let ag[8].text = "Planovane tlacene mnozstvo v Nhod" 
		  let yi = 8 
		  let pocet = 8 
		  let zacstr = 1 
##@@54
##@@42
		when 42 
		  let ag[1].text = "Cislo vyrob.prikazu" 
		  let ag[2].text = "Stlpec tecnolog.postupu" 
		  let ag[3].text = "Riadok tecnolog.postupu" 
		  let ag[4].text = "Cisoper" 
		  let ag[5].text = "Cis.oddel.vyrabajuceho" 
		  let ag[6].text = "Nazov odoberajucej firmy" 
		  let ag[7].text = "Sidlo firmy" 
		  let ag[8].text = "Nazov motivu" 
		  let ag[9].text = "Cislo stroja" 
		  let ag[10].text = "Nazov stroja" 
		  let ag[11].text = "Poradie" 
		  let ag[12].text = "Nazov sortimentu" 
		  let ag[13].text = "Mnozstvo v kg" 
		  let ag[14].text = "Nhod" 
		  let ag[15].text = "Cas odchylky operacie" 
		  let ag[16].text = "Cis.oddel.predchadzajuceho" 
		  let ag[17].text = "Cas odchylky -predch.operacia" 
		  let yi = 17 
		  let pocet = 17 
		  let zacstr = 1 
##@@42
##@@51
		when 51 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Preferovany druh tlace" 
		  let ag[3].text = "Porad.cislo firmy" 
		  let ag[4].text = "Skrateny nazov firmy" 
		  let ag[5].text = "Nazof firmy" 
		  let ag[6].text = "Sidlo firmy" 
		  let yi = 6 
		  let pocet = 6 
		  let zacstr = 1 
##@@51
##@@50
		when 50 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Cislo podniku" 
		  let ag[3].text = "Cislo oddelenia" 
		  let ag[4].text = "Id po_stroje skupina" 
		  let ag[5].text = "Cislo stroja -skupiny" 
		  let ag[6].text = "Nazov stroja -skupiny" 
		  let ag[7].text = "Id po_stroje" 
		  let ag[8].text = "Cislo stroja" 
		  let ag[9].text = "Nazov stroja" 
		  let ag[10].text = "Platnost" 
		  let ag[11].text = "Cas zmeny" 
		  let ag[12].text = "Id zmenil" 
		  let ag[13].text = "Priezvisko" 
		  let ag[14].text = "Meno" 
		  let yi = 14 
		  let pocet = 14 
		  let zacstr = 1 
##@@50
##@@47
		when 47 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Cislo podniku" 
		  let ag[3].text = "Obdobie" 
		  let ag[4].text = "Zaciatok obdobia" 
		  let ag[5].text = "Koniec obdobia" 
		  let ag[6].text = "Rezervovane" 
		  let ag[7].text = "Cas uzavretia" 
		  let ag[8].text = "Iduzavrel" 
		  let ag[9].text = "Priezvisko" 
		  let ag[10].text = "Meno" 
		  let yi = 10 
		  let pocet = 10 
		  let zacstr = 1 
##@@47
##@@48
		when 48 
		  let ag[1].text = "Cislo stroja" 
		  let ag[2].text = "Nazov stroja" 
		  let ag[3].text = "Celkova rezervovana kapacita (dd hh:mm)" 
		  let ag[4].text = "Celkova rezervovana kapacita (percento)" 
		  let ag[5].text = "Planovana napln (dd hh:mm)" 
		  let ag[6].text = "Volna rezervovana kapacita (dd hh:mm)" 
		  let ag[7].text = "Volna rezervovana kapacita (percento)" 
		  let ag[8].text = "Disponibilna kapacita (dd hh:mm)" 
		  let yi = 8 
		  let pocet = 8 
		  let zacstr = 1 
##@@48
##@@45
		when 45 
		  let ag[1].text = "Cislo podniku" 
		  let ag[2].text = "Oddelenie" 
		  let ag[3].text = "Divizia" 
		  let ag[4].text = "Nazov strediska" 
		  let yi = 4 
		  let pocet = 4 
		  let zacstr = 1 
##@@45
##@@43
		when 43 
		  let ag[1].text = "Rok" 
		  let ag[2].text = "Tyzden" 
		  let ag[3].text = "Perioda" 
		  let ag[4].text = "Cislo oddelenia vyrabajuce" 
		  let ag[5].text = "1/10 kapacity oddelenia" 
		  let ag[6].text = "Napln vynimky" 
		  let yi = 6 
		  let pocet = 6 
		  let zacstr = 1 
##@@43
##@@27
		when 27 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Podnik" 
		  let ag[3].text = "Cislo KZ" 
		  let ag[4].text = "Poradove cislo polozky KZ" 
		  let ag[5].text = "Kod storna" 
		  let ag[6].text = "Druh vynimky" 
		  let ag[7].text = "Typ vynimky" 
		  let ag[8].text = "Cislo predajcu" 
		  let ag[9].text = "Stav vynimky" 
		  let ag[10].text = "Dovod" 
		  let ag[11].text = "Pozadovany termin ZUV" 
		  let ag[12].text = "Nazof firmy" 
		  let ag[13].text = "Nazov motivu" 
		  let ag[14].text = "Popis sortimentu" 
		  let ag[15].text = "Mnozstvo KG" 
		  let ag[16].text = "Pozadoval" 
		  let ag[17].text = "Id vytvoril" 
		  let ag[18].text = "Cas vytvorenia" 
		  let ag[19].text = "Priezvisko - vytvoril" 
		  let ag[20].text = "Meno - vytvoril" 
		  let ag[21].text = "Id schvalil" 
		  let ag[22].text = "Cas schvalenia" 
		  let ag[23].text = "Priezvisko - schvalil" 
		  let ag[24].text = "Meno - schvalil" 
		  let ag[25].text = "Id stornoval" 
		  let ag[26].text = "Cas storna" 
		  let ag[27].text = "Priezvisko - stornoval" 
		  let ag[28].text = "Meno - stornoval" 
		  let ag[29].text = "Id polozky KZ" 
		  let ag[30].text = "Id forsirovanej KZ" 
		  let ag[31].text = "Druh zakaziek" 
		  let ag[32].text = "Id pl_vynimka" 
		  let ag[33].text = "Cislo vyrobneho prikazu" 
		  let ag[34].text = "Stav vyrobneho prikazu" 
		  let yi = 34 
		  let pocet = 34 
		  let zacstr = 1 
##@@27
##@@08
		when 8 
		  let ag[1].text = "Id firmy" 
		  let ag[2].text = "Podnik" 
		  let ag[3].text = "Poradove cislo firmy" 
		  let ag[4].text = "skrateny nazov firmy" 
		  let ag[5].text = "Nazof firmy" 
		  let ag[6].text = "Sidlo firmy" 
		  let ag[7].text = "Ico" 
		  let ag[8].text = "Cislo predajcu" 
		  let ag[9].text = "Pocet dodacich podmienok" 
		  let yi = 9 
		  let pocet = 9 
		  let zacstr = 1 
##@@08
##@@40
		when 40 
		  let ag[1].text = "Podnik" 
		  let ag[2].text = "Poradove cislo firmy" 
		  let ag[3].text = "Nazof firmy" 
		  let ag[4].text = "Sidlo firmy" 
		  let ag[5].text = "Ico" 
		  let ag[6].text = "Cislo pred.skupiny" 
		  let ag[7].text = "Pocet podmienok" 
		  let ag[8].text = "Zaciatok platnosti" 
		  let yi = 8 
		  let pocet = 8 
		  let zacstr = 1 
##@@40
##@@41
		when 41 
		  let ag[1].text = "Cislo predajcu" 
		  let ag[2].text = "Titul" 
		  let ag[3].text = "Meno" 
		  let ag[4].text = "Priezvisko" 
		  let ag[5].text = "Popis" 
		  let yi = 5 
		  let pocet = 5 
		  let zacstr = 1 
##@@41
##@@07
		when 7 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Cislo podniku" 
		  let ag[3].text = "Cislo predajcovskej skupiny" 
		  let ag[4].text = "Poradove cislo firmy" 
		  let ag[5].text = "Id firmy" 
		  let ag[6].text = "Skrateny nazov firmy" 
		  let ag[7].text = "Koncern" 
		  let ag[8].text = "Nazof firmy" 
		  let ag[9].text = "Sidlo firmy" 
		  let ag[10].text = "Ico" 
		  let ag[11].text = "Id kodu zakazky" 
		  let ag[12].text = "Kod zakazky" 
		  let ag[13].text = "Popis zakazky" 
		  let ag[14].text = "Id skupiny tovaru" 
		  let ag[15].text = "Skup.tovarov" 
		  let ag[16].text = "Id startovacieho datumu" 
		  let ag[17].text = "Startovaci datum" 
		  let ag[18].text = "Ramcova KZ" 
		  let ag[19].text = "Dni dodania" 
		  let ag[20].text = "Platnost" 
		  let ag[21].text = "Cas poslednej zmeny" 
		  let ag[22].text = "Id pouzivatela posledenej zmeny" 
		  let ag[23].text = "Priezvisko" 
		  let ag[24].text = "Meno" 
		  let yi = 24 
		  let pocet = 24 
		  let zacstr = 1 
##@@07
##@@39
		when 39 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Id pl_skupinatovaru" 
		  let ag[3].text = "Popis skupiny tovarov" 
		  let ag[4].text = "Kod vyrobku" 
		  let ag[5].text = "Nazov tovaru" 
		  let yi = 5 
		  let pocet = 5 
		  let zacstr = 1 
##@@39
##@@38
		when 38 
		  let ag[1].text = "Kod tovaru" 
		  let ag[2].text = "Nazov tovaru" 
		  let yi = 2 
		  let pocet = 2 
		  let zacstr = 1 
##@@38
##@@37
		when 37 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Popis skupiny tovarov" 
		  let yi = 2 
		  let pocet = 2 
		  let zacstr = 1 
##@@37
##@@35
		when 35 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Popis startovacieho datumu" 
		  let ag[3].text = "Databaza" 
		  let ag[4].text = "Tabulka" 
		  let ag[5].text = "Stlpec" 
		  let yi = 5 
		  let pocet = 5 
		  let zacstr = 1 
##@@35
##@@10
		when 10 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Kod zakazky" 
		  let ag[3].text = "Popis zakazky" 
		  let yi = 3 
		  let pocet = 3 
		  let zacstr = 1 
##@@10
##@@36
		when 36 
		  let ag[1].text = "Cislo oddelenia vyrabajuceho" 
		  let ag[2].text = "Cislo operacie v oddeleni" 
		  let ag[3].text = "Rok periody -kde operacia zacina" 
		  let ag[4].text = "Tyzden periody -kde operacia zacina" 
		  let ag[5].text = "Perioda -kde operacia zacina" 
		  let ag[6].text = "Zaciatok operacie" 
		  let ag[7].text = "Koniec operacie" 
		  let ag[8].text = "Tyzden periody -kde operacia konci" 
		  let ag[9].text = "Perioda -kde operacia konci" 
		  let ag[10].text = "Normohodiny operacie" 
		  let yi = 10 
		  let pocet = 10 
		  let zacstr = 1 
##@@36
##@@12
		when 12 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Cislo podniku" 
		  let ag[3].text = "Cislo oddelenia" 
		  let ag[4].text = "Cislo sortimentu" 
		  let ag[5].text = "Nazov sortimentu" 
		  let ag[6].text = "Cislo technologie" 
		  let ag[7].text = "Nazov technologie" 
		  let ag[8].text = "Id zlozenia technologie" 
		  let ag[9].text = "Poradie operacie" 
		  let ag[10].text = "Nazov operacie" 
		  let ag[11].text = "Poradove cislo vyrobku" 
		  let ag[12].text = "Cislo referencneho vzoru" 
		  let ag[13].text = "Kod zmeny referenc.vzoru" 
		  let ag[14].text = "Nazov motivu" 
		  let ag[15].text = "Cislo stroja" 
		  let ag[16].text = "Nazov stroja" 
		  let ag[17].text = "Id stroja" 
		  let ag[18].text = "Priorita stroja" 
		  let ag[19].text = "Cas zmeny" 
		  let ag[20].text = "Priezvisko" 
		  let ag[21].text = "Meno" 
		  let ag[22].text = "Id person zmenil" 
		  let yi = 22 
		  let pocet = 22 
		  let zacstr = 1 
##@@12
##@@32
		when 32 
		  let ag[1].text = "Cislo sortim.vyrabaneho" 
		  let ag[2].text = "Nazov sortimentu" 
		  let ag[3].text = "Hrubka" 
		  let ag[4].text = "Sirka" 
		  let ag[5].text = "Cis.oddel.odoberajuceho" 
		  let ag[6].text = "Je v dennych planoch" 
		  let ag[7].text = "Stav prognozovania" 
		  let ag[8].text = "Ukoncenie GFP prac" 
		  let ag[9].text = "Mnozstvo v kg" 
		  let yi = 9 
		  let pocet = 9 
		  let zacstr = 1 
##@@32
##@@20
		when 20 
		  let ag[1].text = "Externe cislo DKZ" 
		  let ag[2].text = "Cislo zasobovaca" 
		  let ag[3].text = "Datum vystavenia objednavky" 
		  let ag[4].text = "Potvrdene mnozstvo objednavky" 
		  let ag[5].text = "Dodane mnozstvo" 
		  let ag[6].text = "Poradove cislo poziadavky" 
		  let ag[7].text = "Termin potvrdenej dodavky" 
		  let ag[8].text = "Ziadane mnozstvo" 
		  let ag[9].text = "Cislo ziadatela" 
		  let ag[10].text = "Nazov firmy" 
		  let ag[11].text = "Interne cislo" 
		  let ag[12].text = "Sposob dopravy" 
		  let ag[13].text = "Stav DKZ" 
		  let ag[14].text = "Cas poslednej zmeny" 
		  let ag[15].text = "Poznamka ziadatela" 
		  let yi = 15 
		  let pocet = 15 
		  let zacstr = 1 
##@@20
##@@30
		when 30 
		  let ag[1].text = "Cislo kupnej zmluvy" 
		  let ag[2].text = "Poradove cislo KZ" 
		  let ag[3].text = "Termin pozadovaneho ukonc.vyroby" 
		  let ag[4].text = "Nazov motivu" 
		  let ag[5].text = "Pocet valcov" 
		  let ag[6].text = "Sirka produkcie" 
		  let ag[7].text = "Cislo sortimentu" 
		  let ag[8].text = "Nazov sortimentu" 
		  let ag[9].text = "Hrubka" 
		  let ag[10].text = "Plosna hmotnost" 
		  let ag[11].text = "Mnozstvo KG" 
		  let ag[12].text = "Nazov firmy" 
		  let ag[13].text = "Cislo referencneho vzoru" 
		  let ag[14].text = "Kod zmeny referenc.vzoru" 
		  let yi = 14 
		  let pocet = 14 
		  let zacstr = 1 
##@@30
##@@31
		when 31 
		  let ag[1].text = "Poradove cislo farby" 
		  let ag[2].text = "Strana" 
		  let ag[3].text = "Lak" 
		  let ag[4].text = "Priznak novej farby" 
		  let ag[5].text = "Farba" 
		  let ag[6].text = "Panton" 
		  let ag[7].text = "Krytie" 
		  let ag[8].text = "Kod zakladnej farby" 
		  let ag[9].text = "Raster" 
		  let ag[10].text = "FTP technol.:digit -film" 
		  let ag[11].text = "FTP vyroba: plocho - kruh" 
		  let ag[12].text = "Pocet nahradnych ref.vzorov" 
		  let ag[13].text = "Cislo referencneho vzoru" 
		  let yi = 13 
		  let pocet = 13 
		  let zacstr = 1 
##@@31
##@@25
		when 25 
		  let ag[1].text = "Cpv" 
		  let ag[2].text = "Cov" 
		  let ag[3].text = "Rok_zac" 
		  let ag[4].text = "Tyzden_zac" 
		  let ag[5].text = "Perioda" 
		  let ag[6].text = "Verzia" 
		  let ag[7].text = "Cislo stroja" 
		  let ag[8].text = "Idpo_stroje" 
		  let ag[9].text = "Nazov stroja" 
		  let ag[10].text = "Poradie" 
		  let ag[11].text = "Cislo_vp" 
		  let ag[12].text = "Stl" 
		  let ag[13].text = "Riad" 
		  let ag[14].text = "Cisoper" 
		  let ag[15].text = "Zaciatok planovany" 
		  let ag[16].text = "Zaciatok planovany" 
		  let ag[17].text = "Koniec planovany" 
		  let ag[18].text = "Nazov motivu" 
		  let ag[19].text = "Sortiment" 
		  let ag[20].text = "Cislo sortim.vyrabaneho" 
		  let ag[21].text = "Nazov sortimentu" 
		  let ag[22].text = "Nhod" 
		  let ag[23].text = "Pocet potlacovych valcov" 
		  let ag[24].text = "Vzor" 
		  let ag[25].text = "Nhod_prip_plan" 
		  let ag[26].text = "Nhod_beh_plan" 
		  let ag[27].text = "Mnoz_kg_plan" 
		  let ag[28].text = "Mnoz_mj_plan" 
		  let ag[29].text = "Mj" 
		  let ag[30].text = "Mnozstvo v kg" 
		  let yi = 30 
		  let pocet = 30 
		  let zacstr = 1 
##@@25
##@@29
		when 29 
		  let ag[1].text = "Id harm" 
		  let ag[2].text = "Id stroj" 
		  let ag[3].text = "Cislo stroja" 
		  let ag[4].text = "Nazov stroja" 
		  let ag[5].text = "Kapacita stroja (Dni Hod:Min)" 
		  let ag[6].text = "Napln stroja (Dni Hod:Min)" 
		  let ag[7].text = "Napln stroja v percentach" 
		  let ag[8].text = "Pocet zakaziek" 
		  let yi = 8 
		  let pocet = 8 
		  let zacstr = 1 
##@@29
##@@28
		when 28 
		  let ag[1].text = "Rok zaciatku periody" 
		  let ag[2].text = "Tyzden zaciatku periody" 
		  let ag[3].text = "Perioda" 
		  let ag[4].text = "Zaciatok periody" 
		  let ag[5].text = "Koniec periody" 
		  let ag[6].text = "Oddelenie" 
		  let ag[7].text = "Pocet aktivnych strojov na oddeleni" 
		  let ag[8].text = "Celkova kapacita na odd. (Dni Hod:Min)" 
		  let ag[9].text = "Napln v dnoch na odd. (Dni Hod:Min)" 
		  let ag[10].text = "Napln na odd. na 1 stroj (Dni Hod:Min)" 
		  let ag[11].text = "Napln na oddeleni v %" 
		  let ag[12].text = "Id harm" 
		  let yi = 12 
		  let pocet = 12 
		  let zacstr = 1 
##@@28
##@@23
		when 23 
		  let ag[1].text = "Perioda" 
		  let ag[2].text = "Den zaciatku - v tyzdni" 
		  let ag[3].text = "Cas zaciatku" 
		  let ag[4].text = "Dlzka periody (Hod)" 
		  let ag[5].text = "Posun zaciatku voci zaciatku tyzdna" 
		  let ag[6].text = "Posun konca voci zaciatku tyzdna" 
		  let yi = 6 
		  let pocet = 6 
		  let zacstr = 1 
##@@23
##@@24
		when 24 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Kod pracovnej ulohy" 
		  let ag[3].text = "Popis pracovnej ulohy" 
		  let yi = 3 
		  let pocet = 3 
		  let zacstr = 1 
##@@24
##@@22
		when 22 
		  let ag[1].text = "cislo odd. odoberajuceho" 
		  let yi = 1 
		  let pocet = 1 
		  let zacstr = 1 
##@@22
##@@21
		when 21 
		  let ag[1].text = "Cislo podniku" 
		  let ag[2].text = "Cislo skladu" 
		  let ag[3].text = "Evidencne cislo materialu" 
		  let ag[4].text = "Nazov materialu" 
		  let ag[5].text = "Hrubka materialu" 
		  let ag[6].text = "Sirka materialu" 
		  let ag[7].text = "Cislo kalkulacnej polozky" 
		  let ag[8].text = "Poradie nahraditelnosti" 
		  let ag[9].text = "Cislo sort.normotvorneho" 
		  let yi = 9 
		  let pocet = 9 
		  let zacstr = 1 
##@@21
##@@17
		when 17 
		  let ag[1].text = "Cislo strediska" 
		  let ag[2].text = "Cislo sortimentu" 
		  let ag[3].text = "Nazov sortimentu" 
		  let yi = 3 
		  let pocet = 3 
		  let zacstr = 1 
##@@17
##@@15
		when 15 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Kod polozky" 
		  let ag[3].text = "Popis polozky" 
		  let yi = 3 
		  let pocet = 3 
		  let zacstr = 1 
##@@15
##@@16
		when 16 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Kod zdroja" 
		  let ag[3].text = "Popis zdroja" 
		  let yi = 3 
		  let pocet = 3 
		  let zacstr = 1 
##@@16
##@@13
		when 13 
		  let ag[1].text = "Poradove cislo vyrobku" 
		  let ag[2].text = "Cislo referencneho vzoru" 
		  let ag[3].text = "Kod zmeny referenc.vzoru" 
		  let ag[4].text = "Cislo platneho sortimentu" 
		  let ag[5].text = "Nazov motivu" 
		  let ag[6].text = "Obvod valca" 
		  let ag[7].text = "Pocet farieb" 
		  let yi = 7 
		  let pocet = 7 
		  let zacstr = 1 
##@@13
##@@11
		when 11 
		  let ag[1].text = "Id smennost" 
		  let ag[2].text = "Popis smennosti" 
		  let yi = 2 
		  let pocet = 2 
		  let zacstr = 1 
##@@11
##@@09
		when 9 
		  let ag[1].text = "Id disponibility" 
		  let ag[2].text = "Id kap.kalendara" 
		  let ag[3].text = "Cas zaciatku" 
		  let ag[4].text = "Cas konca" 
		  let yi = 4 
		  let pocet = 4 
		  let zacstr = 1 
##@@09
##@@06
		when 6 
		  let ag[1].text = "Id den v tyzdni" 
		  let ag[2].text = "Den v tyzdni" 
		  let yi = 2 
		  let pocet = 2 
		  let zacstr = 1 
##@@06
##@@04
		when 4 
		  let ag[1].text = "Id stroja" 
		  let ag[2].text = "Cislo podniku" 
		  let ag[3].text = "Stredisko vyrabajuce" 
		  let ag[4].text = "Cislo stroja" 
		  let ag[5].text = "Nazov stroja" 
		  let ag[6].text = "Kod stroja" 
		  let ag[7].text = "Cstroj Ippo" 
		  let ag[8].text = "Kod SS" 
		  let yi = 8 
		  let pocet = 8 
		  let zacstr = 1 
##@@04
##@@33
		when 33 
		  let ag[1].text = "Id" 
		  let ag[2].text = "Cislo podniku" 
		  let ag[3].text = "Cislo technologie" 
		  let ag[4].text = "Poradie operacie" 
		  let ag[5].text = "Cislo technolog.operacie" 
		  let ag[6].text = "Nazov operacie" 
		  let ag[7].text = "Nazov technologie" 
		  let yi = 7 
		  let pocet = 7 
		  let zacstr = 1 
##@@33
#@@024
end case
call opw931()
let a = true
input  by name z
	before input
		let pcur = 1
		let scur = 1
		call pocitadlo163()
		call browse163()

	after field z
		if z is not null then
			display "" to z
                        if z >= "0" and z <= "9" then
			if   citpol1(z) then
				if  rel >0 and rel <= yi then
					let zacstr = 1
					let pcur = rel
					let scur = 1
					call pocitadlo163()
					call browse163()
				else
					error  "V danom smere niesu dalsie polozky"
				end if
			end if
				let z = null
                        else
				let z = null
				error ""
			end if
		end if

	on key ("up")
		if pcur > 1 then
			display ag[pcur].* to sc[scur].* 
			let pcur = pcur - 1
			call pocitadlo163()
			if scur > 1 then
				let scur = scur - 1
				display ag[pcur].* to sc[scur].* 
					attribute(reverse)
			else
				call browse163()
			end if
		else
			error "Si na prvom riadku!"
		end if
	on key ("down")
		if pcur < yi then
			display ag[pcur].* to sc[scur].* 
			let pcur = pcur + 1
			call pocitadlo163()
			if scur < maxsc then
				let scur = scur + 1
				display ag[pcur].* to sc[scur].* 
					attribute(reverse)
			else
				call browse163()
			end if
		else
			error "V danom smere nieje viac riadkov!"
		end if
	on key(F8)
			if ag[pcur].zost is null or ag[pcur].zost <> "X" then
				let ag[pcur].zost = "X"
			else
				let ag[pcur].zost = ""
			end if
			display ag[pcur].* to sc[scur].*
				attribute(reverse)
	on key(F7)
		if ag[pcur].cis is null then
		let o = o + 1
		let ag[pcur].cis = o
		display ag[pcur].* to sc[scur].*
			attribute(reverse)
		let pom1 = zacstr + pcur - 1
		if o = 1 then
			if ag[pcur].zost = "X" then
let txtord = txtord clipped," ",pom1 using "<<<"," desc"
			else
let txtord = txtord clipped," ",pom1 using "<<<"
			end if
		else
			if ag[pcur].zost = "X" then
let txtord = txtord clipped,",",pom1 using "<<<"," desc"
			else
let txtord = txtord clipped,",",pom1 using "<<<"
			end if
		end if
		continue input
		else
			error "Uz je oznac.!"
		end if
	on key(F5,esc)
		#if potvrd("Naozaj chces skoncit?[a/n]:") then
			let a = false
			exit input
		#end if
	on key(f11)
		if   citpol() then
			if rel > 0 and rel <= yi then
				let pcur = rel
				let scur = 1
				call pocitadlo163()
				call browse163()
			else
				error  "V danom smere niesu dalsie polozky"
			end if
		end if
end input
close window win06_00
close window win06a_00
if o = 0 then
	let a = false
end if
let txtord = " "
if a then
for i = 1 to o
	for j = 1 to yi
	if ag[j].cis = i then
		if i = 1 then
			if ag[j].zost = "X" then
let txtord = " order by ",j using "<<<"," desc"
			else
let txtord = " order by ",j using "<<<"
			end if
		else
			if ag[j].zost = "X" then
let txtord = txtord clipped,",",j using "<<<"," desc"
			else
let txtord = txtord clipped,",",j using "<<<"
			end if
		end if
		exit for
	end if
	end for
end for
end if
return a,txtord
end function

####modul 40 vyber v tlaciarnach


---otvorenie kurzora pre nacitanie tlaciarni
#################
function pripre7()
###################
define a char
let a = false
let pocet66 = 0
whenever error continue
PREPARE prikpoc FROM otazpoce 
declare  kur4 cursor  for prikpoc
open  kur4 
fetch kur4 into pocet66
close kur4
free kur4
#free prikpoc
whenever error stop
whenever error continue
PREPARE prik7e FROM otaze 
whenever error stop
if sqlca.sqlcode <> 0 then
    let txt2 =  "Nemozem vytvorit podmienkovy prikaz"
else
	declare kurz7e   cursor for prik7e
	call opkur7e() returning a
	if not a then
	    #free prik7e
	    let txt2 =  "Nemozem otvorit kurzor"
	end if
end if
return a
end function

---otvorenie kurzora pre tlaciarne
#####################
function opkur7e()
#####################
define  try,a char
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
 open kurz7e
whenever error stop
call uspech(false) returning st
case st
   when NOTFOUND
    #let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     let a = true
    let try = false
   when 1
    let txt2 = " Tabulka je uzamknuta."
     call potvrd("Tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
return a
end function

---vyber tlaciarni
###################
function vybtleps()
###################
define pcech char
let maxhl66 = 20
let maxsc66 = 13
initialize prazd166.* to null
let is_vybmj66 = false
call vyber87e()
return is_vybmj66
end function
##################
function vyber87e()
#################
        call sprava2("Cakaj,pracujem!")
	if list87e() then
		let txt1 =  "Bola vybrana tlaciaren:" ,ag66[pcur66].porc using "<<" clipped," ",ag66[pcur66].nazov clipped
	else 
		let txt1 = "Nebola vybrana ziadna tlaciaren."
	end if
end function


---otvorenie okna pre listovanie v tlaciarnach
################
function opw2087e()
################
define pomtxt1 char(20)
define ii int
open window win07a_00 at 3,38 with 20 rows,42 columns
call fgl_drawbox(20,42,1,1)
let pomtxt1 = ppsubsyst clipped,"main07_00"
let ii =  41 -  length(pomtxt1)
display pomtxt1 clipped at 1,ii attribute(cyan,reverse) 
open window win07_00 at 4,39 with 18 rows,40 columns
    attribute(
             form line first,
            prompt line last - 2,
            message line last - 2,
            comment line last - 1
           )

open form forma2087e from 
			"main07_00"
display form forma2087e
display "  -Potvrd   -Prerus   -PgDn   -PgUp" at 18,2
display "F2" at 18,2 attribute(reverse)
display "F5" at 18,12 attribute(reverse)
display "F3" at 18,22 attribute(reverse)
display "F4" at 18,30 attribute(reverse)
end function

---brows v tlaciarnach
####################
function browse87e()
####################
define zac,i,j,kon1  integer
let  zac  = pcur66 - scur66 + 1
if  zac + maxsc66 -1  > yi66 then 
	let kon1 =  yi66 - zac + 1
else
	let kon1 =  maxsc66
end if
for i = 1 to kon1
           let j = zac + i - 1
   if i != scur66 then
	display ag66[j].* to sc[i].* 
   else
	display ag66[j].* to sc[i].* 
            attribute (reverse)
   end if
end for
let kon1 = kon1 + 1
for i = kon1 to maxsc66
   if i != scur66 then
       display prazd166.* to sc[i].*
   else
       display prazd166.* to sc[i].*
           attribute(reverse)
   end if
end for
end function

---pocitadlo v listovani v tlaciarnach
#########################
function pocit87e()
#########################
define porad,isa integer,
        text char(30),
        poctex char(10)
if pocet66 <> 0 then
	let porad = zacstr66 + pcur66 -1
else
	let porad = 0
        
end if
let poctex = pocet66
let text = porad,"/",poctex
display text at 1,25
let isa = zacstr66 + yi66 - 1 
#display zacstr66 using "&&&&&"  ," ",isa using "&&&&&" at 1,30
end function

---naplnenie pola tlaciarni
#############
function napln87e()
#############
define a,b,stat char
let stat = true
let a = false
while stat  and yi66 < maxhl66
     let yi66 = yi66 + 1
    call vyb887e(yi66) returning stat
    if  not  stat then
        let yi66 = yi66 - 1
       if  yi66 <= 0 then 
		let a = false
	else
		let a = true
       end if
   else
    if yi66 >= maxhl66  then
       let a = true
       exit while
     end if
end if
end while
return a
end function

---listovanie v tlaciarnach
################
function list87e()
################
define   a,bc char
let yi66 = 0
let pocet66 = 0
let zacstr66 = 1
let is_vybmj66 = false
let otaz2e = "SELECT porc,nazov  from tpv:tlaciarne "
let otazpoce = "SELECT count(*)  from tpv:tlaciarne "
let otaze = otaz2e clipped  ," order by 1 " clipped

if pripre7() then
	let yi66 = 0
	if napln87e() then
                close window pracujem
		call opw2087e()
		call cit_list87e() 
		close window win07_00
		close window win07a_00
		whenever error continue
		close kurz7e
		free kurz7e
		#free prik7e
		whenever error stop
	else 
		close window pracujem
	end if
else
	close window pracujem
end if
return is_vybmj66
end function


---fetch polozky tlaciarne
#####################
function vyb887e(i)
#####################
define i integer, 
       try,a char
let a = false
let try = true
while try
let txt2 = ""
	whenever error continue
		fetch next kurz7e
			into
				ag66[i].porc ,
				ag66[i].nazov
	whenever error stop
	call uspech(false) returning st
	case st
	   when NOTFOUND
	       #let txt2 = " Polozka nebola najdena."
	       let a = false
	       let try = false
	   when -1
	       let a = false
	       let try = false
	   when 0
	        let a = true
	        let try = false
	   when 1
	     let txt2 = " Tabulka je uzamknuta."
	     call potvrd("Tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
	end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
return a
end function
---listovanie  v tlaciarnach
#####################
function cit_list87e()
#####################
define z,bc char,
       maxhl661 integer
input  by name z
	before input
		let pcur66 = 1
		let scur66 = 1
		call pocit87e()
		call browse87e()

	after field z
		if z is not null then
			display "" to z
                        if z >= "0" and z <= "9" then
			if   citpol1(z) then
				if  rel >0 and rel <= yi66 then
					let zacstr66 = 1
					let pcur66 = rel
					let scur66 = 1
					call pocit87e()
					call browse87e()
				else
					error  "V danom smere niesu dalsie polozky"
				end if
			end if
				let z = null
                        else
				let z = null
				error ""
			end if
		end if

	on key ("up")
		if pcur66 > 1 then
			display ag66[pcur66].* to sc[scur66].* 
			let pcur66 = pcur66 - 1
			call pocit87e()
			if scur66 > 1 then
				let scur66 = scur66 - 1
				display ag66[pcur66].* to sc[scur66].* 
					attribute(reverse)
			else
				call browse87e()
			end if
		else
			error "Si na prvom riadku!"
		end if
	on key ("down")
		if pcur66 < yi66 then
			display ag66[pcur66].* to sc[scur66].* 
			let pcur66 = pcur66 + 1
			call pocit87e()
			if scur66 < maxsc66 then
				let scur66 = scur66 + 1
				display ag66[pcur66].* to sc[scur66].* 
					attribute(reverse)
			else
				call browse87e()
			end if
		else
			error "V danom smere nieje viac riadkov!"
		end if
	on key(F4)
		if pcur66 - maxsc66 - scur66 + 1 > 0 then
			let pcur66 = pcur66 - maxsc66 - scur66 + 1 
			let scur66 = 1
			call pocit87e()
			call browse87e()
		else
			error "Si na prvom riadku!"
			let pcur66 = 1
			let scur66 = 1
			call pocit87e()
			call browse87e()
		end if
	on key(F3)
		if pcur66 - scur66 + 1 + maxsc66 <= yi66 then
			let pcur66 = pcur66 - scur66 + 1 + maxsc66
			let scur66 = 1
			call pocit87e()
			call browse87e()
		else
			error "V danom smere nieje viac riadkov!"
		end if
	on key(F5,esc)
		#if potvrd("Naozaj chces skoncit?[a/n]:") then
			let is_vybmj66 = false
			exit input
		#end if
	on key(f11)
		if   citpol() then
			if rel > 0 and rel <= yi66 then
				let pcur66 = rel
				let scur66 = 1
				call pocit87e()
				call browse87e()
			else
				error  "V danom smere niesu dalsie polozky"
			end if
		end if
	on key("accept")
			if   ansiterm(ag66[pcur66].porc) then
				let is_vybmj66 = true
			else
				let txt2 = "Chybna tabulka tlaciarni!"
				let is_vybmj66 = false
			end if
			exit input
end input
end function

#######################
function set_gdatplat()
#######################
define sql_ok char

let sql_ok=true

whenever error continue
select platnost.platnost,platnost.platnost2
into gdatplat,gobdplat
from kalkul:platnost platnost
where platnost.pod = gpodnik and
	platnost.porc = ( select max(uu.porc)
			from kalkul:platnost uu
			where uu.pod = gpodnik )
whenever error stop
if sqlca.sqlcode<0 then
	let sql_ok=false
	error "Nemozem pokracovat pre sql chybu: ",
		sqlca.sqlcode using "-<<<<&"
end if

if sqlca.sqlcode=100 then
	let sql_ok=false
	error "Neviem zistit platnost sortimentu."
end if

return sql_ok
end function

######################
function set_gpodnik()
######################
define sql_ok char

let sql_ok=true

let gpodnik = 0
whenever error continue
select 
	kkk.pod
into 
	gpodnik
from satuziv:podpristup kkk
where 
	kkk.projekt = pprojekt and
	kkk.skupina = pskupina 
whenever error stop
		
if sqlca.sqlcode <> 0 then
	prompt "Zadaj podnik:" for gpodnik
	whenever error continue
	select kkk.pod
	into gpodnik
	from satuziv:podpristup kkk
	where kkk.projekt = pprojekt
		and kkk.skupina = pskupina 
		and kkk.pod = gpodnik 
	whenever error stop
	if sqlca.sqlcode <> 0 then
		error "Pre tento podnik nemas pristup!"
		sleep 4
		let sql_ok=false
		---exit program(0)
	end if
end if

return sql_ok
end function

####################
function is_boolean(l_expr)
####################
define l_expr char
if l_expr=1 or l_expr=0 then
	return true
else
	return false
end if
end function

######################
function get_zam_num(l_login)
######################
define sql_ok char
define l_zam_num char(100) --like sysadm:users.osc
define l_login char(100) --like sysadm:users.user_id

let sql_ok=true

whenever error continue
select osc into l_zam_num
from sysadm:users
where user_id=l_login
whenever error stop
if sqlca.sqlcode<0 then
	let txt1="Polozka nebola vybrana pre SQL chybu:",
	sqlca.sqlcode using "-<<<<<&"
	let sql_ok=false
else
	if sqlca.sqlcode=100 then
		let txt1="Zamestnanec s loginom ",l_login," neexistuje."
		let sql_ok=false
	end if
end if
if l_login="lubos" or l_login="tpv" then
	let l_zam_num=366391
end if

return sql_ok, l_zam_num
end function

##########################
function switch_user()
##########################
define l_login char(10)
define l_puziv char(10)
define l_pskupina smallint
define l_is_ok char

let l_is_ok=true
let l_puziv=puziv
let l_pskupina=pskupina

open window w_user at 10,20 with 1 rows, 30 columns
	attribute(border)

while true

prompt "Zadaj uzivatela : " for l_login
	on key(esc,f5)
		let l_is_ok=false
		exit while
end prompt

if l_login is null then
	continue while
else
	select cc.uzivname,dd.skupina into puziv,pskupina 
	from satuziv:uzivatel cc, satuziv:projskupina dd
	---where cc.username = user
	where cc.username = l_login	---user
	and dd.uzivname = cc.uzivname
	and dd.projekt = "tpv"

	if sqlca.sqlcode <> 0 then
		let txt1 = "Neviem zistit prava pre chybu : ",
			sqlca.sqlcode using "-<<<<&"
		error txt1
		if potvrd1("Zadat login znova? (a/n) ") then
			continue while
		else
			let puziv=l_puziv
			let pskupina=l_pskupina
			let l_is_ok = false
			exit while
		end if
	else
                let l_loginp=l_login
		let l_is_ok=true
		exit while
	end if
	#error puziv," - ",pskupina
end if

end while

close window w_user

return l_is_ok
end function
#########################
function vrat_ascii(znak)
#########################
define znak char
define hodnota smallint
case znak
	when "A" let hodnota = 65 
	when "B" let hodnota = 66 
	when "C" let hodnota = 67 
	when "D" let hodnota = 68 
	when "E" let hodnota = 69
	when "F" let hodnota = 70 
	when "G" let hodnota = 71 
	when "H" let hodnota = 72 
	when "I" let hodnota = 73 
	when "J" let hodnota = 74 
	when "K" let hodnota = 75 
	when "L" let hodnota = 76 
	when "M" let hodnota = 77 
	when "N" let hodnota = 78 
	when "O" let hodnota = 79 
	when "P" let hodnota = 80 
	when "Q" let hodnota = 81 
	when "R" let hodnota = 82 
	when "S" let hodnota = 83 
	when "T" let hodnota = 84 
	when "U" let hodnota = 85 
	when "V" let hodnota = 86 
	when "W" let hodnota = 87 
	when "X" let hodnota = 88 
	when "Y" let hodnota = 89 
	when "Z" let hodnota = 90 
end case
return hodnota
end function


----vrati filter podla jedneho stlpca
#####################
function dajfilter(retazec,zret,doret)
#####################
define retazec,pomret char(1500)
define zret char(500)
define doret char(500)
define i,k1,k2,j,a smallint
define dlz,retdlz smallint

let retdlz =  length( retazec ) 

let k1 = 0
let k2 = 0
if retdlz >= 1500 then
		error "Retazec bude useknuty!"
		sleep(5)
end if 

let dlz =  length( zret ) 
for i = 1 to retdlz
	let j = i + dlz -1
	if j > retdlz then
		exit for 
	end if
	
	if retazec[i,j] = zret and k1 = 0 then
		let k1 = i
		let i = i + dlz - 1
		let dlz =  length( doret ) 
		continue for
    end if
	if retazec[i,j] = doret and k1 > 0 then
		let k2 = i - 1 
		exit for
    end if
end for
if k1 > 0 and k2 <= 0 then
	--ak sa nenasiel nasledujuci stlpec 
	---tak plati do konca retazca,je to posledny stlpec
	let k2 = retdlz
end if
if k2 >= k1 and k1 > 0 and k2 > 0 then
	let pomret = retazec[k1,k2]
else
	let pomret = ""
end if

if (pomret matches '*AND' or  pomret matches '*and' ) and pomret <> 'and' and pomret <> 'AND'  then
		let dlz = length(pomret)
		let dlz = dlz - 3 
		let pomret = pomret[1,dlz]
end if
return pomret

end function

----zrus filter podla jedneho stlpca  doret je nasledujuci stlpec
#####################
function zrusfilter(retazec,zret,doret)
#####################
define retazec,pomret char(1500)
define zret char(500)
define doret char(500)
define i,k1,k2,j,a smallint
define dlz,retdlz smallint

let retdlz =  length( retazec ) 

let k1 = 0
let k2 = 0
if retdlz >= 1500 then
		error "Retazec bude useknuty!"
		sleep(5)
end if 

let dlz =  length( zret ) 
for i = 1 to retdlz
	let j = i + dlz -1
	if j > retdlz then
		exit for 
	end if
	
	if retazec[i,j] = zret and k1 = 0 then
		let k1 = i
		let i = i + dlz - 1
		let dlz =  length( doret ) 
		continue for
    end if
	if retazec[i,j] = doret and k1 > 0 then
		let k2 = i - 1 
		exit for
    end if
end for
if k1 > 0 and k2 <= 0 then
	--ak sa nenasiel nasledujuci stlpec 
	---tak plati do konca retazca,je to posledny stlpec
	let k2 = retdlz
end if

if k2 >= k1 and k1 > 0 and k2 > 0  then
	if k2 < retdlz  then
			-- nieje to dokonca retazca
			if k1 > 1 then
					let pomret = retazec[1,k1 -1 ],retazec[k2+ 1,retdlz]
			else
					let pomret = retazec[k2+ 1,retdlz]
			end if
	else
		---je to dokonca retazca
			if k1 > 1 then
					let pomret = retazec[1,k1 -1 ]
			else
					let pomret =  ''
			end if
	end if
else
	let pomret = retazec
end if
return pomret

end function
----nahradenie matches retazca na ascii velky
########################################################################
function convert__construct_podmienka(l_input)
########################################################################
define l_input record
         retazec char(500),
         stlpec char(200)
       end record
define back record
         retazec char(500)
       end record

open window o1 at 22,78 with form "f_construct"
    attribute    (
                form line first,
        prompt line last - 2,
        message line last - 2,
        comment line last - 2
        )
construct back.retazec on
            testtabulka.policko
          from 
            policko
 
before construct
  display l_input.retazec to policko
  exit construct

end construct
       
close window o1

call substretazec(back.retazec,'testtabulka.policko',l_input.stlpec) returning back.retazec

return back.*
end function

