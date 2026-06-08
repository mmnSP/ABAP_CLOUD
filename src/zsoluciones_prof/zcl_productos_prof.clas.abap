CLASS zcl_productos_prof DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_productos TYPE STANDARD TABLE OF zproductos_21.

    METHODS:
      insertar IMPORTING i_registro TYPE zproductos_21,

      buscar_por_id IMPORTING i_producto_id TYPE zproducto_id_21 EXPORTING  o_registro TYPE zproductos_21,

*      listar_todos EXPORTING o_tab_productos
*                               TYPE ty_productos,

      listar_todos EXPORTING o_tab_productos
                               TYPE ty_productos,

      modificar IMPORTING i_registro TYPE zproductos_21 EXPORTING o_resultado TYPE abap_bool o_reg_afec TYPE i,

      borrar IMPORTING i_producto_id TYPE zproducto_id_21 EXPORTING o_resultado TYPE abap_bool  o_reg_afec TYPE i.

  PROTECTED SECTION.


  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_productos_prof IMPLEMENTATION.

  METHOD insertar.
    INSERT zproductos_21 FROM @i_registro.
  ENDMETHOD.

  METHOD buscar_por_id.
    SELECT SINGLE * FROM zproductos_21 WHERE producto_id = @i_producto_id INTO @o_registro.
  ENDMETHOD.

  METHOD modificar.
    UPDATE zproductos_21 FROM @i_registro.

    IF sy-subrc = 0.
      o_resultado = abap_true.
    ELSE.
      o_resultado = abap_false.
    ENDIF.

    o_reg_afec = sy-dbcnt.

  ENDMETHOD.

  METHOD borrar.
    DELETE FROM zproductos_21 WHERE producto_id = @i_producto_id.
    o_reg_afec = sy-dbcnt.
    IF sy-subrc = 0.
      o_resultado = abap_true.
    ELSE.
      o_resultado = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD listar_todos.

    SELECT * FROM zproductos_21
        INTO TABLE @o_tab_productos.

  ENDMETHOD.

ENDCLASS.
