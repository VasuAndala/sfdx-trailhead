trigger OrderEventTrigger on Order_Event__e (after insert) {
  
    // List to hold all tasks to be created.
    List<Task> tasks = new List<Task>();    
       
    // Iterate through each notification.
    for (Order_Event__e  event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create Case to dispatch new team.
            Task tsk = new Task();
            tsk.Priority = 'Medium';
            tsk.Subject =  'Follow up on shipped order ' + event.Order_Number__c;
            tsk.OwnerId = event.CreatedById;
            tasks.add(tsk);
        }
   }
    
    // Insert all cases corresponding to events received.
    insert tasks;
}