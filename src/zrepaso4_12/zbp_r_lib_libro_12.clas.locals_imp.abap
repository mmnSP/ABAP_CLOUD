CLASS LHC_ZR_LIB_LIBRO_12 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrLibLibro12
        RESULT result,
         "Método añadido:
        ValidarPaginas FOR VALIDATE ON SAVE
        IMPORTING keys FOR ZrLibLibro12~ValidarPaginas,
        "usando el alias ZrLibLibro12 que aparece en el behavior definition.

        "Añado el método del paso 4:
        CalcularEstado FOR DETERMINE ON MODIFY
        IMPORTING keys FOR ZrLibLibro12~CalcularEstado.

ENDCLASS.

CLASS LHC_ZR_LIB_LIBRO_12 IMPLEMENTATION.

  METHOD ValidarPaginas.

    READ ENTITIES OF ZR_LIB_LIBRO_12 IN LOCAL MODE
      ENTITY ZrLibLibro12
        FIELDS ( NumPaginas )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_libros)
      FAILED DATA(lt_failed).

    LOOP AT lt_libros INTO DATA(ls_libro).

      IF ls_libro-NumPaginas < 10.

        APPEND VALUE #( %tky = ls_libro-%tky )
          TO failed-ZrLibLibro12.

        APPEND VALUE #(
          %tky        = ls_libro-%tky
          %state_area = 'VALIDAR_PAGINAS'
          %msg        = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text     = 'El libro debe tener al menos 10 páginas'
                        )
        ) TO reported-ZrLibLibro12.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.


  "Añadir método. Paso 4:
  METHOD CalcularEstado.

    READ ENTITIES OF ZR_LIB_LIBRO_12 IN LOCAL MODE
      ENTITY ZrLibLibro12
        FIELDS ( NumPaginas )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_libros).

    DATA lt_update TYPE TABLE FOR UPDATE ZR_LIB_LIBRO_12\\ZrLibLibro12.

    DATA lv_estado TYPE ZLIB_LIBRO_12-ESTADO.

    LOOP AT lt_libros INTO DATA(ls_libro).

      lv_estado = COND #(
        WHEN ls_libro-NumPaginas < 50    THEN 'Muy deteriorado'
        WHEN ls_libro-NumPaginas < 150   THEN 'Deteriorado'
        WHEN ls_libro-NumPaginas < 400   THEN 'Bueno'
        ELSE                                  'Nuevo'
      ).

      APPEND VALUE #(
        %tky              = ls_libro-%tky
        Estado            = lv_estado
        %control-Estado   = if_abap_behv=>mk-on
      ) TO lt_update.

    ENDLOOP.

    MODIFY ENTITIES OF ZR_LIB_LIBRO_12 IN LOCAL MODE
      ENTITY ZrLibLibro12
        UPDATE FIELDS ( Estado )
        WITH lt_update
      REPORTED DATA(lt_reported).

  ENDMETHOD.


ENDCLASS.
