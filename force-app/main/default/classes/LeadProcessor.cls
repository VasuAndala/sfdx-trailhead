global class LeadProcessor implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id,LeadSource FROM Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<sObject> scope){
        List<Lead> lstOfUpdatedLead = new List<Lead>();
        
        List<Lead> lstOfLead = (List<Lead>)scope;
        for(Lead ld : lstOfLead){
            ld.LeadSource = 'Dreamforce';
            
            lstOfUpdatedLead.add(ld);
        }
        UPDATE lstOfUpdatedLead ;
    }
    
    global void finish(Database.BatchableContext bc){
    }
}