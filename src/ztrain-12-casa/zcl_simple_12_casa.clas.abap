CLASS zcl_simple_12_casa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_simple_12_casa IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


"Crear un programa que:
*Declare una variable `nombre`
*Si el nombre es "Juan", muestre "Hola Juan"
*Si no, muestre "Hola usuario"

  DATA lv_nombre TYPE string.
  lv_nombre = 'Juan'.

  IF lv_nombre = 'Juan'.
    out->write( 'Hola Juan' ).
  ELSE.
    out->write( 'Hola usuario' ).
  ENDIF.

  ENDMETHOD.
ENDCLASS.
