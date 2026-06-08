@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZOO_VET_12'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_ZOO_VET_12
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_ZOO_VET_12
  association [1..1] to ZR_ZOO_VET_12 as _BaseEntity on $projection.VETID = _BaseEntity.VETID
{
  key VetID,
  Nombre,
  Especialidad,
  Telefono,
  Email,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
