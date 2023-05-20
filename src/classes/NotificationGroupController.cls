public without sharing class NotificationGroupController {

    @AuraEnabled
    public static List<NotificationMessage__mdt> getNotificationMessages(final String notificationPage) {
        return NotificationMessageSelector.selector.getMessagesByPageName(new Set<String> {notificationPage}, Datetime.now());
    }
}