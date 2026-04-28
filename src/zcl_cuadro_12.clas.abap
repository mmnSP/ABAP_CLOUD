CLASS zcl_cuadro_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   METHODS: constructor IMPORTING i_cuadro TYPE string i_year TYPE i,
            get_cuadro EXPORTING o_cuadro TYPE string,
            get_year EXPORTING o_year TYPE i,
            set_cuadro IMPORTING i_cuadro TYPE string,
            set_year IMPORTING i_year TYPE i,
            exposicion EXPORTING o_estado TYPE abap_bool,
            mostrar_ficha EXPORTING o_ficha TYPE string.


  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.

   DATA: cuadro TYPE string,
         year TYPE i.

ENDCLASS.



CLASS zcl_cuadro_12 IMPLEMENTATION.

  METHOD constructor.
         cuadro = i_cuadro.
         year = i_year.
  ENDMETHOD.

  METHOD get_cuadro.
         cuadro = o_cuadro.
  ENDMETHOD.

  METHOD Set_cuadro.
         cuadro = i_cuadro.
  ENDMETHOD.

  METHOD get_YEAR.
         year = o_year.
  ENDMETHOD.

  METHOD set_year.
         year = i_year.
  ENDMETHOD.

  METHOD exposicion.
         IF
         year >= 1800.
         o_estado = abap_true.
         ELSE.
         o_estado = abap_false.
         ENDIF.
  ENDMETHOD.

  METHOD mostrar_ficha.
  DATA lv_estado TYPE string.
          IF
         year >= 1800.
         lv_estado = 'Expuesto'.
         ELSE.
         lv_estado = 'No expuesto'.
         ENDIF.
         o_ficha = |El cuadro { cuadro } del año { year } está { lv_estado }|.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
"pensar en importing/exporting como una suma: 1+2(importing)=3(exporting).
  ENDMETHOD.

ENDCLASS.
