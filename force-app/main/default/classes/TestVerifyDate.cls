@isTest
private class TestVerifyDate {

    @isTest static void testCheckDates(){      
        Date d1 = System.today();
        Date d2 = d1.addDays(15);
        Date d3 = d2.addDays(20);
        VerifyDate.CheckDates(d1,d2);
        VerifyDate.CheckDates(d1,d3);
    }
    
}