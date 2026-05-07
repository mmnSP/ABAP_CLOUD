@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista base RAP perros'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_SERVICIO_MMN as select from zdw_services_mmn as serv
  inner join zdw_dog_mmn as perro
    on  serv.id_perro = perro.id_perro

  association [1..1] to zdw_walker_mmn   as paseador   
    on serv.id_paseador = paseador.id_paseador

//  association [1..1] to zdw_perro      as perro      
//    on serv.id_perro = perro.id_perro

  association [0..1] to zdw_owner_mmn      as dueno      
    on perro.id_dueno = dueno.id_dueno

  association [0..1] to zdw_reviews_mmn as valoracion 
    on serv.id_servicio = valoracion.id_servicio
    
{
  key serv.id_servicio      as id_servicio,
      paseador.nombre       as nombre_paseador,
      perro.nombre          as nombre_perro,
      serv.tipo_servicio    as tipo_servicio,
      dueno.nombre          as nombre_dueno,
      valoracion.puntuacion as valoracion
}
    
