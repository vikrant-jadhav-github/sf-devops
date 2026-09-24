@isTest
private class ContactValidationTest {

    @isTest
    static void testValidEmail() {
        Boolean result = ContactValidation.validateEmail('test@example.com');
        System.assertEquals(true, result, 'Valid email should return true');
    }

    @isTest
    static void testEmailWithoutAtSign() {
        Boolean result = ContactValidation.validateEmail('invalidemail.com');
        System.assertEquals(false, result, 'Email without @ should return false');
    }

    @isTest
    static void testNullEmail() {
        Boolean result = ContactValidation.validateEmail(null);
        System.assertEquals(false, result, 'Null email should return false');
    }
}
