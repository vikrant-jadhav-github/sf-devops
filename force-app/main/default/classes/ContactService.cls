public with sharing class ContactService {

    public static Contact createContact(String firstName, String lastName, String email) {
        Contact c = new Contact();
        c.FirstName = firstName;
        c.LastName = lastName;
        c.Email = email;
        insert c;
        return c;
    }

    public static Contact getContactById(Id contactId) {
        return [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE Id = :contactId LIMIT 1];
    }

    public static void updateContactEmail(Id contactId, String newEmail) {
        Contact c = new Contact(Id = contactId, Email = newEmail);
        update c;
    }

    public static void deleteContact(Id contactId) {
        Contact c = new Contact(Id = contactId);
        delete c;
    }

    public static List<Contact> getContactsByLastName(String lastName) {
        return [SELECT Id, FirstName, LastName, Email FROM Contact WHERE LastName = :lastName ORDER BY FirstName ASC];
    }
}
