CLASS zcl_2bombilla_mmn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: ubicacion TYPE string,
          estado TYPE abap_bool.

    METHODS: constructor IMPORTING i_ubicacion TYPE string, "i_estado TYPE abap_bool,
             get_ubicacion EXPORTING o_ubicacion TYPE string,
             set_ubicacion IMPORTING i_ubicacion TYPE string,
             get_estado EXPORTING o_estado TYPE abap_bool,
             encender EXPORTING estado TYPE abap_bool,
             apagar EXPORTING estado TYPE abap_bool.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_2bombilla_mmn IMPLEMENTATION.

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
           estado = abap_false.
    ENDMETHOD.

    METHOD encender.
           IF
           estado = abap_true.
           ENDIF.
    ENDMETHOD.

    METHOD apagar.
           IF
           estado = abap_false.
           ENDIF.
    ENDMETHOD.

ENDCLASS.
