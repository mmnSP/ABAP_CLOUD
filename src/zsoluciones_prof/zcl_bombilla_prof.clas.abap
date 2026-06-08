CLASS zcl_bombilla_prof DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      ubicacion TYPE string,
      estado    TYPE abap_bool.


    METHODS:

      constructor IMPORTING i_ubicacion TYPE string,

      get_ubicacion EXPORTING o_ubicacion TYPE string,
      get_estado EXPORTING o_estado TYPE abap_bool,

      set_ubicacion IMPORTING i_ubicacion TYPE string,

      encender,
      apagar.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_bombilla_prof IMPLEMENTATION.

  METHOD constructor.
    ubicacion = i_ubicacion.
    estado = abap_false.
  ENDMETHOD.

  METHOD get_ubicacion.
    o_Ubicacion = ubicacion.
  ENDMETHOD.

  METHOD get_estado.
    o_estado = Estado.
  ENDMETHOD.

  METHOD set_ubicacion.
    Ubicacion = i_Ubicacion.
  ENDMETHOD.

  METHOD encender.
    Estado = abap_true.
  ENDMETHOD.

  METHOD apagar.
    Estado = abap_false.
  ENDMETHOD.

ENDCLASS.
