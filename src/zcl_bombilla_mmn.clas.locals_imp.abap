*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS zcl_demo_bombilla_mmn DEFINITION.

PUBLIC SECTION.
    DATA: ubicacion TYPE string,
          estado TYPE abap_bool.

    METHODS: constructor IMPORTING i_ubicacion TYPE string i_estado TYPE abap_bool,
             get_ubicacion EXPORTING o_ubicacion TYPE string,
             set_ubicacion IMPORTING i_ubicacion TYPE string,
             get_estado EXPORTING o_estado TYPE abap_bool,
             encender EXPORTING estado TYPE abap_bool,
             apagar EXPORTING estado TYPE abap_bool.

PROTECTED SECTION.
PRIVATE SECTION.

ENDCLASS.


CLASS zcl_demo_bombilla_mmn IMPLEMENTATION.

    METHOD get_ubicacion.
           o_ubicacion = ubicacion.
    ENDMETHOD.

    METHOD set_ubicacion.
           ubicacion = i_ubicacion.
    ENDMETHOD.

    METHOD get_estado.
           o_estado = estado.
    ENDMETHOD.

    METHOD constructor.
           ubicacion = i_ubicacion.
           estado = i_estado.
    ENDMETHOD.

    METHOD encender.
           IF
           estado = abap_false.
           estado = abap_true.
           ENDIF.
    ENDMETHOD.

    METHOD apagar.
           IF
           estado = abap_true.
           estado = abap_false.
           ENDIF.
    ENDMETHOD.

ENDCLASS.
