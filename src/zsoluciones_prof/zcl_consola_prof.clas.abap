CLASS zcl_consola_prof DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_prof IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

**    DATA lo_bombilla TYPE REF TO zcl_bombilla_00.
*
*    DATA(lo_bombilla) = NEW zcl_bombilla_00(  ).
*    DATA(lo_bombilla2) = NEW zcl_bombilla_00( 'Cocina' ).
*
*    DATA lv_estado TYPE abap_bool.
*
*    lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
*    out->write( lv_estado ).
*
*    lo_bombilla->encender( ).
*
*    lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
*    out->write( lo_bombilla->estado ).
*
*    lo_bombilla->apagar( ).
*
*    lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
*    out->write( lv_estado ).
*
*    out->write( lo_bombilla->ubicacion ).

*    " Clase cuadro
*
*    DATA(lo_cuadro1) = NEW zcl_cuadro_00(
*        i_titulo = 'La maja desnuda'
*        i_anyo = 1800 ).
*
*    DATA lv_ficha TYPE string.
*    lo_cuadro1->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
*    out->write( lv_ficha ).
*
*    lo_cuadro1->set_anyo( i_anyo = 1801 ).
*    lo_cuadro1->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
*    out->write( lv_ficha ).
*
*    DATA(lv_boolean) = lo_cuadro1->esta_en_exposicion_l( ).
*    lo_cuadro1->esta_en_exposicion_j(
*            IMPORTING
*                    o_estado = DATA(lv_boolean2) ).

** Clase Calculadora
*
*    DATA(lo_calculadora) = NEW zcl_calculadora_00( 'LuisCa' ).
**    lo_calculadora->get_propietario(
**            IMPORTING rv_propietario = DATA(lv_propietario) ).
**    lo_calculadora->get_valor(
**             IMPORTING rv_valor = DATA(lv_valor) ).
*    DATA(lv_propietario) = lo_calculadora->get_propietario( ).
*    DATA(lv_valor) = lo_calculadora->get_valor( ).
*
*    out->write( | Calculadora de { lv_propietario }  /  Pantalla: { lv_valor } | ).
*
*    out->write( '------------' ).
*    DATA(lo_calculadora2) = NEW zcl_calculadora_00( 'Paco' ).
*    lo_calculadora2->suma_e( EXPORTING
*                                i_num1 = 1
*                                i_num2 = 2
*                            IMPORTING
*                                o_res = DATA(lv_resultado) ).
*    out->write( lv_resultado ).
*
*    out->write( '------------' ).
*    lv_resultado = lo_calculadora2->suma_r( EXPORTING
*                                i_num1 = 3
*                                i_num2 = 4 ).
*    out->write( lv_resultado ).
*
*    out->write( '------------' ).
*    out->write( lo_calculadora2->suma_r( EXPORTING
*                                i_num1 = 5
*                                i_num2 = 6 ) ).

** Tabla y Clase Alumnos
*
*    DATA(lo_alumnos) = NEW zcl_tabla_alumnos( ).
*    DATA lv_valido TYPE abap_bool.
*
*    lo_alumnos->insertar_1(
*        EXPORTING
*            i_dni = '12345678C'
*            i_nombre = 'LuisCa'
*            i_fecha_nac = '19870502'
*            i_curso = 'ABAP'
*            i_nota = 10
*        IMPORTING
*            o_valido = lv_valido ).
*
*    " Esta comprobación indica si ha ido bien o mal
*    IF lv_valido = abap_true. " Ha ido bien
*      out->write( 'Inserción correcta' ).
*    ELSE.
*      out->write( 'Inserción incorrecta' ).
*    ENDIF.
*
*    lo_alumnos->insertar_1(
*        EXPORTING
*            i_dni = '12345678F'
*            i_nombre = ' '
*            i_fecha_nac = '19870502'
*            i_curso = 'Mates'
*            i_nota = 10
*        IMPORTING
*            o_valido = lv_valido ).
*
*    " Esta comprobación indica si ha ido bien o mal
*    IF lv_valido = abap_true. " Ha ido bien
*      out->write( 'Inserción correcta' ).
*    ELSE.
*      out->write( 'Inserción incorrecta' ).
*    ENDIF.
*
*    " Declaro la estructura
*    DATA ls_alumnos TYPE zalumnos_00.
*
*    " Le meto los datos
*    ls_alumnos = VALUE #(
*        dni = '12345678G'
*        nombre = 'LuisCa'
*        fecha_nac = '19870502'
*        curso = 'ABAP'
*        nota = 10 ).
*
*    " Llamo al método
*    lo_alumnos->insertar_2(
*        EXPORTING i_alumnos = ls_alumnos
*        IMPORTING o_valido = lv_valido ).
*
*    " Comprobación
*    IF lv_valido = abap_true. " Ha ido bien
*      out->write( 'Inserción correcta' ).
*    ELSE.
*      out->write( 'Inserción incorrecta' ).
*    ENDIF.

