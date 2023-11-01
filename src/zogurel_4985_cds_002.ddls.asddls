@AbapCatalog.sqlViewName: 'ZOGRL_4985_V002'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ödev 2'
define view ZOGUREL_4985_CDS_002 as select from vbrp as vb
    inner join vbrk as vk on vb.vbeln = vk.vbeln
    inner join mara as mr on vb.matnr = mr.matnr
    left outer join vbak as va on vb.aubel = va.vbeln
    left outer join kna1 as ka on va.kunnr = ka.kunnr
    left outer join makt as mt on mr.matnr = mt.matnr
                              and mt.spras = $session.system_language {
 vb.vbeln,
 vb.posnr,
 vb.aubel,
 vb.aupos,
 va.kunnr,
 concat_with_space(ka.name1, ka.name2, 1) as name,
 left(va.kunnr,3) as left_kunnr,
 length(mr.matnr) as matnr_lenght,
 case vk.fkart when 'FAS' then 'Peşinat talebi iptali'
               when 'FAZ' then 'Peşinat talebi'
               else 'Fatura' end as fatura_tur,
 vk.fkdat,
 currency_conversion( amount => vb.netwr,
                      exchange_rate_date => vk.fkdat,
                      source_currency    => vk.waerk,
                      target_currency    =>  cast ('EUR' as abap.cuky ) )  as conversion_netwr,
vk.inco2_l
               
  
}
