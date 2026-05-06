@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista Consumo RAP app bebidas'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_BEBIDAS_12
  provider contract transactional_query 
as projection on  ZI_BEBIDAS_12
{
  @UI.selectionField: [{ position: 10 }]
  @UI.lineItem: [{ position: 10, label: 'Codigo' }]
  key Codigo,
  
  @UI.selectionField: [{ position: 20 }]
  @UI.lineItem: [{ position: 20, label: 'Nombre' }]
  Nombre,
  
  @UI.selectionField: [{ position: 30 }]
  @UI.lineItem: [{ position: 30, label: 'Tipo' }]
  Tipo,
  
  @UI.selectionField: [{ position: 40 }]
  @UI.lineItem: [{ position: 40, label: 'Origen' }]
  Origen,
  
//  @UI.selectionField: [{ position: 50 }]
  @UI.lineItem: [{ position: 50, label: 'Graduacion' }]
  Graduacion,
  
//  @UI.selectionField: [{ position: 60 }]
  @UI.lineItem: [{ position: 60, label: 'Precio' }]
  Precio  
}
