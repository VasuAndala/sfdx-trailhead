trigger leadTrigger on Lead (before insert,before update) {
    
    Set<String> lEmails = new Set<String>();
    
    for(Lead l : Trigger.new){
        
        if(l.Email <> null && l.Email <> ''){
            lEmails.add(l.Email);
        }
        
        if(l.Company <> null && l.Company <> ''){
            l.Company = l.LastName + ' - ' + l.Company;
            System.debug(System.LoggingLevel.DEBUG, l.LastName);
        }
    }
    
    List<String> contactEmails = new List<String>();
    
    for(Contact c : [SELECT Id,Email From Contact WHERE Email IN:lEmails AND Email!=null ]){
        contactEmails.add(c.Email);
    }
    
    for(Lead ld : Trigger.new){
        if(ld.Email<> null && ld.Email <> '' && contactEmails.contains(ld.Email)){
            ld.Email.addError('Duplicate Contact with Same email , Please check');
        }
    }
    
    
    

}