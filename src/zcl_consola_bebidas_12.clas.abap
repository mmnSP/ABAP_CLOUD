CLASS zcl_consola_bebidas_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_bebidas_12 IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.
    DELETE FROM zbebidas_12.
    COMMIT WORK.
    INSERT zbebidas_12 FROM TABLE @( VALUE #(
                ( codigo = 123456 nombre = 'Vodka' tipo = 'Destilada' origen = 'Rusia' graduacion = 38 precio = 11 )
                ( codigo = 789123 nombre = 'Sidra' tipo = 'Fermentada' origen = 'España' graduacion = 3 precio = '11.7' )
                ( codigo = 456000 nombre = 'Ron' tipo = 'Destilada' origen = 'Cuba' graduacion = '47.5' precio = 21 )
                ( codigo = 120001 nombre = 'Vino Tinto' tipo = 'Vino' origen = 'España' graduacion = '10.7' precio = '30.5' )
                ( codigo = 100056 nombre = 'Cerveza' tipo = 'Fermentada' origen = 'Alemania' graduacion = '4.5'  precio = '5.2' )
                ( codigo = 134522 nombre = 'Ginebra' tipo = 'Destilada' origen = 'Francia' graduacion = '42.3' precio = 12 )
                ( codigo = 923456 nombre = 'Whisky' tipo = 'Destilada' origen = 'Escocia' graduacion = '52.5' precio = '15.7' )
    ) ).


    out->write( 'Datos cargados OK' ).

  ENDMETHOD.

ENDCLASS.
