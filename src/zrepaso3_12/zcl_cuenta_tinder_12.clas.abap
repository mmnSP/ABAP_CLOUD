CLASS zcl_cuenta_tinder_12 DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES zif_swipeable_12.

    DATA: nombre TYPE string,
          swipes_realizados  TYPE i.

    METHODS constructor IMPORTING i_nombre TYPE string.

    METHODS get_plan ABSTRACT RETURNING VALUE(rv_plan) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cuenta_tinder_12 IMPLEMENTATION.

  METHOD constructor.
    nombre = i_nombre.

    swipes_realizados = 0.

  ENDMETHOD.

  METHOD zif_swipeable_12~hacer_swipe.

    swipes_realizados = swipes_realizados + 1.

    rv_texto = |{ nombre } hizo swipe { i_direccion }|.

  ENDMETHOD.


ENDCLASS.
