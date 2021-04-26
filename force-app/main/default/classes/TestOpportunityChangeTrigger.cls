@isTest
public class TestOpportunityChangeTrigger {
    
    @istest static void testCreateAndUpdateOpportunity(){
        
        Test.enableChangeDataCapture();
        
        Opportunity op = new Opportunity();
        op.Name='Sell 100 Widgets';        
        op.StageName='Prospecting';
        op.CloseDate=Date.today().addMonths(3);
        insert op;
        
        Test.getEventBus().deliver();
        
        Opportunity[] opps = [SELECT Id,Name,StageName FROM Opportunity];
        Opportunity opp = opps[0];
        opp.StageName = 'Closed Won';
        update opp;
        Test.getEventBus().deliver();
        
        Task[] taskList2 = [SELECT Id,Subject FROM Task];
        System.assertEquals(1, taskList2.size(), 'The change event trigger did not create the expected task.');
        
    }

}