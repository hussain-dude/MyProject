public class ContactList {
	@AuraEnabled
    public static List<Contact> getContactList(){
        List<Contact> contactlist=[Select id,name,firstName,lastname,email from contact limit 10];
        return contactlist;
    }
    //New Method
    @AuraEnabled
    public static List<Account> getAccContactList(){
       List<Account> AccountList= [select id,name,(select id,name,Address__c,Postalcode__c from AccLocations__r) from Account where id='0012v00002RkjtZ'];
       //List<Account> AccountList= [select id,name from Account where id='0012v00002RkjtZ'];
       List<AccContactWrapper> acccontwrap=new List<AccContactWrapper>();
        for(Account u: AccountList){
            AccContactWrapper acc=new AccContactWrapper(u.name,u.AccLocations__r);
            //acc.AccountName=u.name;
           // acc.contList=u.AccLocations__r;    		 
        	 acccontwrap.add(acc);
		}
        return AccountList;
    }
    
    public class AccContactWrapper {
        public String AccountName  { get; set; }
        /*public String Location  { get; set; }
        public String zipcode { get; set; }*/
        public List<Locations__c> contList { get; set; }
        public AccContactWrapper(String  AccountName,List<Locations__c> contList ) {
            this.AccountName = AccountName;
            this.contList =contList;
        }
    }
}
