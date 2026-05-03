CLASS zcl_consola_12_casa DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_12_casa IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*"Declarar variables:

* DATA lv_mensaje TYPE string.
*lv_mensaje = 'Hola ABAP'.
*
*out->write( lv_mensaje ).


"----------------------------------------------------------------
*"Estructuras de control
*
*    "condicional IF:
*
*DATA edad TYPE i.
*
*     edad = 20.
*
*    IF edad >= 18.
*         out->write( 'Eres mayor de edad' ).
*    ELSE.
*         out->write( 'Eres menor de edad' ).
*    ENDIF.

"-----------------------------------------------------------------------
*"Ciclos

*DATA lv_tabla TYPE i.
*DATA lv_tabla_final TYPE i.
*
*lv_tabla = 1.
*lv_tabla_final = 10.
*
*WHILE lv_tabla <= lv_tabla_final.
*
*  out->write( |{ lv_tabla } x 5 = { lv_tabla * 5 }| ).
*
*  lv_tabla = lv_tabla + 1.
*
*ENDWHILE.

"-----------------------------------------------------------------------
*"Funciones de ayuda

*"condicional SWITCH:

*DATA lv_dia_semana TYPE i.
*lv_dia_semana = 5.
*
*SWITCH lv_dia_semana.
*  WHEN 1.
*    out->write( 'Lunes' ).
*  WHEN 2.
*    out->write( 'Martes' ).
*  WHEN 3.
*    out->write( 'Miércoles' ).
*  WHEN 4.
*    out->write( 'Jueves' ).
*  WHEN 5.
*    out->write( 'Viernes' ).
*  WHEN 6.
*    out->write( 'Sábado' ).
*  WHEN 7.
*    out->write( 'Domingo' ).
*  WHEN OTHERS.
*    out->write( 'Día no válido' ).
*ENDSWITCH.



"-----------------------------------------------------------------------
*"condicional CASE:

*DATA lv_dia_semana TYPE i.
*lv_dia_semana = 5.
*
*CASE lv_dia_semana.
*  WHEN 1.
*    out->write( 'Lunes' ).
*  WHEN 2.
*    out->write( 'Martes' ).
*  WHEN 3.
*    out->write( 'Miércoles' ).
*  WHEN 4.
*    out->write( 'Jueves' ).
*  WHEN 5.
*    out->write( 'Viernes' ).
*  WHEN 6.
*    out->write( 'Sábado' ).
*  WHEN 7.
*    out->write( 'Domingo' ).
*  WHEN OTHERS.
*    out->write( 'Día no válido' ).
*ENDCASE.

"-------------------------------------------------------------------------
*DO 5 TIMES.
*  out->write( 'Iteración' ).
*ENDDO.
















  ENDMETHOD.
ENDCLASS.
