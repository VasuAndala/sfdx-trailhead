public class ContactTriggerHandler {
    
    public static void preventDuplicateContacts(List<Contact> contacts){
        
        set<string> phoneNumbers = new set<string>();
        set<string> emails = new set<string>();
        set<string> mobileNumbers = new set<string>();
        set<String> firstNames = new set<String>();
        set<string> lastNames = new set<string>();
        set<Date> dob = new set<Date>();
        
        for(Contact c: contacts){
            if(c.Phone <> null && c.Phone <> '')
                phoneNumbers.add(c.Phone);
            if(c.Email <> null)
                emails.add(c.Email);
            if(c.MobilePhone <> null && c.MobilePhone <> '')
                mobileNumbers.add(c.MobilePhone);
            if(c.FirstName <> null)
                firstNames.add(c.FirstName);
            if(c.LastName <> null)
                lastNames.add(c.LastName);            
            if(c.Birthdate <> null)
                dob.add(c.Birthdate);
        }
        
        for(Contact existedcontacts : [SELECT Id,FirstName,LastName, MobilePhone,Phone,Email,Birthdate FROM Contact  WHERE 
                                       email IN:emails  OR 
                                       Phone IN:phoneNumbers  OR 
                                       MobilePhone IN:mobileNumbers OR 
                                       (firstName IN:firstNames AND lastName IN:lastNames AND Birthdate IN: dob ) OR  
                                       (firstName IN:lastNames AND lastName IN: firstNames AND Birthdate IN: dob) ] ){
                                           
                                           for(Contact newCon : contacts){
                                               if(newCon.Email<> null && newCon.Email <> '' && newCon.Email == existedcontacts.Email && existedcontacts.Id <> newCon.Id ){
                                                   newCon.Email.addError('Duplicate Email');
                                               }
                                               
                                               if(newCon.MobilePhone<> null && newCon.MobilePhone <> '' && newCon.MobilePhone == existedcontacts.MobilePhone && existedcontacts.Id <> newCon.Id){
                                                   newCon.MobilePhone.addError('Duplicate Mobile Number');
                                               }
                                               
                                               if(newCon.Phone<> null && newCon.Phone <> '' && newCon.Phone == existedcontacts.Phone && existedcontacts.Id <> newCon.Id){
                                                   System.debug('-------------------------\n--'+existedcontacts.Id +'=='+ newCon.Id);                                                   
                                                   newCon.Phone.addError('Duplicate Phone Number');
                                               }
                                               
                                               if(newCon.firstName == existedcontacts.firstName && newCon.LastName == existedcontacts.LastName && (newCon.Birthdate == existedcontacts.Birthdate && newCon.Birthdate <> null) && existedcontacts.Id <> newCon.Id){
                                                   newCon.Phone.addError('Duplicate record based on First Name, Last Name & Birthdate.');
                                               }
                                           }                            
                                           
                                       }
        
    }
}