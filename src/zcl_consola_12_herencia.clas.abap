CLASS zcl_consola_12_herencia DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_12_herencia IMPLEMENTATION.


 METHOD if_oo_adt_classrun~main.

*  DATA(lo_empleado) = NEW zcl_empleado_12( me->nombre = 'Juan'
*                                            me->dni = '12345678'
*                                            me->salario_base = 1300).
*
*  DATA(lo_empleado_fijo) = NEW zcl_empleado_fijo_12( i_nombre = 'María'
*                                                     i_dni = '12345678'
*                                                     i_salario_base = 1800).
*
*  DATA(lo_empleado_temporal) = NEW zcl_empleado_temporal_12( i_nombre = 'Luis'
*                                                             i_dni = '12345678'
*                                                             i_salario_base = 1400).
*
*    out->write( lo_empleado->get_ficha( ) ).
*    out->write(  '--------------------------' ).
*    out->write( lo_empleado_fijo->get_ficha( ) ).
*    out->write(  '--------------------------' ).
*    out->write( lo_empleado_temporal->get_ficha( ) ).
*


  ENDMETHOD.
ENDCLASS.
