trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    
    List<Task> oppTasks = new List<Task>();
    
    for(Opportunity opp : Trigger.new){        
        if(Trigger.isInsert && opp.StageName == 'Closed Won'){
            Task t = new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id);
            oppTasks.add(t);
        }else if(Trigger.isInsert && opp.StageName == 'Closed Won' && Trigger.oldMap.get(opp.Id).StageName <> opp.StageName ){
            Task t = new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id);
            oppTasks.add(t);
        }
        
        
    }
    
    if(oppTasks <> null && oppTasks.size() > 0 && (!oppTasks.isEmpty())){
        insert oppTasks;
    }

}