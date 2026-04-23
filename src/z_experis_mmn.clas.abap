CLASS z_experis_mmn DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_experis_mmn IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
"    out->write( 'Marta' ).

"    data lv_num type i.
"         lv_num = 11.

"    if lv_num MOD 2 = 0.
 "    out->write( 'Es par' ).
  "  ELSE.
  "   out->write( 'No es par' ).

  "  ENDIF.

"Data: lv_numsec type i VALUE 15.
     " lv_num type i.
    "  lv_intento type i VALUE 1.

    "  lv_num = lv_intento + 1.

 "WHILE lv_num <= 100.

   " IF lv_num = lv_numsec.
   "     out->write ( `Este es el número´ ).
 "   ELSEIF lv_num< lv_numsec + 1.
 "        out->write ( `Demasiado bajo´ ).
  "  ELSEIF lv_num> lv_numsec.
  "       out->write ( `Demasiado alto´ ).
  "  ENDIF.

 "ENDWHILE.

DATA: lv_num type i Value 0.


DO 10 TIMES.
lv_num = lv_num + 1.
    out->write( |3 x { lv_num } =  { 3 * lv_num }| ).

ENDDO.

  ENDMETHOD.

ENDCLASS.
