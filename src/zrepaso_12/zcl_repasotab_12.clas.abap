CLASS zcl_repasotab_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_repasotab_12 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  Variable = Identificador + Tipo + Valor (que puede cambiar)

    " Dos formas de declarar variable
    DATA lv_variable TYPE i. " Se declara sin valor
*    DATA lv_variable TYPE i VALUE 5. " Se declara con valor
    lv_variable = 10.

    " Declaración inline. Recibe el tipo y el valor en la asignación
    DATA(lv_variable_inline) = 10.

*    Constante = Identificador + Tipo + Valor (que NO cambia)
    CONSTANTS lc_constante TYPE i VALUE 20.

*    Elemento de dato:
    DATA lv_elemdat TYPE zrepaso.
    lv_elemdat = '12345678901'.
    CONSTANTS lc_constante_2 TYPE zrepaso VALUE '12345678901'.

*    Dominio: Conjunto de valores

**********************************************************************

*    Diferencia entre variable y estructura
*    Variable: Solo tiene un valor
*    Estructura: Tiene uno o varios campos

    TYPES: BEGIN OF ty_estructura,
             nombre   TYPE string,
             apellido TYPE string,
           END OF ty_estructura.

    DATA ls_estructura TYPE ty_estructura.
    ls_estructura-nombre = 'LuisCa'.
    ls_estructura-apellido = 'Pérez'.
*    ls_estructura-edad = 39.

    DATA ls_persona TYPE zestructura.
    ls_persona-nombre = 'Emilia'.
    ls_persona-apellido = 'Corchos'.
**    ls_persona-edad = 120.

*   Diferencia entre estructura y tabla
*    La estructura es un registro
*    La tabla contiene uno o más registros

    DATA ls_persona2 TYPE zestructura.
    ls_persona2-nombre = 'Emilia'.
    ls_persona2-apellido = 'Corchos'.

    DATA lt_personas TYPE TABLE OF zestructura.
    APPEND ls_persona2 TO lt_personas.
    APPEND ls_persona2 TO lt_personas.


    DATA ls_tablar1 TYPE ztabla_r1.
    DATA lt_tablar1 TYPE TABLE OF ztabla_r1.
    ls_tablar1-nombre = 'Emilia'.
    ls_tablar1-apellido = 'Corchos'.
    APPEND ls_tablar1 TO lt_tablar1. " Almaceno en tabla interna

    INSERT ztabla_r1 FROM @ls_tablar1. " Almaceno en BD
    IF sy-subrc = 0.
      out->write( 'OK' ).
    ELSE.
      out->write( 'Fallo' ).
    ENDIF.

**********************************************************************

    " SELECT devuelve una tabla con datos de BD
    SELECT FROM /dmo/carrier
        FIELDS carrier_id, name, currency_code
        INTO TABLE @DATA(lt_carrier).
    IF sy-subrc = 0.
      out->write( lt_carrier ).
    ENDIF.

    " SELECT devuelve una tabla con datos de BD filtrando
    SELECT FROM /dmo/carrier
    FIELDS carrier_id, name, currency_code
    WHERE currency_code = 'EUR'
    INTO TABLE @DATA(lt_carrier1).
    IF sy-subrc = 0.
      out->write( lt_carrier1 ).
    ENDIF.

    " SELECT SINGLE devuelve el primer registro con datos de BD filtrando
    SELECT SINGLE FROM /dmo/carrier
    FIELDS carrier_id, name, currency_code
    WHERE currency_code = 'EUR'
    INTO @DATA(ls_carrier2).
    IF sy-subrc = 0.
      out->write( ls_carrier2 ).
    ENDIF.

    " READ TABLE (clásico) devuelve el primer registro con datos de la tabla interna filtrando
    READ TABLE lt_carrier INTO DATA(ls_carrier)
        WITH KEY carrier_id = 'LH'
                 currency_code = 'EUR'.
    IF sy-subrc = 0.
      out->write( ls_carrier ).
    ELSE.
      out->write( 'No recupera datos' ).
    ENDIF.

    " READ TABLE (moderno) devuelve el primer registro con datos de la tabla interna filtrando
    TRY.
        DATA(ls_carrier3) = lt_carrier[ carrier_id = 'LH' ].
        out->write( ls_carrier3 ).

        DATA(ls_carrier4) = lt_carrier[ carrier_id = 'AA' ].
        out->write( ls_carrier4 ).

      CATCH cx_sy_itab_line_not_found.
        out->write( 'No recupera datos' ).
    ENDTRY.

