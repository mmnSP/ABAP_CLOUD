CLASS zcl_bombilla_mmn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_bombilla_mmn IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA(lo_bombilla) = NEW zcl_demo_bombilla_mmn( i_ubicacion = 'Salón' i_estado = abap_false ).

  DATA: lv_ubicacion TYPE string,
        lv_estado TYPE abap_bool.

*  lo_bombilla->encender( EXPORTING estado = abap_bool ).

  lo_bombilla->get_ubicacion( IMPORTING o_ubicacion = lv_ubicacion ).
  lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).

  out->write( 'La bombilla está apagada' ).

  ENDMETHOD.
ENDCLASS.
