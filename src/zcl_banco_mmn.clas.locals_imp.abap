*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS zcl_demo_banco_mmn DEFINITION.

PUBLIC SECTION.

    DATA nombre TYPE string.
    DATA saldo TYPE i.

    METHODS:
    constructor IMPORTING i_nombre TYPE string i_saldo TYPE i,
    get_nombre EXPORTING o_nombre TYPE string,
    get_saldo EXPORTING o_saldo TYPE i,
    set_nombre IMPORTING i_nombre TYPE string,
*     set_saldo IMPORTING i_saldo TYPE i. No tiene set el saldo porque no se puede modificar el numero.
    ingresar IMPORTING i_cantidad TYPE i,
    retirar IMPORTING i_cantidad TYPE i.

PROTECTED SECTION.
PRIVATE SECTION.

ENDCLASS.


CLASS zcl_demo_banco_mmn IMPLEMENTATION.

    METHOD get_nombre.
           o_nombre = nombre.
    ENDMETHOD.

    METHOD set_nombre.
           nombre = i_nombre.
    ENDMETHOD.

    METHOD get_saldo.
           o_saldo = saldo.
    ENDMETHOD.

    METHOD ingresar.
           saldo = saldo + i_cantidad.
    ENDMETHOD.

    METHOD retirar.
        IF saldo >= i_cantidad.
           saldo = saldo - i_cantidad.
        ENDIF.
    ENDMETHOD.

    METHOD constructor.
           nombre = i_nombre.
           saldo = i_saldo.
    ENDMETHOD.

ENDCLASS.
