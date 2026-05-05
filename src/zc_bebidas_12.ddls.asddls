@AbapCatalog.sqlViewName: 'ZCBEBIDAS_12'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista Consumo RAP app bebidas'
@Metadata.ignorePropagatedAnnotations: true
define view ZC_BEBIDAS_12 as select from ZI_BEBIDAS_12
{
     @UI.selectionField: [{ position: 10 }]
  @UI.lineItem: [{ position: 10, label: 'Codigo' }]
  key Codigo,
  
   @UI.selectionField: [{ position: 20 }]
  @UI.lineItem: [{ position: 20, label: 'Nombre' }]
  key Nombre,
  
   @UI.selectionField: [{ position: 30 }]
  @UI.lineItem: [{ position: 30, label: 'Tipo' }]
  key Tipo,
  
   @UI.selectionField: [{ position: 40 }]
  @UI.lineItem: [{ position: 40, label: 'Origen' }]
  key Origen,
  
   @UI.selectionField: [{ position: 50 }]
  @UI.lineItem: [{ position: 50, label: 'Graduacion' }]
  key Graduacion,
  
   @UI.selectionField: [{ position: 60 }]
  @UI.lineItem: [{ position: 60, label: 'Precio' }]
  key Precio

  
}
