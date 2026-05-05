CLASS zcl_empleado_temporal_12 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado_12
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

 DATA:
        horas TYPE i,
        precio_hora TYPE p DECIMALS 2.

 METHODS:

*    METHODS: constructor IMPORTING i_nombre     TYPE string
*                              i_dni        TYPE string
*                              i_salario_base TYPE i
*                              i_horas        TYPE i
*                              i_precio_hora  TYPE p DECIMALS 2,


"Esto pondría en metodo, lo pongo aqui porque sino no me deja guardar:
*
* constructor.         "izq parametro constructor del padre
*                            "derch parametro constructor del hijo
*        super->constructor( i_nombre = i_nombre
*                            i_dni = i_dni
*                            i_salario_base = i_salario_base).
*
*            me->horas = i_horas.
*            me->precio_hora = i_precio_hora.

             get_ficha REDEFINITION.

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
