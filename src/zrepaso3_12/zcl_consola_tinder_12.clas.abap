CLASS zcl_consola_tinder_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_consola_tinder_12 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.



* ------------> Parte 1:

    DATA(lo_match1) = NEW zcl_match_tinder_12( i_usuario1 = 'Ana'
                                               i_usuario2 = 'Carlos'
                                               i_fecha_match = '20260527'
                                               i_compatibilidad = 92 ).

    DATA(lo_match2) = NEW zcl_match_tinder_12( i_usuario1 = 'Lucia'
                                               i_usuario2 = 'Pedro'
                                               i_fecha_match = '20260527'
                                               i_compatibilidad = 45 ).

    out->write( lo_match1->describir_match( ) ).
        IF lo_match1->es_super_match( ) = abap_true.
                out->write( 'SUPER MATCH' ).
        ELSE.
                out->write( 'Match normal' ).
        ENDIF.

    out->write( lo_match2->describir_match( ) ).
        IF lo_match2->es_super_match( ) = abap_true.
                out->write( 'SUPER MATCH' ).
        ELSE.
                out->write( 'Match normal' ).
        ENDIF.

 out->write( '----------------------------------------------------------------' ).



* -----------> Parte 2 + Polimorfismo:


     DATA(lo_match_normal) = NEW zcl_match_tinder_12( i_usuario1 = 'Ana'
                                                      i_usuario2 = 'Carlos'
                                                      i_fecha_match = '20260527'
                                                      i_compatibilidad = 70 ).

     DATA(lo_match_super) = NEW zcl_match_superlike_12( i_usuario1 = 'Lucia'
                                                        i_usuario2 = 'Pedro'
                                                        i_fecha_match = '20260527'
                                                        i_compatibilidad = 95
                                                        i_mensaje = 'Me encantó tu perfil' ).

    DATA lt_matches TYPE TABLE OF REF TO zcl_match_tinder_12.
            APPEND lo_match_normal TO lt_matches.
            APPEND lo_match_super TO lt_matches.

    LOOP AT lt_matches INTO DATA(lo_match).
                    out->write( lo_match->describir_match( ) ).
         IF lo_match->es_super_match( ) = abap_true.
                    out->write( 'SUPER MATCH' ).
         ELSE.
                    out->write( 'Match normal' ).
         ENDIF.
    ENDLOOP.

            out->write( |Total matches creados: { zcl_match_tinder_12=>get_total_matches( ) }| ).


  out->write( '----------------------------------------------------------------' ).



* ----------> Parte 3:

  DATA(lo_gold) = NEW zcl_cuenta_gold_12( i_nombre = 'Carlos' ).
  DATA(lo_basica) = NEW zcl_cuenta_basica_12( i_nombre = 'Lucia' ).


  " TABLA SWIPEABLE

  DATA lt_swipeables TYPE TABLE OF REF TO zif_swipeable_12.
          APPEND lo_gold TO lt_swipeables.
          APPEND lo_basica TO lt_swipeables.

  LOOP AT lt_swipeables INTO DATA(lo_swipe).
           out->write( lo_swipe->hacer_swipe( 'RIGHT' ) ).
           out->write( lo_swipe->hacer_swipe( 'LEFT' ) ).
    out->write( '----------------------------------------------------------' ).
  ENDLOOP.


  " TABLA BOOSTEABLE

  DATA lt_boosteables TYPE TABLE OF REF TO zif_boosteable_12.
        APPEND lo_gold TO lt_boosteables.
        APPEND lo_basica TO lt_boosteables.

  LOOP AT lt_boosteables INTO DATA(lo_boost).
                  out->write( lo_boost->activar_boost( ) ).
  ENDLOOP.



  " INFO EXTRA

  out->write( '--------------------------------------------------------------------' ).

          out->write( |Plan de Carlos: { lo_gold->get_plan( ) }| ).
          out->write( |Plan de Lucia: { lo_basica->get_plan( ) }| ).


  ENDMETHOD.
ENDCLASS.
