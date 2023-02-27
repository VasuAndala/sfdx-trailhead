public class CampingListController {
    @Auraenabled
    public static List<Camping_Item__c> getItems () {
        List<Camping_Item__c> CI =null;
        try{
            CI = [select id, name,price__c,Quantity__c,Packed__c from Camping_Item__c ];
        }catch(Exception e){
            System.debug('Exception---'+e);
        }
        return CI;
    }
    @Auraenabled
    public static Camping_Item__c saveItem (Camping_Item__c item){
        insert item;
        return item;
    }
}
