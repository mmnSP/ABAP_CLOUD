CLASS zcl_reservas_verano_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

  TYPES: tt_reservas TYPE TABLE OF ztab_verano_12 WITH EMPTY KEY.

    METHODS:
      constructor
        IMPORTING
          i_nombre      TYPE string
          i_apellido    TYPE string
          i_telefono    TYPE string
          i_dias        TYPE i
          i_actividades TYPE i,

      alta_reserva
        RETURNING VALUE(rv_mensaje) TYPE string,

      modificar_reserva
        IMPORTING
          i_id          TYPE i
          i_nombre      TYPE string
          i_apellido    TYPE string
          i_telefono    TYPE string
          i_dias        TYPE i
          i_actividades TYPE i
        RETURNING VALUE(rv_mensaje) TYPE string,

      consultar_reservas
        IMPORTING
          i_id                    TYPE i
        RETURNING
          VALUE(rt_reservas) TYPE tt_reservas,

      consultar_n_reservas
        IMPORTING
          i_n                     TYPE i
        RETURNING
          VALUE(rt_reservas) TYPE tt_reservas.

  PRIVATE SECTION.
    DATA:
      lv_nombre      TYPE string,
      lv_apellido    TYPE string,
      lv_telefono    TYPE string,
      lv_dias        TYPE i,
      lv_actividades TYPE i.

    METHODS:
      calcular_importe
        RETURNING VALUE(rv_importe) TYPE zde_importe_12,

      generar_id_reserva
        RETURNING VALUE(rv_id) TYPE zde_id_reserva_12.

ENDCLASS.


CLASS zcl_reservas_verano_12 IMPLEMENTATION.

  METHOD constructor.
    lv_nombre      = i_nombre.
    lv_apellido    = i_apellido.
    lv_telefono    = i_telefono.
    lv_dias        = i_dias.
    lv_actividades = i_actividades.
  ENDMETHOD.

  METHOD calcular_importe.
    rv_importe = 100 + lv_actividades * 25 + lv_dias * 40.
  ENDMETHOD.

  METHOD generar_id_reserva.
    SELECT MAX( id_reserva )
      FROM ztab_verano_12
      INTO @rv_id.

    IF rv_id IS INITIAL.
      rv_id = 1.
    ELSE.
      rv_id = rv_id + 1.
    ENDIF.
  ENDMETHOD.

  METHOD alta_reserva.
    DATA ls_reserva TYPE ztab_verano_12.

    ls_reserva-id_reserva       = generar_id_reserva( ).
    ls_reserva-nombre_cliente   = lv_nombre.
    ls_reserva-apellido_cliente = lv_apellido.
    ls_reserva-telefono         = lv_telefono.
    ls_reserva-importe_total    = calcular_importe( ).

    INSERT ztab_verano_12 FROM @ls_reserva.

    IF sy-subrc = 0.
      rv_mensaje = |Reserva creada correctamente con ID { ls_reserva-id_reserva }|.
    ELSE.
      rv_mensaje = 'Error al crear la reserva'.
    ENDIF.
  ENDMETHOD.

  METHOD modificar_reserva.
    DATA ls_reserva TYPE ztab_verano_12.

    SELECT SINGLE *
      FROM ztab_verano_12
      WHERE id_reserva = @i_id
      INTO @ls_reserva.

    IF sy-subrc <> 0.
      rv_mensaje = 'Error: no existe ninguna reserva con ese ID'.
      RETURN.
    ENDIF.

    ls_reserva-nombre_cliente   = i_nombre.
    ls_reserva-apellido_cliente = i_apellido.
    ls_reserva-telefono         = i_telefono.

    DATA(lo_temp) = NEW zcl_reservas_verano_12(
      i_nombre      = i_nombre
      i_apellido    = i_apellido
      i_telefono    = i_telefono
      i_dias        = i_dias
      i_actividades = i_actividades
    ).

    ls_reserva-importe_total = lo_temp->calcular_importe( ).

    UPDATE ztab_verano_12 FROM @ls_reserva.

    IF sy-subrc = 0.
      rv_mensaje = 'Reserva modificada correctamente'.
    ELSE.
      rv_mensaje = 'Error al modificar la reserva'.
    ENDIF.
  ENDMETHOD.

  METHOD consultar_reservas.
    IF i_id = 0.
      SELECT *
        FROM ztab_verano_12
        INTO TABLE @rt_reservas.
    ELSE.
      DATA ls_reserva TYPE ztab_verano_12.

      SELECT SINGLE *
        FROM ztab_verano_12
        WHERE id_reserva = @i_id
        INTO @ls_reserva.

      IF sy-subrc = 0.
        APPEND ls_reserva TO rt_reservas.
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD consultar_n_reservas.
    SELECT *
      FROM ztab_verano_12
      ORDER BY id_reserva
      INTO TABLE @rt_reservas
      UP TO @i_n ROWS.
  ENDMETHOD.

ENDCLASS.
