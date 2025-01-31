database tpv2
globals "main_00.4gl"
--globals "package/sat_00.4gl"
--globals "glob.4gl"


define plan record --m
    cislo_vp  like v_prikazy.cislo_vp,
    ckz like  v_prikazy.ckz,
    porc like  v_prikazy.porc,
    por_vp like  v_prikazy.por_vp,
    datplat like  v_prikazy.datplat ,
    podv like  v_prikazy.podv ,
    fin_stred like  v_prikazy.fin_stred ,
    csort like  v_prikazy.csort ,
    nazsort like  v_prikazy.nazsort ,
    novecsv like  v_prikazy.novecsv ,
    techn like  v_prikazy.techn ,
    vzor like  v_prikazy.vzor ,
    gram like  v_prikazy.gram ,
    gramvyp like  v_prikazy.gramvyp ,
    gramskut like  v_prikazy.gramskut ,
    mikron like  v_prikazy.mikron ,
    ---
    pocf like  v_prikazy.pocf ,
    sek_raport like  v_prikazy.sek ,
    sirka like  v_prikazy.sirka ,
    dlzka like  v_prikazy.dlzka ,
    hlbka like  v_prikazy.hlbka ,
    spodzalozka like  v_prikazy.spodzalozka ,
    vrchnazalozka like  v_prikazy.vrchnazalozka ,
    chlopna like  v_prikazy.chlopna ,
    perforaciadna like  v_prikazy.perforaciadna ,
    vzduchotvory like  v_prikazy.vzduchotvory ,
    typplochzvaru like  v_prikazy.typplochzvaru ,
    typchlopne like  v_prikazy.typchlopne ,
    ---
    merkg like  v_prikazy.merkg ,
    merkgvyp like  v_prikazy.merkgvyp ,
    merjed like  v_prikazy.merjed ,
    mj_ks like  v_prikazy.mj_ks ,
    mnozkg like  v_prikazy.mnozkg ,
    mnozks like  v_prikazy.mnozks ,
    mnozmt like  v_prikazy.mnozmt ,
    ---
    mnoz_m2 decimal(11,1) ,
    mnoz_bm decimal(11,1) ,
    mnoz_ks decimal(10,0) ,
    mnoz_obr decimal(12,0) ,
    navin like  v_prikazy.navin,
    stav_prik like  v_prikazy.stav_prik,
    kodsps like  v_prikazy.kodsps,
    ico like  v_prikazy.ico,
    pcrefv like  v_prikazy.pcrefv,
    crefv like  v_prikazy.crefv,
    kodzmen like  v_prikazy.kodzmen,
    nove_prognoz like  v_prikazy.nove_prognoz,
    verzia like  v_prikazy.verzia,
    gram_nanos_susiny dec(10,5),
    d_cislo_vp like  v_prikazy.d_cislo_vp,
    dutinka like  v_prikazy.dutinka,
    ---
    kodval like v_p_motiv.kodval,
    navfinal like v_p_motiv.navfinal,
    navtlac like v_p_motiv.navtlac,
    rozpsp like v_p_motiv.rozpsp,
    sirprod like v_p_motiv.sirprod,
    okraj like v_p_motiv.okraj,
    monobv like v_p_motiv.monobv,
    monved like v_p_motiv.monved,
    obvodval like v_p_motiv.obvodval,
    tlac1 like v_p_motiv.tlac1,
    vrch like v_p_motiv.vrch,
    umiest like v_p_motiv.umiest,
    zmrst like v_p_motiv.zmrst,
    hrubkaftp like v_p_motiv.hrubkaftp,
    sleev_kj like v_p_motiv.sleev_kj,
    kompresleev like v_p_motiv.kompresleev,
    typftp like v_p_motiv.typftp,
    percskrat like v_p_motiv.percskrat,
    pocval like v_p_motiv.pocval,
    mobvsada like v_p_motiv.mobvsada,
    mvedsada like v_p_motiv.mvedsada,
    zmens like v_p_motiv.zmens,
    kodfamily like v_p_motiv.kodfamily,
    typlakusz like v_p_motiv.typlakusz,
    pozdlzzahyb like v_p_motiv.pozdlzzahyb,
    celoplosnatlac like v_p_motiv.celoplosnatlac,
    is_presnyraport like v_p_motiv.is_presnyraport,
    napocraportov like v_p_motiv.napocraportov,
    nammraport like v_p_motiv.nammraport,
    raportminus like v_p_motiv.raportminus,
    raportplus like v_p_motiv.raportplus,
    unikod like v_p_motiv.unikod,
    esa like v_p_motiv.esa,
    nova_grafika like v_prikazy.nova_grafika,
    stav_archivu char(1),
    natlacokdat date,
    zac_per_vyr_natlac datetime year to minute,
    kon_per_vyr_natlac datetime year to minute,
    idnad_spol1 like pl_rezerv_kapacita.idnad_spol1,
    laseruprava like v_prikazy.laseruprava,
    zadstrlava like v_prikazy.zadstrlava, --zadna lava strana vrecka
    zadstrprava like v_prikazy.zadstrprava --zadna prava strana vrecka
end record

--define postupy array[50] of record --pole postupov
define postupy dynamic array of record
    id	 	 like  vp_polot.id ,
    cislo_vp 	 like  vp_polot.cislo_vp ,
    por_polot 	 like  vp_polot.por_polot ,
    datplat 	 like  vp_polot.datplat ,
    podv 	 like  vp_polot.podv ,
    kodss 	 char(3), --like  vp_polot.kodss ,
    csf 	 like  vp_polot.csf ,
    coo 	 like  vp_polot.coo ,
    cso 	 like  vp_polot.cso ,
    cov 	 like  vp_polot.cov ,
    csv 	 like  vp_polot.csv ,
    stlo 	 like  vp_polot.stlo ,
    riado 	 like  vp_polot.riado ,
    cisopero 	 like  vp_polot.cisopero ,
    stl 	 like  vp_polot.stl ,
    riad 	 like  vp_polot.riad ,
    cisoper 	 like  vp_polot.cisoper ,
    gram 	 like  vp_polot.gram ,
    mikron 	 like  vp_polot.mikron ,
    sirka 	 like  vp_polot.sirka ,
    sirka_vst 	 like  vp_polot.sirka_vst ,
    mnoz_kg_vyst 	 like  vp_polot.mnoz_kg_vyst ,
    mnoz_bm_vyst 	 like  vp_polot.mnoz_bm_vyst ,
    mnoz_ks_vyst 	 like  vp_polot.mnoz_ks_vyst ,
    mnoz_m2_vyst 	 like  vp_polot.mnoz_m2_vyst ,
    mnoz_kg_beh 	 like  vp_polot.mnoz_kg_beh ,
    mnoz_bm_beh 	 like  vp_polot.mnoz_bm_beh ,
    mnoz_ks_beh 	 like  vp_polot.mnoz_ks_beh ,
    mnoz_kg_vst 	 like  vp_polot.mnoz_kg_vst ,
    mnoz_bm_vst 	 like  vp_polot.mnoz_bm_vst ,
    mnoz_ks_vst 	 like  vp_polot.mnoz_ks_vst ,
    mnoz_m2_vst 	 like  vp_polot.mnoz_m2_vst ,
    casmont 	 like  vp_polot.casmont ,
    caszabeh 	 like  vp_polot.caszabeh ,
    casmies 	 like  vp_polot.casmies ,
    casdemont 	 like  vp_polot.casdemont ,
    cascisten 	 like  vp_polot.cascisten ,
    casbeh 	 like  vp_polot.casbeh ,
    ctv like	  vp_polot.ctv,
    cto like	  vp_polot.cto,
    koef like	  vp_polot.koef,
    obj_kg like	  vp_polot.obj_kg,
    obj_sirka like  vp_polot.obj_sirka,
    novecsv like v_prikazy.novecsv,
    techn like v_prikazy.techn,
    vzor like v_prikazy.vzor,
    ctoper like  vp_polot.ctoper,
    vyrkg decimal(10,2),
    vyrbm decimal(10,2),
    vyrks decimal(10,2),
    datukvyr date,
    ---
    kod_oper like  pl_oper.kod_oper,
    max_term_mat date,
    caszrenia integer,
    max_kon_rok like pl_harmpolozka.max_kon_rok,
    max_kon_tyz like pl_harmpolozka.max_kon_tyz,
    max_kon_per like pl_harmpolozka.max_kon_per,
    max_kon_cas like pl_harmpolozka.max_kon_cas,
    --------------po tade je vyber z DB
    min_zac_rok like pl_harmpolozka.max_kon_rok,
    min_zac_tyz like pl_harmpolozka.max_kon_tyz,
    min_zac_per like pl_harmpolozka.max_kon_per,
    min_zac_cas like pl_harmpolozka.max_kon_cas,
    min_zac_cas_hr like pl_harmpolozka.max_kon_cas_hr,
    max_kon_cas_hr like pl_harmpolozka.max_kon_cas_hr,
    cas_prip_plan like pl_prac_uloha.cas_prip_plan,
    cas_prip_plan_i like pl_prac_uloha.cas_prip_plan_i,
    cas_beh_plan like pl_prac_uloha.cas_beh_plan,
    cas_beh_plan_i like pl_prac_uloha.cas_beh_plan_i,
    cas_plan like pl_prac_uloha.cas_prip_plan,
    cas_plan_i like pl_prac_uloha.cas_prip_plan_i,
    --cas_skut like pl_prac_uloha.cas_prip_plan_i,
    cas_skut like pl_prac_uloha.cas_prip_plan,
    cas_skut_i like pl_prac_uloha.cas_prip_plan_i,
    cas_beh_skut like pl_prac_uloha.cas_beh_plan,
    cas_beh_skut_i like pl_prac_uloha.cas_beh_plan_i,
    cas_prip_skut like pl_prac_uloha.cas_prip_plan,
    cas_prip_skut_i like pl_prac_uloha.cas_prip_plan_i,
    --cas_zost like pl_prac_uloha.cas_prip_plan_i,
    cas_zost like pl_prac_uloha.cas_prip_plan,
    cas_zost_i like pl_prac_uloha.cas_prip_plan_i,
    cas_beh_zost like pl_prac_uloha.cas_beh_plan,
    cas_beh_zost_i like pl_prac_uloha.cas_beh_plan_i,
    cas_prip_zost like pl_prac_uloha.cas_prip_plan,
    cas_prip_zost_i like pl_prac_uloha.cas_prip_plan_i,
    celk_cas integer,
    poc_per_oper smallint,
    k_stroj smallint
end record
{ 
define postupy_prazd record --inicializacna veta
    id	 	 like  vp_polot.id ,
    cislo_vp 	 like  vp_polot.cislo_vp ,
    por_polot 	 like  vp_polot.por_polot ,
    datplat 	 like  vp_polot.datplat ,
    podv 	 like  vp_polot.podv ,
    kodss 	 char(3), --like  vp_polot.kodss ,
    csf 	 like  vp_polot.csf ,
    coo 	 like  vp_polot.coo ,
    cso 	 like  vp_polot.cso ,
    cov 	 like  vp_polot.cov ,
    csv 	 like  vp_polot.csv ,
    stlo 	 like  vp_polot.stlo ,
    riado 	 like  vp_polot.riado ,
    cisopero 	 like  vp_polot.cisopero ,
    stl 	 like  vp_polot.stl ,
    riad 	 like  vp_polot.riad ,
    cisoper 	 like  vp_polot.cisoper ,
    gram 	 like  vp_polot.gram ,
    mikron 	 like  vp_polot.mikron ,
    sirka 	 like  vp_polot.sirka ,
    sirka_vst 	 like  vp_polot.sirka_vst ,
    mnoz_kg_vyst 	 like  vp_polot.mnoz_kg_vyst ,
    mnoz_bm_vyst 	 like  vp_polot.mnoz_bm_vyst ,
    mnoz_ks_vyst 	 like  vp_polot.mnoz_ks_vyst ,
    mnoz_m2_vyst 	 like  vp_polot.mnoz_m2_vyst ,
    mnoz_kg_beh 	 like  vp_polot.mnoz_kg_beh ,
    mnoz_bm_beh 	 like  vp_polot.mnoz_bm_beh ,
    mnoz_ks_beh 	 like  vp_polot.mnoz_ks_beh ,
    mnoz_kg_vst 	 like  vp_polot.mnoz_kg_vst ,
    mnoz_bm_vst 	 like  vp_polot.mnoz_bm_vst ,
    mnoz_ks_vst 	 like  vp_polot.mnoz_ks_vst ,
    mnoz_m2_vst 	 like  vp_polot.mnoz_m2_vst ,
    casmont 	 like  vp_polot.casmont ,
    caszabeh 	 like  vp_polot.caszabeh ,
    casmies 	 like  vp_polot.casmies ,
    casdemont 	 like  vp_polot.casdemont ,
    cascisten 	 like  pl_mtechpost.cascisten ,
    casbeh 	 like  vp_polot.casbeh ,
    ctv like	  vp_polot.ctv,
    cto like	  vp_polot.cto,
    koef like	  vp_polot.koef,
    obj_kg like	  vp_polot.obj_kg,
    obj_sirka like  vp_polot.obj_sirka,
    novecsv like v_prikazy.novecsv,
    techn like v_prikazy.techn,
    vzor like v_prikazy.vzor,
    ctoper like  vp_polot.ctoper,
    vyrkg like polot2:ht_vpvyr.vyrkg,
    vyrbm like polot2:ht_vpvyr.vyrbm,
    vyrks like polot2:ht_vpvyr.vyrks,
    datukvyr like polot2:ht_vpvyr.datukvyr,
    ---
    kod_oper like  pl_oper.kod_oper,
    max_term_mat date,
    caszrenia integer,
    max_kon_rok like pl_harmpolozka.max_kon_rok,
    max_kon_tyz like pl_harmpolozka.max_kon_tyz,
    max_kon_per like pl_harmpolozka.max_kon_per,
    max_kon_cas like pl_harmpolozka.max_kon_cas,
    --------------po tade je vyber z DB
    min_zac_rok like pl_harmpolozka.max_kon_rok,
    min_zac_tyz like pl_harmpolozka.max_kon_tyz,
    min_zac_per like pl_harmpolozka.max_kon_per,
    min_zac_cas like pl_harmpolozka.max_kon_cas,
    min_zac_cas_hr like pl_harmpolozka.max_kon_cas_hr,
    max_kon_cas_hr like pl_harmpolozka.max_kon_cas_hr,
    cas_prip_plan like pl_prac_uloha.cas_prip_plan,
    cas_prip_plan_i like pl_prac_uloha.cas_prip_plan_i,
    cas_beh_plan like pl_prac_uloha.cas_beh_plan,
    cas_beh_plan_i like pl_prac_uloha.cas_beh_plan_i,
    cas_plan like pl_prac_uloha.cas_prip_plan,
    cas_plan_i like pl_prac_uloha.cas_prip_plan_i,
    cas_skut like pl_prac_uloha.cas_prip_plan_i,
    cas_skut_i like pl_prac_uloha.cas_prip_plan_i,
    cas_beh_skut like pl_prac_uloha.cas_beh_plan,
    cas_beh_skut_i like pl_prac_uloha.cas_beh_plan_i,
    cas_prip_skut like pl_prac_uloha.cas_prip_plan,
    cas_prip_skut_i like pl_prac_uloha.cas_prip_plan_i,
    cas_zost like pl_prac_uloha.cas_prip_plan_i,
    cas_zost_i like pl_prac_uloha.cas_prip_plan_i,
    cas_beh_zost like pl_prac_uloha.cas_beh_plan,
    cas_beh_zost_i like pl_prac_uloha.cas_beh_plan_i,
    cas_prip_zost like pl_prac_uloha.cas_prip_plan,
    cas_prip_zost_i like pl_prac_uloha.cas_prip_plan_i,
    celk_cas integer,
    poc_per_oper smallint,
    k_stroj smallint
end record
} 

define ppolozka record --veta novej polozky
    id smallint,
    cpv like pl_harm.cpv,
    cov like pl_harm.cov,
    rok_zac like pl_harm.rok_zac,
    tyzden_zac like pl_harm.tyzden_zac,
    perioda like pl_harm.perioda,
    verzia like pl_harm.verzia,
    platnost like pl_harm.platnost,
    zac_periody like pl_harm.zac_periody,
    kon_periody like pl_harm.kon_periody,
    stav like pl_harm.stav,
    -----------------
    idpl_sledpolozka like pl_harmpolozka.idpl_sledpolozka,
    idpo_stroje like pl_harmpolozka.idpo_stroje,
    poradie like pl_harmpolozka.poradie,
    zac_plan like pl_harmpolozka.zac_plan,
    kon_plan like pl_harmpolozka.kon_plan,
    min_zac_rok like pl_harmpolozka.min_zac_rok,
    min_zac_tyz like pl_harmpolozka.min_zac_tyz,
    min_zac_per like pl_harmpolozka.min_zac_per,
    min_zac_cas like pl_harmpolozka.min_zac_cas,
    max_kon_rok like pl_harmpolozka.max_kon_rok,
    max_kon_tyz like pl_harmpolozka.max_kon_tyz,
    max_kon_per like pl_harmpolozka.max_kon_per,
    max_kon_cas like pl_harmpolozka.max_kon_cas,
    min_zac_cas_hr like pl_harmpolozka.min_zac_cas_hr,
    max_kon_cas_hr like pl_harmpolozka.max_kon_cas_hr,
    cas_prace_plan like pl_harmpolozka.cas_prace_plan,  
    -----------------
    idpl_typprac_ulohy like pl_prac_uloha.idpl_typprac_ulohy,
    idpl_subeh like pl_prac_uloha.idpl_subeh,
    idvp_polot like pl_prac_uloha.idvp_polot,
    cislo_vp like pl_prac_uloha.cislo_vp,
    stl like pl_prac_uloha.stl,
    riad like pl_prac_uloha.riad,
    cisoper like pl_prac_uloha.cisoper,
    stlo like pl_prac_uloha.stlo,
    riado like pl_prac_uloha.riado,
    cisopero like pl_prac_uloha.cisopero,
    mnoz_kg_plan like pl_prac_uloha.mnoz_kg_plan,
    mnoz_mj_plan like pl_prac_uloha.mnoz_mj_plan,
    mj like pl_prac_uloha.mj,
    cas_prip_plan like pl_prac_uloha.cas_prip_plan,
    cas_beh_plan like pl_prac_uloha.cas_beh_plan,
    cas_prip_plan_i like pl_prac_uloha.cas_prip_plan_i,
    cas_beh_plan_i like pl_prac_uloha.cas_beh_plan_i,
    -----------------
    posun_oper char,
    dlzka_posunu interval hour(3) to minute,
    idpl_harm_posun integer,
    verzia_vp like vp_polot.verzia,
    posun_poradia_presahu char,
    id_presah like pl_harmpolozka.id
end record

--define stroj array[1500,50] of record --pole strojov na operacie
define stroj dynamic array with 2 DIMENSIONS of record --pole strojov na operacie --array of machines
    idpo_stroje like polot2:po_stroje.id,
    cpv like polot2:po_stroje.cp,
    cov like polot2:po_stroje.co,
    cstroj like polot2:po_stroje.cstroj,
    nazstroja like polot2:po_stroje.nazstroja,
    ----------
    zaklvyroba like pl_paramstroj.zaklvyroba,
    tlac like pl_paramstroj.tlac,
    rezanie like pl_paramstroj.rezanie,
    konfekcia like pl_paramstroj.konfekcia,
    kasirovanie like pl_paramstroj.kasirovanie,
    min_vst_sirka like pl_paramstroj.min_vst_sirka,
    max_vst_sirka like pl_paramstroj.max_vst_sirka,
    min_vst_hrubka like pl_paramstroj.min_vst_hrubka,
    max_vst_hrubka like pl_paramstroj.max_vst_hrubka,
    min_vys_sirka like pl_paramstroj.min_vys_sirka,
    max_vys_sirka like pl_paramstroj.max_vys_sirka,
    min_vys_dlzka like pl_paramstroj.min_vys_dlzka,
    max_vys_dlzka like pl_paramstroj.max_vys_dlzka,
    korona_nevodiva like pl_paramstroj.korona_nevodiva,
    korona_vodiva like pl_paramstroj.korona_vodiva,
    korona_umiest like pl_paramstroj.korona_umiest,
    coldseal_pozdlz like pl_paramstroj.coldseal_pozdlz,
    coldseal_umiest like pl_paramstroj.coldseal_umiest,
    unikat_kody like pl_paramstroj.unikat_kody,
    max_pocval like pl_paramstroj.max_pocval,
    min_tl_sirka like pl_paramstroj.min_tl_sirka,
    max_tl_sirka like pl_paramstroj.max_tl_sirka,
    min_obvodval like pl_paramstroj.min_obvodval,
    max_obvodval like pl_paramstroj.max_obvodval,
    presnyraport like pl_paramstroj.presnyraport,
    poc_obracacov like pl_paramstroj.poc_obracacov,
    kratka_vod_draha like pl_paramstroj.kratka_vod_draha,
    esa like pl_paramstroj.esa,
    min_prie_navinu like pl_paramstroj.min_prie_navinu,
    max_prie_navinu like pl_paramstroj.max_prie_navinu,
    min_dutinka like pl_paramstroj.min_dutinka,
    max_dutinka like pl_paramstroj.max_dutinka,
    vzduch_otvory like pl_paramstroj.vzduch_otvory,
    laser_perfor like pl_paramstroj.laser_perfor,
    umiest_pozdl_zlep like pl_paramstroj.umiest_pozdl_zlep,
    ----------
    priorita like pl_pouzistroj.priorita,
    idpo_stroje_skup like pl_skup_stroj.idpo_stroje_skup,
    cstroj_skup like polot2:po_stroje.cstroj,
    pouzitelny char,
    naplneny char, --priznak o naplneni stroja pri vyvazovani
    test_param_text char(80) --hlaska neuspesneho testu parametru stroja
end record

{
define stroj_prazd record --inicializacna veta
    idpo_stroje like polot2:po_stroje.id,
    cpv like polot2:po_stroje.cp,
    cov like polot2:po_stroje.co,
    cstroj like polot2:po_stroje.cstroj,
    nazstroja like polot2:po_stroje.nazstroja,
    ----------
    zaklvyroba like pl_paramstroj.zaklvyroba,
    tlac like pl_paramstroj.tlac,
    rezanie like pl_paramstroj.rezanie,
    konfekcia like pl_paramstroj.konfekcia,
    kasirovanie like pl_paramstroj.kasirovanie,
    min_vst_sirka like pl_paramstroj.min_vst_sirka,
    max_vst_sirka like pl_paramstroj.max_vst_sirka,
    min_vst_hrubka like pl_paramstroj.min_vst_hrubka,
    max_vst_hrubka like pl_paramstroj.max_vst_hrubka,
    min_vys_sirka like pl_paramstroj.min_vys_sirka,
    max_vys_sirka like pl_paramstroj.max_vys_sirka,
    min_vys_dlzka like pl_paramstroj.min_vys_dlzka,
    max_vys_dlzka like pl_paramstroj.max_vys_dlzka,
    korona_nevodiva like pl_paramstroj.korona_nevodiva,
    korona_vodiva like pl_paramstroj.korona_vodiva,
    korona_umiest like pl_paramstroj.korona_umiest,
    coldseal_pozdlz like pl_paramstroj.coldseal_pozdlz,
    coldseal_umiest like pl_paramstroj.coldseal_umiest,
    unikat_kody like pl_paramstroj.unikat_kody,
    max_pocval like pl_paramstroj.max_pocval,
    min_tl_sirka like pl_paramstroj.min_tl_sirka,
    max_tl_sirka like pl_paramstroj.max_tl_sirka,
    min_obvodval like pl_paramstroj.min_obvodval,
    max_obvodval like pl_paramstroj.max_obvodval,
    presnyraport like pl_paramstroj.presnyraport,
    poc_obracacov like pl_paramstroj.poc_obracacov,
    kratka_vod_draha like pl_paramstroj.kratka_vod_draha,
    esa like pl_paramstroj.esa,
    min_prie_navinu like pl_paramstroj.min_prie_navinu,
    max_prie_navinu like pl_paramstroj.max_prie_navinu,
    min_dutinka like pl_paramstroj.min_dutinka,
    max_dutinka like pl_paramstroj.max_dutinka,
    vzduch_otvory like pl_paramstroj.vzduch_otvory,
    laser_perfor like pl_paramstroj.laser_perfor,
    umiest_pozdl_zlep like pl_paramstroj.umiest_pozdl_zlep,
    ----------
    priorita like pl_pouzistroj.priorita,
    idpo_stroje_skup like pl_skup_stroj.idpo_stroje_skup,
    cstroj_skup like polot2:po_stroje.cstroj,
    pouzitelny char,
    naplneny char, --priznak o naplneni stroja pri vyvazovani
    test_param_text char(80) --hlaska neuspesneho testu parametru stroja
end record
}
--define operacie array[150] of record --pole operacii
define operacie dynamic array of record --pole operacii
    id integer,
    cpv smallint,
    cov  smallint,
    rok_zac  smallint,
    tyzden_zac  smallint,
    perioda  smallint,
    zac_periody datetime year to minute,
    kon_periody datetime year to minute,
    idpo_stroje integer,
    poradie smallint,
    zac_plan datetime year to minute,
    kon_plan datetime year to minute,
    min_zac_rok smallint,
    min_zac_tyz smallint,
    min_zac_per smallint,
    min_zac_cas datetime year to minute,
    max_kon_rok smallint,
    max_kon_tyz smallint,
    max_kon_per smallint,
    max_kon_cas datetime year to minute,
    min_zac_cas_hr datetime year to minute,
    max_kon_cas_hr datetime year to minute,
    cas_prace_plan interval hour(3) to minute,
    idvp_polot integer,
    cislo_vp char(8),
    stl smallint,
    riad smallint,
    cisoper smallint,
    stlo smallint,
    riado smallint,
    cisopero smallint,
    mnoz_kg_plan decimal(9,2),
    mnoz_mj_plan decimal(11,1),
    mj char(3),
    cas_prip_plan integer,
    cas_beh_plan integer,
    cas_prip_plan_i interval hour(3) to minute,
    cas_beh_plan_i interval hour(3) to minute,
    posun_oper char,
    dlzka_posunu interval hour(3) to minute,
    idpl_harm_posun integer,
    verzia_vp like vp_polot.verzia,
    posun_poradia_presahu char,
    id_presah like pl_harmpolozka.id
end record
{
define operacie_prazd record --inicializacna veta
    id integer,
    cpv smallint,
    cov  smallint,
    rok_zac  smallint,
    tyzden_zac  smallint,
    perioda  smallint,
    zac_periody datetime year to minute,
    kon_periody datetime year to minute,
    idpo_stroje integer,
    poradie smallint,
    zac_plan datetime year to minute,
    kon_plan datetime year to minute,
    min_zac_rok smallint,
    min_zac_tyz smallint,
    min_zac_per smallint,
    min_zac_cas datetime year to minute,
    max_kon_rok smallint,
    max_kon_tyz smallint,
    max_kon_per smallint,
    max_kon_cas datetime year to minute,
    min_zac_cas_hr datetime year to minute,
    max_kon_cas_hr datetime year to minute,
    cas_prace_plan interval hour(3) to minute,
    idvp_polot integer,
    cislo_vp char(8),
    stl smallint,
    riad smallint,
    cisoper smallint,
    stlo smallint,
    riado smallint,
    cisopero smallint,
    mnoz_kg_plan decimal(9,2),
    mnoz_mj_plan decimal(11,1),
    mj char(3),
    cas_prip_plan integer,
    cas_beh_plan integer,
    cas_prip_plan_i interval hour(3) to minute,
    cas_beh_plan_i interval hour(3) to minute,
    posun_oper char,
    dlzka_posunu interval hour(3) to minute,
    idpl_harm_posun integer,
    verzia_vp like vp_polot.verzia,
    posun_poradia_presahu char,
    id_presah like pl_harmpolozka.id
end record
}
--define ulohy array[150] of record --pole uloh
define ulohy dynamic array of record --pole uloh
   cpv like pl_harm.cpv,
   cov like pl_harm.cov,
   rok_zac like pl_harm.rok_zac,
   tyz_zac like pl_harm.tyzden_zac,
   per_zac like pl_harm.perioda,
   zac_perioda like pl_harm.zac_periody,
   kon_perioda like pl_harm.kon_periody,
   zac_plan like pl_harmpolozka.zac_plan,
   kon_plan like pl_harmpolozka.kon_plan,
   idpo_stroje like pl_harmpolozka.idpo_stroje,
   cas_plan_i like pl_prac_uloha.cas_beh_plan_i,
   idpl_prac_uloha like pl_prac_uloha.id,
   idpl_harmpolozka like pl_harmpolozka.id,
   idpl_sledpolozka like pl_sledpolozka.id,
   idpl_subeh like pl_subeh.id,
   poc_subeh smallint,
   ---
   posun interval hour(3) to minute,
   rok_koniec smallint,
   tyz_koniec smallint,
   per_koniec smallint,
   zac_per_koniec like pl_harm.zac_periody,
   kon_per_koniec like pl_harm.kon_periody
end record
{
define ulohy_prazd record --inicializacna veta
   cpv like pl_harm.cpv,
   cov like pl_harm.cov,
   rok_zac like pl_harm.rok_zac,
   tyz_zac like pl_harm.tyzden_zac,
   per_zac like pl_harm.perioda,
   zac_perioda like pl_harm.zac_periody,
   kon_perioda like pl_harm.kon_periody,
   zac_plan like pl_harmpolozka.zac_plan,
   kon_plan like pl_harmpolozka.kon_plan,
   idpo_stroje like pl_harmpolozka.idpo_stroje,
   cas_plan_i like pl_prac_uloha.cas_beh_plan_i,
   idpl_prac_uloha like pl_prac_uloha.id,
   idpl_harmpolozka like pl_harmpolozka.id,
   idpl_sledpolozka like pl_sledpolozka.id,
   idpl_subeh like pl_subeh.id,
   poc_subeh smallint,
   ---
   posun interval hour(3) to minute,
   rok_koniec smallint,
   tyz_koniec smallint,
   per_koniec smallint,
   zac_per_koniec like pl_harm.zac_periody,
   kon_per_koniec like pl_harm.kon_periody
end record
}
--define odd array[25] of record --pole oddeleni
define odd dynamic array of record --pole oddeleni
   cpv like pl_harm.cpv,
   cov like pl_harm.cov,
   napln_oper interval day(9) to minute,
   poc_strojov smallint, 
   volne_miesto interval hour(4) to minute,
   poc_oper smallint
end record
{
define odd_prazd record --inicializacne pole
   cpv like pl_harm.cpv,
   cov like pl_harm.cov,
   napln_oper interval day(9) to minute,
   poc_strojov smallint, 
   volne_miesto interval hour(4) to minute,
   poc_oper smallint
end record
}
--define oper_preds array[1500] of record --pole operacii do predstihu
define oper_preds dynamic array of record --pole operacii do predstihu
   cpv like pl_harm.cpv,
   cov like pl_harm.cov,
   rok_zac like pl_harm.rok_zac,
   tyz_zac like pl_harm.tyzden_zac,
   per_zac like pl_harm.perioda,
   zac_periody like pl_harm.zac_periody,
   kon_periody like pl_harm.kon_periody,
   id like pl_harmpolozka.id,
   idpl_sledpolozka like pl_harmpolozka.idpl_sledpolozka,
   idpo_stroje like pl_harmpolozka.idpo_stroje,
   zac_plan like pl_harmpolozka.zac_plan,
   kon_plan like pl_harmpolozka.kon_plan,
   min_zac_rok like pl_harmpolozka.min_zac_rok,
   min_zac_tyz like pl_harmpolozka.min_zac_tyz,
   min_zac_per like pl_harmpolozka.min_zac_per,
   min_zac_cas like pl_harmpolozka.min_zac_cas,
   max_kon_rok like pl_harmpolozka.max_kon_rok,
   max_kon_tyz like pl_harmpolozka.max_kon_tyz,
   max_kon_per like pl_harmpolozka.max_kon_per,
   max_kon_cas like pl_harmpolozka.max_kon_cas,
   min_zac_cas_hr like pl_harmpolozka.min_zac_cas_hr,
   max_kon_cas_hr like pl_harmpolozka.max_kon_cas_hr,
   ---
   cas_plan_i like pl_prac_uloha.cas_beh_plan_i,
   cas_skut_i like pl_prac_uloha.cas_beh_plan_i,
   cas_zost_i like pl_prac_uloha.cas_beh_plan_i,
   datplat like vp_polot.datplat,
   cislo_vp like vp_polot.cislo_vp,
   stl like vp_polot.stl,
   riad like vp_polot.riad,
   cisoper like vp_polot.cisoper,
   stlo like vp_polot.stl,
   riado like vp_polot.riad,
   cisopero like vp_polot.cisoper,
   csv like vp_polot.csv,
   ctv like vp_polot.ctv,
   sirka like vp_polot.sirka,
   sirka_vst like vp_polot.sirka_vst,
   mikron like vp_polot.mikron,
   casbeh like vp_polot.casbeh,
   novecsv like v_prikazy.novecsv,
   vyrkg like polot2:ht_vpvyr.vyrkg,
   vyrbm like polot2:ht_vpvyr.vyrbm,
   vyrks like polot2:ht_vpvyr.vyrks,
   datukvyr like polot2:ht_vpvyr.datukvyr,
   mj like pl_prac_uloha.mj,
   mnoz_kg_plan like pl_prac_uloha.mnoz_kg_plan,
   mnoz_mj_plan like pl_prac_uloha.mnoz_mj_plan,
   mnoz_kg_skut like pl_prac_uloha.mnoz_kg_skut,
   mnoz_mj_skut like pl_prac_uloha.mnoz_mj_skut,
   cas_prip_plan_i like pl_prac_uloha.cas_prip_plan_i,
   cas_beh_plan_i like pl_prac_uloha.cas_beh_plan_i,
   poc_stroj smallint,
   presunuta char, --priznak, ci je operacia uz presunuta
   ---
   posun interval hour(3) to minute,
   rok_koniec smallint,
   tyz_koniec smallint,
   per_koniec smallint,
   zac_per_koniec like pl_harm.zac_periody,
   kon_per_koniec like pl_harm.kon_periody,
   kod_tech like technologie.kod_tech,
   casdemont like vp_polot.casdemont,
   cascisten like vp_polot.cascisten,
   idv_prikazy like vp_polot.por_polot, --doplnene 12.2.16
   idvp_polot like vp_polot.id  --doplnene 12.2.16
end record
{
define oper_preds_prazd record --inicializacna veta
   cpv like pl_harm.cpv,
   cov like pl_harm.cov,
   rok_zac like pl_harm.rok_zac,
   tyz_zac like pl_harm.tyzden_zac,
   per_zac like pl_harm.perioda,
   zac_periody like pl_harm.zac_periody,
   kon_periody like pl_harm.kon_periody,
   id like pl_harmpolozka.id,
   idpl_sledpolozka like pl_harmpolozka.idpl_sledpolozka,
   idpo_stroje like pl_harmpolozka.idpo_stroje,
   zac_plan like pl_harmpolozka.zac_plan,
   kon_plan like pl_harmpolozka.kon_plan,
   min_zac_rok like pl_harmpolozka.min_zac_rok,
   min_zac_tyz like pl_harmpolozka.min_zac_tyz,
   min_zac_per like pl_harmpolozka.min_zac_per,
   min_zac_cas like pl_harmpolozka.min_zac_cas,
   max_kon_rok like pl_harmpolozka.max_kon_rok,
   max_kon_tyz like pl_harmpolozka.max_kon_tyz,
   max_kon_per like pl_harmpolozka.max_kon_per,
   max_kon_cas like pl_harmpolozka.max_kon_cas,
   min_zac_cas_hr like pl_harmpolozka.min_zac_cas_hr,
   max_kon_cas_hr like pl_harmpolozka.max_kon_cas_hr,
   ---
   cas_plan_i like pl_prac_uloha.cas_beh_plan_i,
   cas_skut_i like pl_prac_uloha.cas_beh_plan_i,
   cas_zost_i like pl_prac_uloha.cas_beh_plan_i,
   datplat like vp_polot.datplat,
   cislo_vp like vp_polot.cislo_vp,
   stl like vp_polot.stl,
   riad like vp_polot.riad,
   cisoper like vp_polot.cisoper,
   stlo like vp_polot.stl,
   riado like vp_polot.riad,
   cisopero like vp_polot.cisoper,
   csv like vp_polot.csv,
   ctv like vp_polot.ctv,
   sirka like vp_polot.sirka,
   sirka_vst like vp_polot.sirka_vst,
   mikron like vp_polot.mikron,
   casbeh like vp_polot.casbeh,
   novecsv like v_prikazy.novecsv,
   vyrkg like polot2:ht_vpvyr.vyrkg,
   vyrbm like polot2:ht_vpvyr.vyrbm,
   vyrks like polot2:ht_vpvyr.vyrks,
   datukvyr like polot2:ht_vpvyr.datukvyr,
   mj like pl_prac_uloha.mj,
   mnoz_kg_plan like pl_prac_uloha.mnoz_kg_plan,
   mnoz_mj_plan like pl_prac_uloha.mnoz_mj_plan,
   mnoz_kg_skut like pl_prac_uloha.mnoz_kg_skut,
   mnoz_mj_skut like pl_prac_uloha.mnoz_mj_skut,
   cas_prip_plan_i like pl_prac_uloha.cas_prip_plan_i,
   cas_beh_plan_i like pl_prac_uloha.cas_beh_plan_i,
   poc_stroj smallint,
   presunuta char, --priznak, ci je operacia uz presunuta
   ---
   posun interval hour(3) to minute,
   rok_koniec smallint,
   tyz_koniec smallint,
   per_koniec smallint,
   zac_per_koniec like pl_harm.zac_periody,
   kon_per_koniec like pl_harm.kon_periody,
   kod_tech like technologie.kod_tech,
   casdemont like vp_polot.casdemont,
   cascisten like vp_polot.cascisten,
   idv_prikazy like vp_polot.por_polot, --doplnene 12.2.16
   idvp_polot like vp_polot.id --doplnene 12.2.16
end record
}

define lzaz record
  projekt char(6),
  program char(15),
  cinnost char(15),
  menu char(15),
  start datetime year to second,
  stop datetime year to second,
  poznamka char(80),
  username char(8)
end record


--define prestavky array[100] of record --pole prestavok
define prestavky dynamic array of record --pole prestavok
   id like pl_kapkalendar.id,
   zac_useku like pl_kapkalendar.zac_useku,
   kon_useku like pl_kapkalendar.kon_useku,
   dlzka_useku interval hour(9) to minute
end record
{
define prestavky_prazd record
   id like pl_kapkalendar.id,
   zac_useku like pl_kapkalendar.zac_useku,
   kon_useku like pl_kapkalendar.kon_useku,
   dlzka_useku interval hour(9) to minute
end record
}

define text2,preptext2 char(2500) --text premenne pre kurzor postupov
define k_post smallint  --pocet postupov
define gidpl_poziad_progn like pl_dostup_zdroja.idpl_poziad_progn
define dlzka_periody interval hour(3) to minute
define poc_odd smallint --pocet oddeleni
define poc_preds smallint
define gpocupd integer

######################
function alg_prog_01()
######################
define a,bc char
define per,tyzden,rok smallint
define cislo_vp like v_prikazy.cislo_vp
define idpl_poziad_progn like pl_dostup_zdroja.idpl_poziad_progn
define termin_poz_uv like pl_poziad_progn.termin_poz_uv
define termin_prog_uv like pl_poziad_progn.termin_prog_uv
define i,j smallint

let dlzka_periody = "84:00"
open window w0 at 1,1 with 25 rows, 80 columns
menu "PLANOVE VYPOCTY"

{
  command "Oprava_hr_termin"
	let termin_prog_uv = null
	prompt "Cislo_vp:" for cislo_vp
	whenever error continue
	select v.datpotv into termin_prog_uv
	from v_prikazy v
	where v.cislo_vp = cislo_vp
	whenever error stop
	if sqlca.sqlcode < 0 then
	   let txt1 = "Chyba pri vybere terminu ZUV! Cislo chyby:",sqlca.sqlcode using "-<<<<<.&"
	   let a = false
	else
	   if sqlca.sqlcode = 100 then
		let txt1 = "Zadany vyrobny prikaz sa nenasiel!" 
		let a = false
	   end if
	end if
	if a then
	   if termin_prog_uv is null then
		let txt1 = "Vyrobny prikaz nema este urceny termin ZUV!"
		let a = false
	   end if
	end if
	if a then
	   call napl_hr_terminy(cislo_vp,termin_prog_uv) returning a
	end if
	error txt1 clipped

   command "Hranicne_terminy"
	let txt1 = ""
	let txt2 = ""
	call napln_hranicne_terminy() returning a
	error txt1 clipped

   command key("P") "Preplanovanie"
        let txt2 = ""
        let txt1 = ""
        let lzaz.projekt = "tpv"
        let lzaz.program = "01AgrPlanovanie"
        let lzaz.cinnost = "preplanovanie"
        let lzaz.menu = "Preplanovanie"
        let lzaz.start = ""
        let lzaz.stop = ""
        let lzaz.poznamka = ""
        let lzaz.username = ""
if vypocetzamok(0,"Z",lzaz.*) then
        call preplanovanie() returning a
                let lzaz.poznamka = txt1
                call vypocetzamok(0,"K",lzaz.*) returning bc
end if
        let txt1 = txt1 clipped,txt2 clipped
        let txt1 = txt1[1,79]
        error txt1 clipped attribute(reverse)



   command "Uvolni_zakazku"
	prompt "Cislo_vp:" for cislo_vp
	call uvolnenie_zakazky(cislo_vp) returning a
	error txt1 clipped

   command key("V") "kapacitne_Vyvazovanie"
        let txt2 = ""
        let txt1 = ""
        let lzaz.projekt = "tpv"
        let lzaz.program = "01AgrPlanovanie"
        let lzaz.cinnost = "vyvazovanie"
        let lzaz.menu = "Vyvazovanie"
        let lzaz.start = ""
        let lzaz.stop = ""
        let lzaz.poznamka = ""
        let lzaz.username = ""
if vypocetzamok(0,"Z",lzaz.*) then
	call vyvazovanie() returning a
                let lzaz.poznamka = txt1
                call vypocetzamok(0,"K",lzaz.*) returning bc
end if
        let txt1 = txt1 clipped,txt2 clipped
        let txt1 = txt1[1,79]
        error txt1 clipped attribute(reverse)
}


   command key("P") "Preplánovanie a vyvažovanie" "Funkcia preplánovania a vyvažovania"
	if gpodnik = 11 then --Fibrochem
	   error "Tato voľba ešte nie je implementovaná."
	   continue menu
	end if
        let txt2 = ""
        let txt1 = ""
        let lzaz.projekt = "tpv"
        let lzaz.program = "01AgrPlanovanie"
        let lzaz.cinnost = "preplanovanie"
        let lzaz.menu = "Preplanovanie"
        let lzaz.start = ""
        let lzaz.stop = ""
        let lzaz.poznamka = ""
        let lzaz.username = ""
	call test_obdobi(gpodnik) returning a --doplneny test obdobi
	if a then
	   --29.12.2017 test parametrov strojov
	   call test_param_strojov() returning a
	end if
	if a then
	   --29.12.2017 test na prazdny kapacitny kalendar
	   call test_prazd_kapac_kalendar() returning a
	end if
	if a then
	   --29.12.2017 test na zaradenie do skupiny strojov na rezervaciu
		if pp_26.rezervacia_zapnuta then
	   		call test_skupiny_strojov() returning a
	   	end if
	end if
	if a then
	   --28.12.2017 test dostatocnej naplnenosti kapacit.kalendara
	   call test_kapac_kalendara() returning a
	end if
	if a then
	   if vypocetzamok(0,"Z",lzaz.*) then
                --call test_obdobi(gpodnik) returning a --doplneny test obdobi
 		if a then
		   call preplanovanie() returning a
		   let lzaz.poznamka = txt1
		end if
		if a then
		   error txt1 clipped --hlaska o ukoncenom preplanovani
		   call vyvazovanie() returning a
		   let lzaz.poznamka = txt1
		end if
		if a then
		   call vypocetzamok(0,"K",lzaz.*) returning bc --ak sa vsetko podari, zapise sa koniec prepoctu
		else
		   call vypocetzamok(1,"K",lzaz.*) returning bc --ak sa to nepodari, vymaze sa zaciatok prepoctu
		end if
	   end if
	end if
        let txt1 = txt1 clipped,txt2 clipped
        let txt1 = txt1[1,79]
        --error txt1 clipped attribute(reverse)
		CALL fgl_winmessage("Oznam", txt1, "info")
		

{
   command key("M") "pohlad_na_Material" "Pohlad na krytie materialom"
	error "Pripravuje sa prehlad materialu..."
	call priprav_tab_mater() returning a
	error ""
	if a then
		call pozri_tab("material","evidcis,tyzden_zac,perioda,potreba_kg,stav_sklad_str_kg,krytie_sklad_str_kg,stav_obj_kg,krytie_obj_kg,bilancia_kg","","Material")
	else
		error "Nieco zlyhalo."
	end if

   command key("X") "Sklzy"
        let txt2 = ""
        let txt1 = ""
	call lookup_42(0,0,0,"S") returning bc
        let txt1 = txt1 clipped,txt2 clipped
        let txt1 = txt1[1,79]
        error txt1 clipped attribute(reverse)

   command key("Y") "Predstihy"
        let txt2 = ""
        let txt1 = ""
	call lookup_42(0,0,0,"P") returning bc
        let txt1 = txt1 clipped,txt2 clipped
        let txt1 = txt1[1,79]
        error txt1 clipped attribute(reverse)
}

   command key("K","F5") "Koniec"
	exit menu
end menu
close window w0
end function

######################
function nastavenie_rezervacie()
######################
define a char(1)
define l_stav_rezervacie char(18)
open window w1 at 1,2 with 5 rows, 75 columns
let pp_26.cpv = gpodnik
call vyb7_26a() returning a --vyber_parametrov
if a then
   if pp_26.rezervacia_zapnuta then
	let l_stav_rezervacie = "REZERVÁCIA_ZAPNUTÁ"
   else
	let l_stav_rezervacie = "REZERVÁCIA_VYPNUTÁ"
   end if
   menu l_stav_rezervacie
	before menu
	   hide option all 
	   show option "Návrat" 
	   if pp_26.rezervacia_zapnuta then
		show option "Vypnúť_rezerváciu"
	   else
		show option "Zapnúť_rezerváciu"
	   end if

	command "Vypnúť_rezerváciu"
	   if not potvrd1("Naozaj chcete vypnúť rezerváciu?[a/n]") then
		continue menu
	   end if
	   let pp_26.rezervacia_zapnuta = 0
	   if upd1_rezervacia_26() then
		let l_stav_rezervacie = "REZERVÁCIA_VYPNUTÁ"
		let txt1 = "Rezervácia bola vypnutá. Spusťte nanovo preplánovanie!"
		hide option "Vypnúť_rezerváciu"
		show option "Zapnúť_rezerváciu"
	   end if
	   error txt1 clipped
	   next option "Návrat"

	command "Zapnúť_rezerváciu"
	   if not potvrd1("Naozaj chcete zapnúť rezerváciu?[a/n]") then
		continue menu
	   end if
	   let pp_26.rezervacia_zapnuta = 1
	   if upd1_rezervacia_26() then
		let l_stav_rezervacie = "REZERVÁCIA_ZAPNUTÁ"
		let txt1 = "Rezervácia bola zapnutá. Spuťte nanovo preplánovanie!"
		hide option "Zapnúť_rezerváciu"
		show option "Vypnúť_rezerváciu"
	   end if
	   error txt1 clipped
	   next option "Návrat"

	command key("F5") "Návrat"
	   exit menu
   end menu
else
   error txt1 clipped
   sleep 5
end if
close window w1
end function

##########################
function preplanovanie()
##########################
define a char
define rok,tyz,per smallint
define cpv like pl_harm.cpv
define zac_per,kon_per like pl_harm.zac_periody

let ref_cas = daj_ref_cas()
let cpv = gpodnik
--call perioda((current year to minute - 5 units hour)) returning rok,tyz,per --umely posun pre oneskorene planovanie
call perioda(ref_cas) returning rok,tyz,per --aktualna perioda
call hranice_periody(rok,tyz,per) returning zac_per,kon_per --hranice aktual.periody


   call trans_cisti_plan(cpv,kon_per) returning a
   if a then
	error txt1 clipped
	sleep 1
   end if
----------------
if a then
   call napln_harmonogram(cpv,kon_per) returning a
end if
if a then
  let txt1 = "Planning was succesfuly finished."
end if
return a
end function

###########################
function vyvazovanie()
###########################
define rok,tyz,per smallint
define rok_v,tyz_v,per_v smallint --perioda vyvazovana
define rok_k,tyz_k,per_k smallint --perioda konecna z prehladavanych
define poc_per_vyvaz smallint --pocet vyvazovanych period
define poc_per_prehl smallint --pocet prehladavanych period
define a,b,c char
define aa char
define i,j,k,l smallint
define text char(80)
define poc_oper_odd smallint
define poc_pouz_stroj smallint
--define stav_archivu char(1)
define bc smallint

let poc_oper_odd = 0
let a = true
let poc_preds = 0
let dlzka_periody = interval(84:00) hour to minute
let poc_pouz_stroj = 0
let ref_cas = daj_ref_cas()

--test na vhodnost casu vyvazovania
-----------------------------------
--call perioda((current year to minute - 5 units hour)) returning rok,tyz,per --len na dodatocne vyvazovanie
call perioda(ref_cas) returning rok,tyz,per --aktualna perioda
call perioda_posun(rok,tyz,per,"+") returning rok_v,tyz_v,per_v
{
let text = "Naozaj chcete vyvazovat periodu:",rok_v using "###&","-",tyz_v using "<&","/",per_v using "&","?[a/n]:"
call potvrd(text clipped) returning a
}
let a = true
if a then
   let pp_26.cpv = gpodnik
   call vyb7_26a() returning a --vyber_parametrov
end if
if a then
   let poc_per_vyvaz = pp_26.poc_per_vyvaz
   let poc_per_prehl = pp_26.poc_per_prehl
   call perioda_posun2(rok,tyz,per,"+",poc_per_prehl) returning rok_k,tyz_k,per_k
end if


if a then
   call vytv_tab_polozka() returning a
end if
{
if a then
   call del_tab_polozka() returning a
end if
}
if a then
   --error "Prebieha vyvazovanie..."
   for i = 1 to poc_per_vyvaz --cyklus period
	call vyb_odd(rok_v,tyz_v,per_v) returning a --vyber nenaplnenych oddeleni v danej periode
	if not a then
	   exit for
	end if
	for j = 1 to poc_odd --cyklus oddeleni
--docasne odkomentovane, lebo nesuhlasi napocet volneho miesta!
{
	   if odd[j].volne_miesto < "02:00" then
		continue for
	   end if
}
	   ---------------------------------
	   --let self="Prebieha vyvažovanie oddelenia ",odd[j].cov using "<<<&","..."
	   --let bc=messwindow(-7)
	   ---------------------------------
	   call vyb_oper_predstih(j,rok_v,tyz_v,per_v,rok_k,tyz_k,per_k) returning a
	   if not a then
		---------------------------
		--call close_messwindowperc()
		---------------------------
		exit for
	   end if
	   call lycia_progressbar_new(poc_odd,"Prebieha vyvažovanie oddelenia "||odd[j].cov using "<<<&"||"...")
	   for l = 1 to odd[j].poc_oper --cyklus operacii
		if oper_preds[l].presunuta then --test na uz presunutu operaciu
		   continue for
		end if
		if oper_preds[l].datukvyr is not null then --test na ukocenu operaciu
		   continue for
		end if
		if a then
		   call vyb_final(oper_preds[l].cislo_vp) returning a --vyber finalnych udajov 
		end if
{
--vyhadzujem tento kod, lebo uz su riesene operacie na valce 192
		---17.9.09 do predstihu HTL len s archivom---
		if plan.tlac1 = 1 and --HTL
		   oper_preds[l].kod_tech = "TLA" then --tlacova operacia
		   --call archiv(plan.cislo_vp) returning stav_archivu --test stavu archivu
		   if plan.stav_archivu is null or
		      plan.stav_archivu not matches "[AGTHp]" then --nie su archivovane valce
			continue for
		   end if
		end if
		---------------------------------------------
}
		call obcerstvi_oper_preds(oper_preds[l].id) returning a,oper_preds[l].zac_plan,oper_preds[l].kon_plan
		if not a then
		   exit for
		end if
		for k = 1 to oper_preds[l].poc_stroj --cyklus strojov
{
--osetri sa to neskor
		   if stroj[l,k].naplneny then --test naplnenosti stroja
			continue for
		   end if
}
		   if not stroj[l,k].pouzitelny then --test pouzitelnosti stroja
			continue for
		   end if
		   call najdi_miesto_vyvaz(rok_v,tyz_v,per_v,stroj[l,k].idpo_stroje,false,l) returning a,b
		   if a then
			if b then --ak je oper.zaradena,skoncit cyklus strojov
			   let poc_oper_odd = poc_oper_odd + 1
			   exit for
			end if
		   else
			exit for
		   end if
		end for
{
		--test na existenciu pouzitelneho stroja
		if poc_pouz_stroj = 0 then
		   let a = false	
		   let txt1 = "Na odd.",odd[j].cov using "<<<&"," nie je vhodny stroj!"
		   let txt1 = txt1 clipped,txt2
		end if
		----------------------------------------
}
		if not a then
		   exit for
		end if
		----------------
		--let percenta_presne=null --- lebo to skonci skor ako 100%, ostane tu hodnota a potom to spadne
		--call zq_percenta(0,odd[j].poc_oper) returning bc --aby nieco ukazalo
		--call zq_percenta(l,odd[j].poc_oper) returning bc
		DISPLAY l to pb01
		------------------
	   end for
	   if not a then
		---------------------------
		--call close_messwindowperc()
		---------------------------
		exit for
	   else
		let txt1 = 
		"Pre periodu:",rok_v using "<<<&","/",tyz_v using "<&","-",per_v using "&"," ",
		"sa na oddeleni:",odd[j].cov using "<<<&"," ",
		"nasiel pocet predstihov:",poc_oper_odd using "<<<&","."
		error txt1 clipped
		display txt1

		let poc_oper_odd = 0
	   end if
	   ---------------------------
	   --call close_messwindowperc()
		CLOSE WINDOW w1
	   ---------------------------
	end for
	if not a then
	   exit for
	else
	   if poc_odd = 0 then
		let txt1 = "Pre periodu:",rok_v using "<<<&","/",tyz_v using "<&","-",per_v using "&"," sa nenasli nenaplnene oddelenia!"
		error txt1 clipped
		display txt1
		sleep 2
	   end if
	end if
	call perioda_posun(rok_v,tyz_v,per_v,"+") returning rok_v,tyz_v,per_v --posun na dalsiu periodu
   end for
end if
call zrus_tab_polozka() returning aa
--call del_tab_polozka() returning aa
if a then
   let txt1 = "Vyvazovanie bolo uspesne ukoncene."
end if
return a
end function

#######################
function najdi_miesto_vyvaz(rok,tyzden,per,idpo_stroje,posun,i)
#######################
define rok,tyzden,per smallint --startovacia perioda
define idpo_stroje like pl_harmpolozka.idpo_stroje
define posun char
define i smallint
define a char
define b char --priznak ci sa podarilo zaradit
define c char --priznak ci sa prekrocili hranice
define cas_zac_per,cas_kon_per datetime year to minute
--define uloha array[50] of record --pole dolezitych uloh
define uloha dynamic array of record
   rok like pl_harm.rok_zac,
   tyzden like pl_harm.tyzden_zac,
   per like pl_harm.perioda,
   zac_per like pl_harm.zac_periody,
   kon_per like pl_harm.kon_periody,
   id_per_posl_kon like pl_harmpolozka.idpl_harm,
   poradie_posl_kon like pl_harmpolozka.poradie,
   cas_posl_kon like pl_harmpolozka.kon_plan,
   id_per_presah_kon like pl_harmpolozka.idpl_harm,
   cas_presah_kon like pl_harmpolozka.kon_plan,
   id_per_presah_zac like pl_harmpolozka.idpl_harm,
   cas_presah_zac like pl_harmpolozka.zac_plan,
   cista_per char, --priznak, ci je perioda uplne cista
   zac_miesta datetime year to minute,
   kon_miesta datetime year to minute,
   id_presah like pl_harmpolozka.id --id presahu pre posun poradia
end record
define poc_per,poradie_per smallint
define volne_miesto interval hour(3) to minute
define poradie_pred_oper like pl_harmpolozka.poradie
----
define kon_presah_ods like pl_kapkalendar.zac_useku
define zac_presah_ods like pl_kapkalendar.zac_useku
define zac_ods like pl_kapkalendar.zac_useku
define kon_ods like pl_kapkalendar.zac_useku
define interval_ods interval hour(9) to minute
----
define aktual_rok,aktual_tyz,aktual_per smallint
define aktual_cas datetime year to minute

let a = false
let b = false
let c = false
let poradie_per = 1
let volne_miesto = interval(00:00) hour to minute
initialize ppolozka.* to null
initialize uloha to null --inicializacia pola
let aktual_cas = current year to minute
call perioda(aktual_cas) returning aktual_rok,aktual_tyz,aktual_per

while true
   let uloha[poradie_per].rok = rok
   let uloha[poradie_per].tyzden = tyzden
   let uloha[poradie_per].per = per
   call hranice_periody(rok,tyzden,per) returning uloha[poradie_per].zac_per,uloha[poradie_per].kon_per

   call najdi_posl_kon(oper_preds[i].cpv,oper_preds[i].cov,rok,tyzden,per,idpo_stroje) returning a,uloha[poradie_per].id_per_posl_kon,uloha[poradie_per].poradie_posl_kon,uloha[poradie_per].cas_posl_kon
   if a then
	call najdi_presah_kon(oper_preds[i].cpv,oper_preds[i].cov,uloha[poradie_per].zac_per,uloha[poradie_per].kon_per,idpo_stroje) returning a,uloha[poradie_per].id_per_presah_kon,uloha[poradie_per].cas_presah_kon
   end if
   if a then
	call najdi_presah_zac(oper_preds[i].cpv,oper_preds[i].cov,uloha[poradie_per].zac_per,uloha[poradie_per].kon_per,idpo_stroje) returning a,uloha[poradie_per].id_per_presah_zac,uloha[poradie_per].id_presah,uloha[poradie_per].cas_presah_zac
   end if
   if a then
	---zakladne testy ci je nejake miesto, aby sa dalo zacat---- 
	if poradie_per = 1 then
	   if uloha[poradie_per].cas_posl_kon > uloha[poradie_per].kon_per then --operacia konci mimo periody
		let b = false
		exit while
	   end if
	   
	   if uloha[poradie_per].cas_presah_kon > uloha[poradie_per].kon_per then
		let b = false
		exit while
	   end if
	else
	end if
	------------------------------------------------------------ 
	----Napocet volneho miesta---------------
	if uloha[poradie_per].cas_posl_kon is not null then
		let uloha[poradie_per].zac_miesta = uloha[poradie_per].cas_posl_kon
	else
	   if uloha[poradie_per].cas_presah_kon is not null then
		let uloha[poradie_per].zac_miesta = uloha[poradie_per].cas_presah_kon
	   end if
	end if
	if uloha[poradie_per].zac_miesta is null then
	   let uloha[poradie_per].zac_miesta = uloha[poradie_per].zac_per
	end if
	------
	if uloha[poradie_per].cas_presah_zac is not null then
	   let uloha[poradie_per].kon_miesta = uloha[poradie_per].cas_presah_zac
	end if
	if uloha[poradie_per].kon_miesta is null then
	   let uloha[poradie_per].kon_miesta = uloha[poradie_per].kon_per
	end if
	------
	--14.7.11 dodatok pre upresnenie volneho miesta aktualnej periody-----
	if rok = aktual_rok and
	   tyzden = aktual_tyz and
	   per = aktual_per then
		if uloha[poradie_per].zac_miesta < aktual_cas then
			let uloha[poradie_per].zac_miesta = aktual_cas
		end if
	end if
	----------------------------------------------------------------------
	--kumulacia volneho miesta
	let volne_miesto = volne_miesto + (uloha[poradie_per].kon_miesta - uloha[poradie_per].zac_miesta)
	---Lycia
	---if volne_miesto < 0 then
	if volne_miesto < interval(00:00) hour to minute then
		let volne_miesto = interval(00:00) hour to minute
	end if
	------------------------------------------------------

	---12.1.09--zohladnenie odstavok----
	call najdi_sumar_odstavok(idpo_stroje,uloha[1].zac_miesta,uloha[1].zac_miesta+volne_miesto) returning a,kon_presah_ods,zac_presah_ods,interval_ods
	if not a then
	   exit while 
	end if
	------------------------------------
	--1.6.09 ak v startovacej periode nie je miesto, neda sa zacat
	if poradie_per = 1 and
	   (volne_miesto -interval_ods) <= interval(00:00) hour to minute then
	   exit while
	end if
	-------------------------------------------------------------
	-----------------------------------------

	if (uloha[poradie_per].kon_miesta - uloha[poradie_per].zac_miesta) = dlzka_periody then
		let uloha[poradie_per].cista_per = true
	else
		let uloha[poradie_per].cista_per = false
	end if
{
	if oper_preds[i].cas_zost_i <= volne_miesto then
		let b = true
	end if
}
	---12.1.09--zohladnenie odstavok	
	if oper_preds[i].cas_zost_i <= (volne_miesto - interval_ods) then
		let b = true
	end if
	-----------------------------------------
	if not posun then --nie je posun, opustenie cyklu
	   exit while
	end if
	if b then --naslo sa miesto, opustenie cyklu
	   exit while
	else
	   if poradie_per = 1 then
		--nasleduje presah a ten sa zatial neposuva => niet miesto
		if uloha[poradie_per].cas_presah_zac is not null then
		   exit while

		end if
	   else
		if not uloha[poradie_per].cista_per then --dalej sa neda postupovat
		   exit while	
		end if
	   end if
	end if
   else
	exit while
   end if
{
   ----test na prekrocenie max_kon_per
   if (uloha[1].zac_miesta + oper_preds[i].cas_plan_zost_i) > oper_preds[i].max_kon_cas then
	let c = true --hranice boli prekrocene
	let b = false
   end if
   -----------------------------------
}
   --4.5.09 pri vyvazovani nedovolit posun do dalsej periody
   if b then
	let b = false
   end if
   --let poradie_per = poradie_per + 1
   --call perioda_posun(rok,tyzden,per,"+") returning rok,tyzden,per
end while

--let poc_per = poradie_per - 1
let poc_per = poradie_per --opravena chyba z najdi_miesto2
if a then
   if b then
	--definovanie zaciatku,konca a poradia operacie---
	if uloha[1].poradie_posl_kon is not null then
		let poradie_pred_oper = uloha[1].poradie_posl_kon 
        else
		let poradie_pred_oper = 0
	end if
	let ppolozka.rok_zac = uloha[1].rok 
	let ppolozka.tyzden_zac = uloha[1].tyzden
	let ppolozka.perioda = uloha[1].per
	let ppolozka.zac_periody = uloha[1].zac_per
	let ppolozka.kon_periody = uloha[1].kon_per
	let ppolozka.idpo_stroje = idpo_stroje
	let ppolozka.poradie = poradie_pred_oper + 1
	---doplnene 21.4.09----------
	let ppolozka.cas_prace_plan = oper_preds[i].cas_zost_i
	-----------------------------
	--let ppolozka.zac_plan = uloha[1].zac_miesta
	--let ppolozka.kon_plan = uloha[1].zac_miesta + oper_preds[i].cas_zost_i
	--12.1.09 Novy algoritmus zaciatku a konca operacie zohlad.odstavky----
	if interval_ods > interval(00:00) hour to minute then
	   call najdi_hranice_oper(idpo_stroje,uloha[1].zac_miesta,uloha[1].zac_miesta+volne_miesto,oper_preds[i].cas_zost_i,kon_presah_ods) returning a,ppolozka.zac_plan,ppolozka.kon_plan
	else
	   --stara vetva bez odstavok
	   let ppolozka.zac_plan = uloha[1].zac_miesta
	   let ppolozka.kon_plan = uloha[1].zac_miesta + oper_preds[i].cas_zost_i
	end if
	-----------------------------------------------------------------------
{
	let ppolozka.cislo_vp = oper_preds[i].cislo_vp
	let ppolozka.stl = oper_preds[i].stl
	let ppolozka.riad = oper_preds[i].riad
	let ppolozka.cisoper = oper_preds[i].cisoper
	let ppolozka.stlo = oper_preds[i].stlo
	let ppolozka.riado = oper_preds[i].riado
	let ppolozka.cisopero = oper_preds[i].cisopero
	if oper_preds[i].mnoz_ks_vyst > 0 then
	   let ppolozka.mnoz_mj_plan = oper_preds[i].mnoz_ks_vyst
	   let ppolozka.mj = "KS"
	else
	   let ppolozka.mnoz_mj_plan = oper_preds[i].mnoz_bm_vyst
	   let ppolozka.mj = "BM"
	end if
	let ppolozka.cas_prip_plan = oper_preds[i].cas_prip_plan
	let ppolozka.cas_beh_plan = oper_preds[i].cas_beh_plan
	let ppolozka.cas_prip_plan_i = oper_preds[i].cas_prip_plan_i
	let ppolozka.cas_beh_plan_i = oper_preds[i].cas_beh_plan_i
	--naplnenie min_zac_per----------------
	if oper_preds[i].min_zac_cas is not null then
		let ppolozka.min_zac_rok = oper_preds[i].min_zac_rok
		let ppolozka.min_zac_tyz = oper_preds[i].min_zac_tyz
		let ppolozka.min_zac_per = oper_preds[i].min_zac_per
		let ppolozka.min_zac_cas = oper_preds[i].min_zac_cas
	else
		let ppolozka.min_zac_rok = uloha[1].rok
		let ppolozka.min_zac_tyz = uloha[1].tyzden
		let ppolozka.min_zac_per = uloha[1].per
		let ppolozka.min_zac_cas = uloha[1].zac_per
	end if
	---------------------------------------
	--------------------------------------------------
	--najdenie a definovanie posunutych operacii---
	if poc_per > 1 then
	   if uloha[poc_per].poradie_posl_kon is not null then --exist.operacie v posled.periode
		let ppolozka.posun_oper = true
		let ppolozka.dlzka_posunu = ppolozka.kon_plan - uloha[1].zac_per
	        let ppolozka.idpl_harm_posun = uloha[poc_per].id_per_posl_kon
	   else
		let ppolozka.posun_oper = false
	   end if
	else
	   let ppolozka.posun_oper = false
	end if
	-----------------------------------------------
}
	--5.5.09 podmienka na zmenu poradia presahu
	if uloha[1].cas_presah_zac is not null then
	   let ppolozka.posun_poradia_presahu = true
	   let ppolozka.id_presah = uloha[1].id_presah  
	else
	   let ppolozka.posun_poradia_presahu = false
	end if
	-------------------------------------------
	--preneseny test z najdi_miesto2 dna 23.6.11----------
        ---29.6.09--test na posun-----------------------------
        if poradie_per > 1 then
           call najdi_sumar_odstavok(idpo_stroje,uloha[poradie_per].zac_miesta,uloha[poradie_per].kon_miesta) returning a,kon_presah_ods,zac_presah_ods,interval_ods
           if a then
                if ppolozka.dlzka_posunu > ((uloha[poradie_per].kon_miesta - uloha[poradie_per].zac_miesta) - interval_ods) then
                   let b = false
                end if
           end if
        end if
        ------------------------------------------------------
	if a then
	   call trans_zapis_vyvaz(i,rok,tyzden,per) returning a
	end if
	if a then
	   let oper_preds[i].presunuta = true
	end if
   end if
end if

return a,b
end function


##############################
function trans_zapis_vyvaz(i,rok_v,tyz_v,per_v)
##############################
define rok_v,tyz_v,per_v smallint
define a,wk char,
       i int
define idpl_harm like pl_harmpolozka.idpl_harm
let a = true
let wk = true
If beg_wk() then
   if a then
	call vyb_per_v(i,rok_v,tyz_v,per_v) returning a,idpl_harm --vyber id vyvazovanej periody
   end if
   if a then
	call vloz_preds(i,idpl_harm) returning a --vlozenie predstihu do vyvazovanej periody
   end if
   if a then
	call upd_preds(i) returning a --update predstihovej operacie v povodnej periode
   end if
   if a then
	call del_preds(i) returning a --vymazanie predstihovej operacie v povodnej periode
   end if
   if a then
	--call posun_za_preds(i) returning a --posun operacii za predstihovou operaciou v povodnej periode
	call posun_za_preds2(i) returning a --posun operacii za predstihovou operaciou v povodnej periode
   end if
   if a then
	if oper_preds[i].rok_zac = oper_preds[i].rok_koniec and --len preds.operacie bez presahu,lebo inak posun_por = 0
           oper_preds[i].tyz_zac = oper_preds[i].tyz_koniec and
           oper_preds[i].per_zac = oper_preds[i].per_koniec then
		call posun_poradie_za_preds_presah(i) returning a --zmena poradia v nasledujucom presahu
	end if
   end if
   --5.5.09 doplnene o zmenu poradia presahu
   if a then
	if ppolozka.posun_poradia_presahu then
	   call upd_posun_poradia_presah(ppolozka.id_presah) returning a --posun poradia presahu vo vyvaz.periode
	end if
   end if
   -----------------------------------------
   if a then
	call upd_odober_oper(i) returning a --prepis min_zac odober.operacii
   end if
   if a then
	call upd_preds_oper(i) returning a --prepis max_kon predoslych operacii
   end if

   if a then
       call com_wk() returning wk
   else
       call rol_wk() returning wk
   end if

else
       let a = false
       let wk = false
end if
return a
end function

##################
function vyb_per_v(i,rok_v,tyz_v,per_v)
#################
define i smallint
define rok_v,tyz_v,per_v smallint
define try,a char
define pid integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
select
	pl_harm.id
into
	pid
from pl_harm where
	pl_harm.cpv = oper_preds[i].cpv and
	pl_harm.cov = oper_preds[i].cov and
	pl_harm.rok_zac = rok_v and
	pl_harm.tyzden_zac = tyz_v and
	pl_harm.perioda = per_v and
	pl_harm.platnost = 1
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
return a,pid
end function

##################
function vloz_preds(i,pidpl_harm)
#################
define pidpl_harm like pl_harmpolozka.idpl_harm
define pidpl_sledpolozka like pl_harmpolozka.idpl_sledpolozka 
define i smallint
define try,a char
define id integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
insert into pl_harmpolozka ( 
	id,
	idpl_harm,
	idpl_sledpolozka,
	idpo_stroje,
	poradie,
	zac_plan,
	kon_plan,
	min_zac_rok,
	min_zac_tyz,
	min_zac_per,
	min_zac_cas,
	max_kon_rok,
	max_kon_tyz,
	max_kon_per,
	max_kon_cas,
	min_zac_cas_hr,
	max_kon_cas_hr,
	cas_prace_plan
) values ( 
	0, --id,
	pidpl_harm,
	oper_preds[i].idpl_sledpolozka,
	ppolozka.idpo_stroje,
	ppolozka.poradie,
	ppolozka.zac_plan,
	ppolozka.kon_plan,
	oper_preds[i].min_zac_rok,
	oper_preds[i].min_zac_tyz,
	oper_preds[i].min_zac_per,
	oper_preds[i].min_zac_cas,
	oper_preds[i].max_kon_rok,
	oper_preds[i].max_kon_tyz,
	oper_preds[i].max_kon_per,
	oper_preds[i].max_kon_cas,
	oper_preds[i].min_zac_cas_hr,
	oper_preds[i].max_kon_cas_hr,
	ppolozka.cas_prace_plan
 ) 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    ------
    let id = sqlca.sqlerrd[2]
    ------
    let poc_preds = poc_preds + 1
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
return a
end function

##################
function del_preds(i)
#################
define try,a char
define i integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
	delete from pl_harmpolozka
 			 where 
 	pl_harmpolozka.id = oper_preds[i].id 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_02  = sqlca.sqlerrd[3]
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
return a
end function

##################
function upd_preds(i)
#################
define try,a char
define i integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
	update pl_harmpolozka set
   pl_harmpolozka.poradie = 0,
   pl_harmpolozka.zac_plan = "0001-01-01 00:00",
   pl_harmpolozka.kon_plan = "0001-01-01 12:00"

 			 where 
 	pl_harmpolozka.id = oper_preds[i].id 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_02  = sqlca.sqlerrd[3]
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
return a
end function

############################
function posun_za_preds(i)
############################
define try,a char
define i smallint
define posun_por smallint
define l_text char(1000)

if oper_preds[i].rok_zac = oper_preds[i].rok_koniec and
   oper_preds[i].tyz_zac = oper_preds[i].tyz_koniec and
   oper_preds[i].per_zac = oper_preds[i].per_koniec then
	let posun_por = 1
else
	let posun_por = 0
end if

let try = true
let a = false
while try
let txt2 = ""
let l_text =
"update pl_harmpolozka set ",
"   pl_harmpolozka.poradie = pl_harmpolozka.poradie - ",posun_por,", ",
"   pl_harmpolozka.zac_plan = pl_harmpolozka.zac_plan - interval(",oper_preds[i].posun,") hour(3) to minute, ",
"   pl_harmpolozka.kon_plan = pl_harmpolozka.kon_plan - interval(",oper_preds[i].posun,") hour(3) to minute ", 
" where ",
"   pl_harmpolozka.zac_plan >= '",oper_preds[i].kon_plan,"' and ", --vyber operacii za preds.operaciou
"   pl_harmpolozka.kon_plan <= '",oper_preds[i].kon_per_koniec,"' and ", --nevyberat operacie s presahom
"   pl_harmpolozka.idpl_harm in ",
"(select x.id from pl_harm x where ",  --podvyber vybera periodu kde predstihova operacia koncila
"	x.cpv = ",oper_preds[i].cpv," and ",
"	x.cov = ",oper_preds[i].cov," and ",
"	x.rok_zac = ",oper_preds[i].rok_koniec," and ",
"	x.tyzden_zac = ",oper_preds[i].tyz_koniec," and ",
"	x.perioda = ",oper_preds[i].per_koniec," and ",
"	x.platnost = 1) and ",
 "  pl_harmpolozka.idpo_stroje = ",oper_preds[i].idpo_stroje
 
whenever error continue
prepare prep_text_u008 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_u008
end if
{
update pl_harmpolozka set
   pl_harmpolozka.poradie = pl_harmpolozka.poradie - posun_por,
   pl_harmpolozka.zac_plan = pl_harmpolozka.zac_plan - oper_preds[i].posun,
   pl_harmpolozka.kon_plan = pl_harmpolozka.kon_plan - oper_preds[i].posun 
 where 
   pl_harmpolozka.zac_plan >= oper_preds[i].kon_plan and --vyber operacii za preds.operaciou
   pl_harmpolozka.kon_plan <= oper_preds[i].kon_per_koniec and --nevyberat operacie s presahom
   pl_harmpolozka.idpl_harm in
(select x.id from pl_harm x where  --podvyber vybera periodu kde predstihova operacia koncila
	x.cpv = oper_preds[i].cpv and
	x.cov = oper_preds[i].cov and
	x.rok_zac = oper_preds[i].rok_koniec and
	x.tyzden_zac = oper_preds[i].tyz_koniec and
	x.perioda = oper_preds[i].per_koniec and
	x.platnost = 1) and
   pl_harmpolozka.idpo_stroje = oper_preds[i].idpo_stroje
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    --let txt2 = " Polozka nebola najdena."
    --let a = false
    --nemusi byt posun
    let a = true
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
free prep_text_u008
return a
end function

############################
function posun_za_preds2(i)
############################
define i smallint
define a char
define posuny record
   id like pl_harmpolozka.id,
   zac_plan like pl_harmpolozka.zac_plan,
   kon_plan like pl_harmpolozka.kon_plan,
   cas_prace_plan like pl_harmpolozka.cas_prace_plan,
   kon_periody like pl_harm.kon_periody
end record  
define zac_miesta,kon_miesta datetime year to minute
define kon_presah_ods datetime year to minute
define zac_oper,kon_oper datetime year to minute
define posun_por smallint
define kon_oper_predch datetime year to minute
define j integer 
define l_text char(1000)

let a = true

if oper_preds[i].rok_zac = oper_preds[i].rok_koniec and
   oper_preds[i].tyz_zac = oper_preds[i].tyz_koniec and
   oper_preds[i].per_zac = oper_preds[i].per_koniec then
	let posun_por = 1
else
	let posun_por = 0
end if


let l_text =
"select ",
"   pl_harmpolozka.id, ",
"   pl_harmpolozka.zac_plan, ",
"   pl_harmpolozka.kon_plan, ",
"   pl_harmpolozka.cas_prace_plan, ",
"   pl_harm.kon_periody ",
"from pl_harmpolozka,pl_harm ",
"where ",
"pl_harm.id = pl_harmpolozka.idpl_harm and ",
"pl_harmpolozka.zac_plan >= '",oper_preds[i].kon_plan,"' and ", --vyber operacii za preds.operaciou
"pl_harmpolozka.kon_plan <= '",oper_preds[i].kon_per_koniec,"' and ", --nevyberat operacie s presahom
"pl_harmpolozka.idpl_harm in ",
"(select x.id from pl_harm x where ",  --podvyber vybera periodu kde predstihova operacia koncila
"	x.cpv = ",oper_preds[i].cpv," and ",
"	x.cov = ",oper_preds[i].cov," and ",
"	x.rok_zac = ",oper_preds[i].rok_koniec," and ",
"	x.tyzden_zac = ",oper_preds[i].tyz_koniec," and ",
"	x.perioda = ",oper_preds[i].per_koniec," and ",
"	x.platnost = 1) and ",
"pl_harmpolozka.idpo_stroje =", oper_preds[i].idpo_stroje," ",
"order by pl_harmpolozka.zac_plan "

whenever error continue
prepare prep_text3 from l_text
if sqlca.sqlcode = 0 then
	declare posun2 cursor for prep_text3
end if
{
select
   pl_harmpolozka.id,
   pl_harmpolozka.zac_plan,
   pl_harmpolozka.kon_plan,
   pl_harmpolozka.cas_prace_plan,
   pl_harm.kon_periody
from pl_harmpolozka,pl_harm
where
pl_harm.id = pl_harmpolozka.idpl_harm and
pl_harmpolozka.zac_plan >= oper_preds[i].kon_plan and --vyber operacii za preds.operaciou
pl_harmpolozka.kon_plan <= oper_preds[i].kon_per_koniec and --nevyberat operacie s presahom
pl_harmpolozka.idpl_harm in
(select x.id from pl_harm x where  --podvyber vybera periodu kde predstihova operacia koncila
	x.cpv = oper_preds[i].cpv and
	x.cov = oper_preds[i].cov and
	x.rok_zac = oper_preds[i].rok_koniec and
	x.tyzden_zac = oper_preds[i].tyz_koniec and
	x.perioda = oper_preds[i].per_koniec and
	x.platnost = 1) and
pl_harmpolozka.idpo_stroje = oper_preds[i].idpo_stroje
---
order by pl_harmpolozka.zac_plan
}

--lock table pl_harmpolozka in exclusive mode
initialize posuny.* to null
let j = 1
foreach 
   posun2 into posuny.*
   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Chyba pri vybere posunov! Cislo chyby:",sqlca.sqlcode using "-<<<<<&","."
	exit foreach
   end if
   ---hladanie hranic posunov---
   if j = 1 then
	let zac_miesta = posuny.zac_plan - oper_preds[i].posun
   else
	let zac_miesta = kon_oper_predch
   end if
   let kon_miesta = posuny.kon_periody
   call najdi_kon_presah_ods(oper_preds[i].idpo_stroje,zac_miesta,kon_miesta) returning a,kon_presah_ods
   if a then
	call najdi_hranice_oper(oper_preds[i].idpo_stroje,zac_miesta,kon_miesta,posuny.cas_prace_plan,kon_presah_ods) returning a,zac_oper,kon_oper
   else
	exit foreach
   end if
   -----------------------------
   if a then
	call upd_posuny_new2(posuny.id,zac_oper,kon_oper,posun_por) returning a
   else
	exit foreach
   end if
   initialize posuny.* to null
   let j = j + 1
   let kon_oper_predch = kon_oper
end foreach
whenever error stop
free posun2

return a
end function

############################
function posun_poradie_za_preds_presah(i)
############################
define try,a char
define i smallint
define l_text char(1000)
--define posun_por smallint

{
if oper_preds[i].rok_zac = oper_preds[i].rok_koniec and
   oper_preds[i].tyz_zac = oper_preds[i].tyz_koniec and
   oper_preds[i].per_zac = oper_preds[i].per_koniec then
	let posun_por = 1
else
	let posun_por = 0
end if
}

let try = true
let a = false
while try
let txt2 = ""
let l_text = 
"update pl_harmpolozka set ",
"   pl_harmpolozka.poradie = pl_harmpolozka.poradie - 1 ",
" where ",
"   pl_harmpolozka.zac_plan >= '",oper_preds[i].kon_plan,"' and ",
"   pl_harmpolozka.kon_plan > '",oper_preds[i].kon_per_koniec,"' and ",
"   pl_harmpolozka.idpl_harm = ",
"(select x.id from pl_harm x where ", --podvyber vybera periodu, kde koncila preds.operacie
"	x.cpv = ",oper_preds[i].cpv," and ",
"	x.cov = ",oper_preds[i].cov," and ",
"	x.rok_zac = ",oper_preds[i].rok_koniec," and ",
"	x.tyzden_zac = ",oper_preds[i].tyz_koniec," and ",
"	x.perioda = ",oper_preds[i].per_koniec," and ",
"	x.platnost = 1) and ",
"   pl_harmpolozka.idpo_stroje = ",oper_preds[i].idpo_stroje

whenever error continue
prepare prep_text_u001 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_u001
end if

{
update pl_harmpolozka set
   pl_harmpolozka.poradie = pl_harmpolozka.poradie - 1
 where 
   pl_harmpolozka.zac_plan >= oper_preds[i].kon_plan and
   pl_harmpolozka.kon_plan > oper_preds[i].kon_per_koniec and
   pl_harmpolozka.idpl_harm =
(select x.id from pl_harm x where --podvyber vybera periodu, kde koncila preds.operacie
	x.cpv = oper_preds[i].cpv and
	x.cov = oper_preds[i].cov and
	x.rok_zac = oper_preds[i].rok_koniec and
	x.tyzden_zac = oper_preds[i].tyz_koniec and
	x.perioda = oper_preds[i].per_koniec and
	x.platnost = 1) and
   pl_harmpolozka.idpo_stroje = oper_preds[i].idpo_stroje
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    --let txt2 = " Polozka nebola najdena."
    --let a = false
    --nemusi byt posun
    let a = true
    let try = false
   when -1
    --23.6.11 docasne riesenie konfliktu zamkov pri vyvazovani
    if sqlca.sqlcode = -346 then --lock conflict
       let a = true
    else
       let a = false
    end if
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
free prep_text_u001
return a
end function

############################
function upd_odober_oper(i)
############################
define i smallint
define try,a char
define l_text char(1000)

let try = true
let a = false
while try
let txt2 = ""
let l_text =
"update pl_harmpolozka set ",
"   pl_harmpolozka.min_zac_cas = '",ppolozka.kon_periody,"' ",
"where ", 
"pl_harmpolozka.idpl_sledpolozka in ",
"(select p.id from ",
"pl_sledpolozka p,pl_subeh s,pl_prac_uloha u ",
"where ",
"s.id = p.idpl_subeh and ",
"u.idpl_subeh = s.id and ",
"u.cislo_vp = '",oper_preds[i].cislo_vp,"' and ",
"u.stl = ",oper_preds[i].stlo," and ",
"u.riad = ",oper_preds[i].riado," and ",
"u.cisoper = ",oper_preds[i].cisopero,") and ",
"exists ", 
"(select x.id from pl_harm x where ", 
"x.platnost = 1 and ",
"x.id = pl_harmpolozka.idpl_harm) "

whenever error continue
prepare pre_text_u002 from l_text
if sqlca.sqlcode = 0 then
	execute pre_text_u002
end if
{
update pl_harmpolozka set
   pl_harmpolozka.min_zac_cas = ppolozka.kon_periody
where 
pl_harmpolozka.idpl_sledpolozka in
(select p.id from 
pl_sledpolozka p,pl_subeh s,pl_prac_uloha u
where
s.id = p.idpl_subeh and
u.idpl_subeh = s.id and
u.cislo_vp = oper_preds[i].cislo_vp and
u.stl = oper_preds[i].stlo and
u.riad = oper_preds[i].riado and
u.cisoper = oper_preds[i].cisopero) and
exists 
(select x.id from pl_harm x where 
x.platnost = 1 and
x.id = pl_harmpolozka.idpl_harm)
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    --let a = false
    let a = true --nemusi sa najst
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
free pre_text_u002
return a
end function

############################
function upd_preds_oper(i)
############################
define i smallint
define try,a char
define l_text char(1000)

let try = true
let a = false
while try
let txt2 = ""
let l_text = 
"update pl_harmpolozka set ",
"   pl_harmpolozka.max_kon_cas = '",ppolozka.zac_periody,"' ",
"where ", 
"pl_harmpolozka.idpl_sledpolozka in ",
"(select p.id from  ",
"pl_sledpolozka p,pl_subeh s,pl_prac_uloha u ",
"where ",
"s.id = p.idpl_subeh and ",
"u.idpl_subeh = s.id and ",
"u.cislo_vp = '",oper_preds[i].cislo_vp,"' and ",
"u.stlo = ",oper_preds[i].stl," and ",
"u.riado = ",oper_preds[i].riad," and ",
"u.cisopero = ",oper_preds[i].cisoper,") and ",
"exists ", 
"(select x.id from pl_harm x where ", 
"x.platnost = 1 and ",
"x.id = pl_harmpolozka.idpl_harm) "

whenever error continue
prepare prep_text_u003 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_u003
end if
{
update pl_harmpolozka set
   pl_harmpolozka.max_kon_cas = ppolozka.zac_periody
where 
pl_harmpolozka.idpl_sledpolozka in
(select p.id from 
pl_sledpolozka p,pl_subeh s,pl_prac_uloha u
where
s.id = p.idpl_subeh and
u.idpl_subeh = s.id and
u.cislo_vp = oper_preds[i].cislo_vp and
u.stlo = oper_preds[i].stl and
u.riado = oper_preds[i].riad and
u.cisopero = oper_preds[i].cisoper) and
exists 
(select x.id from pl_harm x where 
x.platnost = 1 and
x.id = pl_harmpolozka.idpl_harm)
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    --let a = false
    let a = true --nemusi  sa najst
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
free prep_text_u003
return a
end function


###########################
function uvolnenie_zakazky(cislo_vp)
###########################
define cislo_vp like vp_polot.cislo_vp
define a char
call vyb_ulohy(cislo_vp) returning a
if a then
   call trans_uvolnenie() returning a
   if not a then
	let txt1 = "Transakcia uvolnenia nepresla!"
   end if
end if
return a
end function


{
###################
function uvodny_algoritmus(cislo_vp,termin_poz_uv,idpl_poziad_progn)
###################
define cislo_vp like tpv:v_prikazy.cislo_vp
define term_mater_start date
define idpl_poziad_progn like pl_dostup_zdroja.idpl_poziad_progn
define a char
define i smallint
define pdatpotv like tpv:v_prikazy.datpotv
define dl_per_minuty integer
define p_stl like vp_polot.stl
define p_riad like vp_polot.riad
define p_cisoper like vp_polot.cisoper
define min_poc_per smallint --minimalny pocet period
define poc_per_oper smallint --pocet operacii na operaciu
define rok,tyzden,per smallint
define cas_zac_per,cas_kon_per datetime year to minute
define termin_poz_uv like pl_poziad_progn.termin_poz_uv

let gidpl_poziad_progn = idpl_poziad_progn
let dl_per_minuty = 84 * 60
call inic_postupy()
call vyb_final(cislo_vp) returning a
if a then
   call vyb_odb_postupy(idpl_poziad_progn,cislo_vp,"U") returning a
end if
if a then
   for i = 1 to k_post
	let p_stl = postupy[i].stl
	let p_riad = postupy[i].riad
	let p_cisoper = postupy[i].cisoper
	let poc_per_oper = postupy[i].celk_cas/dl_per_minuty	
	if postupy[i].celk_cas mod dl_per_minuty <> 0 then
	   let poc_per_oper = poc_per_oper + 1
	end if
	let postupy[i].poc_per_oper = poc_per_oper
	let min_poc_per = min_poc_per + poc_per_oper
	if i = 1 then
	   let term_mater_start = postupy[i].max_term_mat
	end if
   end for

   call perioda(extend(termin_poz_uv,year to minute)) returning rok,tyzden,per
   call perioda_posun2(rok,tyzden,per,"-",min_poc_per) returning rok,tyzden,per
   --test na materialove zdroje
   if term_mater_start is not null then
	call hranice_periody(rok,tyzden,per) returning cas_zac_per,cas_kon_per
	if extend(term_mater_start,year to minute) > cas_zac_per then
	   --ak nie je krytie tak zmena start.periody
	   call perioda(extend(term_mater_start,year to minute))  returning rok,tyzden,per
	end if
   end if
   ----------------------------
end if
return a,rok,tyzden,per
end function
}

###########################
function novy_algoritmus(cislo_vp,idpl_poziad_progn,termin_poz_uv,preplanovanie)
###########################
define cislo_vp like vp_polot.cislo_vp
define idpl_poziad_progn like pl_dostup_zdroja.idpl_poziad_progn
define termin_poz_uv like pl_poziad_progn.termin_poz_uv
define preplanovanie smallint --priznak ci ide o preplanovanie
define rok,tyzden,per smallint
define k smallint --uroven odober.operacii
define a,aa char
define b char --priznak ci sa podarilo zakazku zaradit 
define zac_per,kon_per datetime year to minute
define termin_prog_uv like pl_poziad_progn.termin_prog_uv
define termin_prog_natlac like pl_poziad_progn.termin_prog_natlac
define poc integer
define kon_plan_final like pl_harmpolozka.kon_plan
define kon_plan_natlac like pl_harmpolozka.kon_plan
define rok_natlac,tyz_natlac,per_natlac smallint
define zac_per_natlac,kon_per_natlac datetime year to minute
define p_max_kon_cas datetime year to minute

let a = true
let k = 1 
let termin_prog_uv = null
let termin_prog_natlac = null
let dlzka_periody = "84:00"

--poziadavka logickosti
if termin_poz_uv < today then
   let termin_poz_uv = today
end if
-----------------------

{
if a then
   call vytv_tab_polozka() returning a --vytvorenie docas.tabulky
end if
}
if a then
   call vyb_final(cislo_vp) returning a --vyber finalu z v_prikazy
end if
if a then
   let pp_26.cpv = gpodnik
   call vyb7_26a() returning a --vyber parametrov
end if
if a then
   --docasny test
   if plan.fin_stred = 152 or
   plan.fin_stred = 154 then
	let a = false
	let txt1 = "Zakazka ",cislo_vp," je final zakladnej vyroby ",plan.fin_stred using "<<<&","!"
   end if
   if plan.fin_stred = 153 then
	let a = false
	let txt1 = "Zakazka ",cislo_vp," je odpad odvadzany na oddeleni ",plan.fin_stred using "<<<&","!"
   end if
   --------------
end if
if a then
  if not preplanovanie then --iba pri rucnom prognozovani
--test na existenciu prognozovania
   whenever error continue
   select count(*) into poc 
   from pl_prac_uloha p
   where p.cislo_vp = cislo_vp
   whenever error stop
   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Zlyhal test na existenciu prognozovania! Chyba cislo:",sqlca.sqlcode using "-<<<<<&","!"
   end if 
   if a then
	if poc > 0 then
	   --if potvrd("Zakazka uz je prognozovana, chcete opatovne prognozovat?[a/n]:") then
		call uvolnenie_zakazky(cislo_vp) returning a
	   --else
		--let a = false
		--let txt1 = "Opatovne prognozovanie bolo presusene."
	   --end if
	end if
   end if
  end if
--------------
end if

if a then
   call perioda(extend(termin_poz_uv,year to minute)) returning rok,tyzden,per --najdenie periody ZUV
   call perioda_posun(rok,tyzden,per,"-") returning rok,tyzden,per --perioda finalna
   while true --cyklus pre urcenie finalnej periody
	call vytv_tab_polozka() returning a --create temp table
	--call del_tab_polozka() returning a
	if a then
	   call napln_tab_polozka(cislo_vp) returning a
	end if
	call upd_polozka_odb(cislo_vp,0,0,0,rok,tyzden,per,1) returning a --zapis max_kon_per do docas.tabulky
	if a then
	   call vyb_odb_postupy(idpl_poziad_progn,cislo_vp,"O") returning a --najdenie finalnej operacie --select operation and machines
	end if
	if a then
	   if postupy[1].datukvyr is not null then
	      --5.2.16 doplnena podmienka
	      if plan.ckz[1] = "I" then --vynimka pre VP na interne prevadzkove pokusy (IPP)
		--ok, bude sa prognozovat dalej
	      else
		let a = false
		let txt1 = "Finalna operacia je ukoncena, nemozno prognozovat!"
	      end if
	   end if
	   --novy test pri zmenenych podmienkach
	   if k_post = 0 then
		let a = false
		let txt1 = "Finalna operacia je ukoncena, nemozno prognozovat!"
	   end if
	end if
	if a then
	   while true --cyklus pre odoberajuce periody
		--9.9.10 nova vetva pre vyrobu valcov----------------------------------------------
		if postupy[1].ctv = 20 and --technologia vyroby valcov, len jedna v postupe!
		   plan.natlacokdat is not null and --termin natlacku
		   plan.kon_per_vyr_natlac < postupy[1].max_kon_cas then
		    let p_max_kon_cas = postupy[1].max_kon_cas --odpamatanie doteraz vyprognoz.hodnoty
		    let postupy[1].max_kon_cas = plan.kon_per_vyr_natlac
		    call perioda(plan.kon_per_vyr_natlac) returning postupy[1].max_kon_rok,postupy[1].max_kon_tyz,postupy[1].max_kon_per
		    while true --cyklus na najdenie miesta pre vyrobu valcov
			call zakl_algoritmus2() returning a,b --najdenie miesta a zapis max_kon_per do docas.tabulky
			if a then
			   if not b then
				call perioda_posun(postupy[1].max_kon_rok,postupy[1].max_kon_tyz,postupy[1].max_kon_per,"+") returning postupy[1].max_kon_rok,postupy[1].max_kon_tyz,postupy[1].max_kon_per
				call hranice_periody(postupy[1].max_kon_rok,postupy[1].max_kon_tyz,postupy[1].max_kon_per) returning zac_per,postupy[1].max_kon_cas
				--if postupy[1].max_kon_per > p_max_kon_cas then --oper.vyr.valcov uz posuva cely postup
				if postupy[1].max_kon_cas > p_max_kon_cas then --oper.vyr.valcov uz posuva cely postup
				   exit while                                  --je potrebne uz postupovat standardne
				end if                                         --a teda opustit cyklus
			   else --naslo sa miesto pre vyrobu valcov
				exit while
			   end if
			else
			   exit while
			end if
		    end while
		-----------------------------------------------------------------------------------
		else --doterajsia vetva
		    call zakl_algoritmus2() returning a,b --najdenie miesta a zapis max_kon_per do docas.tabulky --algoritm, it not add memory consuption
		end if
		if a then
		   --11.12.09 zmena----------------
		   if b and --naslo sa miesto
		      postupy[1].stl = 0 and --finalna operacia
		      postupy[1].riad = 0 and
		      postupy[1].cisoper = 0 then
			let kon_plan_final = ppolozka.kon_plan
		   end if
		   --------------------------------
		   --9.9.10 zmena---------------
		   if b and --naslo sa miesto
		      postupy[1].ctv = 20 then --technologia vyroby valcov
			let kon_plan_natlac = ppolozka.kon_plan
		   end if
		   --------------------------------
		   if not b then --test ci sa podarilo umiestnenie
			--Zrusenie docasnych tabuliek-------------
			call zrus_tab_polozka() returning a
			--call del_tab_polozka() returning a
			------------------------------------------
			if a then
			   call perioda_posun(rok,tyzden,per,"+") returning rok,tyzden,per --posun finalnej periody
			end if
			exit while
		   end if
		   call vyb_odb_postupy(idpl_poziad_progn,cislo_vp,"O") returning a --vyber odober.operacii
		end if
		if a then
		   if k_post = 0 then --uz sa nenasli ziadne dalsie odober.operacie
			exit while
		   end if
		else
		   exit while
		end if
	   end while
	   if a then
		if b then
		   exit while --odchod z hlavneho cyklu lebo prognozovanie bolo uspesne
		end if
	   else
		exit while --odchod z hlavneho cyklu pre chybu vo vedlajsom cykle
	   end if
	else
	   exit while --odchod z hlavneho cyklu pre chybu 
	end if
   end while
end if

if a then
   --call zapis_do_db() returning a 
end if
call zrus_tab_polozka() returning aa --rusenie tabulky je nezavisle
{
if a then
   call del_tab_polozka() returning a
end if
}

if a then
   --urcenie terminu zuv
   --11.12.09-Zmena urcenia konecnej periody-----
   call perioda(kon_plan_final) returning rok,tyzden,per
   ----------------------------------------------
   call perioda_posun(rok,tyzden,per,"+") returning rok,tyzden,per --perioda ZUV
   call hranice_periody(rok,tyzden,per) returning zac_per,kon_per
   let termin_prog_uv = date(zac_per)
	
--22.6.10 Ukazalo sa, ze je to mylne => vyhadzujem podmienku
{
   if termin_prog_uv < termin_poz_uv then
	let termin_prog_uv = termin_poz_uv
   end if
}
   --urcenie terminu natlacku
   if plan.natlacokdat is not null then
	call perioda(kon_plan_natlac) returning rok,tyzden,per
	call perioda_posun(rok,tyzden,per,"+") returning rok,tyzden,per --perioda terminu natlacku
	call hranice_periody(rok,tyzden,per) returning zac_per,kon_per
	let termin_prog_natlac = date(zac_per)
   end if
end if
----------------------

return a,termin_prog_uv,termin_prog_natlac
end function


########################################
function zakl_algoritmus2()
########################################
define rok,tyz,per smallint --zaciatocna perioda
define a char
define b char --priznak ci sa podarilo zaradit
define i,j smallint
define termin_prog_uv like pl_poziad_progn.termin_prog_uv
define zac_per like pl_harm.zac_periody
define kon_per like pl_harm.kon_periody
define p_stl like vp_polot.stl
define p_cisoper like vp_polot.cisoper
define dl_per_minuty integer
define posun_per smallint
define min_cas_pripravy interval hour(3) to minute

let a = true
let b = false
let dl_per_minuty = 84 * 60

--cyklus odober.operacii
for i = 1 to k_post
   let rok = postupy[i].max_kon_rok
   let tyz = postupy[i].max_kon_tyz
   let per = postupy[i].max_kon_per

   -----test ukoncenej operacie--------
   --if postupy[i].datukvyr is not null then
   if postupy[i].datukvyr is not null and postupy[i].stl <> 0 then
	call trans_zapis_docas_uk_oper(postupy[i].cislo_vp,postupy[i].stl,postupy[i].riad,postupy[i].cisoper,rok,tyz,per) returning a
	if a then
	   let b = true
	   continue for
	else
	   exit for
	end if
   end if
   ------------------------------------

   ------zistovanie startovacej periody------
   let postupy[i].poc_per_oper = postupy[i].celk_cas/dl_per_minuty	
   if postupy[i].celk_cas mod dl_per_minuty <> 0 then
	let postupy[i].poc_per_oper = postupy[i].poc_per_oper + 1
   end if
   let posun_per = postupy[i].poc_per_oper - 1 	--posun moze byt aj rovny nule

   --17.7.08 specialna podmienka pre velke operacie
   if postupy[i].stl > 0 and --iba pre nefinalne operacie
      posun_per > 0 then --velke operacie na viac period
	if postupy[k_post].caszrenia >= (48*60) then --nasobene 60,lebo caszrenia je v selecte prepocitany v minutach!
	   let posun_per = 1 --vacsi odstup medzi operaciami ak je zrenie
	else
	   let posun_per = 0 --bezny odstup
	end if
   end if
   ------------------------------------------------------------------------
{
   --25.10.10 vyhodena podmienka, lebo bola moc stedra na cas
   --7.9.10 specialna podmienka pre operacie vyroby valcov------
   if postupy[i].ctv = 20 then
      let posun_per = 1 --vacsi odstup medzi operaciami aby sa stihalo
   end if
   --------------------------------------------------------------
}

   --Test na hranicny termin ukoncenia-----
   --tuto doplnit test ci koniec periody neprekracuje hranicny term.ukoncenia,
   --ma to vyznam hlavne pri velkych prelinajucich sa operaciach
   ----------------------------------------

   call perioda_posun2(rok,tyz,per,"-",posun_per) returning rok,tyz,per
   ------------------------------------------
   -----------Blok na zaradenie operacie---------
   while true
	-----test na prekrocenie minimalneho casu zaciatku----
	call hranice_periody(rok,tyz,per) returning zac_per,kon_per
	if postupy[i].min_zac_cas is null or
	   (postupy[i].min_zac_cas < ref_cas) then
	   if zac_per < ref_cas then
	   --(postupy[i].min_zac_cas < (current - 5 units hour)) then
	   --if zac_per < (current - 5 units hour) then
		let b = false
		exit while
	   end if
	else
	   if zac_per < postupy[i].min_zac_cas then
		let b = false
		exit while
	   end if
	end if
	------------------------------------------------------


	--17.3.10 Test na minimalnu pripravu potl.foriem------
	if postupy[i].kod_oper = "TLA" then --len potlacove operacie
	   let min_cas_pripravy = interval(00:00) hour to minute
	   if plan.nova_grafika = "G" then
		if plan.tlac1 = 1 then --HTL
		   let min_cas_pripravy = interval(168:00) hour(3) to minute
		else
		   let min_cas_pripravy = interval(84:00) hour to minute
		end if
	   else
		if plan.stav_archivu is null or
		   plan.stav_archivu not matches "[AGTHp]" then --nie su archivovane formy
		    if plan.tlac1 = 1 then --HTL
			let min_cas_pripravy = interval(84:00) hour to minute
		    else
			let min_cas_pripravy = interval(24:00) hour to minute
		    end if
		end if
	   end if
	   if (zac_per - min_cas_pripravy) < ref_cas then
		let b = false
		exit while
	   end if
	end if
	------------------------------------------------------

	--naplnenie hranicnych terminov---
	let postupy[i].min_zac_cas_hr = zac_per
	let postupy[i].max_kon_cas_hr = kon_per + postupy[i].cas_zost_i
	----------------------------------
	call skenuj_stroje2(rok,tyz,per,i) returning a,b 
	if a then
	   if b then --priznak ci sa podarilo zaradit
		exit while
	   else
		call perioda_posun(rok,tyz,per,"-") returning rok,tyz,per --posun zac.periody
	   end if
	else
		exit while
	end if
   end while
   ----------------------------------------------
   if not a then
	exit for
   else
	--19.1.11 doplnena podmienka
        if not b then
	    exit for
	end if
   end if
end for

return a,b
end function

#######################
function skenuj_stroje2(rok,tyzden,per,i)
#######################
define rok,tyzden,per smallint --startovacia perioda
define a char --priznak ci nastala nejaka chyba, vtedy a = false
define aa char --priznak, ci sa rezervuje na oddelenie
define b char --priznak ci sa podarilo zaradit
define bb char --priznak ci sa podarilo zaradit,bez rezervacie
define c char --priznak ci sa prekrocili hranice
define i smallint
define j smallint
define posun char --priznak ci sa posuvaju ine ulohy
define poc_pouz_stroj smallint --pocet pouzitelnych strojov
--------premmene pre chybovy hlasku a mail
define hlavicka char(100)
define l_text char(2500)
define adresa char(50)
define text_e char(200)
--------


let a = true
let b = false
let bb = false
let poc_pouz_stroj = 0

--if postupy[i].cas_plan_i <= dlzka_periody then
if postupy[i].cas_zost_i <= dlzka_periody then
   let posun = false --na zaciatku sa skusa umiestnit bez posuvu
else
   let posun = true --pre operaciu vacsiu ako perioda posuv nema zmysel
end if
while true
	--Lycia
   start report print_error2 to "file_error.txt"
   for j = 1 to postupy[i].k_stroj
	if stroj[i,j].pouzitelny then --test pouzitelnosti stroja
	   let poc_pouz_stroj = poc_pouz_stroj + 1
	else
		let txt2 = "C.stroja:",stroj[i,j].cstroj using "<<<&",", ",stroj[i,j].test_param_text clipped
		
		output to report print_error2(i,txt2)
	    continue for
	end if
	call najdi_miesto2(rok,tyzden,per,stroj[i,j].idpo_stroje,posun,i) returning a,b,c
	if a then
	   if b then
	      if pp_26.rezervacia_zapnuta = 1 then --28.5.13 doplnene
		--exit for --stary kod
		--30.3.11 novy kod----------------
{
		if postupy[i].cov = 155 or
		   postupy[i].cov = 172 or --4.3.16 doplnene oddelenie
		   postupy[i].cov = 178 or
		   postupy[i].cov = 192 then
}
		call test_odd_rezervacia(postupy[i].podv,postupy[i].cov) returning a,aa
		if a and aa then
			let bb = true
			call test_kapacity2(rok,tyzden,per,stroj[i,j].idpo_stroje_skup,stroj[i,j].cstroj_skup,i) returning a,b
			if a then 
			   if b then
				--rezervacia sa nasla a tak sa potvrdzuje opustenie cyklu for
				exit for
			   else
				--POZOR! doplnena vetva pre variantu ak sa rezervuje na cov
				--nema vyznam hladat dalsi stroj ked na celom oddeleni nie je kapacita
				let b = false
				exit for
			   end if
			else
			   --nastala chyba a tak sa opusta cyklus for
			   exit for
			end  if
		else
			exit for
		end if
		----------------------------------
	      else
		--cesta ak je rezervacia vypnuta
		exit for
	      end if
	   end if
	else
	   exit for
	end if
   end for
   finish report print_error2
   ---Lycia
   
   --test na existenciu pouzitelneho stroja
   if poc_pouz_stroj = 0 then
	let a = false	
	let hlavicka = "Na odd.",postupy[i].cov using "<<<&"," sa nenasiel vhodny stroj!"," Cislo VP:",postupy[i].cislo_vp
	---
        let adresa = "hucko.l@chemosvit.sk"
        let text_e = "mailx -s '",hlavicka clipped,"' ",adresa clipped," < file_error.txt "
        ---Lycia
        ---run text_e clipped
	-----------18.10.2017 doplnene adresy na informaciu o problemoch prognozovania
        let adresa = "kacmarakova.e@chemosvit.sk"
        let text_e = "mailx -s '",hlavicka clipped,"' ",adresa clipped," < file_error.txt "
        ---Lycia
        ---run text_e clipped
	---
        let adresa = "badurova.a@chemosvit.sk"
        let text_e = "mailx -s '",hlavicka clipped,"' ",adresa clipped," < file_error.txt "
        ---Lycia
        ---run text_e clipped
	-----------
        let textchy = "vacviewer ","file_error.txt 1 0 0 0 0 "
        ---Lycia
        ---run textchy
	call resizeobr(glargebrowse)
	let txt1 = hlavicka clipped
	--let txt1 = txt1 clipped," CVP:",postupy[i].cislo_vp," CSV:",postupy[i].csv," ",txt2
   end if

   ----------------------------------------
   if a then
	if b then
	   -------------------------
	   --presun zapisu z najdi_miesto2() kvoli pribudnutej rezervacii
	   call trans_zapis_docas() returning a
	   -------------------------
	   exit while --naslo sa miesto
	else
	   if c then
		exit while --hranice boli prekrocene
	   end if
	   --5.4.11 doplnene pre rezervaciu---
	   if bb then
		exit while --naslo sa miesto, ale nie rezervacia, posun nema zmysel
	   end if
	   -----------------------------------
	   if not posun then
		let posun = true --novy pokus o umiestnenie s posunom
	   else
		exit while --nenaslo sa miesto
	   end if
	end if
   else
	exit while
   end if
end while
return a,b
end function

#######################
function test_odd_rezervacia(l_cpv,l_cov)
#######################
define l_cpv like pl_rezerv_odd.cpv
define l_cov like pl_rezerv_odd.cov
define l_pocet smallint
define try,a,b char

let try = true
let a = false
let b = false
let l_pocet = 0

while try
let txt2 = ""
whenever error continue
select
	count(*)
into
	l_pocet
from pl_rezerv_odd o
where
o.cpv  = l_cpv and
o.cov = l_cov and
o.platnost = 1
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		if l_pocet > 0 then
			let b = true
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			--toto by pri count(*) nemalo nastat
			let txt1 = ""
		end if
	end if
return a,b
end function

#######################
function test_kapacity2(rok,tyz,per,idpo_stroje,cstroj_skup,i)
#######################
define rok,tyz,per smallint --startovacia perioda
define idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define cstroj_skup like polot2:po_stroje.cstroj
define i smallint
define a char --priznak ci nastala nejaka chyba, vtedy a = false
define b char --priznak ci sa podarilo zaradit
define ma_rezerv char --priznak ci ma top firma rezervovanu kapacitu
define rezerv_kapac_zaciatku,rezerv_kapac_konca like pl_rezerv_kapacita.rezerv_kapacita
define obsadena_kapac_zaciatku,obsadena_kapac_konca like pl_rezerv_kapacita.rezerv_kapacita
define volna_kapac_zaciatku,volna_kapac_konca interval day(3) to minute
-------------
define obd_zaciatku,obd_konca datetime year to month
define cas_zaciatku,cas_konca interval day(3) to minute
define zac_zaciatku,kon_zaciatku,zac_konca,kon_konca datetime year to minute
define odstavky_zaciatku,odstavky_konca like pl_rezerv_kapacita.rezerv_kapacita
define zac_obd,kon_obd like pl_kalendar_obdobi.zac_obdobia
define p_idnad_spol1_zaciatku,p_idnad_spol1_konca like pl_rezerv_kapacita.idnad_spol1
define aktual_rok,aktual_tyz,aktual_per smallint --aktualna perioda
define zac_per,kon_per,aktual_zac_per,aktual_kon_per,aktual_cas datetime year to minute
define podiel_sklzu like pl_rezerv_kapacita.rezerv_kapacita

--4.8.11 test na uvolnenie rezervovanej kapacity------------
call hranice_periody(rok,tyz,per) returning zac_per,kon_per
let aktual_cas = current year to minute
call perioda(aktual_cas) returning aktual_rok,aktual_tyz,aktual_per
call hranice_periody(aktual_rok,aktual_tyz,aktual_per) returning aktual_zac_per,aktual_kon_per
if kon_per - aktual_kon_per <= interval(7 00:00) day(3) to minute then  --2 periody a menej
   let a = true
   let b = true
   return a,b
end if
------------------------------------------------------------

let a = true
let b = false
let ma_rezerv = false
let obd_zaciatku = extend(ppolozka.zac_plan,year to month)
let obd_konca = extend(ppolozka.kon_plan,year to month)
let p_idnad_spol1_zaciatku = plan.idnad_spol1 --prvotne naplnenie premennej pret testom existencie rezervacie
let p_idnad_spol1_konca = plan.idnad_spol1 --prvotne naplnenie premennej pret testom existencie rezervacie

--Dolezite prvotne testovanie ci top firma ma nejaku rezervaciu v obdobiach-------------
if p_idnad_spol1_zaciatku is not null then
   if a then
	call test_existencie_rezervacie(postupy[i].podv,obd_zaciatku,postupy[i].cov,p_idnad_spol1_zaciatku) returning a,ma_rezerv
   end if
   if a then
	--if top firma nema rezerciu na obdobie zaciatku, bude posudzovana ako ostatne firmy
	if not ma_rezerv then
	   let p_idnad_spol1_zaciatku = null
	end if
   end if
end if
if obd_konca <> obd_zaciatku then
   if p_idnad_spol1_konca is not null then
	if a then
	   call test_existencie_rezervacie(postupy[i].podv,obd_konca,postupy[i].cov,p_idnad_spol1_konca) returning a,ma_rezerv
	end if
	if a then
	   --if top firma nema rezerciu na obdobie konca, bude posudzovana ako ostatne firmy
	   if not ma_rezerv then
		let p_idnad_spol1_konca = null
	   end if
	end if
   end if
end if
-----------------------------------------------------------------------------

if obd_zaciatku = obd_konca then --operacia je v tom istom obdobi
   let zac_zaciatku = ppolozka.zac_plan
   let kon_zaciatku = ppolozka.kon_plan

   let cas_zaciatku = postupy[i].cas_zost_i 
   let cas_konca = interval(00 00:00) day to minute
   let rezerv_kapac_konca = interval(000 00:00) day(3) to minute
   let obsadena_kapac_konca = interval(000 00:00) day(3) to minute

   if a then
	call zisti_rezerv_kapacitu2(obd_zaciatku,idpo_stroje,p_idnad_spol1_zaciatku,i) returning a,rezerv_kapac_zaciatku
   end if
   if a then
	call zisti_obsadenu_kapacitu2(obd_zaciatku,idpo_stroje,p_idnad_spol1_zaciatku,i) returning a,obsadena_kapac_zaciatku
   end if
else
   if a then
	call vyb_hranice_obd(postupy[i].podv,obd_zaciatku) returning a,zac_obd,kon_obd
   end if
   if a then
	let zac_zaciatku = ppolozka.zac_plan
	let kon_zaciatku = kon_obd
	let zac_konca = kon_zaciatku
	let kon_konca = ppolozka.kon_plan
   end if

   if a then
	call vyb_odstavky_useku(zac_zaciatku,kon_zaciatku,idpo_stroje) returning a,odstavky_zaciatku
   end if
   if a then
	call vyb_odstavky_useku(zac_konca,kon_konca,idpo_stroje) returning a,odstavky_konca
   end if
   if a then
	let cas_zaciatku = kon_zaciatku - zac_zaciatku
	let cas_zaciatku = cas_zaciatku - odstavky_zaciatku
	let cas_konca = kon_konca - zac_konca
	let cas_konca = cas_konca - odstavky_konca 
   end if

   if a then
	call zisti_rezerv_kapacitu2(obd_zaciatku,idpo_stroje,p_idnad_spol1_zaciatku,i) returning a,rezerv_kapac_zaciatku
   end if
   if a then
	call zisti_rezerv_kapacitu2(obd_konca,idpo_stroje,p_idnad_spol1_konca,i) returning a,rezerv_kapac_konca
   end if
   if a then
	--vola sa uz dalsia funkcia, aby sa usetril vyber obdobia
	call zisti_obsadenu_kapacitu(zac_obd,kon_obd,idpo_stroje,p_idnad_spol1_zaciatku,i) returning a,obsadena_kapac_zaciatku
   end if
   if a then
	call zisti_obsadenu_kapacitu2(obd_konca,idpo_stroje,p_idnad_spol1_konca,i) returning a,obsadena_kapac_konca
   end if
end if

--30.7.2013 zruseny prenos podielu sklzu pre top firmy so suhlasom p.Olejara
{
--5.8.11 podiel sklzu top firiem---------
if a then
   if extend(today,year to month) = obd_zaciatku then --obdobie zaciatku je aktualne obdobie
	call daj_podiel_sklzu(rezerv_kapac_zaciatku,idpo_stroje,postupy[i].podv,obd_zaciatku,postupy[i].cov) returning a,podiel_sklzu
	if a then
	   let obsadena_kapac_zaciatku = obsadena_kapac_zaciatku + podiel_sklzu
	end if
   end if
end if
------------------------------------------
}

if a then
   let volna_kapac_zaciatku = rezerv_kapac_zaciatku - obsadena_kapac_zaciatku
   let volna_kapac_konca = rezerv_kapac_konca - obsadena_kapac_konca
   if cas_zaciatku <= volna_kapac_zaciatku then
	let b = true --naslo sa miesto na zaciatku
   else
	let b = false
   end if
   if b then
     if cas_konca <= volna_kapac_konca then
	let b = true --naslo sa miesto na konci
     else
 	let b = false
     end if
   end if
end if
return a,b
end function

#######################
function zisti_rezerv_kapacitu2(p_obdobie,p_idpo_stroje,p_idnad_spol1,i)
#######################
define p_obdobie like pl_rezerv_kapacita.obdobie
define p_idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define i smallint
define rezerv_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define a char(1)
define ma_rezerv char(1)

let a = true
let ma_rezerv = false

{
--test rezervacie bol presunuty na vyzsiu uroven
--Testovanie ci top firma ma nejaku rezervaciu---
if p_idnad_spol1 is not null then
   call test_existencie_rezervacie(postupy[i].podv,p_obdobie,postupy[i].cov,p_idnad_spol1) returning a,ma_rezerv
   if a then
	--if top firma nema rezerciu na obdobie zaciatku a ani konca, bude posudzovana ako ostatne firmy
	if not ma_rezerv then
	   let p_idnad_spol1 = null
	end if
   end if
else
   let a = true
end if
----------------------------------------------------
}
if a then
   call vyb_rezerv_kapacitu2(postupy[i].podv,p_obdobie,postupy[i].cov,p_idpo_stroje,p_idnad_spol1) returning a,rezerv_kapacita
end if
return a,rezerv_kapacita
end function

#######################
function zisti_obsadenu_kapacitu2(p_obdobie,p_idpo_stroje,p_idnad_spol1,i)
#######################
define p_obdobie like pl_rezerv_kapacita.obdobie
define p_idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define i smallint
define zac_obd,kon_obd like pl_kalendar_obdobi.zac_obdobia
define celk_obsadena_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define a char

let a = false
call vyb_hranice_obd(postupy[i].podv,p_obdobie) returning a,zac_obd,kon_obd
if a then
   call zisti_obsadenu_kapacitu(zac_obd,kon_obd,p_idpo_stroje,plan.idnad_spol1,i) returning a,celk_obsadena_kapacita
end if

return a,celk_obsadena_kapacita
end function

#######################
function vyb_hranice_obd(p_cpv,p_obdobie)
#######################
define p_cpv like pl_kalendar_obdobi.cpv
define p_obdobie like pl_kalendar_obdobi.obdobie
define zac_obd,kon_obd like pl_kalendar_obdobi.zac_obdobia
define try,a char

let try = true
let a = false

while try
let txt2 = ""
whenever error continue
select
	o.zac_obdobia,
	o.kon_obdobia
into
	zac_obd,
	kon_obd
from pl_kalendar_obdobi o
where
o.cpv  = p_cpv and
o.obdobie = p_obdobie
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Obdobie v kalendari obdobi nebolo najdene!"
		end if
	end if
return a,zac_obd,kon_obd
end function

#######################
function test_kapacity(rok,tyz,per,idpo_stroje,cstroj_skup,i)
#######################
define rok,tyz,per smallint --startovacia perioda
define idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define cstroj_skup like polot2:po_stroje.cstroj
define i smallint
define a char --priznak ci nastala nejaka chyba, vtedy a = false
define b char --priznak ci sa podarilo zaradit
define stred_pl_mes,zac_pl_mes,kon_pl_mes datetime year to minute
define zac_per,kon_per datetime year to minute
define rezerv_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define obsadena_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define volna_kapacita interval hour(4) to minute

let a = true
let b = false

--urcenie stredu plavajuce tyzdna a jeho hranic
call hranice_periody(rok,tyz,per) returning zac_per,kon_per
--let stred_pl_mes = zac_per + postupy[i].cas_zost_i
let stred_pl_mes = zac_per + (postupy[i].cas_zost_i/2) --stred plavajuceho mesiaca dany do stredu operacie
--let zac_pl_mes = stred_pl_mes - 14 units day
--let kon_pl_mes = stred_pl_mes + 14 units day
--pokus s novym rozdelenim plavajuceho mesiaca, pretoze kazdy chce veci skor a skorsie mesiace maju vacsiu vahu
let zac_pl_mes = stred_pl_mes - 21 units day
let kon_pl_mes = stred_pl_mes + 7 units day
-----------------------------------------------
call zisti_rezerv_kapacitu(zac_pl_mes,kon_pl_mes,idpo_stroje,plan.idnad_spol1,i) returning a,rezerv_kapacita
if a then
   call zisti_obsadenu_kapacitu(zac_pl_mes,kon_pl_mes,idpo_stroje,plan.idnad_spol1,i) returning a,obsadena_kapacita
end if
if a then
   let volna_kapacita = (rezerv_kapacita - obsadena_kapacita)
   if postupy[i].cas_zost_i <= volna_kapacita then
	let b = true --naslo sa miesto
   else
	let b = false
	--let txt1 = "Nenasla sa dostatocna rezervacia na odd. ",postupy[i].cov using "<<<&"," c.stroja ",cstroj using "<<<&","!"
   end if
end if
return a,b
end function

###################################################################################
function zisti_rezerv_kapacitu(zac_pl_mes,kon_pl_mes,idpo_stroje,idnad_spol1,i)
###################################################################################
define zac_pl_mes,kon_pl_mes datetime year to minute
define idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define i smallint
define mes_zaciatku,mes_konca smallint --rezervovane mesiace zaciatocnej a konecnej casti zakazky
define pocet_hod_mes_zaciatku,pocet_hod_mes_konca interval hour(9) to hour
define pocet_hod_mes_zaciatku_char,pocet_hod_mes_konca_char char(15)
define pocet_hod_mes_zaciatku_int,pocet_hod_mes_konca_int integer
define pocet_hod_mes_zaciatku_dec,pocet_hod_mes_konca_dec,priem_odstavka_na_stroj dec(6,3)
define obdobie_zaciatku,obdobie_konca like pl_rezerv_kapacita.obdobie
define rezerv_kapacita,rezerv_kapacita_zaciatku,rezerv_kapacita_konca like pl_rezerv_kapacita.rezerv_kapacita
define rezerv_min_na_hod dec(10,4)
define zac_zaciatku,kon_zaciatku,zac_konca,kon_konca datetime year to minute
define a,ma_rezerv char

let a = true
let ma_rezerv = false
let rezerv_kapacita = interval(000 00:00) day(3) to minute
let rezerv_kapacita_zaciatku = interval(000 00:00) day(3) to minute
let rezerv_kapacita_konca = interval(000 00:00) day(3) to minute

let mes_zaciatku = month(zac_pl_mes)
let mes_konca = month(kon_pl_mes)

let obdobie_zaciatku = extend(zac_pl_mes,year to month)
let obdobie_konca = extend(kon_pl_mes,year to month)

if mes_konca > mes_zaciatku then 
   let zac_zaciatku = zac_pl_mes
   let kon_zaciatku = extend(mdy(month(zac_pl_mes)+1,1,year(zac_pl_mes)),year to minute)
   let pocet_hod_mes_zaciatku = kon_zaciatku - zac_zaciatku

   let zac_konca = kon_zaciatku
   let kon_konca = kon_pl_mes
   let pocet_hod_mes_konca = kon_konca - zac_konca
   -----
   let pocet_hod_mes_zaciatku_char = pocet_hod_mes_zaciatku
   let pocet_hod_mes_zaciatku_int = pocet_hod_mes_zaciatku_char
   let pocet_hod_mes_zaciatku_dec = pocet_hod_mes_zaciatku_int

   let pocet_hod_mes_konca_char = pocet_hod_mes_konca
   let pocet_hod_mes_konca_int = pocet_hod_mes_konca_char
   let pocet_hod_mes_konca_dec = pocet_hod_mes_konca_int
else
   let zac_zaciatku = zac_pl_mes
   let kon_zaciatku = kon_pl_mes
   let pocet_hod_mes_zaciatku = kon_pl_mes - zac_pl_mes
   -----
   let pocet_hod_mes_zaciatku_char = pocet_hod_mes_zaciatku
   let pocet_hod_mes_zaciatku_int = pocet_hod_mes_zaciatku_char
   let pocet_hod_mes_zaciatku_dec = pocet_hod_mes_zaciatku_int
   let pocet_hod_mes_konca_dec = 0
end if


--Testovanie ci top firma ma nejaku rezervaciu---
if a then
 if idnad_spol1 is not null then
   --test na obdobie zaciatku
   call test_existencie_rezervacie(postupy[i].podv,obdobie_zaciatku,postupy[i].cov,idnad_spol1) returning a,ma_rezerv
   if a then
	if not ma_rezerv then
	   if obdobie_konca <> obdobie_zaciatku then
		--test na obdobie konca
		call test_existencie_rezervacie(postupy[i].podv,obdobie_konca,postupy[i].cov,idnad_spol1) returning a,ma_rezerv
	   end if
	end if
	if a then
	   --if top firma nema rezerciu na obdobie zaciatku a ani konca, bude posudzovana ako ostatne firmy
	   if not ma_rezerv then
		let idnad_spol1 = null
	   end if
	end if
   end if
 end if
end if
----------------------------------------------------

if a then
   if pocet_hod_mes_zaciatku_dec > 0 then
	call vyb_rezerv_min_na_hod(postupy[i].podv,obdobie_zaciatku,postupy[i].cov,idpo_stroje,idnad_spol1) returning a,rezerv_min_na_hod
	if a then
	   call vyb_priem_odstavky_useku(zac_zaciatku,kon_zaciatku,idpo_stroje) returning a,priem_odstavka_na_stroj
	end if
	if a then
	   let rezerv_kapacita_zaciatku = rezerv_kapacita_zaciatku + 
	       ((pocet_hod_mes_zaciatku_dec - priem_odstavka_na_stroj) * rezerv_min_na_hod) units minute
	end if
   end if
end if
if a then
   if pocet_hod_mes_konca_dec > 0 then
	let rezerv_min_na_hod = null
	call vyb_rezerv_min_na_hod(postupy[i].podv,obdobie_konca,postupy[i].cov,idpo_stroje,plan.idnad_spol1) returning a,rezerv_min_na_hod
	if a then
	   call vyb_priem_odstavky_useku(zac_konca,kon_konca,idpo_stroje) returning a,priem_odstavka_na_stroj
	end if
	if a then
	   let rezerv_kapacita_konca = rezerv_kapacita_konca +
	       ((pocet_hod_mes_konca_dec - priem_odstavka_na_stroj) * rezerv_min_na_hod) units minute
	end if
   end if
end if
if a then
   let rezerv_kapacita = rezerv_kapacita_zaciatku + rezerv_kapacita_konca
end if
return a,rezerv_kapacita
end function

#######################
function vyb_rezerv_min_na_hod(p_cpv,p_obdobie,p_cov,p_idpo_stroje,p_idnad_spol1)
#######################
define p_cpv like pl_rezerv_kapacita.cpv
define p_obdobie like pl_rezerv_kapacita.obdobie
define p_cov like pl_rezerv_kapacita.cov
define p_idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define dispon_kapacita,rezerv_kapacita,mozna_kapacita integer --tieto premenne su minutach
define interval_obdobia,priem_odstavka_na_stroj_obd dec(6,3) --tieto premenne su v hodinach
define rezerv_min_na_hod dec(10,4)
define poc_strojov smallint
define try,a char
define l_text char(2000)

--initialize plan.* to null
let try = true
let a = false
while try
let txt2 = ""
--whenever error continue
if p_idnad_spol1 is not null then
	--vyber pre top firmy
	let l_text =
		"select ",
	   "(select sum(ka.kon_smeny - ka.zac_smeny) kapacita ",
	   "from polot2:po_stroje s,",
	   "pl_paramstroj p,",
	   "pl_kalendar_smien ka,",
	   "pl_skup_stroj sk ",
	   "where ",
	   "sk.idpo_stroje = s.id and ",
	   "s.id = p.idpo_stroje and ",
	   --s.kodstr<>'TEST' and
	   --s.kodstr<>'SLEEP' and
	   --5.4.12----------------------
	   "current between s.platnostod and s.platnostdo and ",
	   "s.planovanie = 'A' and ",
	   ------------------------------
	   "ka.cpv = s.cp and ",
	   "exists ",
	   "( ",
	   "select kk.id ",
	   "from pl_kapkalendar kk where ",
	   "kk.kod_useku = 'R' and ",
	   "ka.cpv = kk.cpv and ",
	   "ka.zac_smeny >= kk.zac_useku and ",
	   "ka.kon_smeny <= kk.kon_useku and ",
	   "kk.idpo_stroje = s.id ",
	   ") and ",
	   "ka.cpv = k.cpv and ",
	   "ka.obdobie = k.obdobie and ",
	   --s.id = r.idpo_stroje
	   --s.cp = r.cpv and
	   --s.co = r.cov
	   "sk.idpo_stroje_skup = r.idpo_stroje ",
	   -----------------------------
	   ")::interval minute(9) to minute::char(20)::integer dispon_kapacita, ",
	   "(k.kon_obdobia - k.zac_obdobia)::interval hour(9) to hour::char(20)::integer::dec(6,3) interval_obdobia, ",
	   "(select count(*)*(k.kon_obdobia - k.zac_obdobia) ",
	   "from pl_skup_stroj j where ",
	   "j.platnost = 1 and ",
	   "j.idpo_stroje_skup = r.idpo_stroje)::interval minute(9) to minute::char(20)::integer mozna_kapacita, ",
	   "(select count(*) ",
	   "from pl_skup_stroj jj where ",
	   "jj.platnost = 1 and ",
	   "jj.idpo_stroje_skup = r.idpo_stroje) poc_strojov, ",
	   "sum(r.rezerv_kapacita)::interval minute(9) to minute::char(20)::integer rezerv_kapacita ",
	"from pl_rezerv_kapacita r,pl_kalendar_obdobi k,exp_kalk:nad_spol1 n1 ",
	"where ",
	"n1.id = r.idnad_spol1 and ",
	"n1.platnostk >= today and ",
	"n1.topklient = 'A' and ",
	"k.id = r.idpl_kalend_obd and ",
    "r.platnost = 1 and ",
	"r.cpv = ",p_cpv," and ",
	"r.obdobie = '",p_obdobie,"' and ",
	"r.cov = ",p_cov," and ",
	"r.idpo_stroje = ",p_idpo_stroje," and ",
	"r.idnad_spol1 = ",p_idnad_spol1," ",
	"group by 1,2,3,4 "
{
	select
	   (select sum(ka.kon_smeny - ka.zac_smeny) kapacita
	   from polot2:po_stroje s,
	   pl_paramstroj p,
	   pl_kalendar_smien ka,
	   pl_skup_stroj sk
	   where
	   sk.idpo_stroje = s.id and
	   s.id = p.idpo_stroje and
	   --s.kodstr<>'TEST' and
	   --s.kodstr<>'SLEEP' and
	   --5.4.12----------------------
	   current between s.platnostod and s.platnostdo and
	   s.planovanie = 'A' and
	   ------------------------------
	   ka.cpv = s.cp and
	   exists
	   (
	   select kk.id
	   from pl_kapkalendar kk where
	   kk.kod_useku = 'R' and
	   ka.cpv = kk.cpv and
	   ka.zac_smeny >= kk.zac_useku and
	   ka.kon_smeny <= kk.kon_useku and
	   kk.idpo_stroje = s.id
	   ) and
	   ka.cpv = k.cpv and
	   ka.obdobie = k.obdobie and
	   --s.id = r.idpo_stroje
	   --s.cp = r.cpv and
	   --s.co = r.cov
	   sk.idpo_stroje_skup = r.idpo_stroje
	   -----------------------------
	   )::interval minute(9) to minute::char(20)::integer dispon_kapacita,
	   (k.kon_obdobia - k.zac_obdobia)::interval hour(9) to hour::char(20)::integer::dec(6,3) interval_obdobia,
	   (select count(*)*(k.kon_obdobia - k.zac_obdobia)
	   from pl_skup_stroj j where
	   j.platnost = 1 and
	   j.idpo_stroje_skup = r.idpo_stroje)::interval minute(9) to minute::char(20)::integer mozna_kapacita,
	   (select count(*)
	   from pl_skup_stroj jj where
	   jj.platnost = 1 and
	   jj.idpo_stroje_skup = r.idpo_stroje) poc_strojov,
	   sum(r.rezerv_kapacita)::interval minute(9) to minute::char(20)::integer rezerv_kapacita
	into
	   $dispon_kapacita,
	   $interval_obdobia,
	   $mozna_kapacita,
	   $poc_strojov,
           $rezerv_kapacita
	from pl_rezerv_kapacita r,pl_kalendar_obdobi k,exp_kalk:nad_spol1 n1
	where
	n1.id = r.idnad_spol1 and
	n1.platnostk >= today and
	n1.topklient = 'A' and
	k.id = r.idpl_kalend_obd and
        r.platnost = 1 and
	r.cpv = $p_cpv and
	r.obdobie = $p_obdobie and
	r.cov = $p_cov and
	r.idpo_stroje = $p_idpo_stroje and
	r.idnad_spol1 = $p_idnad_spol1
	group by 1,2,3,4
	end sql
}
else
	--vyber pre ostatne firmy
	let l_text =
		"select ",
	   "(select sum(ka.kon_smeny - ka.zac_smeny) kapacita ",
	   "from polot2:po_stroje s,",
	   "pl_paramstroj p,",
	   "pl_kalendar_smien ka,",
	   "pl_skup_stroj sk ",
	   "where ",
	   "sk.idpo_stroje = s.id and ",
	   "s.id = p.idpo_stroje and ",
	   --s.kodstr<>'TEST' and
	   --s.kodstr<>'SLEEP' and
	   --5.4.12----------------------
	   "current between s.platnostod and s.platnostdo and ",
	   "s.planovanie = 'A' and ",
	   ------------------------------
	   "ka.cpv = s.cp and ",
	   "exists ",
	   "(",
	   "select kk.id ",
	   "from pl_kapkalendar kk where ",
	   "kk.kod_useku = 'R' and ",
	   "ka.cpv = kk.cpv and ",
	   "ka.zac_smeny >= kk.zac_useku and ",
	   "ka.kon_smeny <= kk.kon_useku and ",
	   "kk.idpo_stroje = s.id ",
	   ") and ",
	   "ka.cpv = k.cpv and ",
	   "ka.obdobie = k.obdobie and ",
	   --s.id = r.idpo_stroje
	   --s.cp = r.cpv and
	   --s.co = r.cov
	   "sk.idpo_stroje_skup = r.idpo_stroje ",
	   -----------------------------
	   ")::interval minute(9) to minute::char(20)::integer dispon_kapacita, ",
	   "(k.kon_obdobia - k.zac_obdobia)::interval hour(9) to hour::char(20)::integer::dec(6,3) interval_obdobia, ",
	   "(select count(*)*(k.kon_obdobia - k.zac_obdobia) ",
	   "from pl_skup_stroj j where ",
	   "j.platnost = 1 and ",
	   "j.idpo_stroje_skup = r.idpo_stroje)::interval minute(9) to minute::char(20)::integer mozna_kapacita, ",
	   "(select count(*) ",
	   "from pl_skup_stroj jj where ",
	   "jj.platnost = 1 and ",
	   "jj.idpo_stroje_skup = r.idpo_stroje) poc_strojov, ",
	   "sum(r.rezerv_kapacita)::interval minute(9) to minute::char(20)::integer rezerv_kapacita ",
	"from pl_rezerv_kapacita r,pl_kalendar_obdobi k,exp_kalk:nad_spol1 n1 ",
	"where ",
	"n1.id = r.idnad_spol1 and ",
	"n1.platnostk >= today and ",
	"n1.topklient = 'A' and ",
	"k.id = r.idpl_kalend_obd and ",
    "r.platnost = 1 and ",
	"r.cpv = ",p_cpv," and ",
	"r.obdobie = '",p_obdobie,"' and ",
	"r.cov = ",p_cov," and ",
	"r.idpo_stroje = ",p_idpo_stroje," ",
	"group by 1,2,3,4 "
{
	sql
	select
	   (select sum(ka.kon_smeny - ka.zac_smeny) kapacita
	   from polot2:po_stroje s,
	   pl_paramstroj p,
	   pl_kalendar_smien ka,
	   pl_skup_stroj sk
	   where
	   sk.idpo_stroje = s.id and
	   s.id = p.idpo_stroje and
	   --s.kodstr<>'TEST' and
	   --s.kodstr<>'SLEEP' and
	   --5.4.12----------------------
	   current between s.platnostod and s.platnostdo and
	   s.planovanie = 'A' and
	   ------------------------------
	   ka.cpv = s.cp and
	   exists
	   (
	   select kk.id
	   from pl_kapkalendar kk where
	   kk.kod_useku = 'R' and
	   ka.cpv = kk.cpv and
	   ka.zac_smeny >= kk.zac_useku and
	   ka.kon_smeny <= kk.kon_useku and
	   kk.idpo_stroje = s.id
	   ) and
	   ka.cpv = k.cpv and
	   ka.obdobie = k.obdobie and
	   --s.id = r.idpo_stroje
	   --s.cp = r.cpv and
	   --s.co = r.cov
	   sk.idpo_stroje_skup = r.idpo_stroje
	   -----------------------------
	   )::interval minute(9) to minute::char(20)::integer dispon_kapacita,
	   (k.kon_obdobia - k.zac_obdobia)::interval hour(9) to hour::char(20)::integer::dec(6,3) interval_obdobia,
	   (select count(*)*(k.kon_obdobia - k.zac_obdobia)
	   from pl_skup_stroj j where
	   j.platnost = 1 and
	   j.idpo_stroje_skup = r.idpo_stroje)::interval minute(9) to minute::char(20)::integer mozna_kapacita,
	   (select count(*)
	   from pl_skup_stroj jj where
	   jj.platnost = 1 and
	   jj.idpo_stroje_skup = r.idpo_stroje) poc_strojov,
	   sum(r.rezerv_kapacita)::interval minute(9) to minute::char(20)::integer rezerv_kapacita
	into
	   $dispon_kapacita,
	   $interval_obdobia,
	   $mozna_kapacita,
	   $poc_strojov,
           $rezerv_kapacita
	from pl_rezerv_kapacita r,pl_kalendar_obdobi k,exp_kalk:nad_spol1 n1
	where
	n1.id = r.idnad_spol1 and
	n1.platnostk >= today and
	n1.topklient = 'A' and
	k.id = r.idpl_kalend_obd and
        r.platnost = 1 and
	r.cpv = $p_cpv and
	r.obdobie = $p_obdobie and
	r.cov = $p_cov and
	r.idpo_stroje = $p_idpo_stroje
	group by 1,2,3,4
	end sql
}
end if

whenever error continue
prepare prep_text1 from l_text
if sqlca.sqlcode = 0 then
        declare kapacita1 cursor for prep_text1
end if
if sqlca.sqlcode = 0 then
        open kapacita1
end if
if sqlca.sqlcode = 0 then
        fetch kapacita1
        	into
		dispon_kapacita,
		interval_obdobia,
		mozna_kapacita,
		poc_strojov,
		rezerv_kapacita
end if
if sqlca.sqlcode = 0 then
        close kapacita1
end if
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		--priemerna odstavka na stroj, delene 60, pretoze chceme hod a kapacity su v minutach
		let priem_odstavka_na_stroj_obd = ((mozna_kapacita - dispon_kapacita)/poc_strojov)/60 
		--osetrenie situacie, ak by bola priemerna odstavka zaporna!
		if priem_odstavka_na_stroj_obd < 0 then 
			let priem_odstavka_na_stroj_obd = 0
		end if
		if priem_odstavka_na_stroj_obd is null then 
			let priem_odstavka_na_stroj_obd = 0
		end if
		let interval_obdobia = interval_obdobia - priem_odstavka_na_stroj_obd 

		if p_idnad_spol1 is not null then --vypocet pre otop firmy
			let rezerv_min_na_hod = rezerv_kapacita/interval_obdobia
		else --vypocet pre ostatne firmy
			let rezerv_min_na_hod = (dispon_kapacita - rezerv_kapacita)/interval_obdobia
		end if

		--osetrenie situacie, ak by bol koeficient zaporny!
		if rezerv_min_na_hod < 0 then 
			let rezerv_min_na_hod = 0
		end if
		if rezerv_min_na_hod is null then 
			let rezerv_min_na_hod = 0
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let rezerv_min_na_hod = 0
			let a = true
			--let txt1 = "Rezervacia nebola najdena!"
		end if
	end if
free kapacita1
return a,rezerv_min_na_hod
end function


#######################
function vyb_rezerv_kapacitu2(p_cpv,p_obdobie,p_cov,p_idpo_stroje,p_idnad_spol1)
#######################
define p_cpv like pl_rezerv_kapacita.cpv
define p_obdobie like pl_rezerv_kapacita.obdobie
define p_cov like pl_rezerv_kapacita.cov
define p_idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define dispon_kapacita,rezerv_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define l_text char(500)
define try,a char

--initialize plan.* to null
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
if p_idnad_spol1 is not null then
	--vyber pre top firmy
	select
	   sum(r.rezerv_kapacita)
	into
           rezerv_kapacita
	from pl_rezerv_kapacita r,exp_kalk:nad_spol1 n1
	where
	n1.id = r.idnad_spol1 and
	n1.platnostk >= today and
	n1.topklient = 'A' and
        r.platnost = 1 and
	r.cpv = p_cpv and
	r.obdobie = p_obdobie and
	r.cov = p_cov and
	r.idpo_stroje = p_idpo_stroje and
	r.idnad_spol1 = p_idnad_spol1
else
	--vyber pre ostatne firmy
{
	select
	   (select sum(ka.kon_smeny - ka.zac_smeny) kapacita
	   from polot2:po_stroje s,
	   pl_paramstroj p,
	   pl_kalendar_smien ka,
	   pl_skup_stroj sk
	   where
	   sk.idpo_stroje = s.id and
	   s.id = p.idpo_stroje and
	   --s.kodstr<>'TEST' and
	   --s.kodstr<>'SLEEP' and
	   --5.4.12----------------------
	   current between s.platnostod and s.platnostdo and
	   s.planovanie = 'A' and
	   ------------------------------
	   ka.cpv = s.cp and
	   exists
	   (
	   select kk.id
	   from pl_kapkalendar kk where
	   kk.kod_useku = 'R' and
	   ka.cpv = kk.cpv and
	   ka.zac_smeny >= kk.zac_useku and
	   ka.kon_smeny <= kk.kon_useku and
	   kk.idpo_stroje = s.id
	   ) and
	   ka.cpv = k.cpv and
	   ka.obdobie = k.obdobie and
	   --s.id = r.idpo_stroje
	   --s.cp = r.cpv and
	   --s.co = r.cov
	   sk.idpo_stroje_skup = r.idpo_stroje
	   -----------------------------
	   ) dispon_kapacita,
	   sum(r.rezerv_kapacita) rezerv_kapacita
}
let l_text =
	"select ",
	"(select ",
	"sum((ka.kon_obdobia - ka.zac_obdobia) - odstavky_useku(ka.zac_obdobia,ka.kon_obdobia,s.id)) ",
	"from pl_kalendar_obdobi ka,polot2:po_stroje s,pl_skup_stroj sk ",
	"where ",
	"ka.cpv = r.cpv and ",
	"ka.obdobie = r.obdobie and ",
	"s.cp = ka.cpv and ",
	"sk.idpo_stroje = s.id and ",
	"s.id = sk.idpo_stroje and ",
	--s.kodstr<>'TEST' and
	--s.kodstr<>'SLEEP' and
	--5.4.12----------------------
	"current between s.platnostod and s.platnostdo and ",
	"s.planovanie = 'A' and ",
	------------------------------
	"sk.idpo_stroje_skup = r.idpo_stroje) rezerv_kapacita ",
	"from pl_rezerv_kapacita r,pl_kalendar_obdobi k,exp_kalk:nad_spol1 n1 ",
	"where ",
	"n1.id = r.idnad_spol1 and ",
	"n1.platnostk >= today and ",
	"n1.topklient = 'A' and ",
	"k.id = r.idpl_kalend_obd and ",
    "r.platnost = 1 and ",
	"r.cpv = ",p_cpv," and ",
	"r.obdobie = '",p_obdobie,"' and ",
	"r.cov = ",p_cov," and ",
	"r.idpo_stroje = ",p_idpo_stroje," ",
	"group by 1 "
	
	prepare l_text_rezerv from l_text
	if sqlca.sqlcode = 0 then
		execute l_text_rezerv into
			dispon_kapacita,
       		rezerv_kapacita
	end if
end if
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		if dispon_kapacita is null then
			let dispon_kapacita = interval(000 00:00) day(3) to minute
		end if
		if rezerv_kapacita is null then
			let rezerv_kapacita = interval(000 00:00) day(3) to minute
		end if
		if p_idnad_spol1 is null then --vypocet pre ostatne firmy
			let rezerv_kapacita = dispon_kapacita - rezerv_kapacita
		end if
		if rezerv_kapacita < interval(000 00:00) day(3) to minute then
			let rezerv_kapacita = interval(000 00:00) day(3) to minute
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let rezerv_kapacita = interval(000 00:00) day(3) to minute
			let a = true
			--let txt1 = "Rezervacia nebola najdena!"
		end if
	end if
free l_text_rezerv
return a,rezerv_kapacita
end function

#######################
function vyb_priem_odstavky_useku(zac_useku,kon_useku,p_idpo_stroje_skup)
#######################
define zac_useku,kon_useku datetime year to minute
define p_idpo_stroje_skup like pl_skup_stroj.idpo_stroje_skup
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define priem_odstavka_na_stroj dec(6,3)
define ret char(2000)

define try,a char

let try = true
let a = false

while try
let txt2 = ""

let ret =
"select ",
"avg(odstavky_useku(extend('",zac_useku,"',year to minute),extend('",kon_useku,"',year to minute),sk.idpo_stroje))::interval minute(9) to minute::char(20)::integer/60 ",
"from pl_skup_stroj sk ",
"where ",
"sk.platnost = 1 and ",
"sk.idpo_stroje_skup = ",p_idpo_stroje_skup

whenever error continue
prepare prep_ret_odstavky from ret
if sqlca.sqlcode = 0 then
        declare odstavky1 cursor for prep_ret_odstavky
end if
if sqlca.sqlcode = 0 then
        open odstavky1
end if
if sqlca.sqlcode = 0 then
        fetch odstavky1 into priem_odstavka_na_stroj
end if
if sqlca.sqlcode = 0 then
        close odstavky1
end if
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		if priem_odstavka_na_stroj is null then
			let priem_odstavka_na_stroj = 0
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Zlyhalo najdenie odstavok!"
		end if
	end if
free odstavky1
return a,priem_odstavka_na_stroj
end function

#######################
function vyb_odstavky_useku(zac_useku,kon_useku,p_idpo_stroje_skup)
#######################
define zac_useku,kon_useku datetime year to minute
define p_idpo_stroje_skup like pl_skup_stroj.idpo_stroje_skup
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define odstavky interval day(3) to minute
define ret char(2000)

define try,a char

let try = true
let a = false

while try
let txt2 = ""

let ret =
"select ",
"odstavky_useku(extend('",zac_useku,"',year to minute),extend('",kon_useku,"',year to minute),sk.idpo_stroje) ",
"from pl_skup_stroj sk ",
"where ",
"sk.platnost = 1 and ",
"sk.idpo_stroje_skup = ",p_idpo_stroje_skup

whenever error continue
prepare prep_ret_odstavky2 from ret
if sqlca.sqlcode = 0 then
        declare odstavky2 cursor for prep_ret_odstavky2
end if
if sqlca.sqlcode = 0 then
        open odstavky2
end if
if sqlca.sqlcode = 0 then
        fetch odstavky2 into odstavky
end if
if sqlca.sqlcode = 0 then
        close odstavky2
end if
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		if odstavky is null then
			let odstavky = interval(000 00:00)  day(3) to minute
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Zlyhalo najdenie odstavok!"
		end if
	end if
free odstavky2
return a,odstavky
end function

#######################
function test_existencie_rezervacie(p_cpv,p_obdobie,p_cov,p_idnad_spol1)
#######################
define p_cpv like pl_rezerv_kapacita.cpv
define p_obdobie like pl_rezerv_kapacita.obdobie
define p_cov like pl_rezerv_kapacita.cov
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define rezerv_kapacita interval day(3) to minute
define ma_rezerv char
define try,a char

--initialize plan.* to null
let try = true
let a = false
let ma_rezerv = false

while try
let txt2 = ""
whenever error continue
select
   sum(r.rezerv_kapacita)
into
   rezerv_kapacita 
from pl_rezerv_kapacita r
where
r.platnost = 1 and
r.cpv = p_cpv and
r.obdobie = p_obdobie and
r.cov = p_cov and
r.idnad_spol1 = p_idnad_spol1
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		if rezerv_kapacita is not null and
		   rezerv_kapacita > interval(000 00:00) day(3) to minute then
			let ma_rezerv = true
		else
			let ma_rezerv = false
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Rezervacia nebola najdena!"
		end if
	end if
return a,ma_rezerv
end function

{
--funkcia integrujuca vsetky testy obdobi pred prognozovanim
#################################
function test_obdobi(p_cpv)
#################################
define p_cpv like pl_rezerv_kapacita.cpv
define p_cov like pl_rezerv_kapacita.cov
define a char
let a = true

call sprava2("Prebieha test obdobi...")
if a then
   let pp_26.cpv = p_cpv
   call vyb7_26a() returning a
end if
if a then
   if pp_26.rezervacia_zapnuta then
	if a then
	   call test_uzavretych_obdobi(p_cpv) returning a
	end if
	if a then
	   call test_predbeznych_obdobi(p_cpv,155) returning a
	end if
	if a then
	   call test_predbeznych_obdobi(p_cpv,178) returning a
	end if
	if a then
	   call test_predbeznych_obdobi(p_cpv,192) returning a
	end if
	if a then
	   call test_spravnej_rezerv_obdobi(p_cpv) returning a
	end if
   end if
end if
close window pracujem
return a
end function
}

#################################
function test_obdobi(p_cpv)
#################################
define p_cpv like pl_rezerv_kapacita.cpv
define p_cov like pl_rezerv_kapacita.cov
define a char
define l_text char(250)

let a = true

call sprava2("Prebieha test obdobi...")
if a then
   let pp_26.cpv = p_cpv
   call vyb7_26a() returning a
end if
if a then
   if pp_26.rezervacia_zapnuta then
   let l_text =
   	"select ",
	"od.cov ",
	"from pl_rezerv_odd od ",
	"where ",
	"od.cpv = ",p_cpv," and ",
	"od.platnost = 1 "
	
	whenever error continue
	prepare prep_text12 from l_text
	if sqlca.sqlcode = 0 then
		declare test_odd01 cursor for prep_text12
	end if
	{
	select
	od.cov
	from pl_rezerv_odd od
	where
	od.cpv = p_cpv and
	od.platnost = 1
	}
	

	 foreach test_odd01 into p_cov
	   -----
	   if sqlca.sqlcode < 0 then
		let a = false
		let txt1 = "Pri vybere oddeleni rezervacie nastala chyba cislo:",sqlca.sqlcode using "-<<<<<&"
		exit foreach
	   end if
	   if p_cov > 0 then
		if a then
		   call test_predbeznych_obdobi(p_cpv,p_cov) returning a
		end if
	   end if
	   if not a then
		exit foreach
	   end if
	 end foreach
	whenever error stop
	if sqlca.sqlcode < 0 then
	   let txt1 = "Pri vybere oddeleni rezervacie nastala chyba cislo:",sqlca.sqlcode using "-<<<<<&"
	   let a = false
	end if
	if a then
	   call test_uzavretych_obdobi(p_cpv) returning a
	end if
	if a then
	   call test_spravnej_rezerv_obdobi(p_cpv) returning a
	end if
   end if
end if
free test_odd01
close window pracujem
return a
end function

########################################
function test_spravnej_rezerv_obdobi(p_cpv)
########################################
define p_cpv like pl_rezerv_kapacita.cpv
define p_obdobie like pl_rezerv_kapacita.obdobie
define p_cov like pl_rezerv_kapacita.cov
define p_idpo_stroje_skup like pl_rezerv_kapacita.idpo_stroje
define a char(1)
define l_text char(500)

let a = true

let l_text =
"select ",
"  unique ",
"  k.cpv, ",
"  k.obdobie, ",
"  pl.cov, ",
"  pl.idpo_stroje_skup ",
"from pl_skup_stroj pl,pl_kalendar_obdobi k ",
"where ",
"k.cpv = pl.cpv and ",
"platnost = 1 and ",
"k.obdobie between extend(today,year to month) and ",
"(extend(today,year to month) + 7 units month) and ",
"k.cpv = ",p_cpv," ",
"order by 1,2,3,4 "

whenever error continue
prepare prep_text4 from l_text
if sqlca.sqlcode = 0 then
	declare test_obd cursor for prep_text4
end if
{
select
  unique
  k.cpv,
  k.obdobie,
  pl.cov,
  pl.idpo_stroje_skup
from pl_skup_stroj pl,pl_kalendar_obdobi k
where
k.cpv = pl.cpv and
platnost = 1 and
k.obdobie between extend(today,year to month) and
(extend(today,year to month) + 7 units month) and
k.cpv = p_cpv
order by 1,2,3,4
}

foreach test_obd into 
   p_cpv,
   p_obdobie,
   p_cov,
   p_idpo_stroje_skup
   -----
   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Chyba pri vybere obdobi! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
	exit foreach
   end if
   call test_spravnej_rezerv_obdobia(p_cpv,p_obdobie,p_cov,p_idpo_stroje_skup) returning a
   if not a then
	exit foreach
   end if
end foreach
whenever error stop
if sqlca.sqlcode < 0 then
   let txt1 = "Chyba pri vybere obdobi! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
   let a = false
end if
free test_obd
return a
end function

--test ci nie je viac rezervovane ako je disponibilna kapacita za dane obdobie 
#######################
function test_spravnej_rezerv_obdobia(p_cpv,p_obdobie,p_cov,p_idpo_stroje_skup)
#######################
define p_cpv like pl_rezerv_kapacita.cpv
define p_obdobie like pl_rezerv_kapacita.obdobie
define p_cov like pl_rezerv_kapacita.cov
define p_idpo_stroje_skup like pl_rezerv_kapacita.idpo_stroje
--define dispon_kapacita,rezerv_kapacita integer
define dispon_kapacita,rezerv_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define l_text char(500)
define try,a char

let try = true
let a = false

while try
let txt2 = ""
let txt1 = ""

let l_text =
    "select ",
	"(select ",
	"sum((ka.kon_obdobia - ka.zac_obdobia) - odstavky_useku(ka.zac_obdobia,ka.kon_obdobia,s.id)) ",
	"from pl_kalendar_obdobi ka,polot2:po_stroje s,pl_skup_stroj sk ",
	"where ",
	"ka.cpv = r.cpv and ",
	"ka.obdobie = r.obdobie and ",
	"s.cp = ka.cpv and ",
	"sk.idpo_stroje = s.id and ",
	"s.id = sk.idpo_stroje and ",
	--s.kodstr<>'TEST' and
	--s.kodstr<>'SLEEP' and
	--5.4.12----------------------
	"current between s.platnostod and s.platnostdo and ",
	"s.planovanie = 'A' and ",
	------------------------------
	"sk.idpo_stroje_skup = r.idpo_stroje), --::interval minute(9) to minute::char(20)::integer dispon_kapacita, ",

           "sum(r.rezerv_kapacita) --::interval minute(9) to minute::char(20)::integer rezerv_kapacita ",

        "from pl_rezerv_kapacita r,pl_kalendar_obdobi k,exp_kalk:nad_spol1 n1 ",
        "where ",
        "n1.id = r.idnad_spol1 and ",
        "n1.platnostk >= today and ",
        "n1.topklient = 'A' and ",
        "k.id = r.idpl_kalend_obd and ",
		"r.platnost = 1 and ",
        "r.cpv = ",p_cpv," and ",
        "r.obdobie = '",p_obdobie,"' and ",
        "r.cov = ",p_cov," and ",
        "r.idpo_stroje = ",p_idpo_stroje_skup," ",
        "group by 1 "

whenever error continue
prepare prep_test_rezerv from l_text
if sqlca.sqlcode = 0 then
	execute prep_test_rezerv into
		dispon_kapacita,
		rezerv_kapacita
end if
{
     select
	(select
	sum((ka.kon_obdobia - ka.zac_obdobia) - odstavky_useku(ka.zac_obdobia,ka.kon_obdobia,s.id))
	from pl_kalendar_obdobi ka,polot2:po_stroje s,pl_skup_stroj sk
	where
	ka.cpv = r.cpv and
	ka.obdobie = r.obdobie and
	s.cp = ka.cpv and
	sk.idpo_stroje = s.id and
	s.id = sk.idpo_stroje and
	--s.kodstr<>'TEST' and
	--s.kodstr<>'SLEEP' and
	--5.4.12----------------------
	current between s.platnostod and s.platnostdo and
	s.planovanie = 'A' and
	------------------------------
	sk.idpo_stroje_skup = r.idpo_stroje), --::interval minute(9) to minute::char(20)::integer dispon_kapacita,

           sum(r.rezerv_kapacita) --::interval minute(9) to minute::char(20)::integer rezerv_kapacita
	into
	   $dispon_kapacita,
	   $rezerv_kapacita
        from pl_rezerv_kapacita r,pl_kalendar_obdobi k,exp_kalk:nad_spol1 n1
        where
        n1.id = r.idnad_spol1 and
        n1.platnostk >= today and
        n1.topklient = 'A' and
        k.id = r.idpl_kalend_obd and
	r.platnost = 1 and
        r.cpv = $p_cpv and
        r.obdobie = $p_obdobie and
        r.cov = $p_cov and
        r.idpo_stroje = $p_idpo_stroje_skup
        group by 1
}   
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
	   if rezerv_kapacita is not null then
		--if (dispon_kapacita - rezerv_kapacita) < 0 then
		if (dispon_kapacita - rezerv_kapacita) < interval(000 00:00) day(3) to minute then
			let txt1 = "Pre obdobie ",p_obdobie," a COV ",p_cov using "<<<&"," rezervovane viac ako disponibil.kapacita!"
			let a = false
		end if
	   end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Obdobie ",p_obdobie," nebolo najdene pre test spravnosti rezervacie!"
		end if
	end if
free prep_test_rezerv
return a
end function

--test nutnych uzavretych obdobi pre rezervaciu
#######################
function test_uzavretych_obdobi(p_cpv)
#######################
define p_cpv like pl_rezerv_kapacita.cpv
define obdobie_od,obdobie_do like pl_rezerv_uzavretie.obdobie
define poc smallint
define try,a char

--initialize plan.* to null
let try = true
let a = false
--let obdobie_od = extend(today,year to month) - 1 units month 
let obdobie_od = extend(today,year to month)
let obdobie_do = extend(today,year to month) + 1 units month 
let poc = 0

while try
let txt2 = ""
whenever error continue
select
   count(*)
into
   poc
from
pl_rezerv_uzavretie u
where
u.cpv = p_cpv and
u.obdobie between obdobie_od and obdobie_do
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		if poc < 2 then
			let txt1 = "Pre obdobia od ",obdobie_od," do ",obdobie_do," je nutne uzavretie rezervacie!"
			let a = false
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Uzavretie nebolo najdene!"
		end if
	end if
return a
end function

--test nutnych predbeznych obdobi pre rezervaciu
#######################
function test_predbeznych_obdobi(p_cpv,p_cov)
#######################
define p_cpv like pl_rezerv_kapacita.cpv
define p_cov like pl_rezerv_kapacita.cov
define obdobie_od,obdobie_do like pl_rezerv_kapacita.obdobie
define poc smallint
define try,a char

--initialize plan.* to null
let try = true
let a = false
let obdobie_od = extend(today,year to month) + 2 units month
let obdobie_do = extend(today,year to month) + 7 units month 
let poc = 0

while try
let txt2 = ""
whenever error continue
select
   count(unique r.obdobie)
into
   poc
from
pl_rezerv_kapacita r
where
r.platnost = 1 and
r.cpv = p_cpv and
r.cov = p_cov and
r.obdobie between obdobie_od and obdobie_do
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		if poc < 5 then
			let txt1 = "Na odd.",p_cov using "<<<&"," pre obdobia od ",obdobie_od," do ",obdobie_do," je nutna predbezna rezervacia!"
			let a = false
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Obdobie rezervacie nebolo najdene!"
		end if
	end if
return a
end function

####################################
function test_kapac_kalendara()
####################################
define l_stroje record
   co like polot2:po_stroje.co,
   cstroj like polot2:po_stroje.cstroj,
   nazstroja like polot2:po_stroje.nazstroja,
   kon_useku like pl_kapkalendar.kon_useku
end record
define a char(1)
define l_poc_problem_stroj smallint
define l_hlavicka char(80)
define l_subor char(50)
define l_text char(500)

let a = true
let l_poc_problem_stroj = 0
initialize l_stroje.* to null
let l_subor = vytvor_subor()
let l_hlavicka = "VYPIS STROJOV S NEDOSTATOCNE VYPLNENYM KAPACITNYM KALENDAROM"

let l_text =
"select ",
"po_stroje.co, ",
"po_stroje.cstroj, ",
"po_stroje.nazstroja, ",
"(select max(k.kon_useku) from pl_kapkalendar k where k.idpo_stroje = po_stroje.id) kalendar_do ",
"from ",
"polot2:po_stroje po_stroje ",
"where ",
"po_stroje.cp = 6 and ",
"po_stroje.co is not null and ",
"po_stroje.planovanie = 'A' and ",
"current between po_stroje.platnostod and po_stroje.platnostdo and ",
"( ",
"select max(k2.kon_useku) from pl_kapkalendar k2 ",
"where ",
"k2.idpo_stroje = po_stroje.id ",
") < (current + 60 units day) ",
"order by 1,2 "

whenever error continue
prepare prep_text5 from l_text
if sqlca.sqlcode = 0 then
	declare test_kap_kalendar cursor for prep_text5
end if
{ 
select
po_stroje.co,
po_stroje.cstroj,
po_stroje.nazstroja,
(select max(k.kon_useku) from pl_kapkalendar k where k.idpo_stroje = po_stroje.id) kalendar_do
from
polot2:po_stroje po_stroje
where
po_stroje.cp = 6 and
po_stroje.co is not null and
po_stroje.planovanie = 'A' and
current between po_stroje.platnostod and po_stroje.platnostdo and
(
select max(k2.kon_useku) from pl_kapkalendar k2
where
k2.idpo_stroje = po_stroje.id
) < (current + 60 units day)
order by 1,2
}

if sqlca.sqlcode < 0 then 
  let txt1 = "Pri deklarovani kurzoru pre test kapac.kalendara nastala chyba:",sqlca.sqlcode using "-<<<<<<<&","!"
  let a = false
end if
if a then

   start report print_strojov to l_subor
   foreach test_kap_kalendar into 
	l_stroje.co,
	l_stroje.cstroj,
	l_stroje.nazstroja,
	l_stroje.kon_useku

	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri vybere obdobi! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
	   exit foreach
	end if
	if not a then
	   exit foreach
	end if
	output to report print_strojov(l_stroje.*,l_hlavicka clipped)
	let l_poc_problem_stroj = l_poc_problem_stroj + 1
   end foreach
   finish report print_strojov

end if
whenever error stop


if a then
   if l_poc_problem_stroj > 0 then
	let a = false	
	let txt1 = "Nasli sa stroje, ktore nemaju vyplneny kapacitny kalendar!"
	call sprava3(txt1)
        let textchy = "vacviewer ",l_subor clipped," 1 0 0 0 0 "
        --Lycia
        --run textchy
	call resizeobr(glargebrowse)
   end if
end if
free test_kap_kalendar

return a
end function

####################################
function test_param_strojov()
####################################
define l_stroje record
   co like polot2:po_stroje.co,
   cstroj like polot2:po_stroje.cstroj,
   nazstroja like polot2:po_stroje.nazstroja,
   kon_useku like pl_kapkalendar.kon_useku
end record
define a char(1)
define l_poc_problem_stroj smallint
define l_hlavicka char(80)
define l_subor char(50)
define l_text char(500)

let a = true
let l_poc_problem_stroj = 0
initialize l_stroje.* to null
let l_subor = vytvor_subor()
let l_hlavicka = "VYPIS STROJOV S NEVYPLNENYMI PARAMETRAMI STROJA"
let l_text =
"select ",
"po_stroje.co, ",
"po_stroje.cstroj, ",
"po_stroje.nazstroja ",
"from polot2:po_stroje po_stroje ",
"where ",
"po_stroje.cp = 6 and ",
"po_stroje.co is not null and ",
"po_stroje.planovanie = 'A' and ",
"current between po_stroje.platnostod and po_stroje.platnostdo and ",
"not exists ",
"( ",
"select x.cstroj from pl_paramstroj x where x.idpo_stroje = po_stroje.id ",
") ",
"order by 1,2 "

whenever error continue
prepare prep_text6 from l_text
if sqlca.sqlcode = 0 then
	declare test_param_strojov cursor for prep_text6
end if
{ 
select
po_stroje.co,
po_stroje.cstroj,
po_stroje.nazstroja
from polot2:po_stroje po_stroje
where
po_stroje.cp = 6 and
po_stroje.co is not null and
po_stroje.planovanie = "A" and
current between po_stroje.platnostod and po_stroje.platnostdo and
not exists
(
select x.cstroj from pl_paramstroj x where x.idpo_stroje = po_stroje.id
)
order by 1,2
}

if sqlca.sqlcode < 0 then 
  let txt1 = "Pri deklarovani kurzoru pre test nastala chyba:",sqlca.sqlcode using "-<<<<<<<&","!"
  let a = false
end if
if a then
	---Lycia
   start report print_strojov to l_subor
   foreach test_param_strojov into 
	l_stroje.co,
	l_stroje.cstroj,
	l_stroje.nazstroja,
	l_stroje.kon_useku

	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri vybere testu! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
	   exit foreach
	end if
	if not a then
	   exit foreach
	end if
	output to report print_strojov(l_stroje.*,l_hlavicka clipped)
	let l_poc_problem_stroj = l_poc_problem_stroj + 1
   end foreach
   finish report print_strojov
end if
whenever error stop

if a then
   if l_poc_problem_stroj > 0 then
	let a = false	
	let txt1 = "Nasli sa stroje, ktore nemaju vyplnene parametre stroja!"
	call sprava3(txt1)
        let textchy = "vacviewer ",l_subor clipped," 1 0 0 0 0 "
        ---Lycia
        ---run textchy
	call resizeobr(glargebrowse)
   end if
end if
free test_param_strojov
return a
end function

####################################
function test_prazd_kapac_kalendar()
####################################
define l_stroje record
   co like polot2:po_stroje.co,
   cstroj like polot2:po_stroje.cstroj,
   nazstroja like polot2:po_stroje.nazstroja,
   kon_useku like pl_kapkalendar.kon_useku
end record
define a char(1)
define l_poc_problem_stroj smallint
define l_hlavicka char(80)
define l_subor char(50)
define l_text char(500)

let a = true
let l_poc_problem_stroj = 0
initialize l_stroje.* to null
let l_subor = vytvor_subor()
let l_hlavicka = "VYPIS STROJOV S PRAZDNYM KAPACITNYM KALENDAROM"

let l_text = 
"select ",
"po_stroje.co, ",
"po_stroje.cstroj, ",
"po_stroje.nazstroja ",
"from polot2:po_stroje po_stroje ",
"where ",
"po_stroje.cp = 6 and ",
"po_stroje.co is not null and ",
"po_stroje.planovanie = 'A' and ",
"current between po_stroje.platnostod and po_stroje.platnostdo and ",
"not exists ",
"( ",
"select y.cstroj from pl_kapkalendar y where y.idpo_stroje = po_stroje.id ",
") ",
"order by 1,2 "

whenever error continue
prepare prep_text7 from l_text
if sqlca.sqlcode = 0 then
	declare test_kap_kalendar2 cursor for prep_text7
end if
{ 
select
po_stroje.co,
po_stroje.cstroj,
po_stroje.nazstroja
from polot2:po_stroje po_stroje
where
po_stroje.cp = 6 and
po_stroje.co is not null and
po_stroje.planovanie = "A" and
current between po_stroje.platnostod and po_stroje.platnostdo and
not exists
(
select y.cstroj from pl_kapkalendar y where y.idpo_stroje = po_stroje.id
)
order by 1,2
}
if sqlca.sqlcode < 0 then 
  let txt1 = "Pri deklarovani kurzoru pre test nastala chyba:",sqlca.sqlcode using "-<<<<<<<&","!"
  let a = false
end if
if a then
   ---Lycia
   start report print_strojov to l_subor
   foreach test_kap_kalendar2 into 
	l_stroje.co,
	l_stroje.cstroj,
	l_stroje.nazstroja,
	l_stroje.kon_useku

	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri vybere testu! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
	   exit foreach
	end if
	if not a then
	   exit foreach
	end if
	output to report print_strojov(l_stroje.*,l_hlavicka clipped)
	let l_poc_problem_stroj = l_poc_problem_stroj + 1
   end foreach
   finish report print_strojov
end if
whenever error stop

if a then
   if l_poc_problem_stroj > 0 then
	let a = false	
	let txt1 = "Nasli sa stroje, ktore maju prazdny kapacitny kalendar!"
	call sprava3(txt1)
        let textchy = "vacviewer ",l_subor clipped," 1 0 0 0 0 "
        ---Lycia
        ---run textchy
	call resizeobr(glargebrowse)
   end if
end if
free test_kap_kalendar2
return a
end function

####################################
function test_skupiny_strojov()
####################################
define l_stroje record
   co like polot2:po_stroje.co,
   cstroj like polot2:po_stroje.cstroj,
   nazstroja like polot2:po_stroje.nazstroja,
   kon_useku like pl_kapkalendar.kon_useku
end record
define a char(1)
define l_poc_problem_stroj smallint
define l_hlavicka char(80)
define l_subor char(50)
define l_text char(500)

let a = true
let l_poc_problem_stroj = 0
initialize l_stroje.* to null
let l_subor = vytvor_subor()
let l_hlavicka = "VYPIS STROJOV NEZARADENYCH DO SKUPINY STROJOV PRE REZERVACIU"

let l_text =
"select ",
"po_stroje.co, ",
"po_stroje.cstroj, ",
"po_stroje.nazstroja ",
"from polot2:po_stroje po_stroje ",
"where ",
"po_stroje.cp = 6 and ",
"po_stroje.co is not null and ",
"po_stroje.planovanie = 'A' and ",
"current between po_stroje.platnostod and po_stroje.platnostdo and ",
"exists ",
"( ",
"select * from pl_rezerv_odd r1 where ",
"r1.cpv = po_stroje.cp and ",
"r1.cov = po_stroje.co and ",
"r1.platnost = 1 ",
") and ",
"not exists ",
"( ",
"select * from pl_skup_stroj r2 where ",
"r2.idpo_stroje = po_stroje.id and ",
"r2.platnost = 1 ",
") ",
"order by 1,2 "

whenever error continue
prepare prep_text8 from l_text
if sqlca.sqlcode = 0 then
	declare test_skup_stroj cursor for prep_text8
end if
{
select
po_stroje.co,
po_stroje.cstroj,
po_stroje.nazstroja
from polot2:po_stroje po_stroje
where
po_stroje.cp = 6 and
po_stroje.co is not null and
po_stroje.planovanie = "A" and
current between po_stroje.platnostod and po_stroje.platnostdo and
exists
(
select * from pl_rezerv_odd r1 where
r1.cpv = po_stroje.cp and
r1.cov = po_stroje.co and
r1.platnost = 1
) and
not exists
(
select * from pl_skup_stroj r2 where
r2.idpo_stroje = po_stroje.id and
r2.platnost = 1
)
order by 1,2
}

if sqlca.sqlcode < 0 then 
  let txt1 = "Pri deklarovani kurzoru pre test nastala chyba:",sqlca.sqlcode using "-<<<<<<<&","!"
  let a = false
end if
if a then
   ---Lycia
   start report print_strojov to l_subor
   foreach test_skup_stroj into 
	l_stroje.co,
	l_stroje.cstroj,
	l_stroje.nazstroja,
	l_stroje.kon_useku

	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri vybere testu! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
	   exit foreach
	end if
	if not a then
	   exit foreach
	end if
	output to report print_strojov(l_stroje.*,l_hlavicka clipped)
	let l_poc_problem_stroj = l_poc_problem_stroj + 1
   end foreach
   finish report print_strojov
end if
whenever error stop

if a then
   if l_poc_problem_stroj > 0 then
	let a = false	
	let txt1 = "Nasli sa stroje, nezaradene v skupine strojov pre rezervaciu!"
	call sprava3(txt1)
        let textchy = "vacviewer ",l_subor clipped," 1 0 0 0 0 "
        ---Lycia
        ---run textchy
	call resizeobr(glargebrowse)
   end if
end if
free test_skup_stroj
return a
end function

##########################
report print_strojov(l_stroje,l_hlavicka)
##########################
define l_stroje record
   co like polot2:po_stroje.co,
   cstroj like polot2:po_stroje.cstroj,
   nazstroja like polot2:po_stroje.nazstroja,
   kon_useku like pl_kapkalendar.kon_useku
end record
define l_hlavicka char(80)
define l_popis_kon_useku char(15)
output

left margin 0
right margin 0
top margin 0
bottom margin 0

format
page header
   print l_hlavicka clipped
   print "Vypis opuste stlacenim klavesy F5."
   skip 1 line
   if l_stroje.kon_useku is not null then
	let l_popis_kon_useku = "Kalendar do" 
   else
	let l_popis_kon_useku = "" 
   end if
   print
	"COV"," ",
	"CSt"," ",
	"Nazov stroja             "," ",
	l_popis_kon_useku clipped
   print "--------------------------------------------------------------------------------"

on every row
   print
	l_stroje.co using "##&"," ",
	l_stroje.cstroj using "<##&"," ",
	l_stroje.nazstroja," ",
	l_stroje.kon_useku," "
end report
---------------------------------------------------

#######################
function zisti_obsadenu_kapacitu(zac_pl_mes,kon_pl_mes,p_idpo_stroje,p_idnad_spol1,i)
#######################
define zac_pl_mes,kon_pl_mes datetime year to minute
define p_idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define i smallint
define cas_delenia_pl_mes datetime year to minute
define vyrob_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define obsadena_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define celk_obsadena_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define a char

let a = false
let vyrob_kapacita = null
let obsadena_kapacita = null

--test ci ide o aktualny mesiac
if extend(today,year to month) = extend(zac_pl_mes,year to month) or
   extend(today,year to month) = extend(kon_pl_mes,year to month) then
	let cas_delenia_pl_mes = current year to minute
	call daj_vyrob_kapacitu(postupy[i].podv,postupy[i].cov,zac_pl_mes,cas_delenia_pl_mes,p_idpo_stroje,p_idnad_spol1) returning a,vyrob_kapacita
	if a then
	   if p_idnad_spol1 is not null then --vyber bez sklzu je len pre top firmy!
	        --30.7.2013 obnoveny prenos sklzu pre top firmy so suhlasom p.Olejara
		--call vyb_obsadenu_kapacitu_bez_sklzu(cas_delenia_pl_mes,kon_pl_mes,p_idpo_stroje,p_idnad_spol1,postupy[i].podv,postupy[i].cov) returning a,obsadena_kapacita
		call vyb_obsadenu_kapacitu(cas_delenia_pl_mes,kon_pl_mes,p_idpo_stroje,p_idnad_spol1,postupy[i].podv,postupy[i].cov) returning a,obsadena_kapacita
	   else
		call vyb_obsadenu_kapacitu(zac_pl_mes,kon_pl_mes,p_idpo_stroje,p_idnad_spol1,postupy[i].podv,postupy[i].cov) returning a,obsadena_kapacita
	   end if
	end if
else
	call vyb_obsadenu_kapacitu(zac_pl_mes,kon_pl_mes,p_idpo_stroje,p_idnad_spol1,postupy[i].podv,postupy[i].cov) returning a,obsadena_kapacita
end if
if a then
   if vyrob_kapacita is null then
	let vyrob_kapacita = interval(000 00:00) day(3) to minute
   end if
   if obsadena_kapacita is null then
	let obsadena_kapacita = interval(000 00:00) day(3) to minute
   end if
   let celk_obsadena_kapacita = vyrob_kapacita + obsadena_kapacita 
end if
return a,celk_obsadena_kapacita
end function

#######################
function zisti_obsadenu_kapacitu_exter(zac_pl_mes,kon_pl_mes,p_idpo_stroje,p_idnad_spol1,p_cpv,p_cov)
#######################
define zac_pl_mes,kon_pl_mes datetime year to minute
define p_idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define p_cpv like pl_rezerv_kapacita.cpv 
define p_cov like pl_rezerv_kapacita.cov 
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define celk_obsadena_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define a char

let postupy[1].podv = p_cpv
let postupy[1].cov = p_cov
call zisti_obsadenu_kapacitu(zac_pl_mes,kon_pl_mes,p_idpo_stroje,p_idnad_spol1,1) returning a,celk_obsadena_kapacita
return a,celk_obsadena_kapacita
end function

#######################
function vyb_obsadenu_kapacitu(zac_pl_mes,kon_pl_mes,p_idpo_stroje,p_idnad_spol1,p_cpv,p_cov)
#######################
define zac_pl_mes,kon_pl_mes datetime year to minute
define p_idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define p_cpv like pl_rezerv_kapacita.cpv
define p_cov like pl_rezerv_kapacita.cov
define obsadena_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define zac_pl_mes_ch,kon_pl_mes_ch char(18)
define ret char(2000)
define p_obdobie like pl_rezerv_kapacita.obdobie

define try,a char

let try = true
let a = false
let zac_pl_mes_ch = "'",zac_pl_mes,"'"
let kon_pl_mes_ch = "'",kon_pl_mes,"'"
let p_obdobie = extend(zac_pl_mes,year to month)

while try
let txt2 = ""

if p_idnad_spol1 is not null then
	--vyber pre top firmy
	let ret =
	"select ",
	"sum( ",
	"(case when p.kon_plan > extend('",kon_pl_mes,"',year to minute) then extend('",kon_pl_mes,"',year to minute) else p.kon_plan end - ",
	"case when p.zac_plan < extend('",zac_pl_mes,"',year to minute) then extend('",zac_pl_mes,"',year to minute) else p.zac_plan end) - ",
	"odstavky_useku( ",
	"case when p.zac_plan < extend('",zac_pl_mes,"',year to minute) then extend('",zac_pl_mes,"',year to minute) else p.zac_plan end, ",
	"case when p.kon_plan > extend('",kon_pl_mes,"',year to minute) then extend('",kon_pl_mes,"',year to minute) else p.kon_plan end, ",
	"p.idpo_stroje))  ",
	"from pl_harm ha,pl_harmpolozka p,pl_sledpolozka d,pl_subeh u,pl_prac_uloha r,vp_polot l,v_prikazy v,pl_skup_stroj sk  ",
	"where ",
	"p.idpl_harm = ha.id and ",
	"ha.cpv = ",gpodnik," and ",
	"ha.zac_periody > '",ref_cas,"' and ",
        -----------------
	"p.idpo_stroje = sk.idpo_stroje and ",
	"sk.idpo_stroje_skup = ",p_idpo_stroje," and ",
	--"p.idpl_harm = h.id and ",
	--"h.cpv = ",p_cpv," and ",
	--"h.cov = ",p_cov," and ",
	------------------------------
	"d.id = p.idpl_sledpolozka and ",
	"d.platnost = 1 and ",
	"u.id = d.idpl_subeh and ",
	"r.idpl_subeh = u.id and ",
	"r.idvp_polot = l.id and ",
	"v.por_vp = l.por_polot and ",
	"( ",
	"p.zac_plan between extend('",zac_pl_mes,"',year to minute) and extend('",kon_pl_mes,"',year to minute) or ",
	"p.kon_plan between extend('",zac_pl_mes,"',year to minute) and extend('",kon_pl_mes,"',year to minute) ",
	")  and ",
	"exists ",
	"(select n1.id ",
	"from exp_kalk:nad_spol n, ",
	"exp_kalk:nad_spol1 n1 ",
	"where ",
	"n.podnik = n1.podnik and ",
	"n.nsp1 = n1.nsp1 and ",
	"n.platnostk >= today and ",
	"n1.platnostk >= today and ",
	"n1.topklient = 'A' and ",
	"n.podnik = v.podv and ",
	"n.nsp2 = v.porf_plan and ", --zmena 26.1.12
	"n1.id = ",p_idnad_spol1,")"
else
	--vyber pre ostatne firmy
	let ret =
	"select ",
	"sum( ",
	"(case when p.kon_plan > extend('",kon_pl_mes,"',year to minute) then extend('",kon_pl_mes,"',year to minute) else p.kon_plan end - ",
	"case when p.zac_plan < extend('",zac_pl_mes,"',year to minute) then extend('",zac_pl_mes,"',year to minute) else p.zac_plan end) - ",
	"odstavky_useku( ",
	"case when p.zac_plan < extend('",zac_pl_mes,"',year to minute) then extend('",zac_pl_mes,"',year to minute) else p.zac_plan end, ",
	"case when p.kon_plan > extend('",kon_pl_mes,"',year to minute) then extend('",kon_pl_mes,"',year to minute) else p.kon_plan end, ",
	"p.idpo_stroje))  ",
	"from pl_harm ha,pl_harmpolozka p,pl_sledpolozka d,pl_subeh u,pl_prac_uloha r,vp_polot l,v_prikazy v,pl_skup_stroj sk ",
	"where ",
	"p.idpl_harm = ha.id and ",
	"ha.cpv = ",gpodnik," and ",
	"ha.zac_periody > '",ref_cas,"' and ",
        -----------------
	"p.idpo_stroje = sk.idpo_stroje and ",
	"sk.idpo_stroje_skup = ",p_idpo_stroje," and ",
	--"p.idpl_harm = h.id and ",
	--"h.cpv = ",p_cpv," and ",
	--"h.cov = ",p_cov," and ",
	----------------------------
	"d.id = p.idpl_sledpolozka and ",
	"d.platnost = 1 and ",
	"u.id = d.idpl_subeh and ",
	"r.idpl_subeh = u.id and ",
	"r.idvp_polot = l.id and ",
	"v.por_vp = l.por_polot and ",
	"( ",
	"p.zac_plan between extend('",zac_pl_mes,"',year to minute) and extend('",kon_pl_mes,"',year to minute) or ",
	"p.kon_plan between extend('",zac_pl_mes,"',year to minute) and extend('",kon_pl_mes,"',year to minute) ",
	")  and ",
	"not exists ",--firma neexistuje medzi rezervovanymi top klientmi pre dane obdobie a oddelenie
	"(select n1.id ",
	"from exp_kalk:nad_spol n, ",
	"exp_kalk:nad_spol1 n1, ",
	"pl_rezerv_kapacita r ",
	"where ",
	"r.cpv = ",p_cpv," and ",
	"r.cov = ",p_cov," and ",
	"r.obdobie = '",p_obdobie,"' and ",
	"r.idpo_stroje = ",p_idpo_stroje," and ",
	"r.idnad_spol1 = n1.id and ",
	"r.rezerv_kapacita > interval(000 00:00) day(3) to minute and ",
	"n.podnik = n1.podnik and ",
	"n.nsp1 = n1.nsp1 and ",
	"n.platnostk >= today and ",
	"n1.platnostk >= today and ",
	"n1.topklient = 'A' and ",
	"n.podnik = v.podv and ",
	"n.nsp2 = v.porf_plan) " --zmena 26.1.12
end if

whenever error continue
prepare prep_ret_zisti from ret
if sqlca.sqlcode = 0 then
        declare obsadene1 cursor for prep_ret_zisti
end if
if sqlca.sqlcode = 0 then
        open obsadene1
end if
if sqlca.sqlcode = 0 then
        fetch obsadene1 into obsadena_kapacita
end if
if sqlca.sqlcode = 0 then
        close obsadene1
end if
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		if obsadena_kapacita is null then
			let obsadena_kapacita = interval(000 00:00) day(3) to minute
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Finalna veta prikazu nebola najdena!"
		end if
	end if
free obsadene1
return a,obsadena_kapacita
end function

#######################
function vyb_obsadenu_kapacitu_bez_sklzu(zac_pl_mes,kon_pl_mes,p_idpo_stroje,p_idnad_spol1,p_cpv,p_cov)
#######################
define zac_pl_mes,kon_pl_mes datetime year to minute
define p_idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define p_cpv like pl_rezerv_kapacita.cpv
define p_cov like pl_rezerv_kapacita.cov
define obsadena_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define zac_pl_mes_ch,kon_pl_mes_ch char(18)
define ret char(2000)
define p_obdobie like pl_rezerv_kapacita.obdobie

define try,a char

let try = true
let a = false
let zac_pl_mes_ch = "'",zac_pl_mes,"'"
let kon_pl_mes_ch = "'",kon_pl_mes,"'"
let p_obdobie = extend(zac_pl_mes,year to month)

while try
let txt2 = ""

if p_idnad_spol1 is not null then
	--vyber pre top firmy
	let ret =
	"select ",
	"sum( ",
	"(case when p.kon_plan > extend('",kon_pl_mes,"',year to minute) then extend('",kon_pl_mes,"',year to minute) else p.kon_plan end - ",
	"case when p.zac_plan < extend('",zac_pl_mes,"',year to minute) then extend('",zac_pl_mes,"',year to minute) else p.zac_plan end) - ",
	"odstavky_useku( ",
	"case when p.zac_plan < extend('",zac_pl_mes,"',year to minute) then extend('",zac_pl_mes,"',year to minute) else p.zac_plan end, ",
	"case when p.kon_plan > extend('",kon_pl_mes,"',year to minute) then extend('",kon_pl_mes,"',year to minute) else p.kon_plan end, ",
	"p.idpo_stroje))  ",
	"from pl_harm ha,pl_harmpolozka p,pl_sledpolozka d,pl_subeh u,pl_prac_uloha r,vp_polot l,v_prikazy v,pl_skup_stroj sk  ",
	"where ",
	"p.idpl_harm = ha.id and ",
	"ha.cpv = ",gpodnik," and ",
	"ha.zac_periody > '",ref_cas,"' and ",
        -----------------
	"p.idpo_stroje = sk.idpo_stroje and ",
	"sk.idpo_stroje_skup = ",p_idpo_stroje," and ",
	--"p.idpl_harm = h.id and ",
	--"h.cpv = ",p_cpv," and ",
	--"h.cov = ",p_cov," and ",
	------------------------------
	"d.id = p.idpl_sledpolozka and ",
	"d.platnost = 1 and ",
	"u.id = d.idpl_subeh and ",
	"r.idpl_subeh = u.id and ",
	"r.idvp_polot = l.id and ",
	"v.por_vp = l.por_polot and ",
	"l.max_kon_cas_hr >= current year to minute and ", --podmienka,ktora vylucuje sklzy
	"( ",
	"p.zac_plan between extend('",zac_pl_mes,"',year to minute) and extend('",kon_pl_mes,"',year to minute) or ",
	"p.kon_plan between extend('",zac_pl_mes,"',year to minute) and extend('",kon_pl_mes,"',year to minute) ",
	")  and ",
	"exists ",
	"(select n1.id ",
	"from exp_kalk:nad_spol n, ",
	"exp_kalk:nad_spol1 n1 ",
	"where ",
	"n.podnik = n1.podnik and ",
	"n.nsp1 = n1.nsp1 and ",
	"n.platnostk >= today and ",
	"n1.platnostk >= today and ",
	"n1.topklient = 'A' and ",
	"n.podnik = v.podv and ",
	"n.nsp2 = v.porf_plan and ", --zmena 26.1.12
	"n1.id = ",p_idnad_spol1,")"
else
	--vyber pre ostatne firmy
	let ret =
	"select ",
	"sum( ",
	"(case when p.kon_plan > extend('",kon_pl_mes,"',year to minute) then extend('",kon_pl_mes,"',year to minute) else p.kon_plan end - ",
	"case when p.zac_plan < extend('",zac_pl_mes,"',year to minute) then extend('",zac_pl_mes,"',year to minute) else p.zac_plan end) - ",
	"odstavky_useku( ",
	"case when p.zac_plan < extend('",zac_pl_mes,"',year to minute) then extend('",zac_pl_mes,"',year to minute) else p.zac_plan end, ",
	"case when p.kon_plan > extend('",kon_pl_mes,"',year to minute) then extend('",kon_pl_mes,"',year to minute) else p.kon_plan end, ",
	"p.idpo_stroje))  ",
	"from pl_harm ha,pl_harmpolozka p,pl_sledpolozka d,pl_subeh u,pl_prac_uloha r,vp_polot l,v_prikazy v,pl_skup_stroj sk ",
	"where ",
	"p.idpl_harm = ha.id and ",
	"ha.cpv = ",gpodnik," and ",
	"ha.zac_periody > '",ref_cas,"' and ",
        -----------------
	"p.idpo_stroje = sk.idpo_stroje and ",
	"sk.idpo_stroje_skup = ",p_idpo_stroje," and ",
	--"p.idpl_harm = h.id and ",
	--"h.cpv = ",p_cpv," and ",
	--"h.cov = ",p_cov," and ",
	----------------------------
	"d.id = p.idpl_sledpolozka and ",
	"d.platnost = 1 and ",
	"u.id = d.idpl_subeh and ",
	"r.idpl_subeh = u.id and ",
	"r.idvp_polot = l.id and ",
	"v.por_vp = l.por_polot and ",
	"( ",
	"p.zac_plan between extend('",zac_pl_mes,"',year to minute) and extend('",kon_pl_mes,"',year to minute) or ",
	"p.kon_plan between extend('",zac_pl_mes,"',year to minute) and extend('",kon_pl_mes,"',year to minute) ",
	")  and ",
	"not exists ",--firma neexistuje medzi rezervovanymi top klientmi pre dane obdobie a oddelenie
	"(select n1.id ",
	"from exp_kalk:nad_spol n, ",
	"exp_kalk:nad_spol1 n1, ",
	"pl_rezerv_kapacita r ",
	"where ",
	"r.cpv = ",p_cpv," and ",
	"r.cov = ",p_cov," and ",
	"r.obdobie = '",p_obdobie,"' and ",
	"r.idpo_stroje = ",p_idpo_stroje," and ",
	"r.idnad_spol1 = n1.id and ",
	"r.rezerv_kapacita > interval(000 00:00) day(3) to minute and ",
	"n.podnik = n1.podnik and ",
	"n.nsp1 = n1.nsp1 and ",
	"n.platnostk >= today and ",
	"n1.platnostk >= today and ",
	"n1.topklient = 'A' and ",
	"n.podnik = v.podv and ",
	"n.nsp2 = v.porf_plan) " --zmena 26.1.12
end if

whenever error continue
prepare prep_ret_zisti2 from ret
if sqlca.sqlcode = 0 then
        declare obsadene2 cursor for prep_ret_zisti2
end if
if sqlca.sqlcode = 0 then
        open obsadene2
end if
if sqlca.sqlcode = 0 then
        fetch obsadene2 into obsadena_kapacita
end if
if sqlca.sqlcode = 0 then
        close obsadene2
end if
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		if obsadena_kapacita is null then
			let obsadena_kapacita = interval(000 00:00) day(3) to minute
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Finalna veta prikazu nebola najdena!"
		end if
	end if
free obsadene2
return a,obsadena_kapacita
end function

#######################
function vyb_sklz_top_firmy(zac_pl_mes,kon_pl_mes,p_idpo_stroje,p_cpv,p_cov)
#######################
define zac_pl_mes,kon_pl_mes datetime year to minute
define p_idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define p_cpv like pl_rezerv_kapacita.cpv
define p_cov like pl_rezerv_kapacita.cov
define sklz_top_firmy like pl_rezerv_kapacita.rezerv_kapacita
define zac_pl_mes_ch,kon_pl_mes_ch char(18)
define ret char(2000)
define p_obdobie like pl_rezerv_kapacita.obdobie

define try,a char

let try = true
let a = false
let zac_pl_mes_ch = "'",zac_pl_mes,"'"
let kon_pl_mes_ch = "'",kon_pl_mes,"'"
let p_obdobie = extend(zac_pl_mes,year to month)

while try
let txt2 = ""

let ret =
"select ",
"sum( ",
"(case when p.kon_plan > extend('",kon_pl_mes,"',year to minute) then extend('",kon_pl_mes,"',year to minute) else p.kon_plan end - ",
"case when p.zac_plan < extend('",zac_pl_mes,"',year to minute) then extend('",zac_pl_mes,"',year to minute) else p.zac_plan end) - ",
"odstavky_useku( ",
"case when p.zac_plan < extend('",zac_pl_mes,"',year to minute) then extend('",zac_pl_mes,"',year to minute) else p.zac_plan end, ",
"case when p.kon_plan > extend('",kon_pl_mes,"',year to minute) then extend('",kon_pl_mes,"',year to minute) else p.kon_plan end, ",
"p.idpo_stroje))  ",
"from pl_harm ha,pl_harmpolozka p,pl_sledpolozka d,pl_subeh u,pl_prac_uloha r,vp_polot l,v_prikazy v,pl_skup_stroj sk  ",
"where ",
"p.idpl_harm = ha.id and ",
"ha.cpv = ",gpodnik," and ",
"ha.zac_periody > '",ref_cas,"' and ",
-----------------
"p.idpo_stroje = sk.idpo_stroje and ",
"sk.idpo_stroje_skup = ",p_idpo_stroje," and ",
--"p.idpl_harm = h.id and ",
--"h.cpv = ",p_cpv," and ",
--"h.cov = ",p_cov," and ",
------------------------------
"d.id = p.idpl_sledpolozka and ",
"d.platnost = 1 and ",
"u.id = d.idpl_subeh and ",
"r.idpl_subeh = u.id and ",
"r.idvp_polot = l.id and ",
"v.por_vp = l.por_polot and ",
"l.max_kon_cas_hr < current year to minute and ", --podmienka sklzu
"( ",
"p.zac_plan between extend('",zac_pl_mes,"',year to minute) and extend('",kon_pl_mes,"',year to minute) or ",
"p.kon_plan between extend('",zac_pl_mes,"',year to minute) and extend('",kon_pl_mes,"',year to minute) ",
")  and ",
"exists ",--rezervovani top klientmi pre dane obdobie a oddelenie
"(select n1.id ",
"from exp_kalk:nad_spol n, ",
"exp_kalk:nad_spol1 n1, ",
"pl_rezerv_kapacita r ",
"where ",
"r.cpv = ",p_cpv," and ",
"r.cov = ",p_cov," and ",
"r.obdobie = '",p_obdobie,"' and ",
"r.idpo_stroje = ",p_idpo_stroje," and ",
"r.idnad_spol1 = n1.id and ",
"r.rezerv_kapacita > interval(000 00:00) day(3) to minute and ",
"n.podnik = n1.podnik and ",
"n.nsp1 = n1.nsp1 and ",
"n.platnostk >= today and ",
"n1.platnostk >= today and ",
"n1.topklient = 'A' and ",
"n.podnik = v.podv and ",
"n.nsp2 = v.porf_plan) " --zmena 26.1.12

whenever error continue
prepare prep_ret_zisti3 from ret
if sqlca.sqlcode = 0 then
        declare obsadene3 cursor for prep_ret_zisti3
end if
if sqlca.sqlcode = 0 then
        open obsadene3
end if
if sqlca.sqlcode = 0 then
        fetch obsadene3 into sklz_top_firmy
end if
if sqlca.sqlcode = 0 then
        close obsadene3
end if
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		if sklz_top_firmy is null then
			let sklz_top_firmy = interval(000 00:00) day(3) to minute
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Finalna veta prikazu nebola najdena!"
		end if
	end if
free obsadene3
return a,sklz_top_firmy
end function

###########################
function daj_podiel_sklzu(rezerv_kapacita,p_idpo_stroje,p_cpv,p_obdobie,p_cov)
###########################
define zac_pl_mes,kon_pl_mes datetime year to minute
define p_idpo_stroje like pl_rezerv_kapacita.idpo_stroje
define p_idnad_spol1 like pl_rezerv_kapacita.idnad_spol1
define p_cpv like pl_rezerv_kapacita.cpv
define p_obdobie like pl_rezerv_kapacita.obdobie
define p_cov like pl_rezerv_kapacita.cov
define podiel_sklzu,sklz_top_firmy like pl_rezerv_kapacita.rezerv_kapacita
define dispon_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define dispon_kapacita_hour interval hour(9) to hour 
define dispon_kapacita_char char(20)
define dispon_kapacita_int int  
define rezerv_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define rezerv_kapacita_min interval minute(9) to minute 
define rezerv_kapacita_char char(20)
define rezerv_kapacita_int int
define rezerv_kapacita_hod dec(12,3)  
define sklz_na_hod interval hour to minute
define a char
define zac_obd,kon_obd datetime year to minute

let a = true

if a then
   call vyb_hranice_obd(p_cpv,p_obdobie) returning a,zac_obd,kon_obd
end if
if a then
   call vyb_sklz_top_firmy(zac_obd,kon_obd,p_idpo_stroje,p_cpv,p_cov) returning a,sklz_top_firmy
end if
if a then
   call vyb_dispon_kapacitu(p_cpv,p_obdobie,p_idpo_stroje) returning a,dispon_kapacita
end if
if a then
   let dispon_kapacita_hour = dispon_kapacita
   let dispon_kapacita_char = dispon_kapacita_hour
   let dispon_kapacita_int = dispon_kapacita_char

   let rezerv_kapacita_min = rezerv_kapacita
   let rezerv_kapacita_char = rezerv_kapacita_min
   let rezerv_kapacita_int = rezerv_kapacita_char
   let rezerv_kapacita_hod = rezerv_kapacita_int/60 

   let sklz_na_hod = sklz_top_firmy/dispon_kapacita_int
   let podiel_sklzu = sklz_na_hod * rezerv_kapacita_hod 
end if

return a,podiel_sklzu
end function

--test ci nie je viac rezervovane ako je disponibilna kapacita za dane obdobie 
#######################
function vyb_dispon_kapacitu(p_cpv,p_obdobie,p_idpo_stroje_skup)
#######################
define p_cpv like pl_rezerv_kapacita.cpv
define p_obdobie like pl_rezerv_kapacita.obdobie
define p_idpo_stroje_skup like pl_rezerv_kapacita.idpo_stroje
define dispon_kapacita like pl_rezerv_kapacita.rezerv_kapacita
define try,a char
define l_text char(500)

let try = true
let a = false

while try
let txt2 = ""
let l_text =
"select ",
"sum((ka.kon_obdobia - ka.zac_obdobia) - odstavky_useku(ka.zac_obdobia,ka.kon_obdobia,s.id)) ",
"from pl_kalendar_obdobi ka,polot2:po_stroje s,pl_skup_stroj sk ",
"where ",
"ka.cpv = ",p_cpv," and ",
"ka.obdobie = '",p_obdobie,"' and ",
"s.cp = ka.cpv and ",
"sk.idpo_stroje = s.id and ",
"s.id = sk.idpo_stroje and ",
"current between s.platnostod and s.platnostdo and ",
"s.planovanie = 'A' and ",
"sk.idpo_stroje_skup = ",p_idpo_stroje_skup

whenever error continue
prepare prep_text_s002 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_s002 into dispon_kapacita
end if

{
select
  sum((ka.kon_obdobia - ka.zac_obdobia) - odstavky_useku(ka.zac_obdobia,ka.kon_obdobia,s.id))
into
  dispon_kapacita
from pl_kalendar_obdobi ka,polot2:po_stroje s,pl_skup_stroj sk
where
ka.cpv = p_cpv and
ka.obdobie = p_obdobie and
s.cp = ka.cpv and
sk.idpo_stroje = s.id and
s.id = sk.idpo_stroje and
--s.kodstr<>'TEST' and
--s.kodstr<>'SLEEP' and
--5.4.12----------------------
current between s.platnostod and s.platnostdo and
s.planovanie = 'A' and
------------------------------
sk.idpo_stroje_skup = p_idpo_stroje_skup
}
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		let txt1 = ""
	else
		if chyba1 < 0 then
			let txt1 = "Disponibil.kapacita nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Disponibil.kapacita nebola najdena!"
		end if
	end if
free prep_text_s002
return a,dispon_kapacita
end function

##########################
report print_error2(i,l_text)
##########################
define i smallint
define l_text char(80)
output report to "file_error.txt"

left margin 0
right margin 0
top margin 0
bottom margin 0

format
page header
   print "VYPIS NEVYHOVUJUCICH PAPAMETROV NA ODDELENI ",postupy[i].cov using "<<<&"
   print "Cislo_vp:        ",plan.cislo_vp
   print "Cislo sortimentu:",plan.csort," - ",plan.nazsort clipped
   print "Cislo ref.vzoru: ",plan.crefv,"/",plan.kodzmen using "<&"
   print "--------------------------------------------------------------------------------"

on every row
   print l_text clipped
end report


#######################
function najdi_miesto2(rok,tyzden,per,idpo_stroje,posun,i)
#######################
define rok,tyzden,per smallint --startovacia perioda
define idpo_stroje like pl_harmpolozka.idpo_stroje
define posun char
define i smallint
define a char
define b char --priznak ci sa podarilo zaradit
define c char --priznak ci sa prekrocili hranice
define d char --ci je kalendarna kapacita v periode
define cas_zac_per,cas_kon_per datetime year to minute
--define uloha array[50] of record --pole dolezitych uloh
define uloha dynamic array of record --pole dolezitych uloh
   rok like pl_harm.rok_zac,
   tyzden like pl_harm.tyzden_zac,
   per like pl_harm.perioda,
   zac_per like pl_harm.zac_periody,
   kon_per like pl_harm.kon_periody,
   id_per_posl_kon like pl_harmpolozka.idpl_harm,
   poradie_posl_kon like pl_harmpolozka.poradie,
   cas_posl_kon like pl_harmpolozka.kon_plan,
   id_per_presah_kon like pl_harmpolozka.idpl_harm,
   cas_presah_kon like pl_harmpolozka.kon_plan,
   id_per_presah_zac like pl_harmpolozka.idpl_harm,
   cas_presah_zac like pl_harmpolozka.zac_plan,
   cista_per char, --priznak, ci je perioda uplne cista
   zac_miesta datetime year to minute,
   kon_miesta datetime year to minute,
   id_presah like pl_harmpolozka.id --id presahu pre posun poradia
end record
define poc_per,poradie_per smallint
define volne_miesto interval hour(4) to minute
define poradie_pred_oper like pl_harmpolozka.poradie
----
define kon_presah_ods like pl_kapkalendar.zac_useku
define zac_presah_ods like pl_kapkalendar.zac_useku
define zac_ods like pl_kapkalendar.zac_useku
define kon_ods like pl_kapkalendar.zac_useku
define interval_ods interval hour(9) to minute
----
define aktual_rok,aktual_tyz,aktual_per smallint
define aktual_cas datetime year to minute
define l_pocet smallint

let a = false
let b = false
let c = false
let poradie_per = 1
let volne_miesto = interval(00:00) hour to minute
initialize ppolozka.* to null
initialize uloha to null --inicializacia pola
let aktual_cas = current year to minute
call perioda(aktual_cas) returning aktual_rok,aktual_tyz,aktual_per

while true
   let uloha[poradie_per].rok = rok
   let uloha[poradie_per].tyzden = tyzden
   let uloha[poradie_per].per = per
   call hranice_periody(rok,tyzden,per) returning uloha[poradie_per].zac_per,uloha[poradie_per].kon_per

   call najdi_posl_kon(postupy[i].podv,postupy[i].cov,rok,tyzden,per,idpo_stroje) returning a,uloha[poradie_per].id_per_posl_kon,uloha[poradie_per].poradie_posl_kon,uloha[poradie_per].cas_posl_kon
   if a then
	call najdi_presah_kon(postupy[i].podv,postupy[i].cov,uloha[poradie_per].zac_per,uloha[poradie_per].kon_per,idpo_stroje) returning a,uloha[poradie_per].id_per_presah_kon,uloha[poradie_per].cas_presah_kon
   end if
   if a then
	call najdi_presah_zac(postupy[i].podv,postupy[i].cov,uloha[poradie_per].zac_per,uloha[poradie_per].kon_per,idpo_stroje) returning a,uloha[poradie_per].id_per_presah_zac,uloha[poradie_per].id_presah,uloha[poradie_per].cas_presah_zac
   end if
   if a then
	---zakladne testy ci je nejake miesto, aby sa dalo zacat---- 
	if poradie_per = 1 then
	   if uloha[poradie_per].cas_posl_kon > uloha[poradie_per].kon_per then --operacia konci mimo periody
		let b = false
		exit while
	   end if
	   
	   if uloha[poradie_per].cas_presah_kon > uloha[poradie_per].kon_per then
		let b = false
		exit while
	   end if
	end if
	------------------------------------------------------------ 
	----Napocet volneho miesta---------------
	if uloha[poradie_per].cas_posl_kon is not null then
		let uloha[poradie_per].zac_miesta = uloha[poradie_per].cas_posl_kon
	else
	   if uloha[poradie_per].cas_presah_kon is not null then
		let uloha[poradie_per].zac_miesta = uloha[poradie_per].cas_presah_kon
	   end if
	end if
	if uloha[poradie_per].zac_miesta is null then
	   let uloha[poradie_per].zac_miesta = uloha[poradie_per].zac_per
	end if
	------
	if uloha[poradie_per].cas_presah_zac is not null then
	   let uloha[poradie_per].kon_miesta = uloha[poradie_per].cas_presah_zac
	end if
	if uloha[poradie_per].kon_miesta is null then
	   let uloha[poradie_per].kon_miesta = uloha[poradie_per].kon_per
	end if
	------
	--14.7.11 dodatok pre upresnenie volneho miesta aktualnej periody-----
	if rok = aktual_rok and
	   tyzden = aktual_tyz and
	   per = aktual_per then
		if uloha[poradie_per].zac_miesta < aktual_cas then
			let uloha[poradie_per].zac_miesta = aktual_cas
		end if
	end if
	----------------------------------------------------------------------
	--kumulacia volneho miesta
	let volne_miesto = volne_miesto + (uloha[poradie_per].kon_miesta - uloha[poradie_per].zac_miesta)
	---Lycia
	---if volne_miesto < 0 then -opravena chyba pre Lycia
	if volne_miesto < interval(00:00) hour to minute then
		let volne_miesto = interval(00:00) hour to minute
	end if
	------------------------------------------------------

	---12.1.09--zohladnenie odstavok----
	call najdi_sumar_odstavok(idpo_stroje,uloha[1].zac_miesta,uloha[1].zac_miesta+volne_miesto) returning a,kon_presah_ods,zac_presah_ods,interval_ods
	if not a then
	   exit while 
	end if
	------------------------------------
	--1.6.09 ak v startovacej periode nie je miesto, neda sa zacat
	if poradie_per = 1 and
	   (volne_miesto -interval_ods) <= interval(00:00) hour to minute then
	   exit while
	end if
	-------------------------------------------------------------

	if (uloha[poradie_per].kon_miesta - uloha[poradie_per].zac_miesta) = dlzka_periody then
		let uloha[poradie_per].cista_per = true
	else
		let uloha[poradie_per].cista_per = false
	end if
{
	if postupy[i].cas_zost_i <= volne_miesto then
		let b = true
	end if
}
	---12.1.09--zohladnenie odstavok	
	if postupy[i].cas_zost_i <= (volne_miesto - interval_ods) then
		let b = true
	end if
	-----------------------------------------
	if not posun then --nie je posun, opustenie cyklu
	   exit while
	end if
	if b then --naslo sa miesto, opustenie cyklu
	   exit while
	else
	   if poradie_per = 1 then
		--nasleduje presah a ten sa zatial neposuva => niet miesto
		if uloha[poradie_per].cas_presah_zac is not null then
		   exit while

		end if
	   else
		if not uloha[poradie_per].cista_per then --dalej sa neda postupovat
		   exit while	
		end if
	   end if
	end if
   else
	exit while
   end if
   ----test na prekrocenie max_kon_per
   --if (uloha[1].zac_miesta + postupy[i].cas_plan_i) > postupy[i].max_kon_cas then
   if (uloha[1].zac_miesta + postupy[i].cas_zost_i) > postupy[i].max_kon_cas then
	let c = true --hranice boli prekrocene
	let b = false
	exit while --uprava 30.1.09
   end if
   -----------------------------------
   --26.1.16 pridany test dlhej odstavky
   call test_dlhej_odstavky(idpo_stroje,uloha[poradie_per].kon_per) returning a,l_pocet
   if a then
	if l_pocet > 0 then --na stroji je odstavka > ako 30 dni, nie je tu miesto na radenie
		let b = false
		exit while
	end if
   else
	exit while
   end if
   -----------------------------------
   let poradie_per = poradie_per + 1
   call perioda_posun(rok,tyzden,per,"+") returning rok,tyzden,per
end while

--let poc_per = poradie_per - 1
let poc_per = poradie_per --uprava 30.1.09
if a then
   if b then
	--definovanie zaciatku,konca a poradia operacie---
	if uloha[1].poradie_posl_kon is not null then
		let poradie_pred_oper = uloha[1].poradie_posl_kon 
        else
		let poradie_pred_oper = 0
	end if
	let ppolozka.rok_zac = uloha[1].rok 
	let ppolozka.tyzden_zac = uloha[1].tyzden
	let ppolozka.perioda = uloha[1].per
	let ppolozka.zac_periody = uloha[1].zac_per
	let ppolozka.kon_periody = uloha[1].kon_per
	let ppolozka.idpo_stroje = idpo_stroje
	let ppolozka.poradie = poradie_pred_oper + 1
	let ppolozka.cas_prace_plan = postupy[i].cas_zost_i
{
	let ppolozka.zac_plan = uloha[1].zac_miesta
	let ppolozka.kon_plan = uloha[1].zac_miesta + postupy[i].cas_zost_i --postupy[i].cas_plan_i
}
	--12.1.09 Novy algoritmus zaciatku a konca operacie zohlad.odstavky----
	if interval_ods > interval(00:00) hour to minute then
	   call najdi_hranice_oper(idpo_stroje,uloha[1].zac_miesta,uloha[1].zac_miesta+volne_miesto,postupy[i].cas_zost_i,kon_presah_ods) returning a,ppolozka.zac_plan,ppolozka.kon_plan
	else
	   --stara vetva bez odstavok
	   let ppolozka.zac_plan = uloha[1].zac_miesta
	   let ppolozka.kon_plan = uloha[1].zac_miesta + postupy[i].cas_zost_i --postupy[i].cas_plan_i
	end if
	-----------------------------------------------------------------------
	let ppolozka.cislo_vp = postupy[i].cislo_vp
	let ppolozka.stl = postupy[i].stl
	let ppolozka.riad = postupy[i].riad
	let ppolozka.cisoper = postupy[i].cisoper
	let ppolozka.stlo = postupy[i].stlo
	let ppolozka.riado = postupy[i].riado
	let ppolozka.cisopero = postupy[i].cisopero
	if postupy[i].mnoz_ks_vyst > 0 then
	   let ppolozka.mnoz_mj_plan = postupy[i].mnoz_ks_vyst
	   let ppolozka.mj = "KS"
	else
	   let ppolozka.mnoz_mj_plan = postupy[i].mnoz_bm_vyst
	   let ppolozka.mj = "BM"
	end if
{
	let ppolozka.cas_prip_plan = postupy[i].cas_prip_plan
	let ppolozka.cas_beh_plan = postupy[i].cas_beh_plan
	let ppolozka.cas_prip_plan_i = postupy[i].cas_prip_plan_i
	let ppolozka.cas_beh_plan_i = postupy[i].cas_beh_plan_i
}
	let ppolozka.cas_prip_plan = postupy[i].cas_prip_zost
	let ppolozka.cas_beh_plan = postupy[i].cas_beh_zost
	let ppolozka.cas_prip_plan_i = postupy[i].cas_prip_zost_i
	let ppolozka.cas_beh_plan_i = postupy[i].cas_beh_zost_i

	--naplnenie min_zac_per ak nevstupuje material--------------
	if postupy[i].min_zac_cas is not null then
		let ppolozka.min_zac_rok = postupy[i].min_zac_rok
		let ppolozka.min_zac_tyz = postupy[i].min_zac_tyz
		let ppolozka.min_zac_per = postupy[i].min_zac_per
		let ppolozka.min_zac_cas = postupy[i].min_zac_cas
	else
		let ppolozka.min_zac_rok = uloha[1].rok
		let ppolozka.min_zac_tyz = uloha[1].tyzden
		let ppolozka.min_zac_per = uloha[1].per
		let ppolozka.min_zac_cas = uloha[1].zac_per
	end if
	------------------------------------------------------------
	--------------------------------------------------
	--najdenie a definovanie posunutych operacii---
	if poc_per > 1 then
	   if uloha[poc_per].poradie_posl_kon is not null then --exist.operacie v posled.periode
		let ppolozka.posun_oper = true
		--let ppolozka.dlzka_posunu = ppolozka.kon_plan - uloha[1].zac_per
		let ppolozka.dlzka_posunu = ppolozka.kon_plan - uloha[poc_per].zac_per
	        let ppolozka.idpl_harm_posun = uloha[poc_per].id_per_posl_kon
	   else
		let ppolozka.posun_oper = false
	   end if
	else
	   let ppolozka.posun_oper = false
	end if
	-----------------------------------------------
	let ppolozka.min_zac_cas_hr = postupy[i].min_zac_cas_hr
	let ppolozka.max_kon_cas_hr = postupy[i].max_kon_cas_hr

	--5.5.09 podmienka na zmenu poradia presahu
	if uloha[1].cas_presah_zac is not null then
	   let ppolozka.posun_poradia_presahu = true
	   let ppolozka.id_presah = uloha[1].id_presah  
	else
	   let ppolozka.posun_poradia_presahu = false
	end if
	-------------------------------------------
	---29.6.09--test na posun-----------------------------
	if poradie_per > 1 then
	   call najdi_sumar_odstavok(idpo_stroje,uloha[poradie_per].zac_miesta,uloha[poradie_per].kon_miesta) returning a,kon_presah_ods,zac_presah_ods,interval_ods
	   if a then
		if ppolozka.dlzka_posunu > ((uloha[poradie_per].kon_miesta - uloha[poradie_per].zac_miesta) - interval_ods) then
		   let b = false
		end if
	   end if
	end if
	------------------------------------------------------
	if a then --dolezite kvoli funkcii najdi_hranice_oper
	   if b then --29.6.09 pre dodatocny test na posun
		--call trans_zapis_docas() returning a
	   end if
	end if
   end if
end if

return a,b,c
end function

--26.1.16 novy test na dlhe odstavky
#################################################
function test_dlhej_odstavky(l_idpo_stroje,l_kon_per) 
#################################################
define l_idpo_stroje like pl_harmpolozka.idpo_stroje
define l_kon_per like pl_harm.kon_periody
define l_pocet smallint
define a,b char
define l_text char(500)

let a = true
let b = true

let l_text = 
"select ",
"count(*) ",
"from pl_kapkalendar k ",
"where ",
"k.idpo_stroje = ",l_idpo_stroje," and ",
"k.kod_useku = 'O' and ",
"k.dlzka_useku > interval(30 00:00) day(3) to minute and ",
" '",l_kon_per,"' between k.zac_useku and k.kon_useku "

whenever error continue
prepare prep_text_s003 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_s003 into l_pocet
end if 
{
select
   count(*)
into
   l_pocet
from pl_kapkalendar k
where
k.idpo_stroje = l_idpo_stroje and
k.kod_useku = 'O' and
k.dlzka_useku > interval(30 00:00) day(3) to minute and
l_kon_per between k.zac_useku and k.kon_useku
}
whenever error stop
if sqlca.sqlcode < 0 then  
	let a = false
	let txt1 = "Problem pri teste na velku odstavku! Chyba:",sqlca.sqlcode using "-<<<<<<<&"
end if
free prep_text_s003
return a,l_pocet
end function

############################
function najdi_hranice_oper(idpo_stroje,zac_miesta,kon_miesta,cas_oper,kon_presah_ods)
############################
define idpo_stroje like pl_kapkalendar.idpo_stroje
define zac_miesta datetime year to minute
define kon_miesta datetime year to minute
define cas_oper like pl_prac_uloha.cas_prip_plan_i
define kon_presah_ods datetime year to minute
define zac_presah_ods datetime year to minute
define interval_ods interval hour(4) to minute
define zac_oper datetime year to minute
define kon_oper datetime year to minute
define a char
define i smallint

let a = false

if kon_presah_ods is not null then
   let zac_oper = kon_presah_ods
else
   let zac_oper = zac_miesta
end if
let kon_oper = zac_oper + cas_oper --prvotne stanovenie konca
call vyb_prestavok(idpo_stroje,zac_oper,kon_miesta) returning a
if a then
for i = 1 to 100
   if prestavky[i].zac_useku < kon_oper then
	let kon_oper = kon_oper + prestavky[i].dlzka_useku
   else
	exit for
   end if
end for
end if
return a,zac_oper,kon_oper
end function


##############################
function trans_zapis_docas()
##############################
define rok,tyz,per smallint
define a,wk char,
       idx int
let a = true
let wk = true
If beg_wk() then
	--posun pre dalsiu operaciu
	call perioda_posun(ppolozka.rok_zac,ppolozka.tyzden_zac,ppolozka.perioda,"-") returning rok,tyz,per 
	call upd_polozka_odb(ppolozka.cislo_vp,ppolozka.stl,ppolozka.riad,ppolozka.cisoper,rok,tyz,per,0) returning a
	if a then
	   call upd_polozka() returning a
	end if

  if a then
       call com_wk() returning wk
  else
       call rol_wk() returning wk
  end if

else
       let a = false
       let wk = false
end if

return a
end function

##############################
function trans_zapis_docas_uk_oper(cislo_vp,stl,riad,cisoper,rok,tyz,per)
##############################
define cislo_vp like vp_polot.cislo_vp
define stl like vp_polot.stl
define riad like vp_polot.riad
define cisoper like vp_polot.cisoper
define rok,tyz,per smallint
define a,wk char,
       idx int
let a = true
let wk = true
If beg_wk() then
	--posun pre dalsiu operaciu
	--call perioda_posun(rok,tyz,per,"-") returning rok,tyz,per 
	call upd_polozka_odb(cislo_vp,stl,riad,cisoper,rok,tyz,per,0) returning a
	if a then
	   call del_polozka(cislo_vp,stl,riad,cisoper) returning a
	end if

  if a then
       call com_wk() returning wk
  else
       call rol_wk() returning wk
  end if

else
       let a = false
       let wk = false
end if

return a
end function

##################
function del_polozka(cislo_vp,stl,riad,cisoper)
#################
define cislo_vp like vp_polot.cislo_vp
define stl like vp_polot.stl
define riad like vp_polot.riad
define cisoper like vp_polot.cisoper
define try,a char
define i integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
delete from  polozka
 where 
    polozka.cislo_vp = cislo_vp and
    polozka.stl = stl and
    polozka.riad = riad and
    polozka.cisoper = cisoper
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_02  = sqlca.sqlerrd[3]
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
return a
end function

#############################
function vytv_tab_polozka()
#############################
define a char

let a = false

whenever error continue
create temp table polozka (
    id serial,
    cpv smallint,
    cov  smallint,
    rok_zac  smallint,
    tyzden_zac  smallint,
    perioda  smallint,
    zac_periody datetime year to minute,
    kon_periody datetime year to minute,
    -----------------
    idpo_stroje integer,
    poradie smallint,
    zac_plan datetime year to minute,
    kon_plan datetime year to minute,
    min_zac_rok smallint,
    min_zac_tyz smallint,
    min_zac_per smallint,
    min_zac_cas datetime year to minute,
    max_kon_rok smallint,
    max_kon_tyz smallint,
    max_kon_per smallint,
    max_kon_cas datetime year to minute,
    min_zac_cas_hr datetime year to minute,
    max_kon_cas_hr datetime year to minute,
    cas_prace_plan interval hour(3) to minute,
    -----------------
    idvp_polot integer,
    cislo_vp char(8),
    stl smallint,
    riad smallint,
    cisoper smallint,
    stlo smallint,
    riado smallint,
    cisopero smallint,
    mnoz_kg_plan decimal(9,2),
    mnoz_mj_plan decimal(11,1),
    mj char(3),
    cas_prip_plan integer,
    cas_beh_plan integer,
    cas_prip_plan_i interval hour(3) to minute,
    cas_beh_plan_i interval hour(3) to minute,
    posun_oper char,
    dlzka_posunu interval hour(3) to minute,
    idpl_harm_posun integer,
    verzia_vp integer,
    posun_poradia_presahu char,
    id_presah integer
) with no log
whenever error stop
if sqlca.sqlcode = 0 or
   sqlca.sqlcode = -958 then --tabulka uz existuje
	let a = true
end if
return a
end function

##################
function del_tab_polozka()
#################
define try,a char
define i integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
delete from polozka
   where 
polozka.id is not null
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = true --tabulka moze byt aj prazdna
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"," pri mazani viet docasnej tabulky!"
end if
return a
end function

#############################
function zrus_tab_polozka()
#############################
define a char
let txt2 = ""
whenever error continue
drop table polozka
whenever error stop
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 = 0 or
   chyba1 = -206 then --takato tabulka neexistuje
   let a = true
else
   let a = false
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"," pri ruseni docasnej tabulky!"
end if
return a
end function


#################
function napln_tab_polozka(pcislo_vp)
#################
define pcislo_vp like vp_polot.cislo_vp
define try,a char
let try = true
let a = false
while try
let txt2 = ""

whenever error continue
insert into polozka (
id,
cpv,
cov,
idvp_polot,
cislo_vp,
stl,
riad,
cisoper,
stlo,
riado,
cisopero,
mnoz_kg_plan,
mnoz_mj_plan,
mj,
verzia_vp
)

select
0, --id 
vp_polot.podv cpv,
vp_polot.cov,
vp_polot.id idvp_polot,
vp_polot.cislo_vp,
vp_polot.stl,
vp_polot.riad,
vp_polot.cisoper,
vp_polot.stlo,
vp_polot.riado,
vp_polot.cisopero,
vp_polot.mnoz_kg,
0,
"XX",
vp_polot.verzia
from
vp_polot
where
vp_polot.cov not in (152,154,181) and --17.6.16 doplnene oddelenie 181, lebo sa odstavil stroj
vp_polot.cislo_vp = pcislo_vp
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

############################
function upd_polozka_odb(pcislo_vp,pstl,priad,pcisoper,prok,ptyzden,pper,is_final)
############################
define pcislo_vp like vp_polot.cislo_vp
define pstl like vp_polot.stlo
define priad like vp_polot.riado
define pcisoper like vp_polot.cisopero
define prok,ptyzden,pper smallint
define is_final char
define cas_zac_per,cas_kon_per datetime year to minute
define try,a char

call hranice_periody(prok,ptyzden,pper) returning cas_zac_per,cas_kon_per
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
if is_final then
	update  polozka set 
	     polozka.max_kon_rok = prok,
	     polozka.max_kon_tyz = ptyzden,
	     polozka.max_kon_per = pper,
	     polozka.max_kon_cas = cas_kon_per
			 where 
	 polozka.cislo_vp = pcislo_vp and
	 polozka.stlo = pstl and
	 polozka.riado = priad and
	 polozka.cisopero = pcisoper and
	 polozka.stl = 0 and
	 polozka.riad = 0 and
	 polozka.cisoper = 0
else
	update  polozka set 
	     polozka.max_kon_rok = prok,
	     polozka.max_kon_tyz = ptyzden,
	     polozka.max_kon_per = pper,
	     polozka.max_kon_cas = cas_kon_per
			 where 
	 polozka.cislo_vp = pcislo_vp and
	 polozka.stlo = pstl and
	 polozka.riado = priad and
	 polozka.cisopero = pcisoper and
	(( polozka.stl <> 0 and
	 polozka.riad <> 0) or
	 polozka.cisoper <> 0)
end if
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    --let a = false
    let a = true
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
return a
end function

############################
function upd_polozka()
############################
define try,a char
define l_text char(2000)

let try = true
let a = false
while try
let txt2 = ""
{
let l_text =
"update tpv:polozka set ",
"   tpv:polozka.rok_zac = ",ppolozka.rok_zac,", ",
"   tpv:polozka.tyzden_zac = ",ppolozka.tyzden_zac,", ",
"   tpv:polozka.perioda = ",ppolozka.perioda,", ",
"   tpv:polozka.zac_periody = '",ppolozka.zac_periody,"', ",
"   tpv:polozka.kon_periody = '",ppolozka.kon_periody,"', ",
"   tpv:polozka.idpo_stroje = ",ppolozka.idpo_stroje,", ",
"   tpv:polozka.poradie = ",ppolozka.poradie,", ",
"   tpv:polozka.zac_plan = '",ppolozka.zac_plan,"', ",
"   tpv:polozka.kon_plan = '",ppolozka.kon_plan,"', ",
"   tpv:polozka.min_zac_rok = ",ppolozka.min_zac_rok,", ",
"   tpv:polozka.min_zac_tyz = ",ppolozka.min_zac_tyz,", ",
"   tpv:polozka.min_zac_per = ",ppolozka.min_zac_per,", ",
"   tpv:polozka.min_zac_cas = '",ppolozka.min_zac_cas,"', ",
"   tpv:polozka.min_zac_cas_hr = '",ppolozka.min_zac_cas_hr,"', ",
"   tpv:polozka.max_kon_cas_hr = '",ppolozka.max_kon_cas_hr,"', ",
"   tpv:polozka.cas_prace_plan = '",ppolozka.cas_prace_plan,"', ", --pridane 29.1.09
"   tpv:polozka.posun_oper = '",ppolozka.posun_oper,"', ",
"   tpv:polozka.dlzka_posunu = '",ppolozka.dlzka_posunu,"', ",
"   tpv:polozka.idpl_harm_posun = ",ppolozka.idpl_harm_posun,", ",
   ---
"   tpv:polozka.mnoz_mj_plan = ",ppolozka.mnoz_mj_plan,", ",
"   tpv:polozka.mj = '",ppolozka.mj,"', ",
"   tpv:polozka.cas_prip_plan = ",ppolozka.cas_prip_plan,", ",
"   tpv:polozka.cas_beh_plan = ",ppolozka.cas_beh_plan,", ",
"   tpv:polozka.cas_prip_plan_i = '",ppolozka.cas_prip_plan_i,"', ",
"   tpv:polozka.cas_beh_plan_i = '",ppolozka.cas_beh_plan_i,"', ",
"   tpv:polozka.posun_poradia_presahu = '",ppolozka.posun_poradia_presahu,"', ",
"   tpv:polozka.id_presah = ",ppolozka.id_presah," ",
" where ",
"   tpv:polozka.cislo_vp = '",ppolozka.cislo_vp,"' and ",
"   tpv:polozka.stl = ",ppolozka.stl," and ",
"   tpv:polozka.riad = ",ppolozka.riad," and ",
"   tpv:polozka.cisoper = ",ppolozka.cisoper
}
   
whenever error continue
{
prepare prep_text_u010 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_u010
end if
}

update  polozka set
    polozka.rok_zac = ppolozka.rok_zac,
    polozka.tyzden_zac = ppolozka.tyzden_zac,
    polozka.perioda = ppolozka.perioda,
    polozka.zac_periody = ppolozka.zac_periody,
    polozka.kon_periody = ppolozka.kon_periody,
    polozka.idpo_stroje = ppolozka.idpo_stroje,
    polozka.poradie = ppolozka.poradie,
    polozka.zac_plan = ppolozka.zac_plan,
    polozka.kon_plan = ppolozka.kon_plan,
    polozka.min_zac_rok = ppolozka.min_zac_rok,
    polozka.min_zac_tyz = ppolozka.min_zac_tyz,
    polozka.min_zac_per = ppolozka.min_zac_per,
    polozka.min_zac_cas = ppolozka.min_zac_cas,
    polozka.min_zac_cas_hr = ppolozka.min_zac_cas_hr,
    polozka.max_kon_cas_hr = ppolozka.max_kon_cas_hr,
    polozka.cas_prace_plan = ppolozka.cas_prace_plan, --pridane 29.1.09
    polozka.posun_oper = ppolozka.posun_oper,
    polozka.dlzka_posunu = ppolozka.dlzka_posunu,
    polozka.idpl_harm_posun = ppolozka.idpl_harm_posun,
   ---
    polozka.mnoz_mj_plan = ppolozka.mnoz_mj_plan,
    polozka.mj = ppolozka.mj,
    polozka.cas_prip_plan = ppolozka.cas_prip_plan,
    polozka.cas_beh_plan = ppolozka.cas_beh_plan,
    polozka.cas_prip_plan_i = ppolozka.cas_prip_plan_i,
    polozka.cas_beh_plan_i = ppolozka.cas_beh_plan_i,
    polozka.posun_poradia_presahu = ppolozka.posun_poradia_presahu,
    polozka.id_presah = ppolozka.id_presah
 where 
    polozka.cislo_vp = ppolozka.cislo_vp and
    polozka.stl = ppolozka.stl and
    polozka.riad = ppolozka.riad and
    polozka.cisoper = ppolozka.cisoper
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
--free prep_text_u010
return a
end function



--sekcia hladacich funkcii-------------

########################################
function najdi_posl_kon(cpv,cov,rok,tyzden,per,idpo_stroje)
########################################
define cpv like pl_harm.cpv
define cov like pl_harm.cov
define rok,tyzden,per smallint
define idpo_stroje like pl_harmpolozka.idpo_stroje
define a char
define idpl_harm like pl_harmpolozka.idpl_harm
define poradie like pl_harmpolozka.poradie
define kon_plan like pl_harmpolozka.kon_plan
define l_text char(1000)

let a = true

let l_text = 
"select ",
"	0, ",
"	polozka.poradie, ",
"	polozka.kon_plan ",
"from  polozka polozka ",
"where ",
"polozka.idpo_stroje = ",idpo_stroje," and ",
"polozka.cpv = ",cpv," and ",
"polozka.cov = ",cov," and ",
"polozka.rok_zac = ",rok," and ",
"polozka.tyzden_zac = ",tyzden," and ",
"polozka.perioda = ",per," and ",
--polozka.platnost = 1 and ",
"polozka.kon_plan = ", 
"(select max(x.kon_plan) from polozka x where ", 			
"	x.cpv = polozka.cpv and ",
"	x.cov = polozka.cov and ",
"	x.rok_zac = polozka.rok_zac and ",
"	x.tyzden_zac = polozka.tyzden_zac and ",
"	x.perioda = polozka.perioda and ",
"	x.idpo_stroje = polozka.idpo_stroje)"



whenever error continue
prepare prep_text_s004 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_s004 into
		idpl_harm,
		poradie,
		kon_plan
end if
	
--najprv sa hlada operacia zaradena v docas.tabulke
{
select 
	0,
	polozka.poradie,
	polozka.kon_plan
into
	idpl_harm,
	poradie,
	kon_plan
from tpv:polozka polozka
where
polozka.idpo_stroje = idpo_stroje and
polozka.cpv = cpv and
polozka.cov = cov and
polozka.rok_zac = rok and
polozka.tyzden_zac = tyzden and
polozka.perioda = per and
--polozka.platnost = 1 and
polozka.kon_plan = 
(select max(x.kon_plan) from polozka x where 			
	x.cpv = polozka.cpv and
	x.cov = polozka.cov and
	x.rok_zac = polozka.rok_zac and
	x.tyzden_zac = polozka.tyzden_zac and
	x.perioda = polozka.perioda and
	x.idpo_stroje = polozka.idpo_stroje)
}
if sqlca.sqlcode = 100 then
	let l_text =
	"select ",
	"	pl_harmpolozka.idpl_harm, ",
	"	pl_harmpolozka.poradie, ",
	"	pl_harmpolozka.kon_plan ",
	"from pl_harm,pl_harmpolozka ",
	"where ",
	"pl_harmpolozka.idpl_harm = pl_harm.id and ",
	"pl_harmpolozka.idpo_stroje = ",idpo_stroje," and ",
	"pl_harm.cpv = ",cpv," and ",
	"pl_harm.cov = ",cov," and ",
	"pl_harm.rok_zac = ",rok," and ",
	"pl_harm.tyzden_zac = ",tyzden," and ",
	"pl_harm.perioda = ",per," and ",
	"pl_harm.platnost = 1 and ",
	"pl_harmpolozka.kon_plan =  ",
	"(select max(x.kon_plan) from pl_harmpolozka x where  ",			
	"	x.idpl_harm = pl_harmpolozka.idpl_harm and ",
	"	x.idpo_stroje = pl_harmpolozka.idpo_stroje) "
	
	prepare prep_text_s005 from l_text
	if sqlca.sqlcode = 0 then
		execute prep_text_s005 into
			idpl_harm,
			poradie,
			kon_plan
	end if
	free prep_text_s005
{
	select 
		pl_harmpolozka.idpl_harm,
		pl_harmpolozka.poradie,
		pl_harmpolozka.kon_plan
	into
		idpl_harm,
		poradie,
		kon_plan
	from pl_harm,pl_harmpolozka
	where
	pl_harmpolozka.idpl_harm = pl_harm.id and
	pl_harmpolozka.idpo_stroje = idpo_stroje and
	pl_harm.cpv = cpv and
	pl_harm.cov = cov and
	pl_harm.rok_zac = rok and
	pl_harm.tyzden_zac = tyzden and
	pl_harm.perioda = per and
	pl_harm.platnost = 1 and
	pl_harmpolozka.kon_plan = 
	(select max(x.kon_plan) from pl_harmpolozka x where 			
		x.idpl_harm = pl_harmpolozka.idpl_harm and
		x.idpo_stroje = pl_harmpolozka.idpo_stroje)
}
end if
whenever error stop
if sqlca.sqlcode < 0 then  
	let a = false
	let txt1 = "Problem pri vybere z pl_harmpolozka! Chyba:",sqlca.sqlcode using "-<<<<<<<&"
end if
free prep_text_s004
return a,idpl_harm,poradie,kon_plan
end function

########################################
function najdi_presah_kon(cpv,cov,zac_per,kon_per,idpo_stroje)
########################################
define cpv like pl_harm.cpv
define cov like pl_harm.cov
define zac_per like pl_harm.zac_periody
define kon_per like pl_harm.kon_periody
define idpo_stroje like pl_harmpolozka.idpo_stroje
define a char
define idpl_harm like pl_harmpolozka.idpl_harm
define kon_plan like pl_harmpolozka.kon_plan

let a = true

whenever error continue
--najprv sa hlada operacia zaradena v docas.tabulke
select 
	0,
	polozka.kon_plan
into
	idpl_harm,
	kon_plan
from polozka
where
polozka.idpo_stroje = idpo_stroje and
polozka.cpv = cpv and
polozka.cov = cov and
--polozka.platnost = 1 and
polozka.zac_plan < zac_per and
polozka.kon_plan > zac_per --and
--polozka.kon_plan <= kon_per --doplnena podmienka

if sqlca.sqlcode = 100 then
	select 
		pl_harmpolozka.idpl_harm,
		pl_harmpolozka.kon_plan
	into
		idpl_harm,
		kon_plan
	from pl_harm,pl_harmpolozka
	where
	pl_harmpolozka.idpl_harm = pl_harm.id and
	pl_harmpolozka.idpo_stroje = idpo_stroje and
	pl_harm.cpv = cpv and
	pl_harm.cov = cov and
	pl_harm.zac_periody < zac_per and --nahradna podmienka
	pl_harm.platnost = 1 and
	--pl_harmpolozka.zac_plan < zac_per and
	pl_harmpolozka.kon_plan > zac_per --and
	--pl_harmpolozka.kon_plan <= kon_per --doplnena podmienka
end if
whenever error stop
if sqlca.sqlcode < 0 then  
	let a = false
	let txt1 = "Problem pri vybere konca presahu z pl_harmpolozka! Chyba:",sqlca.sqlcode using "-<<<<<<<&"
end if

return a,idpl_harm,kon_plan
end function

########################################
function najdi_presah_zac(cpv,cov,zac_per,kon_per,idpo_stroje)
########################################
define cpv like pl_harm.cpv
define cov like pl_harm.cov
define zac_per like pl_harm.zac_periody
define kon_per like pl_harm.kon_periody
define idpo_stroje like pl_harmpolozka.idpo_stroje
define a char
define id_presah like pl_harmpolozka.id
define idpl_harm like pl_harmpolozka.idpl_harm
define zac_plan like pl_harmpolozka.kon_plan

let a = true

whenever error continue
--najprv sa hlada operacia zaradena v docas.tabulke
select 
	0,
	polozka.zac_plan
into
	idpl_harm,
	zac_plan
from polozka
where
polozka.idpo_stroje = idpo_stroje and
polozka.cpv = cpv and
polozka.cov = cov and
--polozka.platnost = 1 and
polozka.zac_plan between zac_per and kon_per and
polozka.kon_plan > kon_per

if sqlca.sqlcode = 100 then
	select 
		pl_harmpolozka.id,
		pl_harmpolozka.idpl_harm,
		pl_harmpolozka.zac_plan
	into
		id_presah,
		idpl_harm,
		zac_plan
	from pl_harm,pl_harmpolozka
	where
	pl_harmpolozka.idpl_harm = pl_harm.id and
	pl_harmpolozka.idpo_stroje = idpo_stroje and
	pl_harm.cpv = cpv and
	pl_harm.cov = cov and
	pl_harm.zac_periody = zac_per and --nahradna podmienka
	pl_harm.platnost = 1 and
	--pl_harmpolozka.zac_plan between zac_per and kon_per and --16.8.13 obnovena vyradena podmienka
								--lebo su problemy synchronizacia period	
	pl_harmpolozka.kon_plan > kon_per
end if
whenever error stop
if sqlca.sqlcode < 0 then  
	let a = false
	let txt1 = "Problem pri vybere zaciatku presahu z pl_harmpolozka! Chyba:",sqlca.sqlcode using "-<<<<<<<&"
end if

return a,idpl_harm,id_presah,zac_plan
end function


########################################
function najdi_sumar_odstavok(idpo_stroje,zac_miesta,kon_miesta)
########################################
define idpo_stroje like pl_harmpolozka.idpo_stroje
define zac_miesta datetime year to minute
define kon_miesta datetime year to minute
define a,b char
define poc int
define kon_presah_ods like pl_kapkalendar.zac_useku
define zac_presah_ods like pl_kapkalendar.zac_useku
define zac_ods like pl_kapkalendar.zac_useku
define kon_ods like pl_kapkalendar.zac_useku
define interval_ods interval hour(9) to minute

let a = true
let b = true
let kon_presah_ods = null
let zac_presah_ods = null
let zac_ods = null
let kon_ods = null

whenever error continue
--test na existenciu odstavky cez celu periodu
select
     count(*)
into
     poc
from pl_kapkalendar
where
pl_kapkalendar.kod_useku = "O" and
pl_kapkalendar.idpo_stroje = idpo_stroje and
pl_kapkalendar.zac_useku < zac_miesta and
pl_kapkalendar.kon_useku > kon_miesta
--------------
if sqlca.sqlcode >= 0 then
   if poc = 0 then
	--kon_presah_ods
	select
	      pl_kapkalendar.kon_useku
	into
	      kon_presah_ods 
	from pl_kapkalendar
	where
	pl_kapkalendar.kod_useku = "O" and
	pl_kapkalendar.idpo_stroje = idpo_stroje and
	--pl_kapkalendar.zac_useku <=  zac_miesta and --aj odstavky zacinajuce presne na zaciatku miesta
	pl_kapkalendar.zac_useku < zac_miesta and --15.7.11 nove 16.8.13 -nemoze byt rovny, lebo to by nebol presah!
	pl_kapkalendar.kon_useku > zac_miesta and
	--pl_kapkalendar.kon_useku < kon_miesta 
	pl_kapkalendar.kon_useku <= kon_miesta --aj odstavky konciace presne na konci miesta
	--------------
	if sqlca.sqlcode >= 0 then
		--zac_presah_ods
		select
		   pl_kapkalendar.zac_useku
		into
		   zac_presah_ods
		from pl_kapkalendar
		where
		pl_kapkalendar.kod_useku = "O" and
		pl_kapkalendar.idpo_stroje = idpo_stroje and
		--pl_kapkalendar.zac_useku > zac_miesta and --15.7.11 nove
		pl_kapkalendar.zac_useku >= zac_miesta and --16.8.13 znova aj tu odstavky mozu zacinat presne od zac_miesta
		pl_kapkalendar.zac_useku < kon_miesta and
		pl_kapkalendar.kon_useku > kon_miesta --nemoze byt rovny, lebo to uz by nebol presah!
	end if
	if sqlca.sqlcode >= 0 then
		--odstavky v useku volneho miesta
		select
		    sum(pl_kapkalendar.kon_useku - pl_kapkalendar.zac_useku)
		into
		    interval_ods
		from pl_kapkalendar
		where
		pl_kapkalendar.kod_useku = "O" and
		pl_kapkalendar.idpo_stroje = idpo_stroje and
		--pl_kapkalendar.zac_useku > zac_miesta and
		--pl_kapkalendar.kon_useku < kon_miesta
		pl_kapkalendar.zac_useku >= zac_miesta and --15.7.11 nove
		pl_kapkalendar.kon_useku <= kon_miesta --15.7.11 nove
	end if
   else
	let b = false --nie je disponibilna kapacita v mieste
   end if
end if
whenever error stop

if sqlca.sqlcode < 0 then  
	let a = false
	let txt1 = "Problem pri vybere odstavok z pl_kapkalendar! Chyba:",sqlca.sqlcode using "-<<<<<<<&"
end if
if a then
   if interval_ods is null then
	let interval_ods = interval(00:00) hour to minute
   end if
   if not b then
	let interval_ods = kon_miesta - zac_miesta --cele miesto je prestavka
   else
	if kon_presah_ods is not null then
		let interval_ods = interval_ods + (kon_presah_ods - zac_miesta)
	end if
	if zac_presah_ods is not null then
		let interval_ods = interval_ods + (kon_miesta - zac_presah_ods)
	end if
   end if
end if

return a,kon_presah_ods,zac_presah_ods,interval_ods
end function

########################################
function najdi_kon_presah_ods(idpo_stroje,zac_miesta,kon_miesta)
########################################
define idpo_stroje like pl_harmpolozka.idpo_stroje
define zac_miesta datetime year to minute
define kon_miesta datetime year to minute
define a,b char
define poc int
define kon_presah_ods like pl_kapkalendar.zac_useku
define zac_presah_ods like pl_kapkalendar.zac_useku
define zac_ods like pl_kapkalendar.zac_useku
define kon_ods like pl_kapkalendar.zac_useku
define interval_ods interval hour(4) to minute

let a = true
let b = true
let kon_presah_ods = null
let zac_presah_ods = null
let zac_ods = null
let kon_ods = null

whenever error continue
	--kon_presah_ods
	select
	      pl_kapkalendar.kon_useku
	into
	      kon_presah_ods 
	from pl_kapkalendar
	where
	pl_kapkalendar.kod_useku = "O" and
	pl_kapkalendar.idpo_stroje = idpo_stroje and
	--pl_kapkalendar.zac_useku <=  zac_miesta and --aj odstavky zacinajuce presne na zaciatku miesta
	pl_kapkalendar.zac_useku < zac_miesta and --15.7.11 nove 16.8.13 -nemoze byt rovny, lebo to by nebol presah!
	pl_kapkalendar.kon_useku > zac_miesta and
	--pl_kapkalendar.kon_useku < kon_miesta 
	pl_kapkalendar.kon_useku <= kon_miesta --aj odstavky konciace presne na konci miesta
whenever error stop

if sqlca.sqlcode < 0 then  
	let a = false
	let txt1 = "Problem pri vybere odstavok z pl_kapkalendar! Chyba:",sqlca.sqlcode using "-<<<<<<<&"
end if

return a,kon_presah_ods
end function


#######################
function inic_postupy()
#######################
{
define i,j smallint
for i = 1 to 50
   if postupy[i].id is null then
	exit for
   end if
   initialize postupy_prazd.* to null
   let postupy[i].* = postupy_prazd.*
   call inic_stroje(i)
end for
}
--initialize postupy to null
call postupy.clear()
call inic_stroje()
end function


#######################
function inic_stroje() --machines
#######################
{
define i,j smallint
for j = 1 to 50
   if stroj[i,j].idpo_stroje is null then
	exit for
   end if
   initialize stroj_prazd.* to null
   let stroj[i,j].* = stroj_prazd.*
end for
}
--initialize stroj to null
call stroj.clear()
end function

#######################
function inic_operacie()
#######################
{
define i smallint
for i = 1 to 150
    if operacie[i].id is null then
	exit for
    end if
    initialize operacie_prazd.* to null
    let operacie[i].* = operacie_prazd.*
end for
}
--initialize operacie to null
call operacie.clear()
end function

#######################
function vyb_odb_postupy(pidpl_poziad_progn,pcislo_vp,kod_vyberu) --select operation for one order and machines
#######################
define pidpl_poziad_progn like pl_dostup_zdroja.idpl_poziad_progn
define pcislo_vp like vp_polot.cislo_vp
define kod_vyberu char --U -uvodny vyber vsetkych operacii, O-vyber odoberajucich operacii
define is_final char
define pom_filter char(25)
define a char
define text_a char(3000)
define rok,tyz,per smallint
define cas_zac_per,cas_kon_per datetime year to minute

call inic_postupy() --initialize of arrays
let a = true

let text_a = "select ",
"vp_polot.id, ",
"vp_polot.cislo_vp, ",
"vp_polot.por_polot, ",
"vp_polot.datplat, ",
"vp_polot.podv, ",
"\"000\" kodss, ",
"vp_polot.csf, ",
"vp_polot.coo, ",
"vp_polot.cso, ",
"vp_polot.cov, ",
"vp_polot.csv, ",
"vp_polot.stlo, ",
"vp_polot.riado, ",
"vp_polot.cisopero, ",
"vp_polot.stl, ",
"vp_polot.riad, ",
"vp_polot.cisoper, ",
"vp_polot.gram, ",
"vp_polot.mikron, ",
"vp_polot.sirka, ",
"vp_polot.sirka_vst, ",
"vp_polot.mnoz_kg_vyst, ",
"vp_polot.mnoz_bm_vyst, ",
"vp_polot.mnoz_ks_vyst, ",
"vp_polot.mnoz_m2_vyst, ",
"vp_polot.mnoz_kg_beh, ",
"vp_polot.mnoz_bm_beh, ",
"vp_polot.mnoz_ks_beh, ",
"vp_polot.mnoz_kg_vst, ",
"vp_polot.mnoz_bm_vst, ",
"vp_polot.mnoz_ks_vst, ",
"vp_polot.mnoz_m2_vst, ",
"vp_polot.casmont, ",
"vp_polot.caszabeh, ",
"vp_polot.casmies, ",
"vp_polot.casdemont, ",
"vp_polot.cascisten, ",
"vp_polot.casbeh, ",
"vp_polot.ctv, ",
"vp_polot.cto, ",
"vp_polot.koef, ",
"vp_polot.obj_kg, ",
"vp_polot.obj_sirka, ",
"sort.novecsv, ",
"sort.techn, ",
"sort.vzor, ",
"vp_polot.ctoper, ",
"ht_vpvyr.vyrkg, ",
"ht_vpvyr.vyrbm, ",
"ht_vpvyr.vyrks, ",
"ht_vpvyr.datukvyr, ",
" pl_oper.kod_oper,",
"(select max(pl_dostup_zdroja.termin_dodania) from ",
"pl_sledpolozka, ",
"pl_vyuz_zdroj, ",
"pl_dostup_zdroja ",
"where ",
"pl_sledpolozka.idvp_polot = vp_polot.id and ",
"pl_vyuz_zdroj.idpl_sledpolozka = pl_sledpolozka.id and ",
"pl_dostup_zdroja.idpl_vyuz_zdroj = pl_vyuz_zdroj.id and ",
"pl_sledpolozka.platnost = 1 and ",
"pl_dostup_zdroja.platnost = 1 and ",
"pl_dostup_zdroja.idpl_poziad_progn = ",pidpl_poziad_progn,"), ",
"(select max(pl_dobyzrenia.caszrenia) * 60 ", --pozor je tu prepocet caszrenia na minuty
"from pl_dobyzrenia ",
"where ",
"pl_dobyzrenia.cpv = vp_polot.podv and ",
"pl_dobyzrenia.cov = vp_polot.cov and ",
"pl_dobyzrenia.csv = vp_polot.csv and ",
"pl_dobyzrenia.ctoper = vp_polot.ctoper and ",
"pl_dobyzrenia.coo = vp_polot.coo and ",
"today between ",
"pl_dobyzrenia.platnostod and ",
"pl_dobyzrenia.platnostdo),",
"polozka.max_kon_rok,",
"polozka.max_kon_tyz,",
"polozka.max_kon_per,",
"polozka.max_kon_cas ",
---
"from ",
" vp_polot vp_polot,outer kalkul2:sort sort,",
"outer  pl_oper pl_oper,",
" polozka polozka,",
--"outer polot2:ht_vpvyr ht_vpvyr ",
"polot2:ht_vpvyr ht_vpvyr, v_prikazy v_prikazy ",
"where ",
"v_prikazy.cislo_vp = vp_polot.cislo_vp and ",
"ht_vpvyr.cislo_vp = vp_polot.cislo_vp and ",
"ht_vpvyr.stl = vp_polot.stl and ",
"ht_vpvyr.riad = vp_polot.riad and ",
"ht_vpvyr.cisoper = vp_polot.cisoper and ",
"(ht_vpvyr.datukvyr is null or (v_prikazy.ckz[1] = 'I' and vp_polot.stl = 0)) and ", --zmenene 5.2.16
"polozka.cislo_vp = vp_polot.cislo_vp and ",
"polozka.stl = vp_polot.stl and ",
"polozka.riad = vp_polot.riad and ",
"polozka.cisoper = vp_polot.cisoper and ",
"pl_oper.ctoper = vp_polot.ctoper and ",
" sort.datplat = vp_polot.datplat and ",
" sort.podv = vp_polot.podv and ",
" sort.csv = vp_polot.csv and ",
"vp_polot.cov not in (152,154,181) and ",--17.6.16 doplnene oddelenie 181, lebo sa odstavil stroj
"vp_polot.cislo_vp = \"",pcislo_vp,"\" and ",
--dolezita podmienka:nasledujuce odober.operacie----
"polozka.zac_plan is null and ",
"polozka.max_kon_per is not null ",
----------------------------------------------------
"order by stl desc, riad desc, cisoper desc"

whenever error continue
prepare preptext_a from text_a 
whenever error stop
if sqlca.sqlcode < 0 then
   let a = false
   let txt1 = "Chyba pri preparovani vyberu operaciii z vp_polot cislo:",sqlca.sqlcode using "-<<<<<&"
end if
if a then
   whenever error continue
   declare kpostupy_odb cursor for preptext_a
   let k_post = 1
   foreach 
	kpostupy_odb into postupy[k_post].*
	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri vybere operacii z vp_polot cislo:",sqlca.sqlcode using "-<<<<<&"
	   exit foreach
	end if
	------
	--zmenene 5.2.16 --CP VP------------------------------
	--osetrenie nezaberania miesta finalom CP a ukoncenym finalom VP IPP
	--if (postupy[k_post].cislo_vp[1] matches "[346]" and postupy[k_post].stl = 0) or
	if (plan.crefv[1] = "C" and postupy[k_post].stl = 0) or --lepsia podmienka
	   (postupy[k_post].datukvyr is not null and postupy[k_post].stl = 0 and plan.ckz[1] = "I") then
		let postupy[k_post].mnoz_kg_vyst = 1
		let postupy[k_post].mnoz_bm_vyst = 1
		let postupy[k_post].mnoz_ks_vyst = 1
		let postupy[k_post].mnoz_m2_vyst = 1
		let postupy[k_post].mnoz_kg_beh = 1
		let postupy[k_post].mnoz_bm_beh = 1
		let postupy[k_post].mnoz_ks_beh = 1
		let postupy[k_post].mnoz_kg_vst = 1
		let postupy[k_post].mnoz_bm_vst = 1
		let postupy[k_post].mnoz_ks_vst = 1
		let postupy[k_post].mnoz_m2_vst = 1
		let postupy[k_post].casmont = 0
		let postupy[k_post].caszabeh = 0
		let postupy[k_post].casmies = 0
		let postupy[k_post].casdemont = 0
		let postupy[k_post].cascisten = 0
		let postupy[k_post].casbeh = 1
	end if
	-------------------------------------------------------

	--13.7.2018 doplnene pre ZCP----------------------------
	--osetrenie nezaberania miesta finalom ZCP
	if (plan.crefv[1] = "Z" and postupy[k_post].stl = 0) then
		call vyb_sum_mnozstva_zakl_vp(postupy[k_post].cislo_vp) returning a,
		postupy[k_post].mnoz_kg_vyst,
		postupy[k_post].mnoz_bm_vyst,
		postupy[k_post].mnoz_ks_vyst,
		postupy[k_post].mnoz_m2_vyst,
		postupy[k_post].mnoz_kg_beh,
		postupy[k_post].mnoz_bm_beh,
		postupy[k_post].mnoz_ks_beh,
		postupy[k_post].mnoz_kg_vst,
		postupy[k_post].mnoz_bm_vst,
		postupy[k_post].mnoz_ks_vst,
		postupy[k_post].mnoz_m2_vst,
		postupy[k_post].casmont,
		postupy[k_post].caszabeh,
		postupy[k_post].casmies,
		postupy[k_post].casdemont,
		postupy[k_post].cascisten,
		postupy[k_post].casbeh

		if not a then
		   exit foreach
		end if
	end if
	--------------------------------------------------------
	if postupy[k_post].caszrenia is null then
		let postupy[k_post].caszrenia = 0
	end if
	let postupy[k_post].cas_prip_plan_i =
		(postupy[k_post].casmont + 
		postupy[k_post].caszabeh +
		postupy[k_post].casmies +
		postupy[k_post].casdemont +
		postupy[k_post].cascisten) units minute
	let postupy[k_post].cas_beh_plan_i = 
		(postupy[k_post].casbeh) units minute
	let postupy[k_post].cas_plan_i = 
		postupy[k_post].cas_prip_plan_i +
		postupy[k_post].cas_beh_plan_i
	let postupy[k_post].cas_prip_plan =
		postupy[k_post].casmont + 
		postupy[k_post].caszabeh +
		postupy[k_post].casmies +
		postupy[k_post].casdemont +
		postupy[k_post].cascisten

	let postupy[k_post].cas_beh_plan =
		postupy[k_post].casbeh

	let postupy[k_post].cas_plan = 
		postupy[k_post].cas_prip_plan +
		postupy[k_post].cas_beh_plan

{
	if postupy[k_post].vyrkg > 0 then
	   let postupy[k_post].cas_beh_skut_i = 
		vypoc_cas_skut(postupy[k_post].casbeh,postupy[k_post].mnoz_kg_vyst,postupy[k_post].vyrkg,1)
	   let postupy[k_post].cas_prip_skut_i = postupy[k_post].cas_prip_plan_i --pripravny cas sa cely uskutocnil
	   let postupy[k_post].cas_beh_skut =
		vypoc_cas_skut(postupy[k_post].casbeh,postupy[k_post].mnoz_kg_vyst,postupy[k_post].vyrkg,0)
	   let postupy[k_post].cas_prip_skut = postupy[k_post].cas_prip_plan --pripravny cas sa cely uskutocnil
	else
	   let postupy[k_post].cas_beh_skut_i = "0:0"
	   let postupy[k_post].cas_beh_skut = 0
	   let postupy[k_post].cas_prip_skut_i = "0:0"
	   let postupy[k_post].cas_prip_skut = 0
	end if
}
	--9.2.12 uprava vypoctu skutocne minutych stratovych casov-----------------------
	if postupy[k_post].vyrkg > 0 then
	   let postupy[k_post].cas_beh_skut_i = 
		vypoc_cas_skut(postupy[k_post].casbeh,postupy[k_post].mnoz_kg_vyst,postupy[k_post].vyrkg,1)
	   let postupy[k_post].cas_prip_skut_i = --uskutocnilo sa iba cas pripravy pred behom
		(postupy[k_post].casmont + 
		postupy[k_post].caszabeh +
		postupy[k_post].casmies) units minute
	   let postupy[k_post].cas_beh_skut =
		vypoc_cas_skut(postupy[k_post].casbeh,postupy[k_post].mnoz_kg_vyst,postupy[k_post].vyrkg,0)
	   let postupy[k_post].cas_prip_skut = --uskutocnilo sa iba cas pripravy pred behom
		postupy[k_post].casmont + 
		postupy[k_post].caszabeh +
		postupy[k_post].casmies
	else
	   let postupy[k_post].cas_beh_skut_i = interval(00:00) hour to minute
	   let postupy[k_post].cas_beh_skut = 0
	   let postupy[k_post].cas_prip_skut_i = interval(00:00) hour to minute
	   let postupy[k_post].cas_prip_skut = 0
	end if
	---------------------------------------------------------------------------------

	let postupy[k_post].cas_skut_i = postupy[k_post].cas_beh_skut_i + postupy[k_post].cas_prip_skut_i
	let postupy[k_post].cas_skut = postupy[k_post].cas_beh_skut + postupy[k_post].cas_prip_skut

	let postupy[k_post].cas_beh_zost_i = postupy[k_post].cas_beh_plan_i - postupy[k_post].cas_beh_skut_i
	let postupy[k_post].cas_beh_zost = postupy[k_post].cas_beh_plan - postupy[k_post].cas_beh_skut
	let postupy[k_post].cas_prip_zost_i = postupy[k_post].cas_prip_plan_i - postupy[k_post].cas_prip_skut_i
	let postupy[k_post].cas_prip_zost = postupy[k_post].cas_prip_plan - postupy[k_post].cas_prip_skut
	--zvacsenie zostatku o rezervu-----
        let postupy[k_post].cas_beh_zost_i = postupy[k_post].cas_beh_zost_i * (1 + (pp_26.rezerva_per/100))
        let postupy[k_post].cas_beh_zost = postupy[k_post].cas_beh_zost * (1 + (pp_26.rezerva_per/100))
        let postupy[k_post].cas_prip_zost_i = postupy[k_post].cas_prip_zost_i * (1 + (pp_26.rezerva_per/100))
        let postupy[k_post].cas_prip_zost = postupy[k_post].cas_prip_zost * (1 + (pp_26.rezerva_per/100))
	----------------------------------

	let postupy[k_post].cas_zost_i = postupy[k_post].cas_beh_zost_i + postupy[k_post].cas_prip_zost_i
	let postupy[k_post].cas_zost = postupy[k_post].cas_beh_zost + postupy[k_post].cas_prip_zost 


	let postupy[k_post].celk_cas =
		postupy[k_post].cas_zost +
		postupy[k_post].caszrenia


	--POZOR--docasne na testovanie--------------------------
	--let postupy[k_post].cas_zost_i = postupy[k_post].cas_plan_i
	let postupy[k_post].celk_cas =
		postupy[k_post].cas_plan +
		postupy[k_post].caszrenia
	--let postupy[k_post].datukvyr = null
	if postupy[k_post].cas_zost_i <= interval(00:00) hour to minute or
	   postupy[k_post].cas_zost_i is null then --28.4.09 doplnena pre istotu prisnejsia podmienka
	   let postupy[k_post].cas_zost_i = interval(00:01) hour to minute --zatial
	   let postupy[k_post].cas_zost = 1 --zatial
	end if
	--------------------------------------------------------

	call perioda(extend(postupy[k_post].max_term_mat,year to minute)) returning rok,tyz,per
	call perioda_posun(rok,tyz,per,"+") returning postupy[k_post].min_zac_rok,postupy[k_post].min_zac_tyz,postupy[k_post].min_zac_per
	--call hranice_periody(postupy[k_post].min_zac_rok,postupy[k_post].min_zac_tyz,postupy[k_post].min_zac_per) returning postupy[k_post].min_zac_cas,cas_zac_per
	call hranice_periody(postupy[k_post].min_zac_rok,postupy[k_post].min_zac_tyz,postupy[k_post].min_zac_per) returning postupy[k_post].min_zac_cas,cas_kon_per
	------
	if sqlca.sqlcode = 0 then
	
		call vyb_stroje(k_post,postupy[k_post].datplat,postupy[k_post].podv,postupy[k_post].cov,postupy[k_post].csv,postupy[k_post].ctv,postupy[k_post].stl,postupy[k_post].riad,postupy[k_post].cisoper,postupy[k_post].sirka,postupy[k_post].sirka_vst,postupy[k_post].mikron,postupy[k_post].novecsv,postupy[k_post].por_polot,postupy[k_post].id) returning a,postupy[k_post].k_stroj
		if a then
		   if postupy[k_post].k_stroj = 0 then
			let a = false
			let txt1 = "Na oddeleni ",postupy[k_post].cov using "<<<&"," sa nenasiel ziadny stroj!"
			exit foreach
		   end if
		else
		   exit foreach
		end if
	end if
	------
	let k_post = k_post + 1
	
   end foreach
   whenever error stop
   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Chyba pri vybere operacii z vp_polot cislo:",sqlca.sqlcode using "-<<<<<&"
   end if
end if
if a then
   let k_post = k_post - 1
end if
free kpostupy_odb
return a
end function

#######################
function vyb_final(pcislo_vp)
#######################
define pcislo_vp like  v_prikazy.cislo_vp
define try,a char
define j smallint
define pocet smallint
define sum_koef,min_koef,kkoef like vp_polot.koef
define druh_prepoctu char(1)  --V -vrecka, T -tasky 
--define koef_kg_tks like  dopln_tasky.koef_kg_tks
-------------
define sirka_polot like  vp_polot.sirka
define pcto like  vp_polot.cto
define p_raport like  v_prikazy.raport
define p_nazsort like  v_prikazy.nazsort
define rok_natlac,tyz_natlac,per_natlac smallint
define l_text char(5000)

initialize plan.* to null
let try = true
let a = false

let l_text = 
"select ",
"    v_prikazy.cislo_vp, ",
"    v_prikazy.ckz, ",
"    v_prikazy.porc, ",
"    v_prikazy.por_vp , ",
"    v_prikazy.datplat , ",
"    v_prikazy.podv , ",
"    v_prikazy.fin_stred , ",
"    v_prikazy.csort , ",
"    v_prikazy.nazsort , ",
"    v_prikazy.novecsv , ",
"    v_prikazy.techn , ",
"    v_prikazy.vzor , ",
"    v_prikazy.gram , ",
"    v_prikazy.gramvyp , ",
"    v_prikazy.gramskut , ",
"    v_prikazy.mikron , ", 
    ---
"    v_prikazy.pocf , ",
"    v_prikazy.sek , ",
"    v_prikazy.raport , ",
"    v_prikazy.sirka , ",
"    v_prikazy.dlzka , ",
"    v_prikazy.hlbka , ",
"    v_prikazy.spodzalozka , ",
"    v_prikazy.vrchnazalozka , ",
"    v_prikazy.chlopna , ",
"    v_prikazy.perforaciadna , ",
"    v_prikazy.vzduchotvory , ",
"    v_prikazy.typplochzvaru , ",
"    v_prikazy.typchlopne , ", 
    ---
"    v_prikazy.merkg , ",
"    v_prikazy.merkgvyp , ",
"    v_prikazy.merjed , ",
"    v_prikazy.mj_ks , ",
"    v_prikazy.mnozkg , ",
"    v_prikazy.mnozks , ",
"    v_prikazy.mnozmt , ", 
    ---
"    0 mnozm2, ",
"    0 mnozbm, ",
"    0 mnozks, ",
"    0 mnozobr, ",
"    v_prikazy.navin, ",
"    v_prikazy.stav_prik, ",
"    v_prikazy.kodsps, ",
"    v_prikazy.ico, ",
"    v_prikazy.pcrefv, ",
"    v_prikazy.crefv, ",
"    v_prikazy.kodzmen, ",
"    v_prikazy.nove_prognoz, ",
"    v_prikazy.verzia, ",
    ---
"    vp_polot2.cto, ",
"    vp_polot2.sirka, ",
"    v_prikazy.nazsort, ",
"    v_prikazy.d_cislo_vp, ",
"    v_prikazy.dutinka, ",
    ---
"    v_p_motiv.kodval, ",
"    v_p_motiv.navfinal, ",
"    v_p_motiv.navtlac, ",
"    v_p_motiv.rozpsp, ",
"    v_p_motiv.sirprod, ",
"    v_p_motiv.okraj, ",
"    v_p_motiv.monobv, ",
"    v_p_motiv.monved, ",
"    v_p_motiv.obvodval, ",
"    v_p_motiv.tlac1, ",
"    v_p_motiv.vrch, ",
"    v_p_motiv.umiest, ",
"    v_p_motiv.zmrst, ",
"    v_p_motiv.hrubkaftp, ",
"    v_p_motiv.sleev_kj, ",
"    v_p_motiv.kompresleev, ",
"    v_p_motiv.typftp, ",
"    v_p_motiv.percskrat, ",
"    v_p_motiv.pocval, ",
"    v_p_motiv.mobvsada, ",
"    v_p_motiv.mvedsada, ",
"    v_p_motiv.zmens, ",
"    v_p_motiv.kodfamily, ",
"    v_p_motiv.typlakusz, ",
"    v_p_motiv.pozdlzzahyb, ",
"    v_p_motiv.celoplosnatlac, ",
"    v_p_motiv.is_presnyraport, ",
"    v_p_motiv.napocraportov, ",
"    v_p_motiv.nammraport, ",
"    v_p_motiv.raportminus, ",
"    v_p_motiv.raportplus, ",
"    v_p_motiv.unikod, ",
"    v_p_motiv.esa, ",
"    v_prikazy.nova_grafika, ",
"    today natlacokdat, ",
"    0 idnad_spol1, ", --temporary solution
{
"    (select n1.id from exp_kalk:nad_spol n,exp_kalk:nad_spol1 n1 where ",
"    n.podnik = n1.podnik and ",
"    n.nsp1 = n1.nsp1 and ",
"    n1.platnostk >= today and ",
"    n.platnostk >= today and ",
"    n.podnik = v_prikazy.podv and ",
"    n.nsp2 = v_prikazy.porf_plan and ", --zmena 26.1.12
"    n1.topklient = 'A') idnad_spol1, ",
}
"    v_prikazy.laseruprava, ",
"    v_prikazy.zadstrlava, ", --zadna lava strana vrecka
"    v_prikazy.zadstrprava ", --zadna prava strana vrecka --40
"from ",
" v_prikazy v_prikazy, ",
"outer  v_p_motiv v_p_motiv, ",
"outer  pl_rez_nasobok n, ",
"outer  pl_rez_okraj o, ",
"outer  vp_polot vp_polot2 ",
"where ",
"vp_polot2.cislo_vp = v_prikazy.cislo_vp and ",
"vp_polot2.stlo = 0 and ",
"vp_polot2.riado = 0 and ",
"vp_polot2.cisopero = 0 and ",
"vp_polot2.stl <> 0 and ",
"vp_polot2.riad <> 0 and ",
"vp_polot2.cisoper = 0 and ",
"vp_polot2.cto = 2 and ", --rezanie
"n.cpv = v_prikazy.podv and ",
"n.cov = v_prikazy.fin_stred and ",
"v_prikazy.sirka between n.vyst_sirka_od and n.vyst_sirka_do and ",
"o.cpv = v_prikazy.podv and ",
"o.cov = v_prikazy.fin_stred and ",
"v_p_motiv.por_vp = v_prikazy.por_vp and ",
"v_prikazy.cislo_vp = '",pcislo_vp,"'"

while try
let txt2 = ""
whenever error continue
prepare prep_final from l_text
if sqlca.sqlcode = 0 then
	execute prep_final into
	plan.cislo_vp,
    plan.ckz,
    plan.porc,
    plan.por_vp,
    plan.datplat,
    plan.podv,
    plan.fin_stred,
    plan.csort,
    plan.nazsort,
    plan.novecsv,
    plan.techn,
    plan.vzor,
    plan.gram,
    plan.gramvyp,
    plan.gramskut,
    plan.mikron,
    ---
    plan.pocf,
    plan.sek_raport,
    p_raport, --pomocne policko!
    plan.sirka,
    plan.dlzka,
    plan.hlbka,
    plan.spodzalozka,
    plan.vrchnazalozka,
    plan.chlopna,
    plan.perforaciadna,
    plan.vzduchotvory,
    plan.typplochzvaru,
    plan.typchlopne,
    ---
    plan.merkg,
    plan.merkgvyp,
    plan.merjed,
    plan.mj_ks,
    plan.mnozkg,
    plan.mnozks,
    plan.mnozmt,
    ---
    plan.mnoz_m2,
    plan.mnoz_bm,
    plan.mnoz_ks,
    plan.mnoz_obr,
    plan.navin,
    plan.stav_prik,
    plan.kodsps,
    plan.ico,
    plan.pcrefv,
    plan.crefv,
    plan.kodzmen,
    plan.nove_prognoz,
    plan.verzia,
    ----
    pcto,
    sirka_polot,
    p_nazsort,
    plan.d_cislo_vp,
    plan.dutinka,
    ----
    plan.kodval,
    plan.navfinal,
    plan.navtlac,
    plan.rozpsp,
    plan.sirprod,
    plan.okraj,
    plan.monobv,
    plan.monved,
    plan.obvodval,
    plan.tlac1,
    plan.vrch,
    plan.umiest,
    plan.zmrst,
    plan.hrubkaftp,
    plan.sleev_kj,
    plan.kompresleev,
    plan.typftp,
    plan.percskrat,
    plan.pocval,
    plan.mobvsada,
    plan.mvedsada,
    plan.zmens,
    plan.kodfamily,
    plan.typlakusz,
    plan.pozdlzzahyb,
    plan.celoplosnatlac,
    plan.is_presnyraport,
    plan.napocraportov,
    plan.nammraport,
    plan.raportminus,
    plan.raportplus,
    plan.unikod,
    plan.esa,
    plan.nova_grafika,
    plan.natlacokdat,
    plan.idnad_spol1,
    plan.laseruprava,
    plan.zadstrlava, --zadna lava strana vrecka
    plan.zadstrprava --zadna prava strana vrecka --39
end if
{
select
    v_prikazy.cislo_vp ,
    v_prikazy.ckz,
    v_prikazy.porc,
    v_prikazy.por_vp ,
    v_prikazy.datplat ,
    v_prikazy.podv ,
    v_prikazy.fin_stred ,
    v_prikazy.csort ,
    v_prikazy.nazsort ,
    v_prikazy.novecsv ,
    v_prikazy.techn ,
    v_prikazy.vzor ,
    v_prikazy.gram ,
    v_prikazy.gramvyp ,
    v_prikazy.gramskut ,
    v_prikazy.mikron ,
    ---
    v_prikazy.pocf ,
    v_prikazy.sek ,
    v_prikazy.raport ,
    v_prikazy.sirka ,
    v_prikazy.dlzka ,
    v_prikazy.hlbka ,
    v_prikazy.spodzalozka ,
    v_prikazy.vrchnazalozka ,
    v_prikazy.chlopna ,
    v_prikazy.perforaciadna ,
    v_prikazy.vzduchotvory ,
    v_prikazy.typplochzvaru ,
    v_prikazy.typchlopne ,
    ---
    v_prikazy.merkg ,
    v_prikazy.merkgvyp ,
    v_prikazy.merjed ,
    v_prikazy.mj_ks ,
    v_prikazy.mnozkg ,
    v_prikazy.mnozks ,
    v_prikazy.mnozmt ,
    ---
    ---
    0 mnozm2,
    0 mnozbm,
    0 mnozks,
    0 mnozobr,
    v_prikazy.navin,
    v_prikazy.stav_prik,
    v_prikazy.kodsps,
    v_prikazy.ico,
    v_prikazy.pcrefv,
    v_prikazy.crefv,
    v_prikazy.kodzmen,
    v_prikazy.nove_prognoz,
    v_prikazy.verzia,
    ---
    vp_polot2.cto,
    vp_polot2.sirka,
    v_prikazy.nazsort,
    v_prikazy.d_cislo_vp,
    v_prikazy.dutinka,
    ---
    v_p_motiv.kodval,
    v_p_motiv.navfinal,
    v_p_motiv.navtlac,
    v_p_motiv.rozpsp,
    v_p_motiv.sirprod,
    v_p_motiv.okraj,
    v_p_motiv.monobv,
    v_p_motiv.monved,
    v_p_motiv.obvodval,
    v_p_motiv.tlac1,
    v_p_motiv.vrch,
    v_p_motiv.umiest,
    v_p_motiv.zmrst,
    v_p_motiv.hrubkaftp,
    v_p_motiv.sleev_kj,
    v_p_motiv.kompresleev,
    v_p_motiv.typftp,
    v_p_motiv.percskrat,
    v_p_motiv.pocval,
    v_p_motiv.mobvsada,
    v_p_motiv.mvedsada,
    v_p_motiv.mvedsada,
    v_p_motiv.zmens,
    v_p_motiv.kodfamily,
    v_p_motiv.typlakusz,
    v_p_motiv.pozdlzzahyb,
    v_p_motiv.celoplosnatlac,
    v_p_motiv.is_presnyraport,
    v_p_motiv.napocraportov,
    v_p_motiv.nammraport,
    v_p_motiv.raportminus,
    v_p_motiv.raportplus,
    v_p_motiv.unikod,
    v_p_motiv.esa,
    v_prikazy.nova_grafika,
    kpolozky.natlacokdat,
    (select n1.id from exp_kalk:nad_spol n,exp_kalk:nad_spol1 n1 where
    n.podnik = n1.podnik and
    n.nsp1 = n1.nsp1 and
    n1.platnostk >= today and
    n.platnostk >= today and
    n.podnik = v_prikazy.podv and
    n.nsp2 = v_prikazy.porf_plan and --zmena 26.1.12
    n1.topklient = 'A') idnad_spol1,
    fivy.laseruprava,
    v_prikazy.zadstrlava, --zadna lava strana vrecka
    v_prikazy.zadstrprava --zadna prava strana vrecka
into
    plan.cislo_vp,
    plan.ckz,
    plan.porc,
    plan.por_vp,
    plan.datplat,
    plan.podv,
    plan.fin_stred,
    plan.csort,
    plan.nazsort,
    plan.novecsv,
    plan.techn,
    plan.vzor,
    plan.gram,
    plan.gramvyp,
    plan.gramskut,
    plan.mikron,
    ---
    plan.pocf,
    plan.sek_raport,
    p_raport, --pomocne policko!
    plan.sirka,
    plan.dlzka,
    plan.hlbka,
    plan.spodzalozka,
    plan.vrchnazalozka,
    plan.chlopna,
    plan.perforaciadna,
    plan.vzduchotvory,
    plan.typplochzvaru,
    plan.typchlopne,
    ---
    plan.merkg,
    plan.merkgvyp,
    plan.merjed,
    plan.mj_ks,
    plan.mnozkg,
    plan.mnozks,
    plan.mnozmt,
    ---
    plan.mnoz_m2,
    plan.mnoz_bm,
    plan.mnoz_ks,
    plan.mnoz_obr,
    plan.navin,
    plan.stav_prik,
    plan.kodsps,
    plan.ico,
    plan.pcrefv,
    plan.crefv,
    plan.kodzmen,
    plan.nove_prognoz,
    plan.verzia,
    ----
    pcto,
    sirka_polot,
    p_nazsort,
    plan.d_cislo_vp,
    plan.dutinka,
    ----
    plan.kodval,
    plan.navfinal,
    plan.navtlac,
    plan.rozpsp,
    plan.sirprod,
    plan.okraj,
    plan.monobv,
    plan.monved,
    plan.obvodval,
    plan.tlac1,
    plan.vrch,
    plan.umiest,
    plan.zmrst,
    plan.hrubkaftp,
    plan.sleev_kj,
    plan.kompresleev,
    plan.typftp,
    plan.percskrat,
    plan.pocval,
    plan.mobvsada,
    plan.mvedsada,
    plan.zmens,
    plan.kodfamily,
    plan.typlakusz,
    plan.pozdlzzahyb,
    plan.celoplosnatlac,
    plan.is_presnyraport,
    plan.napocraportov,
    plan.nammraport,
    plan.raportminus,
    plan.raportplus,
    plan.unikod,
    plan.esa,
    plan.nova_grafika,
    plan.natlacokdat,
    plan.idnad_spol1,
    plan.laseruprava,
    plan.zadstrlava, --zadna lava strana vrecka
    plan.zadstrprava --zadna prava strana vrecka
from
tpv:v_prikazy v_prikazy,
outer tpv:v_p_motiv v_p_motiv,
outer tpv:pl_rez_nasobok n,
outer tpv:pl_rez_okraj o,
outer tpv:vp_polot vp_polot2,
outer k_zmluvy:kpolozky kpolozky,
outer vyrobky:fivy fivy
where
fivy.porc = v_prikazy.pcrefv and
kpolozky.ckz = v_prikazy.ckz and
kpolozky.porc = v_prikazy.porc and
vp_polot2.cislo_vp = v_prikazy.cislo_vp and
vp_polot2.stlo = 0 and
vp_polot2.riado = 0 and
vp_polot2.cisopero = 0 and
vp_polot2.stl <> 0 and
vp_polot2.riad <> 0 and
vp_polot2.cisoper = 0 and
vp_polot2.cto = 2 and --rezanie
n.cpv = v_prikazy.podv and
n.cov = v_prikazy.fin_stred and
v_prikazy.sirka between n.vyst_sirka_od and n.vyst_sirka_do and
o.cpv = v_prikazy.podv and
o.cov = v_prikazy.fin_stred and
v_p_motiv.por_vp = v_prikazy.por_vp and
v_prikazy.cislo_vp = pcislo_vp
}
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		if plan.sek_raport = 0 or
		   plan.sek_raport is null then
			let plan.sek_raport = p_raport
		end if
		if plan.typplochzvaru is null then
			let plan.typplochzvaru = "-"
		end if
		if plan.typchlopne is null then
			let plan.typchlopne = "-"
		end if
		if plan.pocval is null then
			let plan.pocval = 0
		end if
		if plan.novecsv[4] = "6" and --vrecia
		   plan.vzor is null and
		   p_nazsort matches "*ROLO*" then --rolo vrecia
			let plan.vzor = 300
		end if
		--nove 1.10.07
		if plan.pocf > 0 then	
			if plan.gramskut > 0 then
				let plan.gram_nanos_susiny = plan.gramskut - plan.gram
			else
				let plan.gram_nanos_susiny = plan.gramvyp - plan.gram
			end if
			---15.3.2019 vyhodene testovanie stavu, zbytocne to zatazuje
			{
			--17.3.10 doplneny novy udaj
			if plan.tlac1 <> 1 then --zatial okrem HTL
			   call archiv(plan.cislo_vp) returning plan.stav_archivu
			end if
			}
		end if
		if plan.natlacokdat is not null then
			call perioda(extend(plan.natlacokdat,year to minute)) returning rok_natlac,tyz_natlac,per_natlac
			--je nutny posun, aby sa ziskala perioda, kde sa konci vyroba natlackov
			call perioda_posun(rok_natlac,tyz_natlac,per_natlac,"-") returning rok_natlac,tyz_natlac,per_natlac
			call hranice_periody(rok_natlac,tyz_natlac,per_natlac) returning plan.zac_per_vyr_natlac,plan.kon_per_vyr_natlac
		end if
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Finalna veta prikazu ",pcislo_vp," nebola najdena!"
		end if
	end if
free prep_final
return a
end function

#######################
function vyb_stroje(i,p_datplat,p_podv,p_cov,p_csv,p_ctv,p_stl,p_riad,p_cisoper,p_sirka,p_sirka_vst,p_mikron,p_novecsv,l_idv_prikazy,l_idvp_polot)
#######################
define i smallint
define p_datplat like vp_polot.datplat
define p_podv like vp_polot.podv
define p_cov like vp_polot.cov
define p_csv like vp_polot.csv
define p_ctv like vp_polot.ctv
define p_stl like vp_polot.stl
define p_riad like vp_polot.riad
define p_cisoper like vp_polot.cisoper
define p_sirka like vp_polot.sirka
define p_sirka_vst like vp_polot.sirka_vst
define p_mikron like vp_polot.mikron
define p_novecsv like v_prikazy.novecsv
define l_idv_prikazy like vp_polot.por_polot
define l_idvp_polot like vp_polot.por_polot
define k_stroj smallint
define a char
define csv like vp_polot.csv
define pcrefv like v_prikazy.pcrefv
define text3,preptext3 char(2500) --text premenne pre kurzor strojov
define vst_coldseal,vst_al char

let a = true
let vst_coldseal = false
let vst_al = false

--test pouzitelnosti stroja(ci vobec sa da pouzit, neskor sa z test_pl_pouzistroj pouziva poradie pri radeni na stroje
--preto je v tejto tabulke aspon jedna 'splachovacia veta' pre kazde oddelenie a operaciu
call test_pl_pouzistroj(p_podv,p_cov,p_csv,p_ctv,p_cisoper) returning a,csv,pcrefv
if not a then
   return a
end if

let text3 = "select ",
----
"po_stroje.id, ",
"po_stroje.cp, ",
"po_stroje.co, ",
"po_stroje.cstroj, ",
"po_stroje.nazstroja, ",
"pl_paramstroj.zaklvyroba, ",
"pl_paramstroj.tlac, ",
"pl_paramstroj.rezanie, ",
"pl_paramstroj.konfekcia, ",
"pl_paramstroj.kasirovanie, ",
"pl_paramstroj.min_vst_sirka, ",
"pl_paramstroj.max_vst_sirka, ",
"pl_paramstroj.min_vst_hrubka, ",
"pl_paramstroj.max_vst_hrubka, ",
"pl_paramstroj.min_vys_sirka, ",
"pl_paramstroj.max_vys_sirka, ",
"pl_paramstroj.min_vys_dlzka, ",
"pl_paramstroj.max_vys_dlzka, ",
"pl_paramstroj.korona_nevodiva, ",
"pl_paramstroj.korona_vodiva, ",
"pl_paramstroj.korona_umiest, ",
"pl_paramstroj.coldseal_pozdlz, ",
"pl_paramstroj.coldseal_umiest, ",
"pl_paramstroj.unikat_kody, ",
"pl_paramstroj.max_pocval, ",
"pl_paramstroj.min_tl_sirka, ",
"pl_paramstroj.max_tl_sirka, ",
"pl_paramstroj.min_obvodval, ",
"pl_paramstroj.max_obvodval, ",
"pl_paramstroj.presnyraport, ",
"pl_paramstroj.poc_obracacov, ",
"pl_paramstroj.kratka_vod_draha, ",
"pl_paramstroj.esa, ",
"pl_paramstroj.min_prie_navinu, ",
"pl_paramstroj.max_prie_navinu, ",
"pl_paramstroj.min_dutinka, ",
"pl_paramstroj.max_dutinka, ",
"pl_paramstroj.vzduch_otvory, ",
"pl_paramstroj.laser_perfor, ",
"pl_paramstroj.umiest_pozdl_zlep, ",
"pl_pouzistroj.priorita, ",
"pl_skup_stroj.idpo_stroje_skup, ",
"po_stroje_skup.cstroj ",
"from ",
"polot2:po_stroje po_stroje, ",
"pl_tech_zl,",
"pl_pouzistroj,",
"outer pl_paramstroj,",
"outer (pl_skup_stroj,polot2:po_stroje po_stroje_skup) ",
"where ",
"po_stroje.planovanie = 'A' and ", --21.7.11 novy pridany priznak
"po_stroje.skupinovy = 'N' and ", --21.7.11 novy pridany priznak
"pl_skup_stroj.idpo_stroje = po_stroje.id and ",
"po_stroje_skup.id = pl_skup_stroj.idpo_stroje_skup and ",
"pl_pouzistroj.cpv = ",p_podv," and ",
"pl_pouzistroj.cov = ",p_cov," and ",
"pl_pouzistroj.csv = \"",csv,"\" and ",
"pl_pouzistroj.idtechzl = pl_tech_zl.id and ",
"pl_pouzistroj.idfivy = ",pcrefv," and ",
"pl_tech_zl.cpv = ",p_podv," and ",
"pl_tech_zl.ctv = ",p_ctv," and ",
"pl_tech_zl.cisoper = ",p_cisoper," and ",
"pl_paramstroj.idpo_stroje = po_stroje.id and ",
"po_stroje.id = pl_pouzistroj.idpo_stroje and ",
--"po_stroje.kodstr not in (\"SLEEP\",\"TEST\") ",
--5.4.12----------------------
"current between po_stroje.platnostod and po_stroje.platnostdo and ",
"po_stroje.planovanie = 'A' ",
------------------------------
"order by pl_pouzistroj.priorita,po_stroje.cstroj "

whenever error continue
prepare preptext3 from text3 
whenever error stop
if sqlca.sqlcode < 0 then
   let a = false
   let txt1 = "Chyba pri preparovani cislo:",sqlca.sqlcode using "-<<<<<&"
end if
if a then
   whenever error continue
   declare kstroje cursor for preptext3
   let k_stroj= 1
   foreach 
	kstroje into 
	    stroj[i,k_stroj].idpo_stroje,
	    stroj[i,k_stroj].cpv ,
	    stroj[i,k_stroj].cov ,
	    stroj[i,k_stroj].cstroj ,
	    stroj[i,k_stroj].nazstroja ,
	    stroj[i,k_stroj].zaklvyroba ,
	    stroj[i,k_stroj].tlac ,
	    stroj[i,k_stroj].rezanie ,
	    stroj[i,k_stroj].konfekcia ,
	    stroj[i,k_stroj].kasirovanie ,
	    stroj[i,k_stroj].min_vst_sirka ,
	    stroj[i,k_stroj].max_vst_sirka ,
	    stroj[i,k_stroj].min_vst_hrubka ,
	    stroj[i,k_stroj].max_vst_hrubka ,
	    stroj[i,k_stroj].min_vys_sirka ,
	    stroj[i,k_stroj].max_vys_sirka ,
	    stroj[i,k_stroj].min_vys_dlzka ,
	    stroj[i,k_stroj].max_vys_dlzka ,
	    stroj[i,k_stroj].korona_nevodiva ,
	    stroj[i,k_stroj].korona_vodiva ,
	    stroj[i,k_stroj].korona_umiest ,
	    stroj[i,k_stroj].coldseal_pozdlz ,
	    stroj[i,k_stroj].coldseal_umiest ,
	    stroj[i,k_stroj].unikat_kody ,
	    stroj[i,k_stroj].max_pocval ,
	    stroj[i,k_stroj].min_tl_sirka ,
	    stroj[i,k_stroj].max_tl_sirka ,
	    stroj[i,k_stroj].min_obvodval ,
	    stroj[i,k_stroj].max_obvodval ,
	    stroj[i,k_stroj].presnyraport ,
	    stroj[i,k_stroj].poc_obracacov ,
	    stroj[i,k_stroj].kratka_vod_draha ,
	    stroj[i,k_stroj].esa ,
	    stroj[i,k_stroj].min_prie_navinu ,
	    stroj[i,k_stroj].max_prie_navinu ,
	    stroj[i,k_stroj].min_dutinka ,
	    stroj[i,k_stroj].max_dutinka ,
	    stroj[i,k_stroj].vzduch_otvory ,
	    stroj[i,k_stroj].laser_perfor ,
	    stroj[i,k_stroj].umiest_pozdl_zlep ,
	    stroj[i,k_stroj].priorita ,
	    stroj[i,k_stroj].idpo_stroje_skup,
	    stroj[i,k_stroj].cstroj_skup 
	------
	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri vybere strojov cislo:",sqlca.sqlcode using "-<<<<<&"
	   exit foreach
	end if
	if p_cov = 178 or
	   p_cov = 172 then
	   --call test_vst_coldseal(p_datplat,p_podv,p_csv,p_cisoper) returning a,vst_coldseal
	end if
	if a then
	   if p_cov = 172 then
		--call test_vst_al(p_datplat,p_podv,p_csv,p_cisoper) returning a,vst_al
	   end if
	end if
	if a then
	   call test_param_stroja(i,k_stroj,p_stl,p_riad,p_cisoper,p_sirka,p_sirka_vst,p_mikron,p_novecsv,vst_coldseal,vst_al,l_idv_prikazy,l_idvp_polot) returning stroj[i,k_stroj].pouzitelny
	   let k_stroj = k_stroj + 1
	end if
   end foreach
   whenever error stop
   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Chyba pri vybere strojov cislo:",sqlca.sqlcode using "-<<<<<&"
   end if
end if
if a then
	let k_stroj = k_stroj - 1
	--let postupy[i].k_stroj = k_stroj
end if
free kstroje
return a,k_stroj
end function

###########################
function test_pl_pouzistroj(p_podv,p_cov,p_csv,p_ctv,p_cisoper)
###########################
define p_podv like vp_polot.podv
define p_cov like vp_polot.cov
define p_csv like vp_polot.csv
define p_ctv like vp_polot.ctv
define p_cisoper like vp_polot.cisoper
define try,a char
define csv like vp_polot.csv
define pcrefv like v_prikazy.pcrefv
define poc smallint
let try = true
let a = false

while try
let txt2 = ""
whenever error continue
-----uroven oper,csv,pcrefv------------
select
	count(*)
into
	poc
from pl_tech_zl z,pl_pouzistroj s
where
s.cpv = p_podv and
s.cov = p_cov and
s.csv = p_csv and
s.idtechzl = z.id and
s.idfivy = plan.pcrefv and
z.cpv = p_podv and
z.ctv = p_ctv and
z.cisoper = p_cisoper
---------------------------------------
if sqlca.sqlcode = 0 then
   if poc > 0 then
	let csv = p_csv
	let pcrefv = plan.pcrefv
   else
	-----uroven oper,csv-------------------
	select
		count(*)
	into
		poc
	from pl_tech_zl z,pl_pouzistroj s
	where
	s.cpv = p_podv and
	s.cov = p_cov and
	s.csv = p_csv and
	s.idtechzl = z.id and
	s.idfivy = 0 and
	z.cpv = p_podv and
	z.ctv = p_ctv and
	z.cisoper = p_cisoper
	---------------------------------------
	if sqlca.sqlcode = 0 then
	   if poc > 0 then
		let csv = p_csv
		let pcrefv = 0
	   else
		let csv = "000000"
		let pcrefv = 0
	   end if
	end if
   end if
end if
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
return a,csv,pcrefv
end function

{
###########################################################
function test_vst_coldseal(p_datplat,p_podv,p_csv,p_cisoper)
###########################################################
define p_datplat like vp_polot.datplat
define p_podv like vp_polot.podv
define p_csv like vp_polot.csv
define p_cisoper like vp_polot.cisoper
define try,a char
define vst_coldseal char
define poc int

let try = true
let a = false
let vst_coldseal = false

while try
let txt2 = ""
whenever error continue
select
	count(*)
into
	poc
from kalkul2:normy normy 
where
	normy.datplat = p_datplat and
	normy.podv = p_podv and
	normy.csn = p_csv and
	normy.cisoper = p_cisoper and
	normy.ckpol = "011203" --ckpol coldseal-u
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    if poc > 0 then
	let vst_coldseal = true
    end if
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri teste na coldseal! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a,vst_coldseal
end function

###########################################################
function test_vst_al(p_datplat,p_podv,p_csv,p_cisoper)
###########################################################
define p_datplat like vp_polot.datplat
define p_podv like vp_polot.podv
define p_csv like vp_polot.csv
define p_cisoper like vp_polot.cisoper
define try,a char
define vst_al char
define poc int

let try = true
let a = false
let vst_al = false

while try
let txt2 = ""
whenever error continue
select
	count(*)
into
	poc
from kalkul2:normy normy 
where
	normy.datplat = p_datplat and
	normy.podv = p_podv and
	normy.csn = p_csv and
	normy.cisoper = p_cisoper and
	normy.ckpol = "011027" --ckpol al
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    if poc > 0 then
	let vst_al = true
    end if
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri teste na hlinik! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a,vst_al
end function

}

###########################
function test_param_stroja(i,j,stl,riad,cisoper,sirka,sirka_vst,mikron,novecsv,vst_coldseal,vst_al,l_idv_prikazy,l_idvp_polot)
###########################
define i,j smallint
define stl like vp_polot.stl
define riad like vp_polot.riad
define cisoper like vp_polot.cisoper
define sirka like vp_polot.sirka
define sirka_vst like vp_polot.sirka --pri konfekcii ide o hlavny material
define mikron like vp_polot.mikron
define novecsv like v_prikazy.novecsv
define vst_coldseal,vst_al char
define l_idv_prikazy like vp_polot.por_polot
define l_idvp_polot like vp_polot.por_polot
define a,b char
define poc_bielej smallint
define poc_lak_umiest smallint
define zl_vstupy char(25)
define l_cislo_vp like vp_polot.cislo_vp
define l_stl like vp_polot.stl
define l_riad like vp_polot.riad
define l_cisoper like vp_polot.cisoper
define l_min_mikron,l_max_mikron like vp_polot.mikron

let a = true
let txt2 = ""

if a then
   let l_min_mikron = null
   let l_max_mikron = null
   call daj_hrubky_vstupov(plan.cislo_vp,stl,riad,cisoper) returning a,l_min_mikron,l_max_mikron
   if a then
	if l_min_mikron is null or l_max_mikron is null then
		let l_min_mikron = mikron 
		let l_max_mikron = mikron 
	end if 
   end if
end if

---sekcia univerzalnych param-----
if a then
   if sirka_vst > 10 and --aby vypadli chyby
      stroj[i,j].konfekcia = 0 and
      (sirka_vst < stroj[i,j].min_vst_sirka or
      sirka_vst > stroj[i,j].max_vst_sirka) then
	let stroj[i,j].test_param_text = "Sirka vstup.mater.:",sirka_vst using "<<<<&"," je mimo hranic stroja(",stroj[i,j].min_vst_sirka using "<<<<&","...",stroj[i,j].max_vst_sirka using "<<<<&",")!"
	let a = false
   end if
end if
if a then
   if l_min_mikron > 0 and --niekedy je nulova hrubka(odpad)!
      l_min_mikron < stroj[i,j].min_vst_hrubka then
	let stroj[i,j].test_param_text = "Hrubka vstup.mater.:",l_min_mikron using "<<<<&"," je mimo hranic stroja(",stroj[i,j].min_vst_hrubka using "<<<<&","...",stroj[i,j].max_vst_hrubka using "<<<<&",")!"
	let a = false
   end if
end if
if a then
   if l_max_mikron > 0 and --niekedy je nulova hrubka(odpad)!
      l_max_mikron > stroj[i,j].max_vst_hrubka then
	let stroj[i,j].test_param_text = "Hrubka vstup.mater.:",l_max_mikron using "<<<<&"," je mimo hranic stroja(",stroj[i,j].min_vst_hrubka using "<<<<&","...",stroj[i,j].max_vst_hrubka using "<<<<&",")!"
	let a = false
   end if
end if
if a then
   --test na coldseal
   if vst_coldseal and --je vstup coldseal laku
      stroj[i,j].coldseal_pozdlz = 0 and
      stroj[i,j].coldseal_umiest = 0 then
	let stroj[i,j].test_param_text = "Stroj nedokaze nanasat coldseal!"
	let a = false	
   end if
end if
{
stroj[i,j].korona_nevodiva
stroj[i,j].korona_vodiva
stroj[i,j].korona_umiest
stroj[i,j].unikat_kody
}
----------------------------------

{
--24.10.2017 vyhodeny stary test
---sekcia kasirovania-------------
if stroj[i,j].kasirovanie = 1 then
if a then
   --test na al
   if vst_al and --je vstup al folie
      stroj[i,j].cstroj <> 60 then --kasirka K4
	let stroj[i,j].test_param_text = "Stroj nedokaze kasirovat Al!"
	let a = false	
   end if
end if
end if
----------------------------------
}

---sekcia potlace-----------------
if stroj[i,j].tlac = 1 and
   novecsv[5] not matches "[FH]" and -- nema to byt externa potlac
   not (stroj[i,j].konfekcia = 1 and plan.kodsps[1] <> "C") then
{
15.2.16
--11.8.10 Nova sekcia parametrov HTL ako rychle docasne riesenie----------------------------
if a then
   if plan.tlac1 = 1 then --HTL
	call daj_pocet_bielej(plan.cislo_vp) returning a,poc_bielej
   end if
end if
if a then
   if plan.tlac1 = 1 then --HTL
	call daj_poc_lak_umiest(plan.cislo_vp) returning a,poc_lak_umiest
   end if
end if
if a then
   if plan.tlac1 = 1 then --HTL
	call daj_zloz_vstupy(plan.cislo_vp,stl,riad,cisoper) returning a,zl_vstupy
   end if
end if
if a then
   if plan.tlac1 = 1 and --HTL 
      poc_bielej > 1 and 
      plan.pocval <= 8 and
      plan.esa <> "A" and --zakazka s potrebou ESA
      stroj[i,j].cstroj <> 305 then
	let stroj[i,j].test_param_text = "Stroj nedokaze dobre tlacit zakazku s viacerymi bielymi farbami!"
	let a = false
   end if
end if
if a then
   if plan.tlac1 = 1 and --HTL 
      poc_lak_umiest > 1 and 
      stroj[i,j].cstroj <> 227 then
	let stroj[i,j].test_param_text = "Stroj nedokaze dobre tlacit zakazku s umiestnenym lakom!"
	let a = false
   end if
end if
if a then
   if plan.tlac1 = 1 and --HTL 
      (zl_vstupy matches "*MW247*" or 
      zl_vstupy matches "*ONX*") and
      mikron <= 33 and 
      stroj[i,j].cstroj <> 227 then
	let stroj[i,j].test_param_text = "Stroj nedokaze dobre tlacit na material ",zl_vstupy clipped," s hrubkou pod 34um!"
	let a = false
   end if
end if
if a then
   --26.1.15 pridany test na ziadost p.Durecovej
   if plan.cislo_vp[1] matches "[56]" and --FULL HD zakazka
      stroj[i,j].cstroj <> 288 then --Novoflex
	let stroj[i,j].test_param_text = "Stroj nedokaze tlacit flexo FULL HD!"
	let a = false
   end if
end if
----------------------------------------------------------------------------------------
}
if a then
   if plan.pocval > stroj[i,j].max_pocval then
	let stroj[i,j].test_param_text = "Stroj nedokaze tlacit s pozadovanym poctom valcov:",plan.pocval using "<&","!"
	let a = false
   end if
end if

{
if a then
   if plan.sirprod < stroj[i,j].min_tl_sirka or
      plan.sirprod > stroj[i,j].max_tl_sirka then
	let stroj[i,j].test_param_text = "Sirka potlace:",plan.sirprod using "<<<<<&"," je mimo hranic stroja(",stroj[i,j].min_tl_sirka using "<<<<&","...",stroj[i,j].max_tl_sirka using "<<<<&",")!"
	let a = false
   end if
end if
}

if a then
   if plan.obvodval < stroj[i,j].min_obvodval or
      plan.obvodval > stroj[i,j].max_obvodval then
	let stroj[i,j].test_param_text = "Obvod valca:",plan.obvodval using "<<<<&.&"," je mimo hranic stroja(",stroj[i,j].min_obvodval using "<<<<&","...",stroj[i,j].max_obvodval using "<<<<&",")!"
	let a = false
   end if
end if
if a then
   if plan.tlac1 = 1 then --HTL
	if novecsv[1] matches "[15]" and --PE vstupny material
         stroj[i,j].kratka_vod_draha = 0 then
	   let stroj[i,j].test_param_text = "Pre HTL PE je potrebna kratka vodiaca draha!"
	   let a = false
	end if
   end if
end if
if a then
   if plan.tlac1 = 1 then --HTL -len HTL stroj nanasa unikod,FTL zakazky nanasaju unikod na 177
	if plan.unikod = "A" and --zakazka s potlacou unikatnych kodov
         stroj[i,j].unikat_kody = 0 then
	   let stroj[i,j].test_param_text = "Zakazka s tlacou unikatnych kodov nenasla tuto vlastnost stroja!"
	   let a = false
	end if
   end if
end if
if a then
   if plan.tlac1 = 1 then --HTL
	if plan.esa = "A" and --zakazka s potrebou ESA
         stroj[i,j].esa = 0 then
	   let stroj[i,j].test_param_text = "Zakazka s potrebou ESA nenasla tuto vlastnost stroja!"
	   let a = false
	end if
   end if
end if
if a then
   if plan.is_presnyraport = "A" and
      plan.pocval < 11 and --jedenast farebka sa musi tlacit na stroji bez presneho raportu
      sirka_vst >= 600 and
      sirka_vst <= 1295 and --pre vstupy mimo hranic stroja s pres.raportom sa tlaci na stroji bez presneho raportu
      stroj[i,j].presnyraport = 0 then
	let stroj[i,j].test_param_text = "Zakazka s presnym raportom nenasla tuto vlastnost stroja!"
	let a = false
   end if
end if

{
stroj[i,j].presnyraport
stroj[i,j].poc_obracacov
stroj[i,j].esa
}
end if
----------------------------------

---sekcia rezania-----------------
if stroj[i,j].rezanie = 1 then
--finalny test------
if a then
   if stl = 0 and --len final
      novecsv[1] matches "[1238A]" then --12.2.09 1-folia, 2-hadica, 3-polohadica, 8-rolky, A-folia 2x 
	if plan.dutinka < stroj[i,j].min_dutinka or
	   plan.dutinka > stroj[i,j].max_dutinka then
	   let stroj[i,j].test_param_text = "Dutinka:",plan.dutinka using "<<<&"," je mimo hranic stroja(",stroj[i,j].min_dutinka using "<<<<&","...",stroj[i,j].max_dutinka using "<<<<&",")!"
	   let a = false
	end if
   end if
end if
--------------------
--2.6.15 finalny test------
if a then
   if stl = 0 and --len final
      plan.laseruprava = "A" then --len ak je vyplnena laserova uprava(perforacia)
	if stroj[i,j].laser_perfor = 0 then
	   let stroj[i,j].test_param_text = "Zakazka s laser.perforaciou nenasla tuto vlastnost stroja!"
	   let a = false
	end if
   end if
end if
---------------------------
if a then
   if sirka < stroj[i,j].min_vys_sirka or
      sirka > stroj[i,j].max_vys_sirka then
	let stroj[i,j].test_param_text = "Sirka kotuca:",sirka using "<<<<<&"," je mimo hranic stroja(",stroj[i,j].min_vys_sirka using "<<<<&","...",stroj[i,j].max_vys_sirka using "<<<<&",")!"
	let a = false
   end if
end if
end if
----------------------------------

---sekcia konfekcie---------------
if stroj[i,j].konfekcia = 1 then
{
--tento test este nema udaje v parametroch
if a then
   if plan.vzduchotvory <> "N" and --zakazka ma vzduch.otvory
      stroj[i,j].vzduch_otvory = 0 then
	let stroj[i,j].test_param_text = "Stroj nedokaze robit vzduchove otvory!"
	let a = false
   end if
end if
}
if a then
   if plan.sirka < stroj[i,j].min_vys_sirka or
      plan.sirka > stroj[i,j].max_vys_sirka then
	let stroj[i,j].test_param_text = "Sirka konfekcie:",plan.sirka using "<<<<&"," je mimo hranic stroja(",stroj[i,j].min_vys_sirka using "<<<<&","...",stroj[i,j].max_vys_sirka using "<<<<&",")!"
	let a = false
   end if
end if
if a then
   if plan.dlzka < stroj[i,j].min_vys_dlzka or
      plan.dlzka > stroj[i,j].max_vys_dlzka then
	let stroj[i,j].test_param_text = "Dlzka konfekcie:",plan.dlzka using "<<<<&"," je mimo hranic stroja(",stroj[i,j].min_vys_dlzka using "<<<<&","...",stroj[i,j].max_vys_dlzka using "<<<<&",")!"
	let a = false
   end if
end if
if a then
   if plan.zadstrlava is not null and plan.zadstrprava is not null and --len vyplnene udaje
      plan.zadstrlava <> plan.zadstrprava and --pripad umiestneneho pozdlzneho zlepu
      stroj[i,j].umiest_pozdl_zlep = 0 then --stroj nezvlada umiestneny pozdlzny zlep
	let stroj[i,j].test_param_text = "Konfekcny stroj nedokaze robit umiestneny pozdlzny zlep!"
	let a = false
   end if
end if
end if
----------------------------------
--12.2.16 Nove zjednotene testy-------
{
if a then
   case
      when (plan.cislo_vp[1] = "0" and stroj[i,j].cov = 155 or stroj[i,j].cov = 178)
        --netestovat tento pripad, pojde o lakovanie BTL vyrobku
        let b = true

      when stroj[i,j].cov <> 172 and stroj[i,j].cov <> 178 and stroj[i,j].cov <> 155
        --netestovat oddelenie, kde nie su testy radenia
        let b = true

      otherwise
        call testuj_normy_radenia("AGR_PL","RADEN",stroj[i,j].cpv,stroj[i,j].cov,l_idv_prikazy,l_idvp_polot,stroj[i,j].cstroj) returning a,b
        let a = true --pre istotu, keby nastal problem
   end case


   if a then --test na programovu chybu
	if not b then --ked nevyhovuje test radenia
	   let stroj[i,j].test_param_text = txt1 --"Stroj nevyhovuje z dovodu:",txt1
	   let txt1 = ""
	   let a = false
	end if
   else
	let stroj[i,j].test_param_text = txt1
   end if
end if
}
--------------------------------------
return a
end function

#####################################
function daj_hrubky_vstupov(l_cislo_vp,l_stl,l_riad,l_cisoper)
#####################################
define l_cislo_vp like vp_polot.cislo_vp
define l_stl like vp_polot.stl
define l_riad like vp_polot.riad
define l_cisoper like vp_polot.cisoper
define l_min_mikron,l_max_mikron like vp_polot.mikron
define try,a char
define poc int

let try = true
let a = false
let poc = null

while try
let txt2 = ""
whenever error continue
select
   min(mikron),
   max(mikron)
into
   l_min_mikron,
   l_max_mikron
from vp_polot po where
po.coo <> 157 and --nevyberat vstupy pre konfekciu, lebo testuje sa hlavny material a rucka moze byt hrubsia
po.cov <> 192 and --nebrat vyrobu valcov ako vstup 
po.cislo_vp = l_cislo_vp and
po.stlo = l_stl and
po.riado = l_riad and
po.cisopero = l_cisoper
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri zistovani hrubky! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a,l_min_mikron,l_max_mikron
end function

#####################################
function daj_pocet_bielej(p_cislo_vp)
#####################################
define p_cislo_vp like v_prikazy.cislo_vp
define try,a char
define poc int

let try = true
let a = false
let poc = null

while try
let txt2 = ""
whenever error continue
select
	count(*)
into
	poc
from
v_prikazy v,
vp_farbymot f
where
f.por_vp = v.por_vp and
f.kzakfar = "BIE1" and
v.cislo_vp = p_cislo_vp
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri zistovani poctu bielej! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a,poc
end function

#####################################
function daj_poc_lak_umiest(p_cislo_vp)
#####################################
define p_cislo_vp like v_prikazy.cislo_vp
define try,a char
define poc int

let try = true
let a = false
let poc = null

while try
let txt2 = ""
whenever error continue
select
	count(*)
into
	poc
from
v_prikazy v,
vp_farbymot f
where
f.por_vp = v.por_vp and
f.lak = "L" and
f.farba not matches "SZ*" and
f.krytie < 100 and
v.cislo_vp = p_cislo_vp
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri zistovani poctu bielej! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a,poc
end function

#####################################
function daj_zloz_vstupy(p_cislo_vp,p_stl,p_riad,p_cisoper)
#####################################
define p_cislo_vp like vp_polot.cislo_vp
define p_stl like vp_polot.stl
define p_riad like vp_polot.riad
define p_cisoper like vp_polot.cisoper
define try,a char
define poc int
define p_zl_vstupy char(25)
define l_text char(500)

let try = true
let a = false
let poc = null

while try
let txt2 = ""
let l_text = 
"select ",
"zloz_vstupy(vp_polot.cislo_vp,vp_polot.stl,vp_polot.riad,vp_polot.cisoper) ",
"from vp_polot ",
"where ",
"vp_polot.cislo_vp = '",p_cislo_vp,"' and ",
"vp_polot.stl = ",p_stl," and ",
"vp_polot.riad = ",p_riad," and ",
"vp_polot.cisoper = ",p_cisoper

whenever error continue
prepare prep_text_s006 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_s006 into
		p_zl_vstupy
end if
{
select
   zloz_vstupy(vp_polot.cislo_vp,vp_polot.stl,vp_polot.riad,vp_polot.cisoper)
into
   p_zl_vstupy
from vp_polot
where
vp_polot.cislo_vp = p_cislo_vp and
vp_polot.stl = p_stl and
vp_polot.riad = p_riad and
vp_polot.cisoper = p_cisoper
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri zistovani poctu bielej! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
free prep_text_s006
return a,p_zl_vstupy
end function

###################
function zapis_do_db()
###################
define a char
call vyb_operacie() returning a
if a then
   call trans_zapis_db() returning a
end if
return a
end function

##############################
function trans_zapis_db()
##############################
define a,wk char,
       i int
define idpl_subeh like pl_prac_uloha.idpl_subeh
define idpl_sledpolozka like pl_harmpolozka.idpl_sledpolozka 
define idpl_harm like pl_harmpolozka.idpl_harm
let a = true
let wk = true

If beg_wk() then --begin transaction
   for i = 1 to 150
	if operacie[i].cislo_vp is null then
		if i = 1 then --nenasli sa ziadne operacie na zapis
		   let a = false
		   let txt1  = "Nenasli sa neukoncene operacie na zaradenie do planu!"
		end if
		exit for
	end if
	
	---------
{
	if operacie[i].posun_oper then
	   call upd_posuny(i) returning a
	end if
}

	if operacie[i].posun_oper then
	   call upd_posuny2(i) returning a
	end if
	--5.5.09 doplnene o zmenu poradia presahu
	if a then
	   if operacie[i].posun_poradia_presahu then
		call upd_posun_poradia_presah(operacie[i].id_presah) returning a
	   end if
	end if
	-----------------------------------------
	if a then
	   call vloz_pl_subeh(i) returning a,idpl_subeh
	end if
	if a then
	   call vloz_pl_prac_uloha(i,idpl_subeh) returning a
	end if
	if a then
	   call vloz_pl_sledpolozka(i,idpl_subeh) returning a,idpl_sledpolozka
	end if
	if a then
	   call vyb_pl_harm(i,operacie[i].rok_zac,operacie[i].tyzden_zac,operacie[i].perioda) returning a,idpl_harm
	   if a then
		if sqlca.sqlcode = 100 then
		   call vloz_pl_harm(i,operacie[i].rok_zac,operacie[i].tyzden_zac,operacie[i].perioda,operacie[i].zac_periody,operacie[i].kon_periody) returning a,idpl_harm
		end if
	   end if
	end if
	if a then
	   call vloz_pl_harmpolozka(i,idpl_harm,idpl_sledpolozka) returning a
	end if

	--8.12.09 vlozenie celopresahovych period
	if a then
	   call vloz_celopresahove_periody(i) returning a
	end if
	-------------------------------------
	if not a then
	   exit for
	end if
   end for 
   if a then
       call com_wk() returning wk --commit
   else
       call rol_wk() returning wk --rollback
   end if

else
       let a = false
       let wk = false
end if
return a
end function

######################################
function vloz_celopresahove_periody(i)
######################################
define i smallint
define a char
define rok,tyz,per smallint
define rok_kon,tyz_kon,per_kon smallint
define idpl_harm integer
define zac_per like pl_harm.zac_periody
define kon_per like pl_harm.kon_periody

let a = true
let rok = operacie[i].rok_zac
let tyz = operacie[i].tyzden_zac
let per = operacie[i].perioda
call perioda(operacie[i].kon_plan) returning rok_kon,tyz_kon,per_kon

if rok = rok_kon and
   tyz = tyz_kon and
   per = per_kon then
	return a
end if

while true
call perioda_posun(rok,tyz,per,"+") returning rok,tyz,per
if rok = rok_kon and
   tyz = tyz_kon and
   per = per_kon then
	exit while
else
   call vyb_pl_harm(i,rok,tyz,per) returning a,idpl_harm
   if a then
	if sqlca.sqlcode = 100 then
	   call hranice_periody(rok,tyz,per) returning zac_per,kon_per
	   call vloz_pl_harm(i,rok,tyz,per,zac_per,kon_per) returning a,idpl_harm
	   if not a then
		exit while
	   end if
	end if
   else
	exit while
   end if
end if
end while
return a
end function

#######################
function vyb_operacie()
#######################
define i smallint
define a char
define l_text char(1500)
let a = true
call inic_operacie()

let l_text =
"select ",
"    id, ",
"    cpv, ",
"    cov, ",
"    rok_zac, ",
"    tyzden_zac, ",
"    perioda, ",
"    zac_periody, ",
"    kon_periody, ",
"    idpo_stroje, ",
"    poradie, ",
"    zac_plan, ",
"    kon_plan, ",
"    min_zac_rok, ",
"    min_zac_tyz, ",
"    min_zac_per, ",
"    min_zac_cas, ",
"    max_kon_rok, ",
"    max_kon_tyz, ",
"    max_kon_per, ",
"    max_kon_cas, ",
"    min_zac_cas_hr, ",
"    max_kon_cas_hr, ",
"    cas_prace_plan, ",
"    idvp_polot, ",
"    cislo_vp, ",
"    stl, ",
"    riad, ",
"    cisoper, ",
"    stlo, ",
"    riado, ",
"    cisopero, ",
"    mnoz_kg_plan,",
"    mnoz_mj_plan, ",
"    mj, ",
"    cas_prip_plan, ",
"    cas_beh_plan, ",
"    cas_prip_plan_i, ",
"    cas_beh_plan_i, ",
"    posun_oper, ",
"    dlzka_posunu, ",
"    idpl_harm_posun, ",
"    verzia_vp, ",
"    posun_poradia_presahu, ",
"    id_presah ",
"from  polozka ",
"where zac_plan is not null"  --6.4.11 doplnene kvoli zrychleniu a osetreniu algoritmu na vyber len prognozovanych
 
whenever error continue
prepare prep_text9 from l_text
if sqlca.sqlcode = 0 then
	declare koper cursor for prep_text9
end if
{ 
select 
    id,
    cpv,
    cov,
    rok_zac,
    tyzden_zac,
    perioda,
    zac_periody,
    kon_periody,
    idpo_stroje,
    poradie,
    zac_plan,
    kon_plan,
    min_zac_rok,
    min_zac_tyz,
    min_zac_per,
    min_zac_cas,
    max_kon_rok,
    max_kon_tyz,
    max_kon_per,
    max_kon_cas,
    min_zac_cas_hr,
    max_kon_cas_hr,
    cas_prace_plan,
    idvp_polot,
    cislo_vp,
    stl,
    riad,
    cisoper,
    stlo,
    riado,
    cisopero,
    mnoz_kg_plan,
    mnoz_mj_plan,
    mj,
    cas_prip_plan,
    cas_beh_plan,
    cas_prip_plan_i,
    cas_beh_plan_i,
    posun_oper,
    dlzka_posunu,
    idpl_harm_posun,
    verzia_vp,
    posun_poradia_presahu,
    id_presah

from tpv:polozka
where zac_plan is not null --6.4.11 doplnene kvoli zrychleniu a osetreniu algoritmu na vyber len prognozovanych
}
let i = 1
foreach 
   koper into
    operacie[i].id,
    operacie[i].cpv,
    operacie[i].cov,
    operacie[i].rok_zac,
    operacie[i].tyzden_zac,
    operacie[i].perioda,
    operacie[i].zac_periody,
    operacie[i].kon_periody,
    operacie[i].idpo_stroje,
    operacie[i].poradie,
    operacie[i].zac_plan,
    operacie[i].kon_plan,
    operacie[i].min_zac_rok,
    operacie[i].min_zac_tyz,
    operacie[i].min_zac_per,
    operacie[i].min_zac_cas,
    operacie[i].max_kon_rok,
    operacie[i].max_kon_tyz,
    operacie[i].max_kon_per,
    operacie[i].max_kon_cas,
    operacie[i].min_zac_cas_hr,
    operacie[i].max_kon_cas_hr,
    operacie[i].cas_prace_plan,
    operacie[i].idvp_polot,
    operacie[i].cislo_vp,
    operacie[i].stl,
    operacie[i].riad,
    operacie[i].cisoper,
    operacie[i].stlo,
    operacie[i].riado,
    operacie[i].cisopero,
    operacie[i].mnoz_kg_plan,
    operacie[i].mnoz_mj_plan,
    operacie[i].mj,
    operacie[i].cas_prip_plan,
    operacie[i].cas_beh_plan,
    operacie[i].cas_prip_plan_i,
    operacie[i].cas_beh_plan_i,
    operacie[i].posun_oper,
    operacie[i].dlzka_posunu,
    operacie[i].idpl_harm_posun,
    operacie[i].verzia_vp,
    operacie[i].posun_poradia_presahu,
    operacie[i].id_presah

   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Chyba pri vybere operacii! Cislo chyby:",sqlca.sqlcode using "-<<<<<&","."
	exit foreach
   end if
   let i = i + 1
end foreach
whenever error stop
if sqlca.sqlcode < 0 then
   let a = false
   let txt1 = "Chyba pri vybere operacii! Cislo chyby:",sqlca.sqlcode using "-<<<<<&","."
end if
free koper
return a
end function

############################
function upd_posuny(i)
############################
define i smallint
define try,a char
define l_text char(500)

let try = true
let a = false
while try
let txt2 = ""
let l_text =
"update pl_harmpolozka set ",
"   pl_harmpolozka.zac_plan = pl_harmpolozka.zac_plan + '",operacie[i].dlzka_posunu,"' ",
"   pl_harmpolozka.kon_plan = pl_harmpolozka.kon_plan + '",operacie[i].dlzka_posunu,"' ",
"where ",
"   pl_harmpolozka.idpl_harm = ",operacie[i].idpl_harm_posun," and ",
"   pl_harmpolozka.idpo_stroje = ",operacie[i].idpo_stroje
   
whenever error continue
prepare prep_text_u002 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_u002
end if
{
update pl_harmpolozka set 
   pl_harmpolozka.zac_plan = pl_harmpolozka.zac_plan + operacie[i].dlzka_posunu,
   pl_harmpolozka.kon_plan = pl_harmpolozka.kon_plan + operacie[i].dlzka_posunu
where
   pl_harmpolozka.idpl_harm = operacie[i].idpl_harm_posun and
   pl_harmpolozka.idpo_stroje = operacie[i].idpo_stroje
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri update posunov! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
free prep_text_u002
return a
end function

############################
function upd_posuny2(i)
############################
define i smallint
define a char
define posuny record
   id like pl_harmpolozka.id,
   zac_plan like pl_harmpolozka.zac_plan,
   kon_plan like pl_harmpolozka.kon_plan,
   cas_prace_plan like pl_harmpolozka.cas_prace_plan,
   kon_periody like pl_harm.kon_periody
end record  
define zac_miesta,kon_miesta datetime year to minute
define kon_presah_ods datetime year to minute
define zac_oper,kon_oper datetime year to minute
define kon_oper_predch datetime year to minute
define j integer
define l_text char(500)

let a = false
--1.4.11 docasna uprava
--let a = true

let l_text = 
"select ",
"   pl_harmpolozka.id, ",
"   pl_harmpolozka.zac_plan, ",
"   pl_harmpolozka.kon_plan, ",
"   pl_harmpolozka.cas_prace_plan, ",
"   pl_harm.kon_periody ",
"from pl_harmpolozka,pl_harm ",
"where ",
"pl_harm.id = pl_harmpolozka.idpl_harm and ",
"pl_harmpolozka.idpl_harm = ",operacie[i].idpl_harm_posun," and ",
"pl_harmpolozka.idpo_stroje = ",operacie[i].idpo_stroje," ",
"order by pl_harmpolozka.zac_plan "

whenever error continue
prepare prep_text10 from l_text
if sqlca.sqlcode = 0 then
	declare posun cursor for prep_text10
end if
{
select
   pl_harmpolozka.id,
   pl_harmpolozka.zac_plan,
   pl_harmpolozka.kon_plan,
   pl_harmpolozka.cas_prace_plan,
   pl_harm.kon_periody
from pl_harmpolozka,pl_harm
where
pl_harm.id = pl_harmpolozka.idpl_harm and
pl_harmpolozka.idpl_harm = operacie[i].idpl_harm_posun and
pl_harmpolozka.idpo_stroje = operacie[i].idpo_stroje
order by pl_harmpolozka.zac_plan
}
--lock table pl_harmpolozka in exclusive mode
initialize posuny.* to null
let j = 1
foreach 
   posun into posuny.*
   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Chyba pri vybere posunov! Cislo chyby:",sqlca.sqlcode using "-<<<<<&","."
	exit foreach
   end if
   ---hladanie hranic posunov---
   if j = 1 then
	let zac_miesta = posuny.zac_plan + operacie[i].dlzka_posunu 
   else
	let zac_miesta = kon_oper_predch
   end if
   let kon_miesta = posuny.kon_periody
   call najdi_kon_presah_ods(operacie[i].idpo_stroje,zac_miesta,kon_miesta) returning a,kon_presah_ods
   if a then
	call najdi_hranice_oper(operacie[i].idpo_stroje,zac_miesta,kon_miesta,posuny.cas_prace_plan,kon_presah_ods) returning a,zac_oper,kon_oper
   else
	exit foreach
   end if
   -----------------------------
   if a then
	call upd_posuny_new(posuny.id,zac_oper,kon_oper) returning a
   else
	exit foreach
   end if
   initialize posuny.* to null
   let j = j + 1
   let kon_oper_predch = kon_oper
end foreach
whenever error stop
free posun
return a
end function

############################
function upd_posun_poradia_presah(id_presah)
############################
define id_presah like pl_harmpolozka.id
define try,a char
define l_text char(250)

let try = true
let a = false
while try
let txt2 = ""
let l_text = 
"update pl_harmpolozka set ",
"   pl_harmpolozka.poradie = pl_harmpolozka.poradie + 1 ",
"where ",
"   pl_harmpolozka.id = ",id_presah
   
whenever error continue
prepare prep_text_u009 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_u009
end if
{
update pl_harmpolozka set 
   pl_harmpolozka.poradie = pl_harmpolozka.poradie + 1
where
   pl_harmpolozka.id = id_presah
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    --let a = false
    let a = true --ak sa nenasdu operacie na posun, je to OK
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri update posunov! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
free prep_text_u009
return a
end function

############################
function upd_posuny_new(p_id,zac_oper,kon_oper)
############################
define i smallint
define try,a char
define p_id like pl_harmpolozka.id
define zac_oper,kon_oper datetime year to minute

let try = true
let a = false
while try
let txt2 = ""
whenever error continue
update pl_harmpolozka set 
   pl_harmpolozka.zac_plan = zac_oper,
   pl_harmpolozka.kon_plan = kon_oper
where
   pl_harmpolozka.id = p_id
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri update posunov! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a
end function

############################
function upd_posuny_new2(p_id,zac_oper,kon_oper,posun_por)
############################
define i smallint
define try,a char
define p_id like pl_harmpolozka.id
define zac_oper,kon_oper datetime year to minute
define posun_por smallint
define l_text char(500)


let try = true
let a = false
while try
let txt2 = ""
let l_text = 
"update pl_harmpolozka set ",
"   pl_harmpolozka.poradie = pl_harmpolozka.poradie - ",posun_por,", ",
"   pl_harmpolozka.zac_plan = '",zac_oper,"', ",
"   pl_harmpolozka.kon_plan = '",kon_oper,"' ",
"where ",
"   pl_harmpolozka.id = ",p_id
   
whenever error continue
prepare prep_text_u004 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_u004
end if

{
update pl_harmpolozka set 
   pl_harmpolozka.poradie = pl_harmpolozka.poradie - posun_por,
   pl_harmpolozka.zac_plan = zac_oper,
   pl_harmpolozka.kon_plan = kon_oper
where
   pl_harmpolozka.id = p_id
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri update posunov! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
free prep_text_u004
return a
end function


##################
function vloz_pl_subeh(i)
#################
define i smallint
define try,a char
define id integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
insert into pl_subeh ( 
	id
) values ( 
	0
 ) 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    ------
    let id = sqlca.sqlerrd[2]
    ------
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri vkladani subehu! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a,id
end function

##################
function vloz_pl_prac_uloha(i,pidpl_subeh)
#################
define i smallint
define pidpl_subeh like pl_prac_uloha.idpl_subeh
define try,a char
define id integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
insert into pl_prac_uloha ( 
	id,
	idpl_typprac_ulohy,
	idpl_subeh,
	idvp_polot,
	cpv,
	cov,
	cislo_vp,
	stl,
	riad,
	cisoper,
	stlo,
	riado,
	cisopero,
	mnoz_kg_plan,
	mnoz_mj_plan,
	mj,
	cas_prip_plan,
	cas_beh_plan,
	cas_prip_plan_i,
	cas_beh_plan_i,
	d_vytvorenia,
	idvytvoril

) values ( 
	0, --id
	1, --idpl_typprac_ulohy
	pidpl_subeh,
	operacie[i].idvp_polot,
	operacie[i].cpv,
	operacie[i].cov,
	operacie[i].cislo_vp,
	operacie[i].stl,
	operacie[i].riad,
	operacie[i].cisoper,
	operacie[i].stlo,
	operacie[i].riado,
	operacie[i].cisopero,
	operacie[i].mnoz_kg_plan,
	operacie[i].mnoz_mj_plan,
	operacie[i].mj,
	operacie[i].cas_prip_plan,
	operacie[i].cas_beh_plan,
	operacie[i].cas_prip_plan_i,
	operacie[i].cas_beh_plan_i,
	today, --d_vytvorenia,
	gid_zam --idvytvoril
 ) 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    ------
    let id = sqlca.sqlerrd[2]
    ------
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri vkladani prac.ulohy! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a
end function

##################
function vloz_pl_sledpolozka(i,pidpl_subeh)
#################
define i smallint
define pidpl_subeh like pl_prac_uloha.idpl_subeh
define try,a char
define id integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
insert into pl_sledpolozka ( 
	id,
	idpl_subeh,
	idvp_polot,
	verzia_vp,
	platnost,
	idsledpolozkadruh

) values ( 
	0, --id
	pidpl_subeh,
	operacie[i].idvp_polot,
	operacie[i].verzia_vp,
	1, --platnost
	2 --idsledpolozkadruh
 ) 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    ------
    let id = sqlca.sqlerrd[2]
    ------
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri vkladani sledovanej polozky! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a,id
end function

##################
function vyb_pl_harm(i,rok,tyz,per)
#################
define i smallint
define try,a char
define pid integer
define rok,tyz,per smallint
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
select
	pl_harm.id
into
	pid
from pl_harm where
	pl_harm.cpv = operacie[i].cpv and
	pl_harm.cov = operacie[i].cov and
	pl_harm.rok_zac = rok and
	pl_harm.tyzden_zac = tyz and
	pl_harm.perioda = per and
	pl_harm.platnost = 1
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    --let a = false
    let a = true
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri vybere hlavicky harmonogramov! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a,pid
end function

##################
function vloz_pl_harm(i,rok,tyz,per,zac_per,kon_per)
#################
define i smallint
define try,a char
define id integer
define rok,tyz,per smallint
define zac_per like pl_harm.zac_periody
define kon_per like pl_harm.kon_periody

let try = true
let a = false
while try
let txt2 = ""
whenever error continue
insert into pl_harm ( 
	id,
	cpv,
	cov,
	rok_zac,
	tyzden_zac,
	perioda,
	verzia,
	platnost,
	zac_periody,
	kon_periody,
	stav,
	c_vytvorenia,
	idvytvoril
) values ( 
	0, --id
	operacie[i].cpv,
	operacie[i].cov,
	rok,
	tyz,
	per,
	0, --verzia,
	1, --platnost,
	zac_per,
	kon_per,
	"P", --stav,
	current year to minute, --c_vytvorenia,
	gid_zam --idvytvoril
 ) 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    ------
    let id = sqlca.sqlerrd[2]
    ------
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri vkladani hlavicky harmonogramov! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a,id
end function

##################
function vloz_pl_harmpolozka(i,pidpl_harm,pidpl_sledpolozka)
#################
define pidpl_harm like pl_harmpolozka.idpl_harm
define pidpl_sledpolozka like pl_harmpolozka.idpl_sledpolozka 
define i smallint
define try,a char
define id integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
insert into pl_harmpolozka ( 
	id,
	idpl_harm,
	idpl_sledpolozka,
	idpo_stroje,
	poradie,
	zac_plan,
	kon_plan,
	min_zac_rok,
	min_zac_tyz,
	min_zac_per,
	min_zac_cas,
	max_kon_rok,
	max_kon_tyz,
	max_kon_per,
	max_kon_cas,
	min_zac_cas_hr,
	max_kon_cas_hr,
	cas_prace_plan
) values ( 
	0, --id,
	pidpl_harm,
	pidpl_sledpolozka,
	operacie[i].idpo_stroje,
	operacie[i].poradie,
	operacie[i].zac_plan,
	operacie[i].kon_plan,
	operacie[i].min_zac_rok,
	operacie[i].min_zac_tyz,
	operacie[i].min_zac_per,
	operacie[i].min_zac_cas,
	operacie[i].max_kon_rok,
	operacie[i].max_kon_tyz,
	operacie[i].max_kon_per,
	operacie[i].max_kon_cas,
	operacie[i].min_zac_cas_hr,
	operacie[i].max_kon_cas_hr,
	operacie[i].cas_prace_plan
 ) 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    ------
    let id = sqlca.sqlerrd[2]
    ------
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if chyba1 < 0 then
   let txt1 = "Chyba pri vkladani polozky harmonogramu! Cislo chyby:",chyba1 using "-<<<<<&","."
end if
return a
end function

##############################
function trans_uvolnenie()
##############################
define a,wk char,
       i int
let a = true
let wk = true

If beg_wk() then
   for i = 1 to 150
	if ulohy[i].idpl_subeh is null then
	   exit for
	end if
	call obcerstvi_oper_preds(ulohy[i].idpl_harmpolozka) returning a,ulohy[i].zac_plan,ulohy[i].kon_plan
	--------sekcia uvolnenie-------------
	if a then
	   call del_pl_prac_uloha(i) returning a
	end if
	if ulohy[i].poc_subeh = 1 then --ak je viac uloh v subehu, v harm.sa nemaze
	   if a then
		call del_pl_sledpolozka(i) returning a
	   end if
	   if a then
		call del_pl_harmpolozka(i) returning a
	   end if
	   if a then --doplnene 20.7.08, treba otestovat
		call del_pl_subeh(i) returning a
	   end if
	end if
	-------------------------------------
	--------sekcia posunu----------------
	if a then
	   --call posun_za_uvol(i) returning a
	   call posun_za_uvol2(i) returning a
	end if
	if a then
	   if ulohy[i].poc_subeh = 1 then --jedna veta v subehu je vzdy
		if ulohy[i].rok_zac = ulohy[i].rok_koniec and
	           ulohy[i].tyz_zac = ulohy[i].tyz_koniec and
	           ulohy[i].per_zac = ulohy[i].per_koniec then
			call posun_za_uvol_presah(i) returning a
		end if
	   else
		call posun_uvol_oper(i) returning a --posun zmensenej polozky harmonogramu
	   end if
	end if
	-------------------------------------
	if not a then
	   exit for
	end if
   end for 

   if a then
       call com_wk() returning wk
   else
       call rol_wk() returning wk
   end if

else
       let a = false
       let wk = false
end if

return a
end function

#######################
function vyb_ulohy(pcislo_vp)
#######################
define pcislo_vp like pl_prac_uloha.cislo_vp
define i smallint
define a char
define cas_oper_koniec interval hour(3) to minute
define l_text char(500)

let a = true
call inic_ulohy()
let l_text = 
"select ",
"   pl_harm.cpv, ",
"   pl_harm.cov, ",
"   pl_harm.rok_zac, ",
"   pl_harm.tyzden_zac, ",
"   pl_harm.perioda, ",
"   pl_harm.zac_periody, ",
"   pl_harm.kon_periody, ",
"   pl_harmpolozka.zac_plan, ",
"   pl_harmpolozka.kon_plan, ",
"   pl_harmpolozka.idpo_stroje, ",
"   pl_prac_uloha.cas_prip_plan_i + pl_prac_uloha.cas_beh_plan_i, ",
"   pl_prac_uloha.id, ",
"   pl_harmpolozka.id, ",
"   pl_sledpolozka.id, ",
"   pl_subeh.id, ",
"   (select count(*) from pl_subeh x where x.id = pl_subeh.id) ",
"from pl_harm,pl_harmpolozka,pl_sledpolozka,pl_subeh,pl_prac_uloha ",
"where ",
"   pl_harm.id = pl_harmpolozka.idpl_harm and ",
"   pl_harmpolozka.idpl_sledpolozka = pl_sledpolozka.id and  ",
"   pl_sledpolozka.idpl_subeh = pl_subeh.id and ",
"   pl_subeh.id = pl_prac_uloha.idpl_subeh and ",
"   pl_prac_uloha.cislo_vp = '",pcislo_vp,"' and ",
"   pl_prac_uloha.idpl_typprac_ulohy = 1 "
   
whenever error continue
prepare prep_text11 from l_text
if sqlca.sqlcode = 0 then
	declare kuloha cursor for prep_text11
end if

{
select 
   pl_harm.cpv,
   pl_harm.cov,
   pl_harm.rok_zac,
   pl_harm.tyzden_zac,
   pl_harm.perioda,
   pl_harm.zac_periody,
   pl_harm.kon_periody,
   pl_harmpolozka.zac_plan,
   pl_harmpolozka.kon_plan,
   pl_harmpolozka.idpo_stroje,
   pl_prac_uloha.cas_prip_plan_i + pl_prac_uloha.cas_beh_plan_i,
   pl_prac_uloha.id,
   pl_harmpolozka.id,
   pl_sledpolozka.id,
   pl_subeh.id,
   (select count(*) from pl_subeh x where x.id = pl_subeh.id)
from pl_harm,pl_harmpolozka,pl_sledpolozka,pl_subeh,pl_prac_uloha
where
   pl_harm.id = pl_harmpolozka.idpl_harm and
   pl_harmpolozka.idpl_sledpolozka = pl_sledpolozka.id and 
   pl_sledpolozka.idpl_subeh = pl_subeh.id and
   pl_subeh.id = pl_prac_uloha.idpl_subeh and
   pl_prac_uloha.cislo_vp = pcislo_vp and
   pl_prac_uloha.idpl_typprac_ulohy = 1
}

let i = 1
foreach 
   kuloha into 
   ulohy[i].cpv,
   ulohy[i].cov,
   ulohy[i].rok_zac,
   ulohy[i].tyz_zac,
   ulohy[i].per_zac,
   ulohy[i].zac_perioda,
   ulohy[i].kon_perioda,
   ulohy[i].zac_plan,
   ulohy[i].kon_plan,
   ulohy[i].idpo_stroje,
   ulohy[i].cas_plan_i,
   ulohy[i].idpl_prac_uloha,
   ulohy[i].idpl_harmpolozka,
   ulohy[i].idpl_sledpolozka,
   ulohy[i].idpl_subeh,
   ulohy[i].poc_subeh
   -----
   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Chyba pri vybere uloh! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
	exit foreach
   end if
   --call perioda(ulohy[i].kon_plan) returning ulohy[i].rok_koniec,ulohy[i].tyz_koniec,ulohy[i].per_koniec
   --30.10.09 dolezita oprava, lebo boli problemy
   call hranice_periody(ulohy[i].rok_koniec,ulohy[i].tyz_koniec,ulohy[i].per_koniec) returning ulohy[i].zac_per_koniec,ulohy[i].kon_per_koniec
   --stanovenie posunu
   if ulohy[i].kon_plan > ulohy[i].kon_perioda then
	--tu sa pocita cast operacie v koncovej periode
	let cas_oper_koniec = ulohy[i].kon_plan - ulohy[i].zac_per_koniec
	if ulohy[i].cas_plan_i < cas_oper_koniec then 
	   let ulohy[i].posun = ulohy[i].cas_plan_i
	else
	   let ulohy[i].posun = cas_oper_koniec
	end if
   else
	let ulohy[i].posun = ulohy[i].cas_plan_i
   end if

   let i = i + 1
end foreach
whenever error stop
if sqlca.sqlcode < 0 then
   let txt1 = "Chyba pri vybere uloh! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
   let a = false
end if
free kuloha
return a
end function

#######################
function inic_ulohy()
#######################
{
define i smallint
for i = 1 to 150
   if ulohy[i].idpl_harmpolozka is null then
	exit for
   end if
   initialize ulohy_prazd.* to null
   let ulohy[i].* = ulohy_prazd.*
end for
}
--initialize ulohy to null
call ulohy.clear()
end function

##################
function del_pl_prac_uloha(i)
#################
define try,a char
define i integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
	delete from pl_prac_uloha 
 			 where 
 	pl_prac_uloha.id = ulohy[i].idpl_prac_uloha 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_02  = sqlca.sqlerrd[3]
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
return a
end function

##################
function del_pl_sledpolozka(i)
#################
define try,a char
define i integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
	delete from pl_sledpolozka 
 			 where 
 	pl_sledpolozka.id = ulohy[i].idpl_sledpolozka 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_02  = sqlca.sqlerrd[3]
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
return a
end function

##################
function del_pl_harmpolozka(i)
#################
define try,a char
define i integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
	delete from pl_harmpolozka 
 			 where 
 	pl_harmpolozka.id = ulohy[i].idpl_harmpolozka 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_02  = sqlca.sqlerrd[3]
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
return a
end function

##################
function del_pl_subeh(i)
#################
define try,a char
define i integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
	delete from pl_subeh 
 			 where 
 	pl_subeh.id = ulohy[i].idpl_subeh 
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_02  = sqlca.sqlerrd[3]
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
return a
end function

############################
function posun_uvol_oper(i)
############################
define try,a char
define i smallint
define l_text char(250)

let try = true
let a = false
while try
let txt2 = ""
let l_text =
"update pl_harmpolozka set ",
"   pl_harmpolozka.kon_plan = pl_harmpolozka.kon_plan - interval(",ulohy[i].posun,") hour(3) to minute ", 
"where ",
"   pl_harmpolozka.id = ",ulohy[i].idpl_harmpolozka
whenever error continue
prepare prep_text_u005 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_u005
end if
{
update pl_harmpolozka set
   pl_harmpolozka.kon_plan = pl_harmpolozka.kon_plan - ulohy[i].posun 
 where 
   pl_harmpolozka.id = ulohy[i].idpl_harmpolozka
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
free prep_text_u005
return a
end function

############################
function posun_za_uvol(i)
############################
define try,a char
define i smallint
define posun_poradia smallint
define l_text char(1000)

let try = true
let a = false
if ulohy[i].poc_subeh = 1 then --jeden subeh je vzdy
   --let posun_poradia = 1 --kedze sa maze z harm.musi sa menit poradie
   if ulohy[i].rok_zac = ulohy[i].rok_koniec and
      ulohy[i].tyz_zac = ulohy[i].tyz_koniec and
      ulohy[i].per_zac = ulohy[i].per_koniec then
	let posun_poradia = 1
   else
	let posun_poradia = 0
   end if
else
   let posun_poradia = 0
end if

while try
let txt2 = ""
let l_text = 
"update pl_harmpolozka set ",
"   pl_harmpolozka.poradie = pl_harmpolozka.poradie - ",posun_poradia,", ",
"   pl_harmpolozka.zac_plan = pl_harmpolozka.zac_plan - interval(",ulohy[i].posun,") hour(3) to minute, ",
"   pl_harmpolozka.kon_plan = pl_harmpolozka.kon_plan - interval(",ulohy[i].posun,") hour(3) to minute  ",
" where  ",
"   pl_harmpolozka.zac_plan >= '",ulohy[i].kon_plan,"' and ",
"   pl_harmpolozka.kon_plan <= '",ulohy[i].kon_per_koniec,"' and ",
"   pl_harmpolozka.idpl_harm in ",
"(select x.id from pl_harm x where  ",
"	x.cpv = ",ulohy[i].cpv," and ",
"	x.cov = ",ulohy[i].cov," and ",
"	x.rok_zac = ",ulohy[i].rok_koniec," and ",
"	x.tyzden_zac = ",ulohy[i].tyz_koniec," and ",
"	x.perioda = ",ulohy[i].per_koniec," and ",
"	x.platnost = 1) and ",
 "  pl_harmpolozka.idpo_stroje = ",ulohy[i].idpo_stroje

whenever error continue
prepare prep_text_u006 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_u006
end if

{
update pl_harmpolozka set
   pl_harmpolozka.poradie = pl_harmpolozka.poradie - posun_poradia,
   pl_harmpolozka.zac_plan = pl_harmpolozka.zac_plan - ulohy[i].posun ,
   pl_harmpolozka.kon_plan = pl_harmpolozka.kon_plan - ulohy[i].posun 
 where 
   pl_harmpolozka.zac_plan >= ulohy[i].kon_plan and
   pl_harmpolozka.kon_plan <= ulohy[i].kon_per_koniec and
   pl_harmpolozka.idpl_harm in
(select x.id from pl_harm x where 
	x.cpv = ulohy[i].cpv and
	x.cov = ulohy[i].cov and
	x.rok_zac = ulohy[i].rok_koniec and
	x.tyzden_zac = ulohy[i].tyz_koniec and
	x.perioda = ulohy[i].per_koniec and
	x.platnost = 1) and
   pl_harmpolozka.idpo_stroje = ulohy[i].idpo_stroje
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    --let txt2 = " Polozka nebola najdena."
    --let a = false
    --nemusi byt posun
    let a = true
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
free prep_text_u006
return a
end function

############################
function posun_za_uvol2(i)
############################
define i smallint
define a char
define posuny record
   id like pl_harmpolozka.id,
   zac_plan like pl_harmpolozka.zac_plan,
   kon_plan like pl_harmpolozka.kon_plan,
   cas_prace_plan like pl_harmpolozka.cas_prace_plan,
   kon_periody like pl_harm.kon_periody
end record  
define zac_miesta,kon_miesta datetime year to minute
define kon_presah_ods datetime year to minute
define zac_oper,kon_oper datetime year to minute
define posun_por smallint
define kon_oper_predch datetime year to minute
define j integer
define l_text char(500) 

let a = true

if ulohy[i].poc_subeh = 1 then --jeden subeh je vzdy
   --let posun_por = 1 --kedze sa maze z harm.musi sa menit poradie
   if ulohy[i].rok_zac = ulohy[i].rok_koniec and
      ulohy[i].tyz_zac = ulohy[i].tyz_koniec and
      ulohy[i].per_zac = ulohy[i].per_koniec then
	let posun_por = 1
   else
	let posun_por = 0
   end if
else
   let posun_por = 0
end if

let l_text =
"select ",
"   pl_harmpolozka.id, ",
"   pl_harmpolozka.zac_plan, ",
"   pl_harmpolozka.kon_plan, ",
"   pl_harmpolozka.cas_prace_plan, ",
"   pl_harm.kon_periody ",
"from pl_harmpolozka,pl_harm ",
"where ",
"pl_harm.id = pl_harmpolozka.idpl_harm and ",
"pl_harmpolozka.zac_plan >= '",ulohy[i].kon_plan,"' and ",
"pl_harmpolozka.kon_plan <= '",ulohy[i].kon_per_koniec,"' and ",
"pl_harmpolozka.idpl_harm in ",
"(select x.id from pl_harm x where ",
"	x.cpv = ",ulohy[i].cpv," and ",
"	x.cov = ",ulohy[i].cov," and ",
"	x.rok_zac = ",ulohy[i].rok_koniec," and ",
"	x.tyzden_zac = ",ulohy[i].tyz_koniec," and ",
"	x.perioda = ",ulohy[i].per_koniec," and ",
"	x.platnost = 1) and ",
"pl_harmpolozka.idpo_stroje = ",ulohy[i].idpo_stroje," ",
---
"order by pl_harmpolozka.zac_plan "

whenever error continue
prepare prep_text13 from l_text
if sqlca.sqlcode = 0 then
	declare posun3 cursor for prep_text13
end if

{
select
   pl_harmpolozka.id,
   pl_harmpolozka.zac_plan,
   pl_harmpolozka.kon_plan,
   pl_harmpolozka.cas_prace_plan,
   pl_harm.kon_periody
from pl_harmpolozka,pl_harm
where
pl_harm.id = pl_harmpolozka.idpl_harm and
pl_harmpolozka.zac_plan >= ulohy[i].kon_plan and
pl_harmpolozka.kon_plan <= ulohy[i].kon_per_koniec and
pl_harmpolozka.idpl_harm in
(select x.id from pl_harm x where 
	x.cpv = ulohy[i].cpv and
	x.cov = ulohy[i].cov and
	x.rok_zac = ulohy[i].rok_koniec and
	x.tyzden_zac = ulohy[i].tyz_koniec and
	x.perioda = ulohy[i].per_koniec and
	x.platnost = 1) and
pl_harmpolozka.idpo_stroje = ulohy[i].idpo_stroje
---
order by pl_harmpolozka.zac_plan
}

--lock table pl_harmpolozka in exclusive mode
initialize posuny.* to null
let j = 1
foreach 
   posun3 into posuny.*
   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Chyba pri vybere posunov! Cislo chyby:",sqlca.sqlcode using "-<<<<<&","."
	exit foreach
   end if
   ---hladanie hranic posunov---
   if j = 1 then
	let zac_miesta = posuny.zac_plan - ulohy[i].posun
   else
	let zac_miesta = kon_oper_predch
   end if
   let kon_miesta = posuny.kon_periody
   call najdi_kon_presah_ods(operacie[i].idpo_stroje,zac_miesta,kon_miesta) returning a,kon_presah_ods
   if a then
	call najdi_hranice_oper(operacie[i].idpo_stroje,zac_miesta,kon_miesta,posuny.cas_prace_plan,kon_presah_ods) returning a,zac_oper,kon_oper
   else
	exit foreach
   end if
   -----------------------------
   if a then
	call upd_posuny_new2(posuny.id,zac_oper,kon_oper,posun_por) returning a
   else
	exit foreach
   end if
   initialize posuny.* to null
   let j = j + 1
   let kon_oper_predch = kon_oper
end foreach
whenever error stop
free posun3
return a
end function

############################
function posun_za_uvol_presah(i)
############################
define try,a char
define i smallint
define l_text char(1000)

let try = true
let a = false
while try
let txt2 = ""
let l_text =
"update pl_harmpolozka set ",
"   pl_harmpolozka.poradie = pl_harmpolozka.poradie - 1 ",
" where ", 
"   pl_harmpolozka.zac_plan >= '",ulohy[i].kon_plan,"' and ",
"   pl_harmpolozka.kon_plan > '",ulohy[i].kon_per_koniec,"' and ",
"   pl_harmpolozka.idpl_harm = ",
"(select x.id from pl_harm x where ",
"	x.cpv = ",ulohy[i].cpv," and ",
"	x.cov = ",ulohy[i].cov," and ",
"	x.rok_zac = ",ulohy[i].rok_koniec," and ",
"	x.tyzden_zac = ",ulohy[i].tyz_koniec," and ",
"	x.perioda = ",ulohy[i].per_koniec," and ",
"	x.platnost = 1) and ",
"   pl_harmpolozka.idpo_stroje = ",ulohy[i].idpo_stroje
   
whenever error continue
prepare prep_text_u007 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_u007
end if

{
update pl_harmpolozka set
   pl_harmpolozka.poradie = pl_harmpolozka.poradie - 1
 where 
   pl_harmpolozka.zac_plan >= ulohy[i].kon_plan and
   pl_harmpolozka.kon_plan > ulohy[i].kon_per_koniec and
   pl_harmpolozka.idpl_harm =
(select x.id from pl_harm x where 
	x.cpv = ulohy[i].cpv and
	x.cov = ulohy[i].cov and
	x.rok_zac = ulohy[i].rok_koniec and
	x.tyzden_zac = ulohy[i].tyz_koniec and
	x.perioda = ulohy[i].per_koniec and
	x.platnost = 1) and
   pl_harmpolozka.idpo_stroje = ulohy[i].idpo_stroje
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    --let txt2 = " Polozka nebola najdena."
    --let a = false
    --nemusi byt posun
    let a = true
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_24  = sqlca.sqlerrd[3]
     let a = true
     let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
free prep_text_u007
return a
end function

#######################
function vyb_odd(rok_v,tyz_v,per_v)
#######################
define rok_v,tyz_v,per_v smallint
define a char
define i smallint
define podm_odd,p_podm_odd char(500)

let a = true
call inic_odd()

let podm_odd =
"select  ",
"a.cpv, ",
"a.cov, ",
"sum(case when b.kon_plan > a.kon_periody then a.kon_periody else b.kon_plan end - b.zac_plan), ",
"count(unique b.idpo_stroje) ",
"from pl_harm a,pl_harmpolozka b ",
"where ",
"b.idpl_harm = a.id and ",
"a.cpv = ",gpodnik," and ",
"a.rok_zac = ",rok_v," and ",
"a.tyzden_zac = ",tyz_v," and ",
"a.perioda = ",per_v," and ",
"a.platnost = 1 ",
"group by 1,2 order by 1,2 "

prepare p_podm_odd from podm_odd 
whenever error stop
if sqlca.sqlcode < 0 then
   let a = false
   let txt1 = "Chyba pri preparovani cislo:",sqlca.sqlcode using "-<<<<<&"
end if
if a then
   whenever error continue
   declare kstr cursor for p_podm_odd

   let i = 1
   foreach kstr into 
	odd[i].cpv,
	odd[i].cov,
	odd[i].napln_oper,
	odd[i].poc_strojov

	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri vybere stredisk! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
	   exit foreach
	end if
	let odd[i].volne_miesto =  (odd[i].poc_strojov * 84 units hour) - odd[i].napln_oper
	let i = i + 1
   end foreach
   whenever error stop
   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Chyba pri vybere stredisk! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
   end if
end if
if a then
	let poc_odd = i - 1
end if
free kstr
return a
end function

#######################
function inic_odd()
#######################
{
define i smallint
for i = 1 to 25
   if odd[i].cov is null then
	exit for
   end if
   initialize odd_prazd.* to null
   let odd[i].* = odd_prazd.*
end for
}
--initialize odd to null 
call odd.clear()
end function

#######################
function vyb_oper_predstih(j,rok_v,tyz_v,per_v,rok_k,tyz_k,per_k)
#######################
define j smallint
define rok_v,tyz_v,per_v smallint --vyvazovana perioda
define rok_z,tyz_z,per_z smallint --zaciatocna perioda predstihov
define rok_k,tyz_k,per_k smallint --konecna perioda predstihov
define a char
define text_p,preptext_p char(5000)
define poc_oper smallint
define zac_per_v,kon_per_v datetime year to minute
define zac_per_z,kon_per_z datetime year to minute
define zac_per_k,kon_per_k datetime year to minute
define cas_oper_koniec interval hour(3) to minute

let a = true
call inic_oper_preds()

call hranice_periody(rok_v,tyz_v,per_v) returning zac_per_v,kon_per_v

--call perioda_posun(rok_v,tyz_v,per_v,"+") returning rok_z,tyz_z,per_z --zaciatocna perioda predstihov
--call hranice_periody(rok_z,tyz_z,per_z) returning zac_per_z,kon_per_z
call hranice_periody(rok_k,tyz_k,per_k) returning zac_per_k,kon_per_k

let text_p = 
"select ",
"pl_harm.cpv,",
"pl_harm.cov,",
"pl_harm.rok_zac,",
"pl_harm.tyzden_zac,",
"pl_harm.perioda,",
"pl_harmpolozka.id,",
"pl_harmpolozka.idpo_stroje,",
"pl_harmpolozka.zac_plan,",
"pl_harmpolozka.kon_plan,",
"pl_harmpolozka.min_zac_rok,",
"pl_harmpolozka.min_zac_tyz,",
"pl_harmpolozka.min_zac_per,",
"pl_harmpolozka.min_zac_cas,",
"pl_harmpolozka.max_kon_rok,",
"pl_harmpolozka.max_kon_tyz,",
"pl_harmpolozka.max_kon_per,",
"pl_harmpolozka.max_kon_cas,",
"pl_harmpolozka.min_zac_cas_hr,",
"pl_harmpolozka.max_kon_cas_hr,",
"pl_harmpolozka.idpl_sledpolozka,",
"vp_polot.datplat,",
"vp_polot.cislo_vp,",
"vp_polot.stl,",
"vp_polot.riad,",
"vp_polot.cisoper,",
"vp_polot.stlo,",
"vp_polot.riado,",
"vp_polot.cisopero,",
"vp_polot.csv,",
"vp_polot.ctv,",
"vp_polot.sirka,",
"vp_polot.sirka_vst,",
"vp_polot.mikron,",
"vp_polot.casbeh,",
"sort.novecsv,",
"ht_vpvyr.vyrkg,",
"ht_vpvyr.vyrbm,",
"ht_vpvyr.vyrks,",
"ht_vpvyr.datukvyr,",
"pl_prac_uloha.mj,",
"technologie.kod_tech,",
"vp_polot.casdemont,",
"vp_polot.cascisten,",
"vp_polot.por_polot,", --idv_prikazy doplnene 12.2.16
"vp_polot.id,", --idvp_polot doplnene 12.2.16
"sum(pl_prac_uloha.mnoz_kg_plan),",
"sum(pl_prac_uloha.mnoz_mj_plan),",
"sum(pl_prac_uloha.cas_prip_plan_i),",
"sum(pl_prac_uloha.cas_beh_plan_i) ",
----
"from ",
"pl_harm, ",
"pl_harmpolozka,",
"pl_sledpolozka,",
"pl_subeh,",
"pl_prac_uloha, ",
"vp_polot, ",
"outer kalkul2:sort sort,",
"polot2:ht_vpvyr ht_vpvyr,",
"outer technologie ",
"where ",
"technologie.ctv = vp_polot.ctv and ",
"ht_vpvyr.cislo_vp = pl_prac_uloha.cislo_vp and ",
"ht_vpvyr.stl = pl_prac_uloha.stl and ",
"ht_vpvyr.riad = pl_prac_uloha.riad and ",
"ht_vpvyr.cisoper = pl_prac_uloha.cisoper and ",
"sort.datplat = vp_polot.datplat and ",
"sort.podv = vp_polot.podv and ",
"sort.csv = vp_polot.csv and ",
"vp_polot.cislo_vp = pl_prac_uloha.cislo_vp and ",
"vp_polot.stl = pl_prac_uloha.stl and ",
"vp_polot.riad = pl_prac_uloha.riad and ",
"vp_polot.cisoper = pl_prac_uloha.cisoper and ",
"pl_harmpolozka.idpl_harm = pl_harm.id and ",
"pl_sledpolozka.id = pl_harmpolozka.idpl_sledpolozka and ",
"pl_subeh.id = pl_sledpolozka.idpl_subeh and ",
"pl_prac_uloha.idpl_subeh = pl_subeh.id and ",
"pl_harm.cpv = ",odd[j].cpv," and ",
"pl_harm.cov = ",odd[j].cov," and ",
"pl_harm.zac_periody between \"",kon_per_v,"\" and \"",zac_per_k,"\" and ",
"ht_vpvyr.cpv = ",odd[j].cpv," and ",
"ht_vpvyr.cov = ",odd[j].cov," and ",
"ht_vpvyr.datukvyr is null and ", --len neukoncene
--"pl_harmpolozka.zac_plan between \"",kon_per_z,"\" and \"",kon_per_k,"\" and ",
"pl_harmpolozka.min_zac_cas <= \"",zac_per_v,"\" ", --tie co im to umoznuje minimal.cas zaciatku
"group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45 ",
"union select ",
"pl_harm.cpv,",
"pl_harm.cov,",
"pl_harm.rok_zac,",
"pl_harm.tyzden_zac,",
"pl_harm.perioda,",
"pl_harmpolozka.id,",
"pl_harmpolozka.idpo_stroje,",
"pl_harmpolozka.zac_plan,",
"pl_harmpolozka.kon_plan,",
"pl_harmpolozka.min_zac_rok,",
"pl_harmpolozka.min_zac_tyz,",
"pl_harmpolozka.min_zac_per,",
"pl_harmpolozka.min_zac_cas,",
"pl_harmpolozka.max_kon_rok,",
"pl_harmpolozka.max_kon_tyz,",
"pl_harmpolozka.max_kon_per,",
"pl_harmpolozka.max_kon_cas,",
"pl_harmpolozka.min_zac_cas_hr,",
"pl_harmpolozka.max_kon_cas_hr,",
"pl_harmpolozka.idpl_sledpolozka,",
"vp_polot.datplat,",
"vp_polot.cislo_vp,",
"vp_polot.stl,",
"vp_polot.riad,",
"vp_polot.cisoper,",
"vp_polot.stlo,",
"vp_polot.riado,",
"vp_polot.cisopero,",
"vp_polot.csv,",
"vp_polot.ctv,",
"vp_polot.sirka,",
"vp_polot.sirka_vst,",
"vp_polot.mikron,",
"vp_polot.casbeh,",
"sort.novecsv,",
"ht_vpvyr.vyrkg,",
"ht_vpvyr.vyrbm,",
"ht_vpvyr.vyrks,",
"ht_vpvyr.datukvyr,",
"pl_prac_uloha.mj,",
"technologie.kod_tech,",
"vp_polot.casdemont,",
"vp_polot.cascisten,",
"vp_polot.por_polot,", --idv_prikazy doplnene 12.2.16
"vp_polot.id,", --idvp_polot doplnene 12.2.16
"sum(pl_prac_uloha.mnoz_kg_plan),",
"sum(pl_prac_uloha.mnoz_mj_plan),",
"sum(pl_prac_uloha.cas_prip_plan_i),",
"sum(pl_prac_uloha.cas_beh_plan_i) ",
----
"from ",
"pl_harm, ",
"pl_harmpolozka,",
"pl_sledpolozka,",
"pl_subeh,",
"pl_prac_uloha, ",
"vp_polot, ",
"outer kalkul2:sort sort,",
"polot2:ht_vpvyr ht_vpvyr,",
"outer technologie ",
--"vp_polot2, ",
--"polot2:ht_vpvyr ht_vpvyr2 ",
"where ",
{
"vp_polot2.cislo_vp = pl_prac_uloha.cislo_vp and ",
"vp_polot2.stlo = pl_prac_uloha.stl and ",
"vp_polot2.riado = pl_prac_uloha.riad and ",
"vp_polot2.cisopero = pl_prac_uloha.cisoper and ",
"ht_vpvyr2.cislo_vp = vp_polot2.cislo_vp and ",
"ht_vpvyr2.stl = vp_polot2.stl and ",
"ht_vpvyr2.riad = vp_polot2.riad and ",
"ht_vpvyr2.cisoper = vp_polot2.cisoper and ",
}
"technologie.ctv = vp_polot.ctv and ",
"ht_vpvyr.cislo_vp = pl_prac_uloha.cislo_vp and ",
"ht_vpvyr.stl = pl_prac_uloha.stl and ",
"ht_vpvyr.riad = pl_prac_uloha.riad and ",
"ht_vpvyr.cisoper = pl_prac_uloha.cisoper and ",
"sort.datplat = vp_polot.datplat and ",
"sort.podv = vp_polot.podv and ",
"sort.csv = vp_polot.csv and ",
"vp_polot.cislo_vp = pl_prac_uloha.cislo_vp and ",
"vp_polot.stl = pl_prac_uloha.stl and ",
"vp_polot.riad = pl_prac_uloha.riad and ",
"vp_polot.cisoper = pl_prac_uloha.cisoper and ",
"pl_harmpolozka.idpl_harm = pl_harm.id and ",
"pl_sledpolozka.id = pl_harmpolozka.idpl_sledpolozka and ",
"pl_subeh.id = pl_sledpolozka.idpl_subeh and ",
"pl_prac_uloha.idpl_subeh = pl_subeh.id and ",
"pl_harm.cpv = ",odd[j].cpv," and ",
"pl_harm.cov = ",odd[j].cov," and ",
"pl_harm.zac_periody between \"",kon_per_v,"\" and \"",zac_per_k,"\" and ",
"ht_vpvyr.datukvyr is null and ", --len neukoncene
--"pl_harmpolozka.zac_plan between \"",kon_per_z,"\" and \"",kon_per_k,"\" and ",
--"ht_vpvyr2.datukvyr is not null ", --aj tie co maju predoslu operaciu ukoncenu
"exists ",
"(select x.cislo_vp from polot2:ht_vpvyr x,vp_polot y where ",
"y.cislo_vp = x.cislo_vp and ",
"y.stl = x.stl and ",
"y.riad = x.riad and ",
"y.cisoper = x.cisoper and ",
"x.cislo_vp = pl_prac_uloha.cislo_vp and ",
"x.stl = pl_prac_uloha.stl and ",
"x.riad = pl_prac_uloha.riad and ",
"x.cisoper = pl_prac_uloha.cisoper and ",
"x.datukvyr is not null) ",

"group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45 ",
" order by pl_harmpolozka.zac_plan "

whenever error continue
prepare preptext_p from text_p 
whenever error stop
if sqlca.sqlcode < 0 then
   let a = false
   let txt1 = "Chyba pri preparovani cislo:",sqlca.sqlcode using "-<<<<<&"
end if
if a then
   whenever error continue
   declare kpreds cursor for preptext_p
   let poc_oper= 1
   foreach 
	kpreds into 
	oper_preds[poc_oper].cpv,
	oper_preds[poc_oper].cov,
	oper_preds[poc_oper].rok_zac,
	oper_preds[poc_oper].tyz_zac,
	oper_preds[poc_oper].per_zac,
	oper_preds[poc_oper].id,
	oper_preds[poc_oper].idpo_stroje,
	oper_preds[poc_oper].zac_plan,
	oper_preds[poc_oper].kon_plan,
	oper_preds[poc_oper].min_zac_rok,
	oper_preds[poc_oper].min_zac_tyz,
	oper_preds[poc_oper].min_zac_per,
	oper_preds[poc_oper].min_zac_cas,
	oper_preds[poc_oper].max_kon_rok,
	oper_preds[poc_oper].max_kon_tyz,
	oper_preds[poc_oper].max_kon_per,
	oper_preds[poc_oper].max_kon_cas,
	oper_preds[poc_oper].min_zac_cas_hr,
	oper_preds[poc_oper].max_kon_cas_hr,
	oper_preds[poc_oper].idpl_sledpolozka,
	oper_preds[poc_oper].datplat,
	oper_preds[poc_oper].cislo_vp,
	oper_preds[poc_oper].stl,
	oper_preds[poc_oper].riad,
	oper_preds[poc_oper].cisoper,
	oper_preds[poc_oper].stlo,
	oper_preds[poc_oper].riado,
	oper_preds[poc_oper].cisopero,
	oper_preds[poc_oper].csv,
	oper_preds[poc_oper].ctv,
	oper_preds[poc_oper].sirka,
	oper_preds[poc_oper].sirka_vst,
	oper_preds[poc_oper].mikron,
	oper_preds[poc_oper].casbeh,
	oper_preds[poc_oper].novecsv,
	oper_preds[poc_oper].vyrkg,
	oper_preds[poc_oper].vyrbm,
	oper_preds[poc_oper].vyrks,
	oper_preds[poc_oper].datukvyr,
	oper_preds[poc_oper].mj,
	oper_preds[poc_oper].kod_tech,
	oper_preds[poc_oper].casdemont,
	oper_preds[poc_oper].cascisten,
	oper_preds[poc_oper].idv_prikazy, --doplnene 12.2.16
	oper_preds[poc_oper].idvp_polot, --doplnene 12.2.16
	oper_preds[poc_oper].mnoz_kg_plan,
	oper_preds[poc_oper].mnoz_mj_plan,
	oper_preds[poc_oper].cas_prip_plan_i,
	oper_preds[poc_oper].cas_beh_plan_i
	------
	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri vybere predstihovych operacii:",sqlca.sqlcode using "-<<<<<&"
	   exit foreach
	end if
	------
	case oper_preds[poc_oper].mj
	   when "BM"
		let oper_preds[poc_oper].mnoz_mj_skut = oper_preds[poc_oper].vyrbm
	   when "KS"
		let oper_preds[poc_oper].mnoz_mj_skut = oper_preds[poc_oper].vyrks
	end case
	let oper_preds[poc_oper].mnoz_kg_skut = oper_preds[poc_oper].vyrkg

	let oper_preds[poc_oper].cas_plan_i = 
		oper_preds[poc_oper].cas_prip_plan_i +
		oper_preds[poc_oper].cas_beh_plan_i

{
	if oper_preds[poc_oper].vyrkg > 0 then
	   let oper_preds[poc_oper].cas_skut_i = 
		vypoc_cas_skut(oper_preds[poc_oper].casbeh,oper_preds[poc_oper].mnoz_kg_plan,oper_preds[poc_oper].vyrkg,1) +
		oper_preds[poc_oper].cas_prip_plan_i
	else
	   let oper_preds[poc_oper].cas_skut_i = "00:00"
	end if
}
	--9.2.12 uprava vypoctu skutocne minutych stratovych casov-----------------------
	if oper_preds[poc_oper].vyrkg > 0 then
	   let oper_preds[poc_oper].cas_skut_i = 
		vypoc_cas_skut(oper_preds[poc_oper].casbeh,oper_preds[poc_oper].mnoz_kg_plan,oper_preds[poc_oper].vyrkg,1) +
		(oper_preds[poc_oper].cas_prip_plan_i - 
		(oper_preds[poc_oper].casdemont+oper_preds[poc_oper].cascisten) units minute)
	else
	   let oper_preds[poc_oper].cas_skut_i = interval(00:00) hour to minute
	end if
	---------------------------------------------------------------------------------

	let oper_preds[poc_oper].cas_zost_i = 
	   oper_preds[poc_oper].cas_plan_i -
	   oper_preds[poc_oper].cas_skut_i   
	if oper_preds[poc_oper].cas_zost_i <= interval(00:00) hour to minute then
	   let oper_preds[poc_oper].cas_zost_i = interval(00:01) hour to minute --zatial
	end if
	------------------------------------------
	---7.9.09 zmena---
	--call perioda(oper_preds[poc_oper].kon_plan) returning oper_preds[poc_oper].rok_koniec,oper_preds[poc_oper].tyz_koniec,oper_preds[poc_oper].per_koniec
	call daj_kon_periodu(oper_preds[poc_oper].kon_plan) returning oper_preds[poc_oper].rok_koniec,oper_preds[poc_oper].tyz_koniec,oper_preds[poc_oper].per_koniec
	------------------

	call hranice_periody(oper_preds[poc_oper].rok_koniec,oper_preds[poc_oper].tyz_koniec,oper_preds[poc_oper].per_koniec) returning oper_preds[poc_oper].zac_per_koniec,oper_preds[poc_oper].kon_per_koniec
	--stanovenie posunu
	if oper_preds[poc_oper].kon_plan > oper_preds[poc_oper].kon_periody then
	   --tu sa pocita cast operacie v koncovej periode
	   let cas_oper_koniec = oper_preds[poc_oper].kon_plan - ulohy[poc_oper].zac_per_koniec
	   if oper_preds[poc_oper].cas_plan_i < cas_oper_koniec then 
		--let oper_preds[poc_oper].posun = oper_preds[poc_oper].cas_plan_i
	        --pokusne nahradeny planovany cas, zostatkovym casom
		let oper_preds[poc_oper].posun = oper_preds[poc_oper].cas_zost_i
	   else
		let oper_preds[poc_oper].posun = cas_oper_koniec
	   end if
	else
	   --let oper_preds[poc_oper].posun = oper_preds[poc_oper].cas_plan_i
	   --pokusne nahradeny planovany cas, zostatkovym casom
	   let oper_preds[poc_oper].posun = oper_preds[poc_oper].cas_zost_i
	end if
	let oper_preds[poc_oper].presunuta = false
	------------------------------------------

	if sqlca.sqlcode = 0 then
	   --2.6.15 dodatocne doplneny vyber finalnych parametrov pre spravne testy vyberu stroja-----
	   call vyb_final(oper_preds[poc_oper].cislo_vp) returning a --vyber finalnych udajov 
	   -------------------------------------------------------------------------------------------
	   if a then
		call vyb_stroje(poc_oper,oper_preds[poc_oper].datplat,oper_preds[poc_oper].cpv,oper_preds[poc_oper].cov,oper_preds[poc_oper].csv,oper_preds[poc_oper].ctv,oper_preds[poc_oper].stl,oper_preds[poc_oper].riad,oper_preds[poc_oper].cisoper,oper_preds[poc_oper].sirka,oper_preds[poc_oper].sirka_vst,oper_preds[poc_oper].mikron,oper_preds[poc_oper].novecsv,oper_preds[poc_oper].idv_prikazy,oper_preds[poc_oper].idvp_polot) returning a,oper_preds[poc_oper].poc_stroj
	   else 
		exit foreach
	   end if
	   if a then
		if oper_preds[poc_oper].poc_stroj = 0 then
		   let a = false
		   let txt1 = "Na oddeleni ",oper_preds[k_post].cov using "<<<&"," sa nenasiel ziadny stroj!"
		   exit foreach
		end if
	   else
		exit foreach
	   end if
	end if
	------
	let poc_oper = poc_oper + 1
   end foreach
   whenever error stop
   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Chyba pri vybere strojov cislo:",sqlca.sqlcode using "-<<<<<&"
   end if
end if
if a then
	let poc_oper = poc_oper - 1
	let odd[j].poc_oper = poc_oper
end if
free kpreds
return a
end function

##########################
function daj_kon_periodu(kon)
##########################
define kon datetime year to minute
define cas_kon datetime hour to minute
define den,rok,tyz,per smallint

let cas_kon = extend(kon,hour to minute)
let den = weekday(kon)

if den = 2 and cas_kon = interval(00:00) hour to minute or
   den = 5 and cas_kon = interval(12:00) hour to minute then
	let kon = kon - 1 units minute
end if
call perioda(kon) returning rok,tyz,per
return rok,tyz,per 
end function

#######################
function inic_oper_preds()
#######################
{
define i,j smallint
for i = 1 to 1500
   if oper_preds[i].id is null then
	exit for
   end if
   initialize oper_preds_prazd.* to null
   let oper_preds[i].* = oper_preds_prazd.*
   call inic_stroje(i)
end for
}
--initialize oper_preds to null
call oper_preds.clear()
call inic_stroje()
end function

##################
function obcerstvi_oper_preds(idpl_harmpolozka)
#################
define idpl_harmpolozka like pl_harmpolozka.id
define zac_plan like pl_harmpolozka.zac_plan
define kon_plan like pl_harmpolozka.kon_plan
define rok_v,tyz_v,per_v smallint
define try,a char
define pid integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
select
	pl_harmpolozka.zac_plan,
	pl_harmpolozka.kon_plan
into
	zac_plan,
	kon_plan
from pl_harmpolozka where
	pl_harmpolozka.id = idpl_harmpolozka
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
return a,zac_plan,kon_plan
end function

#################################
function vypoc_cas_skut(casbeh,mnoz_kg_plan,mnoz_kg_skut,interval_format)
#################################
define casbeh,casskut integer
define mnoz_kg_plan like pl_prac_uloha.mnoz_kg_plan
define mnoz_kg_skut like pl_prac_uloha.mnoz_kg_skut
define casskut_i interval hour(3) to minute
define interval_format smallint

let casskut = (casbeh/mnoz_kg_plan) * mnoz_kg_skut
let casskut_i = casskut units minute
if interval_format then 
   return casskut_i
else
   return casskut
end if
end function

{
#######################
function napln_harmonogram(cpv,kon_per) --here is start of calculation alpr
#######################
define cpv like pl_harm.cpv
define kon_per like pl_harm.zac_periody
define i smallint
define a char
define cislo_vp like pl_poziad_progn.cislo_vp
define l_ckz like pl_poziad_progn.ckz
define idpl_poziad_progn like pl_poziad_progn.id
define termin_poz_uv like pl_poziad_progn.termin_poz_uv
define termin_prog_uv like pl_poziad_progn.termin_prog_uv
define termin_prog_natlac like pl_poziad_progn.termin_prog_natlac
define c_poziad like pl_poziad_progn.c_poziad
define l_text char(80)
define poc integer
define cas_vytvorenia like pl_vynimka.cas_vytvorenia
define ret,ret_poc char(2000)
define pocet integer
define bc smallint

let a = true
let cislo_vp = null
let l_ckz = null
let idpl_poziad_progn = null
let termin_poz_uv = null
let c_poziad = null
let cas_vytvorenia = null
let pocet = 0


let ret =
"select ",
"p.cislo_vp, ",
"vp.ckz, ",
"p.id, ",
"case when pl_vynimka_zak.termin_poz_uv is not null then pl_vynimka_zak.termin_poz_uv else p.termin_prog_uv end, ",--ZUV
"p.c_poziad, ",
"case when pl_vynimka.cas_vytvorenia is not null then pl_vynimka.cas_vytvorenia else ",
"(current year to second)+500 units year end ", --cas tvorby vynimky
"from ",
"pl_poziad_progn p, ",
"polot2:ht_vpvyr h, ",
"odvskl:vpvyr v, ",
"v_prikazy vp, ",
"outer (pl_vynimka_zak,pl_vynimka) ",
"where ",
"pl_vynimka_zak.ckz = vp.ckz and ",
"pl_vynimka_zak.porc = vp.porc and ",
"pl_vynimka.id = pl_vynimka_zak.idpl_vynimka and ",
"pl_vynimka.druh_vynimky = 'R' and ", --riaditelske vynimky
"pl_vynimka.stav_vynimky = 'N' and ", --len platne vynimky
"vp.cislo_vp = p.cislo_vp and ",
"vp.stav_prik <> 'S' and ",
"vp.fin_stred not in (152,154,153,181) and ",--17.6.16 doplnene oddelenie 181, lebo sa odstavil stroj
"v.cvp = p.cislo_vp and ",
"v.datukodv is null and ",
"p.d_prognoz > '25.03.2008' and ",
"h.cislo_vp = p.cislo_vp and ",
"h.stl = 0 and ",
"h.riad = 0 and ",
"h.cisoper = 0 and ",
"h.cpv = vp.podv and ",
"h.cov = vp.fin_stred and ",
--"h.datukvyr is null and ",
"(h.datukvyr is null or (h.datukvyr is not null and vp.ckz[1] = 'I')) and ",
"p.stav not matches '[SU]' and ",
"p.termin_prog_uv is not null ",
--"order by 5,6,3 "
"order by 5,3 "

let ret_poc =
"select ",
"count(*) ",
"from ",
"pl_poziad_progn p, ",
"polot2:ht_vpvyr h, ",
"odvskl:vpvyr v, ",
"v_prikazy vp, ",
"outer (pl_vynimka_zak,pl_vynimka) ",
"where ",
"pl_vynimka_zak.ckz = vp.ckz and ",
"pl_vynimka_zak.porc = vp.porc and ",
"pl_vynimka.id = pl_vynimka_zak.idpl_vynimka and ",
"pl_vynimka.druh_vynimky = 'R' and ", --riaditelske vynimky
"pl_vynimka.stav_vynimky = 'N' and ", --len platne vynimky
"vp.cislo_vp = p.cislo_vp and ",
"vp.stav_prik <> 'S' and ",
"vp.fin_stred not in (152,154,153,181) and ",--17.6.16 doplnene oddelenie 181, lebo sa odstavil stroj
"v.cvp = p.cislo_vp and ",
"v.datukodv is null and ",
"p.d_prognoz > '25.03.2008' and ",
"h.cislo_vp = p.cislo_vp and ",
"h.stl = 0 and ",
"h.riad = 0 and ",
"h.cisoper = 0 and ",
"h.cpv = vp.podv and ",
"h.cov = vp.fin_stred and ",
--"h.datukvyr is null and ",
"(h.datukvyr is null or (h.datukvyr is not null and vp.ckz[1] = 'I')) and ",
"p.stav not matches '[SU]' and ",
"p.termin_prog_uv is not null "

whenever error continue
prepare prep_ret from ret
if sqlca.sqlcode < 0 then
   let a = false
   let txt1 = "Chyba pri preparovani vyberu pre preplanovanie! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
end if
if a then
	prepare prep_ret_poc from ret_poc --find out number of orders
	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri preparovani vyberu poctu pre preplanovanie! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
	end if
end if
if a then
	declare kpocet cursor for prep_ret_poc
	open kpocet 
	fetch kpocet into pocet
	close kpocet
	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri vyberu poctu pre preplanovanie! Cislo chyby:",sqlca.sqlcode using "-<<<<<&"
	end if
end if
if a then
	declare napln cursor with hold for prep_ret
	let i = 1
	--let self="Prebieha preplánovanie..."
	--let bc=messwindow(-7)
	call lycia_progressbar_new(pocet,"Prebieha preplánovanie...") --I add progressbar
	foreach --main foreach of orders
	   napln into
		cislo_vp,
		l_ckz,
		idpl_poziad_progn,
		termin_poz_uv, --plni sa terminom termin_prog_uv
		c_poziad,
		cas_vytvorenia
	   if sqlca.sqlcode < 0 then
		let a = false
		let txt1 = "Chyba pri vybere pri vybere polozky pre preplanovanie! Cislo chyby:",sqlca.sqlcode using "-<<<<<&","."
		exit foreach
	   end if
	   ----------------
	   
	   let l_text = "Planujem zakazku:",cislo_vp,"-",termin_poz_uv using "dd.mm.yy"," Poradie:",i using "<<<<<&"
	   display l_text
	   error l_text clipped
		--docasny test----------------------------t
		let poc = 0
		select count(*) into poc
		from 
		pl_prac_uloha pu,pl_subeh su,pl_sledpolozka sp,pl_harmpolozka hp,pl_harm ha
		where
		   pu.idpl_subeh = su.id and
		   sp.idpl_subeh = su.id and
		   hp.idpl_sledpolozka = sp.id and
		   hp.idpl_harm = ha.id and
		   ha.cpv = cpv and
		   ha.zac_periody >= kon_per and
		   pu.cislo_vp = cislo_vp
		if poc > 0 then
		   let i = i + 1
		   continue foreach
		end if
		------------------------------------------

		--6.5.11 test ukoncenia finalnej operacie-
		let poc = 0
		call test_final_oper(cislo_vp) returning a,poc --this is test if planning order was already planning, you can continue, 
		if a then
		   if poc = 0 then --ak existuje ukoncena finalna operacia
			if l_ckz[1] = "I" then
			   --OK --vynimka pre VP na IPP -bude sa prognozovat aj ukoncena finalna operacia
			else
			   --pokracovanie cyklu s preskocenim prognozovania zakazky
			   let i = i + 1
			   continue foreach
			end if
		   end if
		end if
		------------------------------------------
	   if a then
		call novy_algoritmus(cislo_vp,idpl_poziad_progn,termin_poz_uv,1) returning a,termin_prog_uv,termin_prog_natlac --this is main algoritmic function for one order
	   end if
	   if a then
		display termin_prog_uv using "dd.mm.yy" at 24,30
	   else
		exit foreach
	   end if
	   ----------------
	   let cislo_vp = null
	   let l_ckz = null
	   let idpl_poziad_progn = null
	   let termin_poz_uv = null
	   let c_poziad = null
	   let cas_vytvorenia = null
	   --let percenta_presne=null --- lebo to skonci skor ako 100%, ostane tu hodnota a potom to spadne
	   --call zq_percenta(0,pocet) returning bc --aby nieco ukazalo
	   --call zq_percenta(i,pocet) returning bc
	   DISPLAY i to pb01 --progressbar
	   let i = i + 1
	end foreach
	--call close_messwindowperc()
	CLOSE WINDOW w1
	
end if
whenever error stop
if a then
	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri vybere PnP! Cislo chyby:",sqlca.sqlcode using "-<<<<<&","."
	end if
end if
if not a then
   let txt1 = txt1 clipped,"Poradie:",i using "<<<<<<&"
end if
free kpocet
return a --there is end if foreach ends --alpr
end function
}
#######################
function napln_harmonogram(cpv,kon_per) --here is start of calculation alpr
#######################
define cpv like pl_harm.cpv
define kon_per like pl_harm.zac_periody
define i smallint
define a char
define cislo_vp like pl_poziad_progn.cislo_vp
define l_ckz like pl_poziad_progn.ckz
define idpl_poziad_progn like pl_poziad_progn.id
define termin_poz_uv like pl_poziad_progn.termin_poz_uv
define termin_prog_uv like pl_poziad_progn.termin_prog_uv
define termin_prog_natlac like pl_poziad_progn.termin_prog_natlac
define c_poziad like pl_poziad_progn.c_poziad
define l_text char(80)
define poc integer
define cas_vytvorenia like pl_vynimka.cas_vytvorenia
define ret,ret_poc char(2000)
define pocet integer
define bc smallint

let a = true
let cislo_vp = null
let l_ckz = null
let idpl_poziad_progn = null
let termin_poz_uv = null
let c_poziad = null
let cas_vytvorenia = null

let pocet = 1000
let a = true



--whenever error continue
if a then
	call lycia_progressbar_new(pocet,"Planning...") --I add progressbar
	for i = 1 to 1000 --main foreach of orders
	   
		let cislo_vp = "00600119"
		let l_ckz = "B6368054FR"
		let idpl_poziad_progn = 238296
		let termin_poz_uv = "28.06.2019"
		let c_poziad = "2018-12-04 09:44:53"
		let cas_vytvorenia = "2519-05-14 16:57:53"
		
	   if sqlca.sqlcode < 0 then
		let a = false
		let txt1 = "Chyba pri vybere pri vybere polozky pre preplanovanie! Cislo chyby:",sqlca.sqlcode using "-<<<<<&","."
		exit for
	   end if
	   ----------------
	   
	   let l_text = "Now is planning job number:",cislo_vp,"-",termin_poz_uv using "dd.mm.yy"," Order:",i using "<<<<<&"
	   
	   display l_text
	   error l_text clipped

	   if a then
		call novy_algoritmus(cislo_vp,idpl_poziad_progn,termin_poz_uv,1) returning a,termin_prog_uv,termin_prog_natlac --this is main algoritmic function for one order
	   end if
	   if a then
		display termin_prog_uv using "dd.mm.yy" at 24,30
	   else
		exit for
	   end if
	   ----------------
	   DISPLAY i to pb01 --progressbar
	   --let i = i + 1
	end for
	CLOSE WINDOW w1
	
end if
--whenever error stop
if a then
	if sqlca.sqlcode < 0 then
	   let a = false
	   let txt1 = "Chyba pri vybere PnP! Cislo chyby:",sqlca.sqlcode using "-<<<<<&","."
	end if
end if
if not a then
   let txt1 = txt1 clipped,"Poradie:",i using "<<<<<<&"
end if

return a --there is end if foreach ends --alpr
end function

#################################
function lycia_progressbar_new(l_maxvalue,l_window_title)
#################################
DEFINE l_maxvalue INT
DEFINE l_window_title CHAR(100)
DEFINE l_pb ui.ProgressBar
DEFINE win1 ui.window

OPEN WINDOW w1 WITH FORM '3416/ProgressBar' ATTRIBUTE(BORDER)
LET win1 = ui.window.forname("w1")
CALL win1.SetTitle(l_window_title)
LET l_pb = ui.ProgressBar.forName("pb01")
CALL l_pb.SetMinValue(0)
CALL l_pb.SetMaxValue(l_maxvalue)
--CALL l_pb.SetStep =1
end function

##################
function test_final_oper(p_cislo_vp)
#################
define p_cislo_vp like polot2:ht_vpvyr.cislo_vp
define try,a char
define poc smallint
let try = true
let a = false
while try
let txt2 = ""
let poc = 0

whenever error continue
select
	count(*)
into
	poc
from polot2:ht_vpvyr h where
	h.cislo_vp = p_cislo_vp and
	h.stl = 0 and
	h.riad = 0 and
	h.cisoper = 0 and
	h.datukvyr is null
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let try = false
   when -1
    let a = false
    let try = false
   when 0
    let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
return a,poc
end function

##############################
function trans_cisti_plan(cpv,kon_per)
##############################
define rok,tyz,per smallint
define cpv like pl_harm.cpv
define kon_per like pl_harm.zac_periody
define a,wk char,
       i int

let a = true
let wk = true

If beg_wk() then
   if a then
	call cisti_pl_prac_uloha(cpv,kon_per) returning a
   end if
   if a then
	call cisti_pl_subeh(cpv,kon_per) returning a
   end if
   if a then
	call cisti_pl_sledpolozka(cpv,kon_per) returning a
   end if
   if a then
	call cisti_pl_harmpolozka(cpv,kon_per) returning a
   end if

--8.12.09 cistenie period nama zmysel, lebo su zakazkovo nezavisle
{
   if a then
	call cisti_pl_harm(cpv,kon_per) returning a
   end if
}


   if a then
       call com_wk() returning wk
   else
       call rol_wk() returning wk
   end if

else
       let a = false
       let wk = false
end if

if a then
   let txt1 = "Pocet vymazanych operacii z harmonogramov:",gpocupd using "<<<<<&"
end if
return a
end function

###########################
function cisti_pl_prac_uloha(cpv,kon_per)
###########################
define cpv like pl_harm.cpv
define kon_per like pl_harm.zac_periody
define try,a char
define i integer
define l_text char(500)

let try = true
let a = false
while try
let txt2 = ""

let l_text =
"	delete from pl_prac_uloha ",
" 			 where ", 
" 	pl_prac_uloha.idpl_subeh in ",
"(select su.id ", 
"from ", 
"pl_subeh su,pl_sledpolozka sp,pl_harmpolozka hp,pl_harm ha ",
"where ",
"   sp.idpl_subeh = su.id and ",
"   hp.idpl_sledpolozka = sp.id and ",
"   hp.idpl_harm = ha.id and ",
"   ha.cpv = ",cpv," and ",
"   ha.zac_periody >= '",kon_per,"') "

whenever error continue
prepare prep_text_d001 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_d001
end if

{
	delete from pl_prac_uloha
 			 where 
 	pl_prac_uloha.idpl_subeh in
(select su.id 
from 
pl_subeh su,pl_sledpolozka sp,pl_harmpolozka hp,pl_harm ha
where
   sp.idpl_subeh = su.id and
   hp.idpl_sledpolozka = sp.id and
   hp.idpl_harm = ha.id and
   ha.cpv = cpv and
   ha.zac_periody >= kon_per)
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    --let a = false
    let a = true
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
free prep_text_d001
return a
end function

##################
function cisti_pl_subeh(cpv,kon_per)
#################
define cpv like pl_harm.cpv
define kon_per like pl_harm.zac_periody
define try,a char
define i integer
define l_text char(500)

let try = true
let a = false
while try
let txt2 = ""

let l_text = 
"	delete from pl_subeh ",
" 			 where ", 
" 	pl_subeh.id in ",
"(select sp.idpl_subeh ", 
"from ", 
"pl_sledpolozka sp,pl_harmpolozka hp,pl_harm ha ",
"where ",
"   hp.idpl_sledpolozka = sp.id and ",
"   hp.idpl_harm = ha.id and ",
"   ha.cpv = ",cpv," and ",
"   ha.zac_periody >= '",kon_per,"') "

whenever error continue
prepare prep_text_d002 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_d002
end if

{
	delete from pl_subeh
 			 where 
 	pl_subeh.id in
(select sp.idpl_subeh 
from 
pl_sledpolozka sp,pl_harmpolozka hp,pl_harm ha
where
   hp.idpl_sledpolozka = sp.id and
   hp.idpl_harm = ha.id and
   ha.cpv = cpv and
   ha.zac_periody >= kon_per)
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    --let a = false
    let a = true
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     --let  gpocupd_02  = sqlca.sqlerrd[3]
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
free prep_text_d002
return a
end function

##################
function cisti_pl_sledpolozka(cpv,kon_per)
#################
define cpv like pl_harm.cpv
define kon_per like pl_harm.zac_periody
define try,a char
define i integer
define l_text char(500)

let try = true
let a = false
while try
let txt2 = ""

let l_text = 
"delete from pl_sledpolozka ",
" 			 where ", 
"	pl_sledpolozka.idsledpolozkadruh = 2 and ", --poistka
" 	pl_sledpolozka.id in ",
"(select hp.idpl_sledpolozka  ",
"from ", 
"pl_harmpolozka hp,pl_harm ha ",
"where ",
"   hp.idpl_harm = ha.id and ",
"   ha.cpv = ",cpv," and ",
"   ha.zac_periody >= '",kon_per,"') "

whenever error continue
prepare prep_text_d003 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_d003
end if
{
	delete from pl_sledpolozka
 			 where 
	pl_sledpolozka.idsledpolozkadruh = 2 and --poistka
 	pl_sledpolozka.id in
(select hp.idpl_sledpolozka 
from 
pl_harmpolozka hp,pl_harm ha
where
   hp.idpl_harm = ha.id and
   ha.cpv = cpv and
   ha.zac_periody >= kon_per)
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    --let a = false
    let a = true
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
free prep_text_d003
return a
end function

##################
function cisti_pl_harmpolozka(cpv,kon_per)
#################
define cpv like pl_harm.cpv
define kon_per like pl_harm.zac_periody
define try,a char
define i integer
define l_text char(500)

let try = true
let a = false
while try
let txt2 = ""

let l_text =
"delete from pl_harmpolozka ",
" 			 where ", 
" 	pl_harmpolozka.idpl_harm in ",
"(select ha.id  ",
"from ",
"pl_harm ha ",
"where ",
"   ha.cpv = ",cpv," and ",
"   ha.zac_periody >= '",kon_per,"') "

whenever error continue
prepare prep_text_d004 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_d004
end if
{
	delete from pl_harmpolozka
 			 where 
 	pl_harmpolozka.idpl_harm in
(select ha.id 
from 
pl_harm ha
where
   ha.cpv = cpv and
   ha.zac_periody >= kon_per)
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    --let a = false
    let a = true
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     let gpocupd = sqlca.sqlerrd[3]
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
free prep_text_d004
return a
end function

##################
function cisti_pl_harm(cpv,kon_per)
#################
define cpv like pl_harm.cpv
define kon_per like pl_harm.zac_periody
define try,a char
define i integer
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
	delete from pl_harm
 			 where 
   pl_harm.cpv = cpv and
   pl_harm.zac_periody >= kon_per
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    --let a = false
    let a = true
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Chyba cislo:",chyba1 using "-<<<<<<&"
end if
return a
end function

#######################
function vyb_prestavok(idpo_stroje,zac_miesta,kon_miesta)
#######################
define i smallint
define a char
define idpo_stroje like pl_kapkalendar.idpo_stroje
define zac_miesta,kon_miesta datetime year to minute
define l_text char(1000)

let a = true
call inic_prestavky()
let l_text =
"select ",
"	id, ",
"	zac_useku, ",
"	kon_useku, ",
"	kon_useku - zac_useku ",
"from pl_kapkalendar ",
"where ",
"pl_kapkalendar.kod_useku = 'O' and ",
"pl_kapkalendar.idpo_stroje = ",idpo_stroje," and ",
"pl_kapkalendar.zac_useku between '",zac_miesta,"' and '",kon_miesta,"'  ",
"union ",
"select ",
"	id, ",
"	zac_useku, ",
"	kon_useku, ",
"	kon_useku - zac_useku ",
"from pl_kapkalendar ",
"where ",
"pl_kapkalendar.kod_useku = 'O' and ",
"pl_kapkalendar.idpo_stroje = ",idpo_stroje," and ",
"pl_kapkalendar.kon_useku between '",zac_miesta,"' and '",kon_miesta,"' and ",
"pl_kapkalendar.zac_useku > '",zac_miesta,"'  ", --28.3.09 doplnena podmienka, aby sa nevyberala prestavka s koncovym presahom
"order by zac_useku "
whenever error continue
prepare prep_text2 from l_text
if sqlca.sqlcode = 0 then
	declare kprestavky cursor for prep_text2
end if
{ 
select
	id,
	zac_useku,
	kon_useku,
	kon_useku - zac_useku
from pl_kapkalendar
where
pl_kapkalendar.kod_useku = "O" and
pl_kapkalendar.idpo_stroje = idpo_stroje and
pl_kapkalendar.zac_useku between zac_miesta and kon_miesta 
union
select
	id,
	zac_useku,
	kon_useku,
	kon_useku - zac_useku
from pl_kapkalendar
where
pl_kapkalendar.kod_useku = "O" and
pl_kapkalendar.idpo_stroje = idpo_stroje and
pl_kapkalendar.kon_useku between zac_miesta and kon_miesta and
pl_kapkalendar.zac_useku > zac_miesta --28.3.09 doplnena podmienka, aby sa nevyberala prestavka s koncovym presahom
order by zac_useku
}

let i = 1
foreach 
   kprestavky into prestavky[i].*
   if sqlca.sqlcode < 0 then
	let a = false
	let txt1 = "Chyba pri vybere prestavok! Cislo chyby:",sqlca.sqlcode using "-<<<<<&","."
	exit foreach
   end if
   let i = i + 1
end foreach
whenever error stop
if sqlca.sqlcode < 0 then
   let a = false
   let txt1 = "Chyba pri vybere prestavok! Cislo chyby:",sqlca.sqlcode using "-<<<<<&","."
end if
free kprestavky
return a
end function

#######################
function inic_prestavky()
#######################
{
define i smallint
for i = 1 to 100
    if prestavky[i].id is null then
	exit for
    end if
    initialize prestavky_prazd.* to null
    let prestavky[i].* = prestavky_prazd.*
end for
}
--initialize prestavky to null
call prestavky.clear()
end function

#######################
function daj_ref_cas()
#######################
define i smallint
define ref_cas datetime year to minute
define den smallint
define datum date

let ref_cas = current year to minute
let datum = date(ref_cas)
let den = weekday(ref_cas)
case 
   when den = 1
	exit case

   when den = 2
	let ref_cas = ref_cas - 1 units day

   when den = 3
	let ref_cas = ref_cas - 2 units day

   when den = 4
	let ref_cas = ref_cas - 3 units day

   when den = 5
	let ref_cas = extend(datum) + 8 units hour --akoby sa spustalo preplanovanie o 8:00 rano

   when den = 6
	let ref_cas = extend(datum - 1 units day) + 8 units hour

   when den = 0
	let ref_cas = extend(datum - 2 units day) + 8 units hour
end case

return ref_cas
end function

#############################################
function vyb_sum_mnozstva_zakl_vp(l_cislo_vp)
#############################################
define l_cislo_vp like v_prikazy.cislo_vp
define l_veta record
	mnoz_kg_vyst like vp_polot.mnoz_kg_vyst,
	mnoz_bm_vyst like vp_polot.mnoz_bm_vyst,
	mnoz_ks_vyst like vp_polot.mnoz_ks_vyst,
	mnoz_m2_vyst like vp_polot.mnoz_m2_vyst,
	mnoz_kg_beh like vp_polot.mnoz_kg_beh,
	mnoz_bm_beh like vp_polot.mnoz_bm_beh,
	mnoz_ks_beh like vp_polot.mnoz_ks_beh,
	mnoz_kg_vst like vp_polot.mnoz_kg_vst,
	mnoz_bm_vst like vp_polot.mnoz_bm_vst,
	mnoz_ks_vst like vp_polot.mnoz_ks_vst,
	mnoz_m2_vst like vp_polot.mnoz_m2_vst,
	casmont like vp_polot.casmont,
	caszabeh like vp_polot.caszabeh,
	casmies like vp_polot.casmies,
	casdemont like vp_polot.casdemont,
	cascisten like vp_polot.cascisten,
	casbeh like vp_polot.casbeh
end record
define try,a char
define i integer
define l_text char(1000)

let try = true
let a = false
while try
let txt2 = ""
let l_text =
"select ",
"sum(pol.mnoz_kg_vyst), ",
"sum(pol.mnoz_bm_vyst), ",
"sum(pol.mnoz_ks_vyst), ",
"sum(pol.mnoz_m2_vyst), ",
"sum(pol.mnoz_kg_beh), ",
"sum(pol.mnoz_bm_beh), ",
"sum(pol.mnoz_ks_beh), ",
"sum(pol.mnoz_kg_vst), ",
"sum(pol.mnoz_bm_vst), ",
"sum(pol.mnoz_ks_vst), ",
"sum(pol.mnoz_m2_vst), ",
"sum(pol.casmont), ",
"sum(pol.caszabeh), ",
"sum(pol.casmies), ",
"sum(pol.casdemont), ",
"sum(pol.cascisten), ",
"sum(pol.casbeh) ",
"from ",
"vp_polot pol ",
"where ",
"pol.stl = 0 and ",
"pol.riad = 0 and ",
"pol.cisoper = 0 and ",
"pol.cislo_vp in ",
"( ",
"select com.zak_cislo_vpv ",
"from k_zmluvy:combineprepoj com ",
"where ",
"com.combine_cislo_vp = '",l_cislo_vp,"' ",
")"

whenever error continue
prepare prep_text_s001 from l_text
if sqlca.sqlcode = 0 then
	execute prep_text_s001 into
	l_veta.mnoz_kg_vyst,
	l_veta.mnoz_bm_vyst,
	l_veta.mnoz_ks_vyst,
	l_veta.mnoz_m2_vyst,
	l_veta.mnoz_kg_beh,
	l_veta.mnoz_bm_beh,
	l_veta.mnoz_ks_beh,
	l_veta.mnoz_kg_vst,
	l_veta.mnoz_bm_vst,
	l_veta.mnoz_ks_vst,
	l_veta.mnoz_m2_vst,
	l_veta.casmont,
	l_veta.caszabeh,
	l_veta.casmies,
	l_veta.casdemont,
	l_veta.cascisten,
	l_veta.casbeh
end if
{
select
        sum(pol.mnoz_kg_vyst),
        sum(pol.mnoz_bm_vyst),
        sum(pol.mnoz_ks_vyst),
        sum(pol.mnoz_m2_vyst),
        sum(pol.mnoz_kg_beh),
        sum(pol.mnoz_bm_beh),
        sum(pol.mnoz_ks_beh),
        sum(pol.mnoz_kg_vst),
        sum(pol.mnoz_bm_vst),
        sum(pol.mnoz_ks_vst),
        sum(pol.mnoz_m2_vst),
        sum(pol.casmont),
        sum(pol.caszabeh),
        sum(pol.casmies),
        sum(pol.casdemont),
        sum(pol.cascisten),
        sum(pol.casbeh)
into
	l_veta.mnoz_kg_vyst,
	l_veta.mnoz_bm_vyst,
	l_veta.mnoz_ks_vyst,
	l_veta.mnoz_m2_vyst,
	l_veta.mnoz_kg_beh,
	l_veta.mnoz_bm_beh,
	l_veta.mnoz_ks_beh,
	l_veta.mnoz_kg_vst,
	l_veta.mnoz_bm_vst,
	l_veta.mnoz_ks_vst,
	l_veta.mnoz_m2_vst,
	l_veta.casmont,
	l_veta.caszabeh,
	l_veta.casmies,
	l_veta.casdemont,
	l_veta.cascisten,
	l_veta.casbeh
from
vp_polot pol
where
pol.stl = 0 and
pol.riad = 0 and
pol.cisoper = 0 and
pol.cislo_vp in
(
select com.zak_cislo_vp
from k_zmluvy:combineprepoj com
where
com.combine_cislo_vp = l_cislo_vp
)
}
whenever error stop
call uspech(true) returning st
case st
   when NOTFOUND
    let txt2 = " Polozka nebola najdena."
    let a = false
    let a = true
    let try = false
   when -1
    let a = false
    let try = false
   when 0
     let a = true
    let try = false
   when 1
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
if not a then
   let txt1 = "Pri vybere final.mnozstva finalu ZCP VP nastala chyba cislo:",chyba1 using "-<<<<<<&"
end if
free prep_text_s001
return a,l_veta.*
end function

#####################
function vyb7_26a()
####################
define try,a char
let try = true
let a = false
while try
let txt2 = ""
whenever error continue
---#@@048
select 
pl_parametre.id,
pl_parametre.cpv,
pl_parametre.rezerva_per,
pl_parametre.poc_per_vyvaz,
pl_parametre.poc_per_prehl,
pl_parametre.rezervacia_zapnuta
into 
	pp_26.id,
	pp_26.cpv,
	pp_26.rezerva_per,
	pp_26.poc_per_vyvaz,
	pp_26.poc_per_prehl,
	pp_26.rezervacia_zapnuta
 from 
pl_parametre
 where 


	pl_parametre.cpv               = pp_26.cpv  
---#@@048
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
    let txt2 = " tabulka je uzamknuta."
     call potvrd("tabulka je uzamknuta.Novy pokus?[a/n]:") returning try
end case
end while
let chyba1 = sqlca.sqlcode
let chyba2 = sqlca.sqlerrd[2]
	if chyba1 = 0 then
		let txt1 = "Polozka bola vybrana."
	else
		if chyba1 < 0 then
			let txt1 = "Polozka nebola vybrana pre SQL chybu:",chyba1 using "-<<<<<&" ,"    ",chyba2 using "-<<<<<&" 
		else
			let txt1 = "Polozka nebola najdena."
		end if
	end if
return a
end function

