public with sharing class CollectionUtils {

    public static Set<String> retrieveValuesByField(List<SObject> collection, SObjectField field) {
        Set<String> result = new Set<String>();

        if (collection == null) {
            return result;
        }

        for (SObject sobj : collection) {
            result.add((String) sobj.get(field));
        }

        return result;
    }
}