CLASS zcl_banco_mmn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_banco_mmn IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* APUNTES POO 27 abril, mirar clase profesor ZCL_PERSONA (ojo diferenciar entre la clase y la clase demo):
*lo que haces con un returning lo puedes hacer con un exporting, pero no al reves
* la clase ppal es la que tiene la interfaz, es el main, el programa. En local types puedes definir clases.

*get_nobre = el atributo se asigna a lo que va a salir
*set_nombre = lo que vas a entrado se asigna al atributo

  DATA(lo_cuenta) = NEW zcl_demo_banco_mmn( i_nombre = 'Carlos' i_saldo = 1000 ).

  DATA lv_nombre TYPE string.
  DATA lv_saldo TYPE i.

*  lo_cuenta->get_nombre( IMPORTING o_nombre = lv_nombre ).
*  lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).
*
*  out->write( | 'La cuenta de { lv_nombre } tiene { lv_saldo }€ '| ).

*  lo_cuenta->ingresar( EXPORTING i_cantidad = 100 ).
*  out->write( | 'La cuenta de { lv_nombre } tiene { lv_saldo }€ '| ).
*
*  lo_cuenta->get_nombre( IMPORTING o_nombre = lv_nombre ).
*    lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).
*    out->write( | La cuenta de { lv_nombre } tiene { lv_saldo }€ | ).

*  lo_cuenta->retirar( EXPORTING i_cantidad = 500 ).
*  out->write( | 'La cuenta de { lv_nombre } tiene { lv_saldo }€ '| ).
*
*  lo_cuenta->get_nombre( IMPORTING o_nombre = lv_nombre ).
*    lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).
*    out->write( | La cuenta de { lv_nombre } tiene { lv_saldo }€ | ).

  lo_cuenta->retirar( EXPORTING i_cantidad = 2000 ).
  out->write( | 'La cuenta de { lv_nombre } tiene { lv_saldo }€ '| ).

  lo_cuenta->get_nombre( IMPORTING o_nombre = lv_nombre ).
    lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( | La cuenta de { lv_nombre } tiene { lv_saldo }€ | ).

* mirar en la clase del profesor como hacer cuando da error de no hay mas dinero

  ENDMETHOD.
ENDCLASS.







