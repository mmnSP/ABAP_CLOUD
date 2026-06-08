INTERFACE zif_swipeable_12
  PUBLIC .

METHODS hacer_swipe IMPORTING i_direccion TYPE string RETURNING VALUE(rv_texto) TYPE string.

ENDINTERFACE.
