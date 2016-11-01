/*
* ContentfulEntryTestMVN
* 
* Created By:   Paul Battisson 
* Created Date: March 10th 2016
* Description:  This is the test class for the ContentfulEntryMVN class (and also covers the ContentfulResponseMVN class).
*/
@isTest
private class ContentfulEntryTestMVN {

    static void checkJSONDeserialized(ContentfulEntryMVN entry) {
        System.assert(entry.sys != null);
        System.assert(entry.total != null);
        System.assert(entry.skip != null);
        System.assert(entry.queryLimit != null);
        System.assert(!entry.items.isEmpty());
        System.assert(entry.includes != null);
    }

    static void checkIsBaseTemplate(ContentfulEntryMVN entry) {
        System.assert(entry.items[0].fields instanceof ContentfulContentTypeMVN.BaseTemplate);

        ContentfulContentTypeMVN.BaseTemplate baseTemplate = (ContentfulContentTypeMVN.BaseTemplate)entry.items[0].fields;
        System.assert(baseTemplate.title != null);
        System.assert(baseTemplate.siteId != null);
        System.assert(baseTemplate.bodyClassName != null);
        System.assert(baseTemplate.navigation != null);

        ContentfulContentTypeMVN.Navigation navigation = null;
        ContentfulContentTypeMVN.Footer footer = null;
        for (ContentfulEntryMVN.Entry e : entry.includes.Entry) {
            if (e.fields instanceof ContentfulContentTypeMVN.Navigation) {
                navigation = (ContentfulContentTypeMVN.Navigation)e.fields;
            } else if (e.fields instanceof ContentfulContentTypeMVN.Footer) {
                footer = (ContentfulContentTypeMVN.Footer)e.fields;
            }
        }

        System.assert(navigation != null, navigation);
        System.assert(navigation.logo != null, navigation.logo);
        System.assert(navigation.siteId != null, navigation.siteId);
        System.assert(navigation.backgroundImage == null, navigation.backgroundImage);
        System.assert(navigation.backgroundColor != null, navigation.backgroundColor);
        System.assert(navigation.className != null, navigation.className);
        System.assert(navigation.title != null, navigation.title);

        System.assert(navigation.menuItems != null);
        System.debug('PAUL::' + entry.includes.entryMap.get(navigation.menuItems[0].sys.id).fields);


        ContentfulContentTypeMVN.MenuItem item = (ContentfulContentTypeMVN.MenuItem)entry.includes.entryMap.get(navigation.menuItems[0].sys.id).fields;
        System.assert(item.siteId != null);
        System.assert(item.label != null);
        System.assert(item.url != null);
        System.assert(item.order != null);
        System.assert(item.title != null);
        System.assert(item.iconClass != null);

        System.assert(footer != null);
        System.assert(footer.title != null);
        System.assert(footer.logo != null);
        System.assert(footer.backgroundColor != null);
        System.assert(footer.backgroundImage == null);
        System.assert(footer.footerText != null);

        System.assert(baseTemplate.legalHtml == null);
        System.assert(baseTemplate.footer != null);               
        System.assert(baseTemplate.stylesheet != null);
    }

    static void checkIsChildTemplate(ContentfulEntryMVN entry) {
        System.assert(entry.items[0].fields instanceof ContentfulContentTypeMVN.ChildTemplate);
        ContentfulContentTypeMVN.ChildTemplate childTemplate = (ContentfulContentTypeMVN.ChildTemplate)entry.items[0].fields;
        System.assert(childTemplate.title != null);
        System.assert(childTemplate.pageTitle != null);
        System.assert(childTemplate.backgroundColor != null);
        System.assert(childTemplate.htmlTop != null);
        System.assert(childTemplate.htmlBottom == null);
        System.assert(childTemplate.promotionalText == null);
        System.assert(childTemplate.promotionalDisclaimer == null);
        
        childTemplate.assets = entry.includes.Asset;
        System.assert(childTemplate.assets != null);
        System.assert(childTemplate.assetIds != null);
        System.assert(childTemplate.htmlMap != null);
        System.assert(childTemplate.htmlTopBody != null);
        System.assert(childTemplate.htmlBottomBody == null);
    }

    @isTest
    private static void testCreateRegistrationTemplate() {
        ContentfulCalloutMockMVN mock = new ContentfulCalloutMockMVN(200, 'success', null);
        Test.setMock(HttpCalloutMock.class, mock);
        ContentfulEntryMVN entry = ContentfulEntryMVN.parse(mock.getResponseByEntryId('6N4eZ50R32W0eAI4QCEQcO'));
        checkJSONDeserialized(entry);
        checkIsChildTemplate(entry);
    }

    @isTest
    private static void testCreateLoginTemplate() {
        ContentfulCalloutMockMVN mock = new ContentfulCalloutMockMVN(200, 'success', null);
        Test.setMock(HttpCalloutMock.class, mock);
        ContentfulEntryMVN entry = ContentfulEntryMVN.parse(mock.getResponseByEntryId('65x0bwNBSwQcWkiKQyAgSS'));
        checkJSONDeserialized(entry);
        checkIsChildTemplate(entry);
    }

    @isTest
    private static void testCreateForgotPasswordTemplate() {
        ContentfulCalloutMockMVN mock = new ContentfulCalloutMockMVN(200, 'success', null);
        Test.setMock(HttpCalloutMock.class, mock);
        ContentfulEntryMVN entry = ContentfulEntryMVN.parse(mock.getResponseByEntryId('1CrMQ5Xg8AkOsCquuGSWKw'));
        checkJSONDeserialized(entry);
        checkIsChildTemplate(entry);
    }

    @isTest
    private static void testCreateSetPasswordTemplate() {
        ContentfulCalloutMockMVN mock = new ContentfulCalloutMockMVN(200, 'success', null);
        Test.setMock(HttpCalloutMock.class, mock);
        ContentfulEntryMVN entry = ContentfulEntryMVN.parse(mock.getResponseByEntryId('1OZToMRyfCeYcEYMoUeawm'));
        checkJSONDeserialized(entry);
        checkIsChildTemplate(entry);
    }

    @isTest
    private static void testCreateBaseTemplate() {
        ContentfulCalloutMockMVN mock = new ContentfulCalloutMockMVN(200, 'success', null);
        ContentfulEntryMVN entry = ContentfulEntryMVN.parse(mock.getResponseByEntryId('6Rv9J0E95SmOkGiqyqw6IW'));
        checkJSONDeserialized(entry);
        checkIsBaseTemplate(entry);
    }

    @isTest
    private static void testCreateProfileTemplate() {
        ContentfulCalloutMockMVN mock = new ContentfulCalloutMockMVN(200, 'success', null);
        Test.setMock(HttpCalloutMock.class, mock);
        ContentfulEntryMVN entry = ContentfulEntryMVN.parse(mock.getResponseByEntryId('21xcifGVeMIkKc0owaIisk'));
        checkJSONDeserialized(entry);
        checkIsChildTemplate(entry);
    }
}