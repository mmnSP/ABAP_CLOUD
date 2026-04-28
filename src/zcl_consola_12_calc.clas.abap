CLASS zcl_consola_12_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_12_calc IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
DATA(lo_calculadora) = NEW zcl_calculadora_12( i_nombre = 'Marta' i_numero = 0 ).

DATA: operador TYPE i.
 "       lv_operador = 10.
"lo_calculadora->sumar( IMPORTING o_sumar = lv_operador  ).
""lo_calculadora->get_nombre( IMPORTING i_nombre ).
"out->write( |'Propietario: { lo_calculadora->get_nombre() } / Resultado: { lo_calculadora->sumar(  ) }'| ).




  ENDMETHOD.

ENDCLASS.
