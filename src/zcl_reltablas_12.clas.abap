CLASS zcl_reltablas_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_reltablas_12 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  TYPES: BEGIN OF ty_reservas,
             name          TYPE /dmo/agency-name,
             connection_id TYPE /dmo/booking-connection_id,
             flight_date   TYPE /dmo/booking-flight_date,
             flight_price  TYPE /dmo/booking-flight_price,
           END OF ty_reservas.

 DATA ls_reservas TYPE ty_reservas.
 DATA lt_reservas TYPE TABLE OF ty_reservas.

 SELECT  travel_id,
         connection_id,
         flight_date,
         flight_price
             FROM /dmo/booking
             INTO TABLE @DATA(lt_booking).
        IF sy-subrc = 0.
        "Selección de viajes
    SELECT travel_id,
           agency_id
             FROM /dmo/travel
             INTO TABLE @DATA(lt_travel).
        ENDIF.

        IF sy-subrc = 0.
 "Selección de agencias
 SELECT name,
        agency_id
            FROM /dmo/agency
            INTO TABLE @DATA(lt_agency).
        ENDIF.


  ENDMETHOD.
ENDCLASS.
