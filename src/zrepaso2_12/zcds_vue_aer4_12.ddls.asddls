@AbapCatalog.sqlViewName: 'ZVUEAER412'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Estadísticas vuelos por aerolínea'

define view ZCDS_VUE_AER4_12
  as select from /dmo/flight as flight
    inner join /dmo/carrier as carrier
      on flight.carrier_id = carrier.carrier_id
{
    carrier.name          as airline_name,

    flight.currency_code,

    avg( flight.price )   as average_price,

    sum( flight.price )   as total_price,

    max( flight.price )   as max_price,

    min( flight.price )   as min_price,

    count( * )            as number_of_flights

}
group by
    carrier.name,
    flight.currency_code
