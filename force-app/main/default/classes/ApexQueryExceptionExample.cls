public class ApexQueryExceptionExample {
    
    class CustException extends Exception {
        String urlParam = String.escapeSingleQuotes(ApexPages.currentPage().getParameters().get('url_param'));
       
    }
    
    public static Account query(){
        Account a;
        try{
            a = [select Id FROM Account Where CreatedDate > TODAY];
            
        }catch(CustException e){
            System.debug('------CustException------'+e);
        }catch(System.QueryException e){
            System.debug('------QueryException------'+e);
        }
        finally{
            System.debug('------finally------');
        }
        return a;
    }

}