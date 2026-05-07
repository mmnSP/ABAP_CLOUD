@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: 'Servicios con detalle completo'
}
define root view entity ZC_SERVICIO_MMN 
as projection on ZI_SERVICIO_MMN
//as select from ZI_SERVICIO_MMN
association [1..1] to ZI_SERVICIO_MMN as _BaseEntity 
on $projection.id_servicio = _BaseEntity.id_servicio
{
  key id_servicio,
      nombre_paseador,
      nombre_perro,
      @EndUserText: {
        label: 'Tipo de Servicio',
        quickInfo: 'Tipo de Servicio'
      }
      tipo_servicio,
      nombre_dueno,
      valoracion,
      _BaseEntity
}
