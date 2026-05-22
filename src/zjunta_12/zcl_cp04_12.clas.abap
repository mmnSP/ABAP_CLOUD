CLASS zcl_cp04_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp04_12 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

* Tarea 4.1:

*Los campos que usan tipos genéricos, y que por tanto pueden usar Data Elements son:
*  key id_reserva
*  key aerolinea
*  num_vuelo
*  pasajero
*  precio
*  estado -> el que más se beneficia, podría tener valores fijos (A=Activa, C=Cancelada)
*Los campos que no los usan son client y fecha, por lo que no necesitan Data Elements.

* En zcl_cp02_12 usé directamente 'TYPE TABLE OF zreservas_12' en lugar de definir
* un tipo local ty_reserva. Eso hace la refactorización algo más simple:
* hay que cambiar las referencias a la Database Table por los nuevos tipos del diccionario:

*   Antes: DATA lt_reservas TYPE TABLE OF zreservas_12.
*   Ahora: usamos el tipo tabla global del diccionario
    DATA lt_reservas TYPE ztt_bookings_12.

*   Antes: DATA ls_reservas TYPE zreservas_12.
*   Ahora: usamos la estructura global del diccionario
    DATA ls_reservas TYPE zst_booking_12.

*   Antes: DATA lr_reservas TYPE REF TO zreservas_12.
*   Ahora: referencia a la estructura global
    DATA lr_reservas TYPE REF TO zst_booking_12.

