CLASS zcl_restaurante_consola DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_restaurante_consola IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DELETE FROM z12_restaurante.

INSERT z12_restaurante FROM TABLE @( VALUE #(
  ( client = sy-mandt rest_id = 'REST001' rest_name = 'El Rincón de María'      city = 'Sevilla'       cuisine_type = 'Andaluza'    max_capacity = 80 )
  ( client = sy-mandt rest_id = 'REST002' rest_name = 'La Taberna del Chef'     city = 'Madrid'        cuisine_type = 'Española'    max_capacity = 60 )
  ( client = sy-mandt rest_id = 'REST003' rest_name = 'Sakura Japanese Food'    city = 'Barcelona'     cuisine_type = 'Japonesa'    max_capacity = 45 )
  ( client = sy-mandt rest_id = 'REST004' rest_name = 'Trattoria da Luigi'      city = 'Valencia'      cuisine_type = 'Italiana'    max_capacity = 55 )
  ( client = sy-mandt rest_id = 'REST005' rest_name = 'Le Petit Bistró'         city = 'Bilbao'        cuisine_type = 'Francesa'    max_capacity = 40 )
  ( client = sy-mandt rest_id = 'REST006' rest_name = 'Casa Pepe Mariscos'      city = 'Málaga'        cuisine_type = 'Marisquería' max_capacity = 70 )
  ( client = sy-mandt rest_id = 'REST007' rest_name = 'El Asador de Castilla'   city = 'Burgos'        cuisine_type = 'Castellana'  max_capacity = 90 )
  ( client = sy-mandt rest_id = 'REST008' rest_name = 'Wok & Roll'              city = 'Zaragoza'      cuisine_type = 'China'       max_capacity = 65 )
  ( client = sy-mandt rest_id = 'REST009' rest_name = 'La Brasa del Sur'        city = 'Granada'       cuisine_type = 'Parrilla'    max_capacity = 50 )
  ( client = sy-mandt rest_id = 'REST010' rest_name = 'Txoko Euskaldun'         city = 'San Sebastián' cuisine_type = 'Vasca'       max_capacity = 35 )
) ).

DELETE FROM z12_recetas.

INSERT z12_recetas FROM TABLE @( VALUE #(
  ( client = sy-mandt receta_id = 'REC001' rest_id = 'REST001' receta_name = 'Gazpacho andaluz'     category = 'Entrante'  prep_time_min = 20  difficulty = 'Fácil'  )
  ( client = sy-mandt receta_id = 'REC002' rest_id = 'REST001' receta_name = 'Salmorejo cordobés'   category = 'Entrante'  prep_time_min = 25  difficulty = 'Fácil'  )
  ( client = sy-mandt receta_id = 'REC003' rest_id = 'REST002' receta_name = 'Cocido madrileño'     category = 'Principal' prep_time_min = 180 difficulty = 'Media'  )
  ( client = sy-mandt receta_id = 'REC004' rest_id = 'REST003' receta_name = 'Ramen de miso'         category = 'Principal' prep_time_min = 90  difficulty = 'Alta'   )
  ( client = sy-mandt receta_id = 'REC005' rest_id = 'REST004' receta_name = 'Risotto de setas'     category = 'Principal' prep_time_min = 45  difficulty = 'Media'  )
  ( client = sy-mandt receta_id = 'REC006' rest_id = 'REST005' receta_name = 'Crème brûlée'         category = 'Postre'    prep_time_min = 60  difficulty = 'Alta'   )
  ( client = sy-mandt receta_id = 'REC007' rest_id = 'REST006' receta_name = 'Paella de marisco'    category = 'Principal' prep_time_min = 60  difficulty = 'Media'  )
  ( client = sy-mandt receta_id = 'REC008' rest_id = 'REST007' receta_name = 'Lechazo al horno'     category = 'Principal' prep_time_min = 120 difficulty = 'Media'  )
  ( client = sy-mandt receta_id = 'REC009' rest_id = 'REST009' receta_name = 'Chuletón a la brasa'  category = 'Principal' prep_time_min = 30  difficulty = 'Fácil'  )
  ( client = sy-mandt receta_id = 'REC010' rest_id = 'REST010' receta_name = 'Bacalao al pil-pil'   category = 'Principal' prep_time_min = 50  difficulty = 'Alta'   )
) ).

DELETE FROM z12_ingredientes.

INSERT z12_ingredientes FROM TABLE @( VALUE #(
  ( client = sy-mandt receta_id = 'REC001' ingrediente_id = 'ING001' ingrediente_name = 'Tomate maduro'        quantity = '1.00' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC001' ingrediente_id = 'ING002' ingrediente_name = 'Pepino'               quantity = '0.50' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC002' ingrediente_id = 'ING003' ingrediente_name = 'Tomate maduro'        quantity = '1.50' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC002' ingrediente_id = 'ING004' ingrediente_name = 'Pan del día anterior' quantity = '0.20' unit = 'kg' is_allergen = abap_true  )
  ( client = sy-mandt receta_id = 'REC003' ingrediente_id = 'ING005' ingrediente_name = 'Garbanzos'            quantity = '0.50' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC004' ingrediente_id = 'ING006' ingrediente_name = 'Fideos ramen'         quantity = '0.20' unit = 'kg' is_allergen = abap_true  )
  ( client = sy-mandt receta_id = 'REC005' ingrediente_id = 'ING007' ingrediente_name = 'Arroz arborio'        quantity = '0.30' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC007' ingrediente_id = 'ING008' ingrediente_name = 'Arroz bomba'          quantity = '0.40' unit = 'kg' is_allergen = abap_false )
  ( client = sy-mandt receta_id = 'REC007' ingrediente_id = 'ING009' ingrediente_name = 'Gambas frescas'       quantity = '0.50' unit = 'kg' is_allergen = abap_true  )
  ( client = sy-mandt receta_id = 'REC010' ingrediente_id = 'ING010' ingrediente_name = 'Bacalao desalado'     quantity = '0.60' unit = 'kg' is_allergen = abap_false )
) ).

COMMIT WORK.

  ENDMETHOD.
ENDCLASS.
