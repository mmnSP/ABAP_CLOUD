@AbapCatalog.sqlViewName: 'ZVUEAER12'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista CDS vuelos con nombre de aerolínea'

define view ZCDS_VUE_AER_12
  as select from /dmo/flight as flight
    inner join /dmo/carrier as carrier
      on flight.carrier_id = carrier.carrier_id
{
    key flight.carrier_id,
    key flight.connection_id,
    
    
    carrier.name           as airline_name,
    
    flight.flight_date,
    flight.price,
    flight.currency_code,
    

    division(
    flight.price * 80, 100, 2) as descuento
    
   
}



