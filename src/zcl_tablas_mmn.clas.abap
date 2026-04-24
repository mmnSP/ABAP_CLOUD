CLASS zcl_tablas_mmn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas_mmn IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*
*  DATA number TYPE TABLE OF i.
*
*  APPEND 1 TO number.



* " Codigo profesor:
*
*    TYPES: BEGIN OF ty_alumnos,
*             nombre TYPE string,
*             edad   TYPE i,
*             ciudad TYPE string,
*           END OF ty_ALUMNOS.
*
*    " Estructuras
*    DATA ls_alumnos TYPE ty_alumnos.
*
*    " Tablas
*    DATA: lt_alumnos TYPE TABLE OF ty_alumnos,
*          lt_alumnos_aux TYPE TABLE OF ty_alumnos.
*
*    ls_alumnos-nombre = 'Juan'.
*    ls_alumnos-edad = 23.
*    ls_alumnos-ciudad = 'Madrid'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Maria'.
*    ls_alumnos-edad = 25.
*    ls_alumnos-ciudad = 'Barcelona'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Jorge'.
*    ls_alumnos-edad = 27.
*    ls_alumnos-ciudad = 'Valencia'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    LOOP AT lt_alumnos INTO ls_alumnos.
*      IF ls_alumnos-edad > 25.
*        APPEND ls_alumnos TO lt_alumnos_aux.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lt_alumnos_aux ).
*
**    DATA lt_numeros TYPE TABLE OF i. " Declaración de una tabla INTERNA de tipo entero
**
**    APPEND 1 TO lt_numeros.
**    APPEND 2 TO lt_numeros.
**    APPEND 3 TO lt_numeros.
**    APPEND '4' TO lt_numeros.
**    APPEND 5 TO lt_numeros.
**    APPEND 6 TO lt_numeros.
**    APPEND 7 TO lt_numeros.
**    APPEND 8 TO lt_numeros.
**    APPEND 9 TO lt_numeros.
**    APPEND 10 TO lt_numeros.
**
**    out->write( lt_numeros ).



 " otra actividad:

* DATA lt_vuelos TYPE TABLE OF /dmo/flight.
* DATA ls_vuelos TYPE /dmo/flight.
* DATA ls_price TYPE /dmo/flight_price.
* DATA lv_total TYPE i.
* SELECT * FROM /dmo/flight INTO TABLE @lt_vuelos.
**    out->write( lt_vuelos ).
*
**        WHERE carrier_id = 'LC'.
**        INTO TABLE @lt_vuelos.
*    IF sy-subrc = 0.
*    LOOP AT lt_vuelos INTO ls_vuelos.
*        lv_total = lv_total + ls_price.
*    ENDLOOP.
*        out->write( | 'La suma de todos los vuelos es { lv_total } ' | ).
*    ELSE.
*        out->write( 'No existen vuelos' ).
*    ENDIF.


"Como seria segun Joule:
* " calcularme el total del precio de los vuelos, sin tener en cuenta la moneda
*    DATA lv_total_price TYPE i.
*    LOOP AT lt_vuelos INTO DATA(ls_flight).
*      lv_total_price = lv_total_price + ls_flight-price.
*    ENDLOOP.
*
*    out->write( lv_total_price ).
*
*" calcularme el total del precio de los vuelos, teniendo en cuenta la moneda
*    DATA lv_total_price_curr TYPE i.
*    LOOP AT lt_vuelos INTO ls_flight.
*      lv_total_price_curr = lv_total_price_curr + ls_flight-price.
*    ENDLOOP.
*
*    out->write( lv_total_price_curr ).
*
*" calcularme el total del precio de losvuelos, teniendo en cuenta la moneda
*    DATA lv_total_price_curr2 TYPE i.
*    LOOP AT lt_vuelos INTO ls_flight.
*      lv_total_price_curr2 = lv_total_price_curr2 + ls_flight-price.
*    ENDLOOP.
*
*    out->write( lv_total_price_curr2 ).




** Mi tarea 1:
*
*TYPES: BEGIN OF ty_camisetas,
*          talla TYPE string,
*          color TYPE string,
*          precio TYPE i,
*          genero TYPE string,
*          manga TYPE string,
*       END OF ty_camisetas.
*
*
*DATA lt_camisetas TYPE TABLE OF ty_camisetas.
*DATA lt_camisetas_aux TYPE TABLE OF ty_camisetas.
*DATA ls_camisetas TYPE ty_camisetas.
*
*ls_camisetas-talla = 'S'.
*ls_camisetas-color = 'Negro'.
*ls_camisetas-precio = 10.
*ls_camisetas-genero = 'H'.
*ls_camisetas-manga = 'Corta'.
*APPEND ls_camisetas TO lt_camisetas.
*
*ls_camisetas-talla = 'M'.
*ls_camisetas-color = 'Blanco'.
*ls_camisetas-precio = 13.
*ls_camisetas-genero = 'M'.
*ls_camisetas-manga = 'Larga'.
*APPEND ls_camisetas TO lt_camisetas.
*
*ls_camisetas-talla = 'L'.
*ls_camisetas-color = 'Rojo'.
*ls_camisetas-precio = 10.
*ls_camisetas-genero = 'H'.
*ls_camisetas-manga = 'Larga'.
*APPEND ls_camisetas TO lt_camisetas.
*
*ls_camisetas-talla = 'XL'.
*ls_camisetas-color = 'Azul'.
*ls_camisetas-precio = 15.
*ls_camisetas-genero = 'H'.
*ls_camisetas-manga = 'Corta'.
*APPEND ls_camisetas TO lt_camisetas.
*
*
*    LOOP AT lt_camisetas INTO ls_camisetas.
*      IF ls_camisetas-manga = 'Corta'.
*        APPEND ls_camisetas TO lt_camisetas_aux.
*      ENDIF.
**      out->write( lt_camisetas ).
*    ENDLOOP.
*
* out->write( lt_camisetas_aux ).



* Mi tarea 2 y 3:

DATA lt_viaje TYPE TABLE OF /dmo/agency.
DATA ls_viaje TYPE /dmo/agency.
DATA lv_numero TYPE i.
SELECT * FROM /dmo/agency
WHERE city = 'New York'
INTO TABLE @lt_viaje.
*    out->write( lt_viaje ).

IF sy-subrc = 0.
LOOP AT lt_viaje INTO ls_viaje.
 out->write( ls_viaje ).
ENDLOOP.
ELSE.
  out->write( 'No existen agencias ' ).
ENDIF.
out->write( lt_viaje ).

  ENDMETHOD.

ENDCLASS.
