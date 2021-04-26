public class VeryLargeSOQLQueries {
    
    
    public static void executeLargeSOQL(){
        
        for(List<Account> accts : [SELECT Id, Name FROM Account] ){
            update accts;
        }
        
    }

}