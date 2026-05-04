CLASS zcl_empleado_12 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA: nombre TYPE string,
        dni TYPE i,
        salario_base TYPE i.



METHODS: constructor IMPORTING i_nombre TYPE string
                               i_dni TYPE i
                               i_salario_base TYPE i,
         get_ficha RETURNING VALUE(rs_ficha) TYPE string,
         get_salario_base RETURNING VALUE(rv_salario_base) TYPE i.




    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_empleado_12 IMPLEMENTATION.

METHOD constructor.

            me->nombre = i_nombre.
            me->dni = i_dni.
            me->salario_base = i_salario_base.

ENDMETHOD.


METHOD get_ficha.
       rs_ficha = |Nombre: {  me->nombre }| &
                  |DNI: {  me->dni }| &
                  |Salario base: {  me->salario_base }|.

  ENDMETHOD.

METHOD get_salario_base.
            rv_salario_base =  me->salario_base * 14.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.
ENDCLASS.
