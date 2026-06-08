@AbapCatalog.sqlViewName: 'ZVUEAER312'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Media precios por aerolínea y moneda'

define view ZCDS_VUE_AER3_12
  as select from /dmo/flight as flight
    inner join /dmo/carrier as carrier
      on flight.carrier_id = carrier.carrier_id
{
    carrier.name         as airline_name,

    flight.currency_code,

    avg( flight.price )  as average_price

}
group by
    carrier.name,
    flight.currency_code
