public with sharing class ContactValidation {
    public static Boolean validateEmail(String email) {
        return email != null && email.contains('@');
    }
}
