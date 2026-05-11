CLASS lhc_zr_profesional_12 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrProfesional12
        RESULT result,

      subida_salario FOR MODIFY
        IMPORTING keys FOR ACTION ZrProfesional12~subida_salario
        RESULT result, "dice claude que como no tiene que sacar un resultado..se quita

      modificar_profesion FOR MODIFY
        IMPORTING keys   FOR ACTION ZrProfesional12~modificar_profesion
        RESULT    result.

ENDCLASS.

CLASS lhc_zr_profesional_12 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD subida_salario.

    " 1. Leer los registros actuales para obtener el salario
    READ ENTITIES OF zr_profesional_12 IN LOCAL MODE
      ENTITY ZrProfesional12
        FIELDS ( Salario )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_profesionales)
      FAILED failed.

    " 2. Modificar con el salario duplicado
    MODIFY ENTITIES OF zr_profesional_12 IN LOCAL MODE
      ENTITY ZrProfesional12
        UPDATE FIELDS ( Salario )
        WITH VALUE #(
          FOR ls_prof IN lt_profesionales
          (
            %tky    = ls_prof-%tky
            Salario = ls_prof-Salario * 2
          )
        )
      FAILED failed
      REPORTED reported.

*    " 3. Releer para devolver el resultado actualizado a Fiori
*    READ ENTITIES OF zr_profesional_12 IN LOCAL MODE
*      ENTITY ZrProfesional12
*        ALL FIELDS
*        WITH CORRESPONDING #( keys )
*      RESULT DATA(lt_result).

*    result = VALUE #(
*      FOR ls_prof IN lt_profesionales
*      (
*        %tky   = ls_prof-%tky
*        %param = ls_prof
*      )
*    ).

  ENDMETHOD.

    METHOD modificar_profesion.

    MODIFY ENTITIES OF zr_profesional_12 IN LOCAL MODE
      ENTITY ZrProfesional12
        UPDATE FIELDS ( Profesion )
        WITH VALUE #(
          FOR key IN keys
          (
            %tky    = key-%tky
            Profesion = key-%param-Profesion
          )
        )
      FAILED failed
      REPORTED reported.

      READ ENTITIES OF zr_profesional_12 IN LOCAL MODE
      ENTITY ZrProfesional12
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_profesionales).

    result = VALUE #(
      FOR ls_prof IN lt_profesionales
      (
        %tky   = ls_prof-%tky
        %param = ls_prof
      )
    ).

  ENDMETHOD.

ENDCLASS.
