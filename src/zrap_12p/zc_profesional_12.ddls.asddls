@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZPROFESIONAL_12'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_PROFESIONAL_12
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_PROFESIONAL_12
  association [1..1] to ZR_PROFESIONAL_12 as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,
  Nombre,
  Profesion,
  Salario,
  IsActive,
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
