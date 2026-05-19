CLASS zcl_flight_12 DEFINITION
  PUBLIC
*  FINAL (o no podrá tener hijas)
  CREATE PUBLIC .
  PUBLIC SECTION.

 DATA: carrier_id    TYPE /dmo/carrier_id    READ-ONLY,
       connection_id TYPE /dmo/connection_id READ-ONLY,
       airport_from  TYPE /dmo/airport_from_id READ-ONLY,
       airport_to    TYPE /dmo/airport_to_id   READ-ONLY.

  METHODS: constructor IMPORTING iv_carrier_id    TYPE /dmo/carrier_id
                                 iv_connection_id TYPE /dmo/connection_id
                                 iv_plane_type    TYPE /dmo/plane_type_id.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.

  DATA: plane_type TYPE /dmo/plane_type_id.


  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_flight_12 IMPLEMENTATION.

 METHOD constructor.

    carrier_id    = iv_carrier_id.
    connection_id = iv_connection_id.
    plane_type    = iv_plane_type.

*DATA lt_vuelos TYPE TABLE OF .
*    SELECT
*    FIELDS carrier_id, connection_id
*    FROM /dmo/flight
*    INTO TABLE @DATA(lt_vuelos).


ENDMETHOD.

ENDCLASS.
