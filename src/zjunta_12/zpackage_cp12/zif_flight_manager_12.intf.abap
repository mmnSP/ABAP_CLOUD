INTERFACE zif_flight_manager_12
  PUBLIC.

  TYPES: BEGIN OF ty_flight,
           aerolinea TYPE c LENGTH 2,
           num_vuelo TYPE n LENGTH 4,
           pasajero  TYPE c LENGTH 50,
           fecha     TYPE d,
           precio    TYPE p LENGTH 8 DECIMALS 2,
         END OF ty_flight.

  TYPES ty_t_flights TYPE STANDARD TABLE OF ty_flight
                     WITH KEY aerolinea num_vuelo.

  METHODS add_flight
    IMPORTING
      is_flight TYPE ty_flight
    RAISING
      zcx_flight_error_12.

  METHODS get_flights_by_airline
    IMPORTING
      iv_aerolinea TYPE c
    RETURNING
      VALUE(rt_flights) TYPE ty_t_flights.

  METHODS get_cheapest_flight
    RETURNING
      VALUE(rs_flight) TYPE ty_flight.

  METHODS get_total_revenue
    RETURNING
      VALUE(rv_total) TYPE decfloat34.

ENDINTERFACE.
