@isTest
private class ContactServiceTest {

    @isTest
    static void testCreateContact() {
        Contact c = ContactService.createContact('John', 'Doe', 'john.doe@example.com');
        System.assertNotEquals(null, c.Id, 'Contact should have been inserted');
        System.assertEquals('John', c.FirstName);
        System.assertEquals('Doe', c.LastName);
        System.assertEquals('john.doe@example.com', c.Email);
    }

    @isTest
    static void testGetContactById() {
        Contact c = ContactService.createContact('Jane', 'Smith', 'jane.smith@example.com');
        Contact fetched = ContactService.getContactById(c.Id);
        System.assertEquals(c.Id, fetched.Id);
        System.assertEquals('Jane', fetched.FirstName);
    }

    @isTest
    static void testUpdateContactEmail() {
        Contact c = ContactService.createContact('Bob', 'Brown', 'bob@example.com');
        ContactService.updateContactEmail(c.Id, 'bob.new@example.com');
        Contact updated = [SELECT Email FROM Contact WHERE Id = :c.Id];
        System.assertEquals('bob.new@example.com', updated.Email);
    }

    @isTest
    static void testDeleteContact() {
        Contact c = ContactService.createContact('Alice', 'Green', 'alice@example.com');
        ContactService.deleteContact(c.Id);
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Id = :c.Id];
        System.assertEquals(0, contacts.size(), 'Contact should have been deleted');
    }

    @isTest
    static void testGetContactsByLastName() {
        ContactService.createContact('Tom', 'Wilson', 'tom@example.com');
        ContactService.createContact('Sue', 'Wilson', 'sue@example.com');
        List<Contact> results = ContactService.getContactsByLastName('Wilson');
        System.assertEquals(2, results.size(), 'Should return 2 contacts with last name Wilson');
    }
}
