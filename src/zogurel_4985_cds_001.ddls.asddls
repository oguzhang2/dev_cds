@AbapCatalog.sqlViewName: 'ZOGRL_4985_V001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Örnek'
define view ZOGUREL_4985_CDS_001 as select from ekko as ek 
inner join ekpo as ep on ek.ebeln = ep.ebeln 
inner join mara as mr on ep.matnr = mr.matnr
left outer join makt as mk on mr.matnr = mk.matnr
inner join lfa1 as lf on ek.lifnr = lf.lifnr
{
    ep.ebeln,
    ep.ebelp,
    ep.matnr,
    mk.maktx,
    ep.werks,
    ep.lgort,
    ep.meins,
    lf.lifnr,
    lf.name1,
    concat_with_space( lf.stras , lf.mcod3 , 1 ) as satici_adresi
}
