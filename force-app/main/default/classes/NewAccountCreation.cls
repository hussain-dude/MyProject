public class NewAccountCreation {
public Account account{get;set;}
public void save(){

if (!Schema.sObjectType.Account.fields.name.isCreateable()) {
     System.debug('stop');
 }
Account acc = new Account();
acc.name = 'Test1';
Insert acc;
}
}