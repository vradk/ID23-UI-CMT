public with sharing class DirectPriceCalculator implements IPriceCalculatorService{

    public void calculatePrice(final Sell_Item__c sellItem) {
        if (null == sellItem?.Initial_Cost__c) {
            sellItem.Initial_Cost__c.addError('Cannot be blank during Direct Price Calculation!');

        } else {
            sellItem.Price__c = sellItem.Initial_Cost__c * 1.1;
        }
    }
}