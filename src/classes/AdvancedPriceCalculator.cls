public with sharing class AdvancedPriceCalculator implements IPriceCalculatorService{

    public void calculatePrice(final Sell_Item__c sellItem) {

        Boolean isCheckPassed = true;
        Set<String> fieldsToCheck = new Set<String> {'Parameter_A__c', 'Parameter_B__c', 'Initial_Cost__c'};

        for (String sellItemField : fieldsToCheck) {
            if (null == sellItem.get(sellItemField)) {
                sellItem.addError(sellItemField, 'Cannot be blank during Advanced Price Calculation!');
                isCheckPassed = false;
            }
        }

        if (isCheckPassed) {
            sellItem.Price__c = sellItem.Initial_Cost__c + 0.25 * sellItem.Parameter_A__c + (sellItem.Parameter_A__c * sellItem.Parameter_B__c);
        }
    }
}