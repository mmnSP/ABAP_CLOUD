CLASS zcl_calculadora_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    METHODS: CONSTRUCTOR IMPORTING i_nombre TYPE string i_numero TYPE i,
             get_nombre EXPORTING o_nombre TYPE string,
             get_numero EXPORTING o_numero TYPE i,
             set_nombre IMPORTING i_nombre TYPE string,
             sumar EXPORTING o_sumar TYPE i,
             restar EXPORTING o_restar TYPE i,
             multiplicar EXPORTING o_multiplicar TYPE i,
             dividir EXPORTING o_dividir TYPE i,
             reset EXPORTING o_reset TYPE i.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

      DATA:  nombre TYPE string,
             numero TYPE i.


ENDCLASS.


CLASS zcl_calculadora_12 IMPLEMENTATION.

METHOD CONSTRUCTOR.
        nombre = i_nombre.
        numero = i_numero.
ENDMETHOD.

    METHOD get_nombre.
        o_nombre = nombre.
    ENDMETHOD.

    METHOD get_numero.
        o_numero = numero.
    ENDMETHOD.

    METHOD set_nombre.
        nombre = i_nombre.
    ENDMETHOD.

    METHOD sumar.
           DATA lv_operador TYPE i.
           o_sumar = numero + lv_operador.
    ENDMETHOD.

    METHOD restar.
           DATA lv_operador TYPE i.
           o_restar = numero - lv_operador.
    ENDMETHOD.

    METHOD multiplicar.
           DATA lv_operador TYPE i.
           o_multiplicar = numero * lv_operador.
    ENDMETHOD.

    METHOD dividir.
           DATA: lv_operador TYPE i,
                 lv_error TYPE string.

                 lv_error = 'ERROR'.

           TRY.
                 o_dividir = numero / lv_operador.
            CATCH cx_sy_zerodivide.
                o_dividir = lv_error.
           ENDTRY.
    ENDMETHOD.

    METHOD reset.
    DATA lv_numero TYPE i.
         lv_numero = 0.

           o_reset = lv_numero. "clear i_numero
    ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

  ENDMETHOD.

ENDCLASS.
