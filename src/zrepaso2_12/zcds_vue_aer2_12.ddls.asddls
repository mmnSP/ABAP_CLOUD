@AbapCatalog.sqlViewName: 'ZVUEAER212'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Media precios por moneda'

define view ZCDS_VUE_AER2_12
  as select from /dmo/flight
{
    currency_code,

    avg( price ) as average_price

}
group by currency_code
