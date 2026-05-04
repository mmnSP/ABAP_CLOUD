CLASS zcl_empleado_temporal_12 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado_12
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

 DATA:  horas TYPE i,
        precio_hora TYPE p DECIMALS 2.

    METHODS: get_ficha REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_empleado_temporal_12 IMPLEMENTATION.


METHOD get_ficha.

    DATA: lv_horas TYPE i,
          lv_precio_hora TYPE p DECIMALS 2,
          lv_total TYPE p DECIMALS 2.


            lv_total = lv_horas * lv_precio_hora.

    DATA(lv_ficha_padre) =  super->get_ficha( ).

         rs_ficha = |{ lv_ficha_padre }| &
                    |Horas trabajadas: { lv_horas }| &
                    |Precio hora: { lv_precio_hora }| &
                    |Salario total: { lv_total }|.

  ENDMETHOD.
ENDCLASS.
