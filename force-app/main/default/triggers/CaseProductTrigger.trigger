trigger CaseProductTrigger on Case_Product__c (before insert, before update) {
    Map<Id, Id> ProductPriceBookIds = new Map<Id,Id>(); 
    for(Case_Product__c cp : Trigger.New){
        ProductPriceBookIds.put(cp.Price_Book__c,cp.Product__c);
    }
    
    List<PricebookEntry> priceBookEntryList = [SELECT Id,Name,UnitPrice,Pricebook2Id,Product2Id FROM PricebookEntry WHERE IsActive =: true AND 
                                              Pricebook2Id IN: ProductPriceBookIds.keySet() AND  
                                              Product2Id IN: ProductPriceBookIds.values()];
    
    System.debug('-----------priceBookEntryList----------------'+priceBookEntryList);
    System.debug('-----------priceBookEntryList.Size----------------'+priceBookEntryList.size());
    
    for(Case_Product__c cp : Trigger.New){
        for(PricebookEntry pbe : priceBookEntryList){
           	System.debug('----cp.Product__c--------------'+cp.Product__c);
            System.debug('---pbe.Product2Id--------------'+pbe.Product2Id);
            System.debug('----cp.Price_Book__c--------------'+cp.Price_Book__c);
            System.debug('---pbe.Pricebook2Id--------------'+pbe.Pricebook2Id);
            if(cp.Product__c == pbe.Product2Id && cp.Price_Book__c == pbe.Pricebook2Id){
                cp.Total_Price__c = cp.Quantity__c * pbe.UnitPrice;
                cp.Sales_Price__c = pbe.UnitPrice;
            }            
        }        
    }    
}