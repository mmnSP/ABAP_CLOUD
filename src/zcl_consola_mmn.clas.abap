CLASS zcl_consola_mmn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_consola_mmn IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*APUNTES 28 ABRIL: CLASS-DATA es un atributo estatico que comparten todas las instancias de esa clase.
*Si hay un amodificacion, afecta a todas esas instancias.
*DATA es un atributo que solo existe mientras vive la instancia.
*Si hay una modificación, solo afecta a esa instancia.
*CLASS-METHODS es un metodo estatico que no necesita instanciarse para llamarlo.
*Métodos estaticos no tienen acceso a los atributos de instancia.
*Métodos estaticos pueden llamar a otros métodos estaticos.
*Métodos de instancia pueden llamar a otros métodos de instancia.
*Métodos de instancia pueden llamar a otros

*IMPORTANTE: cada vez que se hace una modificacion de algo, antes de modificar hay que ver donde se esta usando.
*Para ver donde se esta usando un atributo, hay que ir a la definicion de la clase y luego a la definicion del atributo.
*Para ver donde se esta usando un metodo, hay que ir a la definicion de la clase y luego a la definicion del metodo.
*Para ver donde se esta usando un metodo estatico, hay que ir a la definicion de la clase y luego a la defin
*CÓMO: Vamos clic derecho a la clase y clic en get Where used

    DATA(lo_bombilla) = NEW zcl_2bombilla_mmn( i_ubicacion = 'Salón' ).
*    DATA(lo_bombilla2) = NEW zcl_demo_2bombilla_mmn( i_ubicacion = 'Cocina' ).

  DATA: lv_ubicacion TYPE string,
        lv_estado TYPE abap_bool.

*  lo_bombilla->encender( EXPORTING estado = abap_bool ).

  lo_bombilla->get_ubicacion( IMPORTING o_ubicacion = lv_ubicacion ).
  lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).

  out->write( 'La bombilla está apagada' ).
  out->write( lo_bombilla->ubicacion ).


  lo_bombilla->encender(  ).

  lo_bombilla->get_ubicacion( IMPORTING o_ubicacion = lv_ubicacion ).
  lo_bombilla->get_estado( ).

  out->write( 'La bombilla está encendida' ).

  ENDMETHOD.
ENDCLASS.
