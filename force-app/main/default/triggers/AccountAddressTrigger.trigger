trigger AccountAddressTrigger on Account (before insert,before update,after insert ,after update) {

    for(Account a: Trigger.new){
        
        
        if(Trigger.isBefore && (Trigger.isInsert || Trigger.isupdate)){
            System.debug('------IS BEFORE AND IS UPDATE---------');
            System.debug('-----Number_of_Opportunities__c-----'+a.Number_of_Opportunities__c);
            System.debug('---Account_Formulafield__c-------'+a.Account_Formulafield__c);            
        }
        
        if(Trigger.isAfter && (Trigger.isInsert || Trigger.isupdate)){
            System.debug('------IS AFTER AND IS UPDATE---------');
            System.debug('-----Number_of_Opportunities__c-----'+a.Number_of_Opportunities__c);
            System.debug('---Account_Formulafield__c-------'+a.Account_Formulafield__c);
        }
        
        
        if(a.Match_Billing_Address__c && (Trigger.isInsert || (Trigger.isUpdate &&  Trigger.oldMap.get(a.Id).ShippingPostalCode <> a.ShippingPostalCode))){
            a.BillingPostalCode = a.ShippingPostalCode;
        }
    }
}