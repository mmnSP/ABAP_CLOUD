@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Behavior base RAP app bebidas'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_BEBIDAS_12 as select from zbebidas_12
{
    key codigo  as Codigo,
    nombre      as Nombre,
    tipo        as Tipo,
    origen      as Origen,
    graduacion  as Graduacion,
    precio      as Precio
}
