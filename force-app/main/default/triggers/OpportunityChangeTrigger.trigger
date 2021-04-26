trigger OpportunityChangeTrigger on OpportunityChangeEvent (after insert) {
    
    List<Task> tasks = new List<Task>();
    // Iterate through each event message.
    for (OpportunityChangeEvent event : Trigger.New) {
        // Get some event header fields
        
        EventBus.ChangeEventHeader header = event.ChangeEventHeader;
        if (header.changetype == 'UPDATE') {
            if(event.isWon == true){
                Task t = new Task();
                t.subject = 'Follow up on won opportunities: ' + header.recordIds;
                tasks.add(t);
            }
        }
        
    }
    if (tasks.size() > 0) {
        insert tasks;
    }    
}