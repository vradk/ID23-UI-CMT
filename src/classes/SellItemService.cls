public with sharing class SellItemService {

    public void calculatePricesForGivenItems(final List<Sell_Item__c> sellItems) {
        Map<String, IPriceCalculatorService> services = new PriceCalculatorInjector().getPriceCalculators();

        for (Sell_Item__c sellItem : sellItems) {
            IPriceCalculatorService priceService = services.containsKey(sellItem.Price_Type__c)
                ? services.get(sellItem.Price_Type__c)
                : services.get('Default');

            if (null == priceService) {
                throw new SellItemServiceException('Price Calculator was not found!');
            }
            priceService.calculatePrice(sellItem);
        }
    }

    public class SellItemServiceException extends Exception {}
}