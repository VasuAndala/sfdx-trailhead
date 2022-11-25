public class CreateTestLeadINBatch implements Database.Batchable<sObject> {
    
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('query');
    }
    public void execute(Database.BatchableContext bc, List<sObject> scope){
        
        System.debug(')))))))))))))))');
        
    }
    public void finish(Database.BatchableContext bc){}

}