*   Antes: DATA lr_reservas TYPE zreservas_12.
*   Ahora: referencia a la estructura global
    DATA ls_reserva_id1  TYPE zst_booking_12.



  DELETE FROM zreservas_12.

  INSERT zreservas_12 FROM TABLE @( VALUE #(
  ( id_reserva = 1  aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Ana García'   fecha = '20260515' precio = '899.00'  estado = 'A' )
  ( id_reserva = 2  aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Carlos López' fecha = '20260515' precio = '120.00'  estado = 'A' )
  ( id_reserva = 3  aerolinea = 'AA' num_vuelo = '0017' pasajero = 'John Smith'   fecha = '20260520' precio = '450.50'  estado = 'A' )
  ( id_reserva = 4  aerolinea = 'LH' num_vuelo = '0455' pasajero = 'María Pérez'  fecha = '20260520' precio = '310.75'  estado = 'A' )
  ( id_reserva = 5  aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Pedro Ruiz'   fecha = '20260515' precio = '120.00'  estado = 'C' )
  ( id_reserva = 6  aerolinea = 'SQ' num_vuelo = '0026' pasajero = 'Lisa Tan'     fecha = '20260601' precio = '1250.00' estado = 'A' )
  ( id_reserva = 7  aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Hans Müller'  fecha = '20260515' precio = '899.00'  estado = 'A' )
  ( id_reserva = 8  aerolinea = 'AA' num_vuelo = '0064' pasajero = 'Sarah Jones'  fecha = '20260525' precio = '510.00'  estado = 'A' )
) ).

    IF sy-subrc = 0.
        out->write( 'Datos insertados correctamente' ).
    ELSE.
        out->write( 'Error al insertar' ).
    ENDIF.

*Como zreservas_12 tiene el campo client y zst_booking_12 no, cambio a un select por campos y así me salto el problema de client:
SELECT id_reserva,
       aerolinea,
       num_vuelo,
       pasajero,
       fecha,
       precio,
       estado
  FROM zreservas_12
  INTO TABLE @lt_reservas.

        out->write( EXPORTING data = lt_reservas name = 'Reservas' ).

COMMIT WORK.

 out->write( '---------------------------------------------------------------------' ).


  INSERT zreservas_12 FROM TABLE @( VALUE #(
  ( id_reserva = 9  aerolinea = 'IB' num_vuelo = '3950' pasajero = 'Elena Martín'   fecha = '20260601' precio = '275.30'  estado = 'A' )
  ( id_reserva = 10  aerolinea = 'LH' num_vuelo = '2030' pasajero = 'Franz Weber' fecha = '20260610' precio = '95.00'  estado = 'A' )
  ) ).
  IF sy-subrc = 0.
        out->write( 'Datos insertados correctamente' ).
    ELSE.
        out->write( 'Error al insertar' ).
    ENDIF.

*Como zreservas_12 tiene el campo client y zst_booking_12 no, cambio a un select por campos y así me salto el problema de client:
SELECT id_reserva,
       aerolinea,
       num_vuelo,
       pasajero,
       fecha,
       precio,
       estado
  FROM zreservas_12
  INTO TABLE @lt_reservas.

    IF sy-subrc = 0.
        out->write( EXPORTING data = lt_reservas name = 'Reservas tras altas' ).
    ENDIF.

 out->write( '---------------------------------------------------------------------' ).



READ TABLE lt_reservas INTO ls_reservas WITH KEY id_reserva = 3.
    IF sy-subrc = 0.
        ls_reservas-precio = '480.00'.
        MODIFY lt_reservas FROM ls_reservas TRANSPORTING precio
          WHERE id_reserva = 3.
             IF sy-subrc = 0.
                    out->write( ls_reservas ).
             ENDIF.
    ENDIF.

 out->write( '---------------------------------------------------------------------' ).


LOOP AT lt_reservas INTO ls_reservas WHERE aerolinea = 'LH'.
            ls_reservas-precio = ls_reservas-precio * '0.9'.
        MODIFY lt_reservas FROM ls_reservas TRANSPORTING precio
        WHERE id_reserva = ls_reservas-id_reserva.
         IF sy-subrc = 0.
            out->write( ls_reservas ).
        ENDIF.

ENDLOOP.

 out->write( '---------------------------------------------------------------------' ).


READ TABLE lt_reservas INTO ls_reservas WITH KEY id_reserva = 4.
    IF sy-subrc = 0.
        ls_reservas-estado = 'C'.
        MODIFY lt_reservas FROM ls_reservas TRANSPORTING estado
          WHERE id_reserva = 4.
             IF sy-subrc = 0.
                    out->write( ls_reservas ).
             ENDIF.
    ENDIF.

 out->write( '---------------------------------------------------------------------' ).


DATA lv_canceladas TYPE i.
     lv_canceladas = 0.

LOOP AT lt_reservas INTO ls_reservas WHERE estado = 'C'.

        lv_canceladas = lv_canceladas + 1.
ENDLOOP.

        DELETE lt_reservas WHERE estado = 'C'.

            out->write( |Registros eliminados: { lv_canceladas }| ).
            out->write( EXPORTING data = lt_reservas name = 'Reservas tras borrado' ).

 out->write( '---------------------------------------------------------------------' ).


READ TABLE lt_reservas TRANSPORTING NO FIELDS
  WITH KEY pasajero = 'Lisa Tan'.
IF sy-subrc = 0.
  out->write( 'Sí' ).
ELSE.
  out->write( 'No' ).
ENDIF.

 out->write( '---------------------------------------------------------------------' ).



READ TABLE lt_reservas REFERENCE INTO lr_reservas
  WITH KEY id_reserva = 6.
IF sy-subrc = 0.
  out->write( lr_reservas->* ).
ENDIF.

 out->write( '---------------------------------------------------------------------' ).


DATA lv_pasajero TYPE string.

* --------------Aquí cambia el acceso directo de 'VALUE zreservas_12' a:
ls_reserva_id1 = VALUE zst_booking_12( lt_reservas[ id_reserva = 1 ] OPTIONAL ).
lv_pasajero    = ls_reserva_id1-pasajero.

out->write( lv_pasajero ).

 out->write( '---------------------------------------------------------------------' ).


    DATA lv_num_reservas TYPE i.
    DATA lv_total       TYPE p DECIMALS 2.
    DATA lv_media       TYPE p DECIMALS 2.

LOOP AT lt_reservas INTO ls_reservas
  GROUP BY ls_reservas-aerolinea
  ASCENDING
  ASSIGNING FIELD-SYMBOL(<grupo>).

      lv_num_reservas = 0.
      lv_total        = 0.
      lv_media        = 0.

      LOOP AT GROUP <grupo> INTO ls_reservas.
        lv_num_reservas = lv_num_reservas + 1.
        lv_total = lv_total + ls_reservas-precio.
  ENDLOOP.

  IF lv_num_reservas > 0.
    lv_media = lv_total / lv_num_reservas.
  ENDIF.

  out->write( |Aerolínea: { <grupo> }| ).
  out->write( |Reservas:  { lv_num_reservas }| ).
  out->write( |Total:     { lv_total }| ).
  out->write( |Media:     { lv_media }| ).
  out->write( '─────────────────────' ).

ENDLOOP.

  ENDMETHOD.
ENDCLASS.
