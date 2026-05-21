CLASS zcl_cp01_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp01_12 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*Declaro la variable tabla interna vuelos como tipo el Database Table que he creado:
  DATA lt_vuelos TYPE TABLE OF zvuelos_12.

*Inserto los datos en el Database Table:
DELETE FROM zvuelos_12.

INSERT zvuelos_12 FROM TABLE @( VALUE #(
   ( carrier_id = 'LH' num_flight = 0400 price = '899.00' seats_free = 15 currency_code = 'EUR' airport_from_id = 'FRA' airport_to_id = 'JFK' )
   ( carrier_id = 'AA' num_flight = 0017 price = '450.50' seats_free = 0 currency_code = 'EUR' airport_from_id = 'JFK' airport_to_id = 'SFO' )
   ( carrier_id = 'IB' num_flight = 3740 price = '120.00' seats_free = 42 currency_code = 'EUR' airport_from_id = 'MAD' airport_to_id = 'BCN' )
   ( carrier_id = 'LH' num_flight = 0455 price = '310.75' seats_free = 8 currency_code = 'EUR' airport_from_id = 'FRA' airport_to_id = 'MAD' )
   ( carrier_id = 'AA' num_flight = 0064 price = '510.00' seats_free = 3 currency_code = 'EUR' airport_from_id = 'SFO' airport_to_id = 'JFK' )
   ( carrier_id = 'IB' num_flight = 3950 price = '275.30' seats_free = 0 currency_code = 'EUR' airport_from_id = 'BCN' airport_to_id = 'LHR' )
   ( carrier_id = 'LH' num_flight = 2030 price = '95.00' seats_free = 60 currency_code = 'EUR' airport_from_id = 'MUC' airport_to_id = 'FRA' )
   ( carrier_id = 'SQ' num_flight = 0026 price = '1250.00' seats_free = 5 currency_code = 'EUR' airport_from_id = 'SIN' airport_to_id = 'FRA' )
) ).

*SELECT para traer los datos desde el Database Table a mi variable tabla:
SELECT * FROM zvuelos_12 INTO TABLE @lt_vuelos.

out->write( EXPORTING data = lt_vuelos name = 'Vuelos' ).

COMMIT WORK.

*Tarea 1.1:
*Declaro una variable estructura del tipo mi Database Table:
DATA ls_vuelo TYPE zvuelos_12.

*Recorro la variable tabla vuelos y meto en mi estructura los datos que coinciden con mi búsqueda:
LOOP AT lt_vuelos INTO ls_vuelo.

  DATA(categoria) = COND string(
      WHEN ls_vuelo-price < 150        THEN 'Económico'
      WHEN ls_vuelo-price <= 500       THEN 'Estándar'
      WHEN ls_vuelo-price <= 1000      THEN 'Premium'
      ELSE 'First Class'
  ).
    IF sy-subrc = 0.
        out->write( |{ ls_vuelo-carrier_id } { ls_vuelo-num_flight } - { categoria }| ).
    ENDIF.
ENDLOOP.

**Tarea 1.2:
**Declaro una variable tabla del tipo mi Database Table:
*DATA lt_filtrados TYPE TABLE OF zvuelos_12.
**Recorro la variable tabla vuelos y meto en mi estructura los datos que coinciden con mi búsqueda:
*LOOP AT lt_vuelos INTO ls_vuelo.
**Busco los vuelos que coinciden con las condiciones:
**tienen asientos disponibles, parten o llegan de FRA y tienen un precio menor o igual a 1000€:
*  IF ls_vuelo-seats_free > 0
*     AND ( ls_vuelo-airport_from_id = 'FRA'
*           OR ls_vuelo-airport_to_id = 'FRA' )
*     AND ls_vuelo-price <= 1000.
**Meto los datos del resultado en mi nueva variable tabla:
*    APPEND ls_vuelo TO lt_filtrados.
*
*  ENDIF.
*
*ENDLOOP.
*    IF sy-subrc = 0.
*        out->write( EXPORTING data = lt_filtrados name = 'Filtrados con LOOP' ).
*    ENDIF.
*
**Tarea 1.3:

**Concatenar aerolínea y el número de vuelo:
*DATA: lv_codigo_vuelo TYPE string.
*
*LOOP AT lt_vuelos INTO ls_vuelo.
*   lv_codigo_vuelo = |{ ls_vuelo-carrier_id } { '-' } { ls_vuelo-num_flight }|.
*        IF sy-subrc = 0.
*            out->write( lv_codigo_vuelo ).
*        ENDIF.
*ENDLOOP.
*
**Convertir el destino en minusculas:
*DATA lv_destino_minus TYPE string.
*
*LOOP AT lt_vuelos INTO ls_vuelo.
*            lv_destino_minus = ls_vuelo-airport_to_id.
*           lv_destino_minus = to_lower( lv_destino_minus ).
*        IF sy-subrc = 0.
*            out->write( lv_destino_minus ).
*        ENDIF.
*ENDLOOP.


*Para que este loop funcione hay que comentar los anteriores y viceversa:
*Calcular longitud del código final generado:
DATA lv_longitud TYPE i.
DATA lv_cadena TYPE string.

LOOP AT lt_vuelos INTO ls_vuelo.

    DATA(lv_destino_minus) = to_lower( ls_vuelo-airport_to_id ).
    DATA(lv_codigo_vuelo)  = |{ ls_vuelo-carrier_id } { '-' } { ls_vuelo-num_flight }|.

            lv_cadena = |{ lv_codigo_vuelo } { '|' } { lv_destino_minus }|.
            lv_longitud = strlen( lv_cadena ).
            lv_cadena   = |{ lv_cadena } { '|' } { lv_longitud }|.
        IF sy-subrc = 0.
            out->write( lv_cadena ).
        ENDIF.
ENDLOOP.

*Tarea 1.4 :

DATA: lv_max_price    TYPE /dmo/flight_price,
      lv_min_price    TYPE /dmo/flight_price,
      lv_sum_price    TYPE decfloat34,
      lv_avg_price    TYPE decfloat34,
      lv_total_plazas TYPE i.

" Inicializo valores
lv_max_price    = 0.
lv_min_price    = 999999.
lv_sum_price    = 0.
lv_total_plazas = 0.

LOOP AT lt_vuelos INTO ls_vuelo.

  " Calcular precio máximo
  IF ls_vuelo-price > lv_max_price.
    lv_max_price = ls_vuelo-price.
  ENDIF.

  " Calcular precio mínimo
  IF ls_vuelo-price < lv_min_price.
    lv_min_price = ls_vuelo-price.
  ENDIF.

  " Acumular precios para la media
  lv_sum_price = lv_sum_price + ls_vuelo-price.

  " Acumular plazas libres
  lv_total_plazas = lv_total_plazas + ls_vuelo-seats_free.

ENDLOOP.

" Calcular precio medio
lv_avg_price = round( val = lv_sum_price / lines( lt_vuelos ) dec = 2 ).

" Mostrar resultados
out->write( |Precio máximo: { lv_max_price }| ).
out->write( |Precio mínimo: { lv_min_price }| ).
out->write( |Precio medio: { lv_avg_price }| ).
out->write( |Total plazas libres: { lv_total_plazas }| ).



  ENDMETHOD.
ENDCLASS.