** Relacionar tablas
*
*    " Este tipo es la estructura final
*    " La que quiero para el informe
*    TYPES: BEGIN OF ty_vuelos,
*             name          TYPE /dmo/carrier-name, " El nombre de la aerolinea
*             connection_id TYPE /dmo/flight-connection_id,
*             flight_date   TYPE /dmo/flight-flight_date,
*             price         TYPE /dmo/flight-price,
*           END OF ty_vuelos.
*
*    " Declaraciones para el informe
*    DATA ls_vuelos TYPE ty_vuelos.
*    DATA lt_vuelos TYPE TABLE OF ty_vuelos.
*
*    " Recupero TODOS los campos y registros
*    SELECT carrier_id,
*           connection_id,
*           flight_date,
*           price
*        FROM /dmo/flight
*        INTO TABLE @DATA(lt_flight).
*    IF sy-subrc = 0.
**      out->write( lt_flight ).
*    ENDIF.
*
*    " Recupero solo ID y NAME
*    SELECT carrier_id, name
*        FROM /dmo/carrier
*        INTO TABLE @DATA(lt_carrier).
*    IF sy-subrc = 0.
**      out->write( lt_carrier ).
*    ENDIF.
*
*    " Recorro la tabla de los vuelos
*    LOOP AT lt_flight INTO DATA(ls_flight).
*
*      " Por cada vuelo busco el nombre en la tabla de aerolíneas
*      READ TABLE lt_carrier INTO DATA(ls_carrier)
*          WITH KEY carrier_id = ls_flight-carrier_id. " Comparo por ID
*      IF sy-subrc = 0.
*
*        " Asigno valores a la estructura del informe
*        ls_vuelos = VALUE #( name = ls_carrier-name
*                             connection_id = ls_flight-connection_id
*                             flight_date = ls_flight-flight_date
*                             price = ls_flight-price ).
*
*        " Añado la estructura a la tabla del informe
*        APPEND ls_vuelos TO lt_vuelos.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lt_vuelos ).

* Ejercicio de Reservas y Agencias
*
*    TYPES: BEGIN OF ty_reservas,
*             name          TYPE /dmo/agency-name,
*             connection_id TYPE /dmo/booking-connection_id,
*             flight_date   TYPE /dmo/booking-flight_date,
*             flight_price  TYPE /dmo/booking-flight_price,
*           END OF ty_reservas.
*
*    DATA ls_reservas TYPE ty_reservas.
*    DATA lt_reservas TYPE TABLE OF ty_reservas.
*
*    SELECT travel_id,
*           connection_id,
*           flight_date,
*           flight_price
*        FROM /dmo/booking
*        INTO TABLE @DATA(lt_booking) UP TO 10 ROWS.
*    IF sy-subrc = 0.
*
*      " Selección a Viajes
*      SELECT travel_id, agency_id FROM /dmo/travel
*          INTO TABLE @DATA(lt_travel).
*      IF sy-subrc = 0.
*
*        " Selección a Agencias
*        SELECT agency_id, name FROM /dmo/agency
*            INTO TABLE @DATA(lt_agency).
*        IF sy-subrc = 0.
*
*          LOOP AT lt_booking INTO DATA(ls_booking).
*
*            TRY.
*                DATA(ls_travel) = lt_travel[ travel_id = ls_booking-travel_id ].
*
*
*                DATA(ls_agency) = lt_agency[ agency_id = ls_travel-agency_id ].
*
*                ls_reservas = VALUE #( connection_id = ls_booking-connection_id
*                                  flight_date = ls_booking-flight_date
*                                  flight_price = ls_booking-flight_price
*                                  name = ls_agency-name ).
*
*                APPEND ls_reservas TO lt_reservas.
*
*              CATCH cx_sy_itab_line_not_found.
*                " No hace nada — si no encuentra, simplemente no añade
*            ENDTRY.
*
*          ENDLOOP.
*
*          out->write( lt_reservas ).
*
*        ENDIF.
*
*      ENDIF.
*
*    ENDIF.

*    " Versión PRO
*
*    SELECT
*            connection_id,
*            flight_date,
*            flight_price,
*            name
*
*            FROM /dmo/booking AS b
*                 JOIN /dmo/travel AS t
*                    ON b~travel_id = t~travel_id
*                 JOIN /dmo/agency AS a
*                    ON t~agency_id = a~agency_id
*
*            INTO TABLE @DATA(lt_reservas)
*                UP TO 10 ROWS.
*
*    IF sy-subrc = 0.
*      out->write( lt_reservas ).
*    ENDIF.


    " Versión PRO PRO

    SELECT * FROM zcds_reservas_00
        INTO TABLE @DATA(lt_reservas) UP TO 10 ROWS.
    IF sy-subrc = 0.
      out->write( lt_reservas ).
    ENDIF.


  ENDMETHOD.



ENDCLASS.
