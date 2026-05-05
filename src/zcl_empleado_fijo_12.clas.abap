CLASS zcl_empleado_fijo_12 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado_12
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:  anios TYPE i,
           plus TYPE p DECIMALS 2.

    METHODS: get_ficha REDEFINITION,
             get_salario_base REDEFINITION.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_empleado_fijo_12 IMPLEMENTATION.

METHOD get_salario_base.

    DATA(lv_salario_base) = super->get_salario_base( ).

    rv_salario_base = lv_salario_base * 14.

"Arreglar lo del salario base porque no está en rs_ficha, no va a salir. Y también falta el constructor
"porque sino me coge el salario del padre y el fijo puede que tenga otro difrente.

  ENDMETHOD.

METHOD get_ficha.

    DATA: lv_anios TYPE i,
          lv_plus TYPE p DECIMALS 2.

            lv_plus =  me->salario_base * lv_anios * 50.

    DATA(lv_ficha_padre) =  super->get_ficha( ).

         rs_ficha = |{ lv_ficha_padre }| &
                    |Años de antigüedad: { lv_anios }| &
                    |Plus de antigüedad: { lv_plus }|.

  ENDMETHOD.



ENDCLASS.
