@isTest
private class NewAccountCreationTest{
public static testMethod void NewAccountCreationTestMethod(){
NewAccountCreation accountCreation = new NewAccountCreation ();
Account acc = new Account();
acc.name = 'NewAccount';
acc.Adress__c= 'bangalore';
insert acc;
system.assertEquals(acc.name ,'NewAccount');
accountCreation.save();
}
}