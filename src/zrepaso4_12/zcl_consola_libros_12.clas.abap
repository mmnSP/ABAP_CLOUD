CLASS zcl_consola_libros_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_libros_12 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA lt_libros TYPE TABLE OF zlib_libro_12.

lt_libros = VALUE #(

( client = sy-mandt
  libro_id = 'LIB00001'
  titulo = 'Don Quijote de la Mancha'
  autor = 'Miguel de Cervantes'
  genero = 'Novela'
  num_paginas = 863
  disponible = 'X'
  estado = 'Nuevo' )

( client = sy-mandt
  libro_id = 'LIB00002'
  titulo = 'La sombra del viento'
  autor = 'Carlos Ruiz Zafon'
  genero = 'Novela'
  num_paginas = 576
  disponible = 'X'
  estado = 'Nuevo' )

( client = sy-mandt
  libro_id = 'LIB00003'
  titulo = 'El principito'
  autor = 'Antoine de Saint-Exupery'
  genero = 'Infantil'
  num_paginas = 96
  disponible = 'X'
  estado = 'Deteriorado' )

( client = sy-mandt
  libro_id = 'LIB00004'
  titulo = 'Veinte poemas de amor'
  autor = 'Pablo Neruda'
  genero = 'Poesia'
  num_paginas = 120
  disponible = ''
  estado = 'Deteriorado' )

( client = sy-mandt
  libro_id = 'LIB00005'
  titulo = 'Fundacion'
  autor = 'Isaac Asimov'
  genero = 'Ciencia Ficcion'
  num_paginas = 255
  disponible = 'X'
  estado = 'Bueno' )

( client = sy-mandt
  libro_id = 'LIB00006'
  titulo = 'Sapiens'
  autor = 'Yuval Noah Harari'
  genero = 'Ensayo'
  num_paginas = 498
  disponible = 'X'
  estado = 'Nuevo' )

( client = sy-mandt
  libro_id = 'LIB00007'
  titulo = 'Rebelion en la granja'
  autor = 'George Orwell'
  genero = 'Novela'
  num_paginas = 144
  disponible = 'X'
  estado = 'Deteriorado' )

( client = sy-mandt
  libro_id = 'LIB00008'
  titulo = 'Fahrenheit 451'
  autor = 'Ray Bradbury'
  genero = 'Ciencia Ficcion'
  num_paginas = 210
  disponible = ''
  estado = 'Bueno' )

( client = sy-mandt
  libro_id = 'LIB00009'
  titulo = 'Cuentos infantiles'
  autor = 'Varios'
  genero = 'Infantil'
  num_paginas = 35
  disponible = 'X'
  estado = 'Muy deteriorado' )

).


INSERT zlib_libro_12 FROM TABLE @lt_libros.
    IF sy-subrc = 0.
            out->write( 'Datos insertados correctamente' ).
    ELSE.
            out->write( 'Error al insertar datos' ).
    ENDIF.


        out->write( lt_libros ).



  ENDMETHOD.
ENDCLASS.
