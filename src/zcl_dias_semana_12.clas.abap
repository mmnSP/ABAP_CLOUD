CLASS zcl_dias_semana_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dias_semana_12 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

 "que salga booleano y el nombre del día:

      DATA lv_hoy TYPE d.
    lv_hoy = '20260330'.
    SELECT single FROM /dmo/carrier
            FIELDS
                is_valid( @lv_hoy ) AS valido
            INTO @DATA(ls_carrier).
    IF sy-subrc = 0.
      out->write( ls_carrier ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
