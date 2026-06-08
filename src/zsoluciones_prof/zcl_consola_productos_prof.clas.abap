CLASS zcl_consola_productos_prof DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_productos_prof IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_productos TYPE TABLE OF zproductos_21.
    DATA(lo_productos) = NEW zcl_productos_00( ).

    lo_productos->listar_todos( IMPORTING
        o_tab_productos = lt_productos ).

    out->write( lt_productos ).

  ENDMETHOD.
ENDCLASS.
