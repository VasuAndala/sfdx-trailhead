trigger ContatcTrigger on Contact (before insert, before update) {
    
    
    Switch on Trigger.OperationType {
        
        When BEFORE_INSERT, BEFORE_UPDATE {
            System.debug('------BEFORE INSERT--------');
            
            // Prevent Duplicate records method:
            ContactTriggerHandler.preventDuplicateContacts(Trigger.new);
        }
        When BEFORE_DELETE {
            System.debug('------BEFORE UPDATE --------');
            
            // Prevent Duplicate records method:
            // ContactTriggerHandler.preventDuplicateContacts(Trigger.new);
        }
    }
}