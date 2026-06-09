CLASS zcl_examen_consola_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.


CLASS zcl_examen_consola_12 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lv_opcion) = 1.

    CASE lv_opcion.

*      WHEN 0.
*        DELETE FROM zempleados_12.
*            IF sy-subrc = 0.
*                out->write( 'Tabla limpiada correctamente' ).
*            ELSE.
*                out->write( 'La tabla ya estaba vacía' ).
*            ENDIF.

      WHEN 1. "Alta de empleado
        DATA(lo_alta1) = NEW zcl_examen_empleados_12(
          i_nombre          = 'Carlos'
          i_apellido        = 'García'
          i_telefono        = '600123456'
          i_certificaciones = 3
          i_experiencia     = 5
        ).

        DATA(lv_alta) = lo_alta1->alta_empleado( ).
        out->write( lv_alta ).

        DATA(lo_alta2) = NEW zcl_examen_empleados_12(
        i_nombre = 'Laura' i_apellido = 'Martínez' i_telefono = '611222333' i_certificaciones = 2 i_experiencia = 3
        ).
        DATA(lv_alta2) = lo_alta2->alta_empleado( ).
        out->write( lv_alta2 ).

        DATA(lo_alta3) = NEW zcl_examen_empleados_12(
        i_nombre = 'Sergio' i_apellido = 'López' i_telefono = '622333444' i_certificaciones = 5 i_experiencia = 8
        ).
        DATA(lv_alta3) = lo_alta3->alta_empleado( ).
        out->write( lv_alta3 ).

        DATA(lo_alta4) = NEW zcl_examen_empleados_12(
        i_nombre = 'Ana' i_apellido = 'Fernández' i_telefono = '633444555' i_certificaciones = 1 i_experiencia = 2
        ).
        DATA(lv_alta4) = lo_alta4->alta_empleado( ).
        out->write( lv_alta4 ).

        DATA(lo_alta5) = NEW zcl_examen_empleados_12(
        i_nombre = 'Pedro' i_apellido = 'Sánchez' i_telefono = '644555666' i_certificaciones = 4 i_experiencia = 10
        ).
        DATA(lv_alta5) = lo_alta5->alta_empleado( ).
        out->write( lv_alta5 ).

      WHEN 2. "Modificar empleado
        DATA(lo_mod) = NEW zcl_examen_empleados_12(
          i_nombre          = 'Marta'
          i_apellido        = 'López'
          i_telefono        = '612345678'
          i_certificaciones = 1
          i_experiencia     = 3
        ).
        DATA(lv_mod) = lo_mod->modificar_empleado(
          i_id              = 1
          i_nombre          = 'Carlos'
          i_apellido        = 'Martínez'
          i_telefono        = '611999888'
          i_certificaciones = 4
          i_experiencia     = 6
        ).
        out->write( lv_mod ).

      WHEN 3. "Consulta por ID (0 = todos)
        DATA(lo_cons) = NEW zcl_examen_empleados_12(
          i_nombre          = 'Julio'
          i_apellido        = 'Domínguez'
          i_telefono        = '802567456'
          i_certificaciones = 2
          i_experiencia     = 0
        ).
        DATA(lt_result) = lo_cons->consultar_empleado( i_id = 0 ).
        out->write( lt_result ).

      WHEN 4. "Consultar N primeros registros
        DATA(lo_n) = NEW zcl_examen_empleados_12(
          i_nombre          = 'Paco'
          i_apellido        = 'Porras'
          i_telefono        = '666666666'
          i_certificaciones = 15
          i_experiencia     = 8
        ).
        DATA(lt_n) = lo_n->consultar_n_empleados( i_n = 2 ).
        out->write( lt_n ).

    ENDCASE.

  ENDMETHOD.

ENDCLASS.

