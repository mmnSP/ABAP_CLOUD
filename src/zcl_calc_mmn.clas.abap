CLASS zcl_calc_mmn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calc_mmn IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

DATA lv_op type c.
DATA lv_num1 type i VALUE 10.
DATA lv_num2 type i VALUE 2.
DATA lv_resultado type p DECIMALS 2.

CASE lv_op.
  WHEN `+`.
      lv_resultado = lv_num1 + lv_num2.
      out->write( |{ lv_num1 } { lv_op } { lv_num2 } = { lv_resultado }| ).
  WHEN `-`.
      lv_resultado = lv_num1 - lv_num2.
      out->write( |{ lv_num1 } { lv_op } { lv_num2 } = { lv_resultado }|  ).
  WHEN `*`.
      lv_resultado = lv_num1 * lv_num2.
      out->write( |{ lv_num1 } { lv_op } { lv_num2 } = { lv_resultado }|  ).
  WHEN `/`.
      lv_resultado = lv_num1 / lv_num2.
      out->write( |{ lv_num1 } { lv_op } { lv_num2 } = { lv_resultado }|  ).
        TRY.
            out->write( |{ lv_num1 } { lv_op } { lv_num2 } = { lv_resultado }|  ).
        CATCH  cx_sy_zerodivide.
            out->write( 'No se puede dividir entre cero' ).
        ENDTRY.
  ENDCASE.

  ENDMETHOD.

ENDCLASS.
