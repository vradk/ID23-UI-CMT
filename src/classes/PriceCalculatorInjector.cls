public with sharing class PriceCalculatorInjector {

    public Map<String, IPriceCalculatorService> getPriceCalculators() {
        Map<String, IPriceCalculatorService> priceCalculators = new Map<String, IPriceCalculatorService>();

        List<DI_Setting__mdt> priceCalculatorsSettings = DISettingSelector.selector.getActiveSettingsByEntities(
            new Set<String> {'SellItemPriceCalculator'}
        );
        Map<String, String> classMappings = getMappingsForDISettings(priceCalculatorsSettings);

        for (String classKey: classMappings.keySet()) {
            priceCalculators.put(classKey, (IPriceCalculatorService)Type.forName(classMappings.get(classKey)).newInstance());
        }

        return priceCalculators;
    }

    private Map<String, String> getMappingsForDISettings(final List<DI_Setting__mdt> priceCalculatorsSettings) {
        Map<String, String> classMappings = new Map<String, String>();

        for (DI_Setting__mdt settings: priceCalculatorsSettings) {
            classMappings.put(settings.Key__c, settings.Value__c);
        }

        return classMappings;
    }
}