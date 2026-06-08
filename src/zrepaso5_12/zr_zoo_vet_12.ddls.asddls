@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZOO_VET_12'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_ZOO_VET_12
  as select from ZZOO_VET_12
{
  key vet_id as VetID,
  nombre as Nombre,
  especialidad as Especialidad,
  telefono as Telefono,
  email as Email,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
