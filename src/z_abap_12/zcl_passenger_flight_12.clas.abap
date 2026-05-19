CLASS zcl_passenger_flight_12 DEFINITION
  PUBLIC
  FINAL
  INHERITING FROM zcl_flight_12
  CREATE PUBLIC .

  PUBLIC SECTION.


  METHODS: constructor IMPORTING iv_carrier_id    TYPE /dmo/carrier_id
                                 iv_connection_id TYPE /dmo/connection_id
                                 iv_plane_type    TYPE /dmo/plane_type_id,
                                 asiento_max RETURNING VALUE(rv_seats_max) TYPE /dmo/plane_seats_max.
*    INTERFACES if_oo_adt_classrun . (ya esta en la clase global)
  PROTECTED SECTION.
  PRIVATE SECTION.

  DATA seats_max TYPE /dmo/plane_seats_max.

ENDCLASS.



CLASS zcl_passenger_flight_12 IMPLEMENTATION.

 METHOD constructor.

    super->constructor( iv_carrier_id    = iv_carrier_id
                        iv_connection_id = iv_connection_id
                        iv_plane_type    = iv_plane_type ).

  ENDMETHOD.

 METHOD asiento_max.

*    rv_seats_max = seats_max

  ENDMETHOD.
ENDCLASS.
