public class MuleSoftIntegrationAPI {
    
    
    public static void getMuleSoftProducts(){
        
        String endpoint ='https://anypoint.mulesoft.com/mocking/api/v1/links/9eeafe33-e800-4f30-8920-3f8866691f3d/products/2';
        
        String userName='mulesoft';
        String password='mulesoft';
        Blob headerValue= Blob.valueOf(userName+':'+password);
        string AuthHeader = 'BASICS '+EncodingUtil.base64Encode(headerValue);
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setHeader('Authorization',AuthHeader);
        HttpResponse resp = http.send(req);
        System.debug('------resp--------'+resp);
        System.debug('------getBody--------'+resp.getBody());
    }

}