**********************************************************************

    " Utilizamos LOOP para recorrer una tabla interna
    out->write( 'LOOP' ).
    DATA lv_contador TYPE i.
    SELECT FROM /dmo/carrier
        FIELDS carrier_id, name, currency_code
        INTO TABLE @lt_carrier.
    IF sy-subrc = 0.
      LOOP AT lt_carrier INTO ls_carrier.
        lv_contador = lv_contador + 1.
        out->write( | Contador: { lv_contador } | ).
        out->write( ls_carrier ).
      ENDLOOP.

      DATA lt_carrier_aux LIKE lt_carrier.
      LOOP AT lt_carrier INTO ls_carrier.
        ls_carrier-currency_code = 'LCA'.
        out->write( ls_carrier ).
        APPEND ls_carrier TO  lt_carrier_aux.
      ENDLOOP.

      " ¿Qué moneda saldría?
      out->write( lt_carrier ).

      " Field Symbol: Apunta a la misma direción de memoria
      LOOP AT lt_carrier ASSIGNING FIELD-SYMBOL(<fs_carrier>).
        <fs_carrier>-currency_code = 'LCA'.
      ENDLOOP.

      " ¿Qué moneda saldría?
      out->write( lt_carrier ).


    ENDIF.

    " El LOOP no puede recorrer una BD
*    LOOP AT /dmo/carrier INTO ls_carrier.
*    endLOOP.


**********************************************************************

    " Ya esta definida más arriba
*    TYPES: BEGIN OF ty_estructura,
*             nombre   TYPE string,
*             apellido TYPE string,
*           END OF ty_estructura.

*    DATA ls_estructura TYPE ty_estructura.

    TYPES: BEGIN OF ty_estructura2,
             nombre   TYPE string,
             edad     TYPE i,
             apellido TYPE string,
           END OF ty_estructura2.

    DATA ls_estructura2 TYPE ty_estructura2.

    CLEAR: ls_estructura, ls_estructura2.
    ls_estructura-nombre = 'LuisCa'.
    ls_estructura-apellido = 'Pérez'.

    " Intento pasar los datos de una estrctura a otra
*    ls_estructura2 = ls_estructura.

    " Puedo pasar valores que coincidan en el tipo 1 a 1
    CLEAR ls_estructura2.
    ls_estructura2-nombre = ls_estructura-nombre.
    ls_estructura2-apellido = ls_estructura-apellido.

    " Puedo pasar valores que coincidan en el nombre en lote con CORRESPONDING
    " Clásica
    CLEAR ls_estructura2.
    MOVE-CORRESPONDING ls_estructura TO ls_estructura2.

    " Moderna
    CLEAR ls_estructura2.
    ls_estructura2 = CORRESPONDING #( ls_estructura ).


**********************************************************************

    " Antes se montaba la SELECT directamente en el código
    SELECT FROM /dmo/carrier
    FIELDS carrier_id, name, currency_code
    INTO TABLE @lt_carrier.
    IF sy-subrc = 0.
      out->write( lt_carrier ).
    ENDIF.

    " Ahora se recupera con una CDS
    SELECT FROM zcds_repaso_00
    FIELDS carrier_id, name, calculado
    INTO TABLE @DATA(lt_cds_carrier).
    IF sy-subrc = 0.
      out->write( lt_cds_carrier ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.



