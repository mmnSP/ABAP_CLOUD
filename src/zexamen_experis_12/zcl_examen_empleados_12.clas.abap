CLASS zcl_examen_empleados_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

  TYPES: tt_empleados TYPE TABLE OF zempleados_12 WITH EMPTY KEY.

    METHODS:
      constructor
        IMPORTING
          i_nombre      TYPE string
          i_apellido    TYPE string
          i_telefono    TYPE string
          i_certificaciones TYPE i
          i_experiencia TYPE i,

      alta_empleado
        RETURNING VALUE(rv_mensaje) TYPE string,

      modificar_empleado
        IMPORTING
          i_id          TYPE i
          i_nombre      TYPE string
          i_apellido    TYPE string
          i_telefono    TYPE string
          i_certificaciones TYPE i
          i_experiencia TYPE i
        RETURNING VALUE(rv_mensaje) TYPE string,

      consultar_empleado
        IMPORTING
          i_id                    TYPE i
        RETURNING
          VALUE(rt_empleados) TYPE tt_empleados,

      consultar_n_empleados
        IMPORTING
          i_n                     TYPE i
        RETURNING
          VALUE(rt_empleados) TYPE tt_empleados.

  PRIVATE SECTION.
    DATA:
      lv_nombre      TYPE string,
      lv_apellido    TYPE string,
      lv_telefono    TYPE string,
      lv_certificaciones TYPE i,
      lv_experiencia TYPE i.

    METHODS:
      calcular_sueldo
        RETURNING VALUE(rv_sueldo) TYPE ZDE_EXAMEN_SUELDO_12,

      generar_id_empleado
        RETURNING VALUE(rv_id) TYPE zde_id_empleado_12.

ENDCLASS.


CLASS zcl_examen_empleados_12 IMPLEMENTATION.

  METHOD constructor.
    lv_nombre      = i_nombre.
    lv_apellido    = i_apellido.
    lv_telefono    = i_telefono.
    lv_certificaciones = i_certificaciones.
    lv_experiencia = i_experiencia.
  ENDMETHOD.

  METHOD calcular_sueldo.
    rv_sueldo = 1000 + lv_certificaciones * 50 + lv_experiencia * 100.
  ENDMETHOD.

  METHOD generar_id_empleado.
    SELECT MAX( id_empleado )
      FROM zempleados_12
      INTO @rv_id.

    IF rv_id IS INITIAL.
      rv_id = 1.
    ELSE.
      rv_id = rv_id + 1.
    ENDIF.
  ENDMETHOD.

  METHOD alta_empleado.
    DATA ls_empleados TYPE zempleados_12.

    ls_empleados-id_empleado       = generar_id_empleado( ).
    ls_empleados-nombre_empleado   = lv_nombre.
    ls_empleados-apellido_empleado = lv_apellido.
    ls_empleados-telefono          = lv_telefono.
    ls_empleados-sueldo            = calcular_sueldo( ).

    INSERT zempleados_12 FROM @ls_empleados.

    IF sy-subrc = 0.
      rv_mensaje = |Empleado creado correctamente con ID { ls_empleados-id_empleado }|.
    ELSE.
      rv_mensaje = 'Error al crear empleado'.
    ENDIF.
  ENDMETHOD.

  METHOD modificar_empleado.
    DATA ls_empleados TYPE zempleados_12.

    SELECT SINGLE *
      FROM zempleados_12
      WHERE id_empleado = @i_id
      INTO @ls_empleados.

    IF sy-subrc <> 0.
      rv_mensaje = 'Error: no existe ningún empleado con ese ID'.
      RETURN.
    ENDIF.

    ls_empleados-nombre_empleado   = i_nombre.
    ls_empleados-apellido_empleado = i_apellido.
    ls_empleados-telefono         = i_telefono.

    DATA(lo_temp) = NEW zcl_examen_empleados_12(
      i_nombre      = i_nombre
      i_apellido    = i_apellido
      i_telefono    = i_telefono
      i_certificaciones = i_certificaciones
      i_experiencia = i_experiencia
    ).

    ls_empleados-sueldo = lo_temp->calcular_sueldo( ).

    UPDATE zempleados_12 FROM @ls_empleados.

    IF sy-subrc = 0.
      rv_mensaje = 'Empleado modificada correctamente'.
    ELSE.
      rv_mensaje = 'Error al modificar empleado'.
    ENDIF.
  ENDMETHOD.

  METHOD consultar_empleado.
    IF i_id = 0.
      SELECT *
        FROM zempleados_12
        INTO TABLE @rt_empleados.
    ELSE.
      DATA ls_empleados TYPE zempleados_12.

      SELECT SINGLE *
        FROM zempleados_12
        WHERE id_empleado = @i_id
        INTO @ls_empleados.

      IF sy-subrc = 0.
        APPEND ls_empleados TO rt_empleados.
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD consultar_n_empleados.
    SELECT *
      FROM zempleados_12
      ORDER BY id_empleado
      INTO TABLE @rt_empleados
      UP TO @i_n ROWS.
  ENDMETHOD.

ENDCLASS.
