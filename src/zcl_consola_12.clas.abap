CLASS zcl_consola_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_12 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(lo_cuadro) = NEW zcl_cuadro_12( i_cuadro = 'La maja desnuda' i_year = 1800 ).
*
  DATA: lv_ficha TYPE string.

*       lo_cuadro->get_cuadro( EXPORTING i_cuadro = lv_cuadro ).
*       lo_cuadro->get_year( EXPORTING i_year = lv_year ).
       lo_cuadro->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).

       out->write( lv_ficha ).





  ENDMETHOD.
ENDCLASS.
