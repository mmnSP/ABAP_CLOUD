CLASS zcl_cp03_12 DEFINITION
  PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.


CLASS zcl_cp03_12 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA lo_manager  TYPE REF TO zcl_flight_manager_12.
    DATA lo_error    TYPE REF TO zcx_flight_error_12.
    DATA lt_aerolinea TYPE zif_flight_manager_12=>ty_t_flights.
    DATA ls_cheapest  TYPE zif_flight_manager_12=>ty_flight.
    DATA lv_total     TYPE p LENGTH 8 DECIMALS 2.

    " Crear instancia
    lo_manager = NEW zcl_flight_manager_12( ).

    " Añadir 5 vuelos
    TRY.
      lo_manager->zif_flight_manager_12~add_flight(
        VALUE #( aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Ana García'
                 fecha = '20260515' precio = '899.00' ) ).

      lo_manager->zif_flight_manager_12~add_flight(
        VALUE #( aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Carlos López'
                 fecha = '20260515' precio = '120.00' ) ).

      lo_manager->zif_flight_manager_12~add_flight(
        VALUE #( aerolinea = 'AA' num_vuelo = '0017' pasajero = 'John Smith'
                 fecha = '20260520' precio = '450.50' ) ).

      lo_manager->zif_flight_manager_12~add_flight(
        VALUE #( aerolinea = 'LH' num_vuelo = '0455' pasajero = 'María Pérez'
                 fecha = '20260520' precio = '310.75' ) ).

      lo_manager->zif_flight_manager_12~add_flight(
        VALUE #( aerolinea = 'SQ' num_vuelo = '0026' pasajero = 'Lisa Tan'
                 fecha = '20260601' precio = '1250.00' ) ).

    CATCH zcx_flight_error_12 INTO lo_error.
      out->write( lo_error->mv_message ).
    ENDTRY.

    " Vuelo con precio negativo
    TRY.
      lo_manager->zif_flight_manager_12~add_flight(
        VALUE #( aerolinea = 'IB' num_vuelo = '9999' pasajero = 'Test'
                 fecha = '20260601' precio = '-50.00' ) ).
    CATCH zcx_flight_error_12 INTO lo_error.
      out->write( |Error precio: { lo_error->mv_message }| ).
    ENDTRY.

    " Vuelo duplicado
    TRY.
      lo_manager->zif_flight_manager_12~add_flight(
        VALUE #( aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Duplicado'
                 fecha = '20260515' precio = '899.00' ) ).
    CATCH zcx_flight_error_12 INTO lo_error.
      out->write( |Error duplicado: { lo_error->mv_message }| ).
    ENDTRY.

    " Vuelos de aerolínea LH
    lt_aerolinea = lo_manager->zif_flight_manager_12~get_flights_by_airline(
                     iv_aerolinea = 'LH' ).
    out->write( EXPORTING data = lt_aerolinea name = 'Vuelos LH' ).

    " Vuelo más barato
    ls_cheapest = lo_manager->zif_flight_manager_12~get_cheapest_flight( ).
    out->write( EXPORTING data = ls_cheapest name = 'Vuelo más barato' ).

    " Facturación total
    lv_total = lo_manager->zif_flight_manager_12~get_total_revenue( ).
    out->write( |Facturación total: { lv_total }| ).

  ENDMETHOD.
ENDCLASS.
