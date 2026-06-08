CLASS zcl_consola_reservas_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_consola_reservas_12 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lv_opcion) = 5.

    CASE lv_opcion.

      WHEN 1.
        out->write( 'ALTA DE RESERVAS' ).

        DATA(lo_reserva1) = NEW zcl_reservas_verano_12(
          i_nombre      = 'Laura'
          i_apellido    = 'Sánchez'
          i_telefono    = '600111222'
          i_dias        = 3
          i_actividades = 2
        ).
        out->write( lo_reserva1->alta_reserva( ) ).

        DATA(lo_reserva2) = NEW zcl_reservas_verano_12(
          i_nombre      = 'Manuel'
          i_apellido    = 'Pérez'
          i_telefono    = '600333444'
          i_dias        = 5
          i_actividades = 4
        ).
        out->write( lo_reserva2->alta_reserva( ) ).

        DATA(lo_reserva3) = NEW zcl_reservas_verano_12(
          i_nombre      = 'Carmen'
          i_apellido    = 'Ruiz'
          i_telefono    = '600555666'
          i_dias        = 2
          i_actividades = 1
        ).
        out->write( lo_reserva3->alta_reserva( ) ).

      WHEN 2.
        out->write( 'MODIFICAR RESERVA' ).

        DATA(lo_mod) = NEW zcl_reservas_verano_12(
          i_nombre      = ''
          i_apellido    = ''
          i_telefono    = ''
          i_dias        = 0
          i_actividades = 0
        ).


        out->write( lo_mod->modificar_reserva(
          i_id          = 1
          i_nombre      = 'Laura'
          i_apellido    = 'García'
          i_telefono    = '600999000'
          i_dias        = 4
          i_actividades = 3
        ) ).



        out->write( lo_mod->modificar_reserva(
          i_id          = 999
          i_nombre      = 'Nadie'
          i_apellido    = 'Inexistente'
          i_telefono    = '000000000'
          i_dias        = 1
          i_actividades = 1
        ) ).

      WHEN 3.
        out->write( 'CONSULTAR RESERVA POR ID' ).

        DATA(lo_cons) = NEW zcl_reservas_verano_12(
          i_nombre      = ''
          i_apellido    = ''
          i_telefono    = ''
          i_dias        = 0
          i_actividades = 0
        ).

        DATA(lt_resultado) = lo_cons->consultar_reservas( i_id = 1 ).

        LOOP AT lt_resultado INTO DATA(ls_linea).
          out->write( | ID: { ls_linea-id_reserva } | ).
          out->write( | Nombre: { ls_linea-nombre_cliente } { ls_linea-apellido_cliente } | ).
          out->write( | Teléfono: { ls_linea-telefono } | ).
          out->write( | Importe: { ls_linea-importe_total } | ).
        ENDLOOP.

      WHEN 4.
        out->write( 'CONSULTAR TODAS LAS RESERVAS' ).

        DATA(lo_todas) = NEW zcl_reservas_verano_12(
          i_nombre      = ''
          i_apellido    = ''
          i_telefono    = ''
          i_dias        = 0
          i_actividades = 0
        ).

        DATA(lt_todas) = lo_todas->consultar_reservas( i_id = 0 ).

        LOOP AT lt_todas INTO DATA(ls_todas).
          out->write( | ID: { ls_todas-id_reserva } | &&
                      | { ls_todas-nombre_cliente } { ls_todas-apellido_cliente } | &&
                      | Tel: { ls_todas-telefono } | &&
                      | Importe: { ls_todas-importe_total } | ).
        ENDLOOP.

      WHEN 5.
        out->write( 'PRIMEROS N REGISTROS' ).

        DATA(lo_n) = NEW zcl_reservas_verano_12(
          i_nombre      = ''
          i_apellido    = ''
          i_telefono    = ''
          i_dias        = 0
          i_actividades = 0
        ).

        DATA(lt_n) = lo_n->consultar_n_reservas( i_n = 2 ).

        LOOP AT lt_n INTO DATA(ls_n).
          out->write( | ID: { ls_n-id_reserva } | &&
                      | { ls_n-nombre_cliente } { ls_n-apellido_cliente } | &&
                      | Tel: { ls_n-telefono } | &&
                      | Importe: { ls_n-importe_total } | ).
        ENDLOOP.

    ENDCASE.

  ENDMETHOD.

ENDCLASS.



