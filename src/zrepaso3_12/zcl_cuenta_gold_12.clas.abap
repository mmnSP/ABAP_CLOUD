CLASS zcl_cuenta_gold_12 DEFINITION
  PUBLIC
    INHERITING FROM zcl_cuenta_tinder_12
  CREATE PUBLIC .
  PUBLIC SECTION.

    INTERFACES zif_boosteable_12.

    METHODS get_plan REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cuenta_gold_12 IMPLEMENTATION.

  METHOD zif_boosteable_12~activar_boost.
    rv_texto = |Boost activado para { nombre }|.
  ENDMETHOD.

  METHOD get_plan.
            rv_plan = 'GOLD'.
  ENDMETHOD.

ENDCLASS.
