CLASS zcl_flight_manager_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES zif_flight_manager_12.

    METHODS constructor IMPORTING it_flights TYPE zif_flight_manager_12=>ty_t_flights OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.
  DATA mt_flights TYPE zif_flight_manager_12=>ty_t_flights.

ENDCLASS.

CLASS zcl_flight_manager_12 IMPLEMENTATION.

METHOD constructor.
    IF it_flights IS NOT INITIAL.
      mt_flights = it_flights.
    ENDIF.
  ENDMETHOD.

METHOD zif_flight_manager_12~add_flight.
    DATA ls_flight TYPE zif_flight_manager_12=>ty_flight.
    DATA lv_message TYPE string.

    " Validar precio positivo
    IF is_flight-precio <= 0.
      lv_message = |Precio inválido: { is_flight-precio }. Debe ser mayor que 0.|.
      RAISE EXCEPTION TYPE zcx_flight_error_12
        EXPORTING iv_message = lv_message.
    ENDIF.

    " Validar vuelo duplicado
    READ TABLE mt_flights INTO ls_flight
      WITH KEY aerolinea = is_flight-aerolinea
               num_vuelo = is_flight-num_vuelo.
    IF sy-subrc = 0.
      lv_message = |Vuelo duplicado: { is_flight-aerolinea } { is_flight-num_vuelo }.|.
      RAISE EXCEPTION TYPE zcx_flight_error_12
        EXPORTING iv_message = lv_message.
    ENDIF.

    APPEND is_flight TO mt_flights.
  ENDMETHOD.

 METHOD zif_flight_manager_12~get_flights_by_airline.

    DATA ls_current TYPE zif_flight_manager_12=>ty_flight.

    LOOP AT mt_flights INTO ls_current
      WHERE aerolinea = iv_aerolinea.
      APPEND ls_current TO rt_flights.
    ENDLOOP.

ENDMETHOD.

METHOD zif_flight_manager_12~get_cheapest_flight.

    DATA ls_cheapest TYPE zif_flight_manager_12=>ty_flight.
    DATA ls_current  TYPE zif_flight_manager_12=>ty_flight.

    ls_cheapest-precio = 99999999.

    LOOP AT mt_flights INTO ls_current.
      IF ls_current-precio < ls_cheapest-precio.
        ls_cheapest = ls_current.
      ENDIF.
    ENDLOOP.

    rs_flight = ls_cheapest.

ENDMETHOD.

METHOD zif_flight_manager_12~get_total_revenue.

    DATA ls_current TYPE zif_flight_manager_12=>ty_flight.

    rv_total = 0.

    LOOP AT mt_flights INTO ls_current.
      rv_total = rv_total + ls_current-precio.
    ENDLOOP.

ENDMETHOD.


ENDCLASS.
