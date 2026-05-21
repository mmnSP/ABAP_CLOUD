CLASS zcl_cp02_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
*    TYPES: BEGIN OF ty_reserva,
*             id_reserva TYPE i,
*             aerolinea  TYPE c LENGTH 2,
*             num_vuelo  TYPE n LENGTH 4,
*             pasajero   TYPE string,
*             fecha      TYPE d,
*             precio     TYPE p LENGTH 8 DECIMALS 2,
*             estado     TYPE c LENGTH 1,
*           END OF ty_reserva.
*
*    TYPES ty_t_reservas TYPE STANDARD TABLE OF ty_reserva WITH KEY id_reserva.

ENDCLASS.


CLASS zcl_cp02_12 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*Declaro la variable tabla interna reservas como tipo el Database Table que he creado:
  DATA lt_reservas TYPE TABLE OF zreservas_12.
*Inserto los datos en el Database Table:
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

    SELECT * FROM zreservas_12 INTO TABLE @lt_reservas.

        out->write( EXPORTING data = lt_reservas name = 'Reservas' ).

COMMIT WORK.

*Tarea 2.1 (que es igual a lo que hicimos antes):

*Meto en mi tabla los datos siguientes:
  INSERT zreservas_12 FROM TABLE @( VALUE #(
  ( id_reserva = 9  aerolinea = 'IB' num_vuelo = '3950' pasajero = 'Elena Martín'   fecha = '20260601' precio = '275.30'  estado = 'A' )
  ( id_reserva = 10  aerolinea = 'LH' num_vuelo = '2030' pasajero = 'Franz Weber' fecha = '20260610' precio = '95.00'  estado = 'A' )
  ) ).
*Los meto a mi tabla interna para visualizarlos:
SELECT * FROM zreservas_12 INTO TABLE @lt_reservas.
    IF sy-subrc = 0.
        out->write( EXPORTING data = lt_reservas name = 'Reservas tras altas' ).
    ENDIF.

*Tarea 2.2:





*
*    DATA lt_reservas    TYPE ty_t_reservas.
*    DATA ls_reserva     TYPE ty_reserva.
*    DATA lr_reserva     TYPE REF TO ty_reserva.
*    DATA lv_canceladas  TYPE i.
*    DATA lv_num_reservas TYPE i.
*    DATA lv_total       TYPE p LENGTH 8 DECIMALS 2.
*    DATA lv_media       TYPE p LENGTH 8 DECIMALS 2.
*    DATA lv_pasajero    TYPE string.
*


*    " ═══ TAREA 2.2 – MODIFICACIONES ═══
*    out->write( '--- TAREA 2.2 – MODIFICACIONES ---' ).
*
*    " Cambiar precio ID 3 a 480.00
*    READ TABLE lt_reservas INTO ls_reserva WITH KEY id_reserva = 3.
*    IF sy-subrc = 0.
*      ls_reserva-precio = '480.00'.
*      MODIFY lt_reservas FROM ls_reserva TRANSPORTING precio
*        WHERE id_reserva = 3.
*      out->write( 'ID 3 precio actualizado a 480.00' ).
*    ENDIF.
*
*    " Descuento 10% a todas las reservas LH
*    LOOP AT lt_reservas INTO ls_reserva WHERE aerolinea = 'LH'.
*      ls_reserva-precio = ls_reserva-precio * '0.9'.
*      MODIFY lt_reservas FROM ls_reserva TRANSPORTING precio
*        WHERE id_reserva = ls_reserva-id_reserva.
*      out->write( ls_reserva ).
*    ENDLOOP.
*
*
*    " ═══ TAREA 2.3 – CANCELACIONES Y BORRADOS ═══
*    out->write( '--- TAREA 2.3 – CANCELACIONES Y BORRADOS ---' ).
*
*    " Cancelar ID 4
*    READ TABLE lt_reservas INTO ls_reserva WITH KEY id_reserva = 4.
*    IF sy-subrc = 0.
*      ls_reserva-estado = 'C'.
*      MODIFY lt_reservas FROM ls_reserva TRANSPORTING estado
*        WHERE id_reserva = 4.
*      out->write( 'Reserva ID 4 cancelada' ).
*    ENDIF.
*
*    " Contar canceladas antes de borrar
*    lv_canceladas = 0.
*    LOOP AT lt_reservas INTO ls_reserva WHERE estado = 'C'.
*      lv_canceladas = lv_canceladas + 1.
*    ENDLOOP.
*
*    DELETE lt_reservas WHERE estado = 'C'.
*
*    out->write( lv_canceladas ).
*    out->write( EXPORTING data = lt_reservas name = 'Reservas tras borrado' ).
*
*
*    " ═══ TAREA 2.4 – BÚSQUEDAS ═══
*    out->write( '--- TAREA 2.4 – BÚSQUEDAS ---' ).
*
*    " TRANSPORTING NO FIELDS
*    READ TABLE lt_reservas TRANSPORTING NO FIELDS
*      WITH KEY pasajero = 'Lisa Tan'.
*    IF sy-subrc = 0.
*      out->write( 'Lisa Tan encontrada' ).
*    ELSE.
*      out->write( 'Lisa Tan NO encontrada' ).
*    ENDIF.
*
*    " REFERENCE INTO a ID 6
*    READ TABLE lt_reservas REFERENCE INTO lr_reserva
*      WITH KEY id_reserva = 6.
*    IF sy-subrc = 0.
*      out->write( lr_reserva->* ).
*    ENDIF.
*
*    " Acceso directo al pasajero de ID 1
*    READ TABLE lt_reservas INTO ls_reserva WITH KEY id_reserva = 1.
*    IF sy-subrc = 0.
*      lv_pasajero = ls_reserva-pasajero.
*      out->write( lv_pasajero ).
*    ENDIF.
*
*
*    " ═══ TAREA 2.5 – AGRUPACIÓN Y AGREGADOS ═══
*    out->write( '--- TAREA 2.5 – AGRUPACIÓN POR AEROLÍNEA ---' ).
*
*    LOOP AT lt_reservas INTO ls_reserva
*      GROUP BY ls_reserva-aerolinea
*      ASCENDING
*      ASSIGNING FIELD-SYMBOL(<grupo>).
*
*      lv_num_reservas = 0.
*      lv_total        = 0.
*      lv_media        = 0.
*
*      LOOP AT GROUP <grupo> INTO ls_reserva.
*        lv_num_reservas = lv_num_reservas + 1.
*        lv_total        = lv_total + ls_reserva-precio.
*      ENDLOOP.
*
*      IF lv_num_reservas > 0.
*        lv_media = lv_total / lv_num_reservas.
*      ENDIF.
*
*      out->write( <grupo> ).
*      out->write( lv_num_reservas ).
*      out->write( lv_total ).
*      out->write( lv_media ).
*
*    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
