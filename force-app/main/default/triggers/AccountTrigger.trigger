trigger AccountTrigger on Account (before update) {
    
    
    contact[] conlist = [SELECT Name,Title FROM Contact WHERE AccountId IN :Trigger.new];
    
    System.debug('--------conlist---------'+conlist);
    
}