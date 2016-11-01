@isTest
private class ContentfulUtilityTestMVN {

    static {
        Contentful_Settings_MVN__c settings = new Contentful_Settings_MVN__c();
        settings.API_Key_MVN__c = 'TEST_KEY';
        settings.Endpoint_MVN__c = 'http://contentful.com/';
        settings.Space_Id_MVN__c = 'spacedid';
        insert settings;
    }
    
    @isTest 
    private static void testErrorNullEntryId() {
        try {
            ContentfulResponseMVN resp = ContentfulUtilityMVN.getEntryById(null, 'en-US');
            System.assert(false, 'Should have thrown an error');
        } catch (ContentfulUtilityMVN.ContententfulUtilityException ex) {
            System.assertEquals(Label.EntryIdMustBeProvided, ex.getMessage(), 'Incorrect error message');
        }
    }

    @isTest 
    private static void testErrorBlankEntryId() {
        try {
            ContentfulResponseMVN resp = ContentfulUtilityMVN.getEntryById('', 'en-US');
            System.assert(false, 'Should have thrown an error');
        } catch (ContentfulUtilityMVN.ContententfulUtilityException ex) {
            System.assertEquals(Label.EntryIdMustBeProvided, ex.getMessage(), 'Incorrect error message');
        }
    }

    @isTest 
    private static void testErrorNullLocale() {
        try {
            ContentfulResponseMVN resp = ContentfulUtilityMVN.getEntryById('testId', null);
            System.assert(false, 'Should have thrown an error');
        } catch (ContentfulUtilityMVN.ContententfulUtilityException ex) {
            System.assertEquals(Label.LocaleMustBeProvided, ex.getMessage(), 'Incorrect error message');
        }
    }

    @isTest 
    private static void testErrorBlankLocale() {
        try {
            ContentfulResponseMVN resp = ContentfulUtilityMVN.getEntryById('testId', '');
            System.assert(false, 'Should have thrown an error');
        } catch (ContentfulUtilityMVN.ContententfulUtilityException ex) {
            System.assertEquals(Label.LocaleMustBeProvided, ex.getMessage(), 'Incorrect error message');
        }
    }

    @isTest
    private static void testSendRequestNoError() {

        //String jsonResponse = '{"sys":{"type":"Array"},"total":1,"skip":0,"limit":100,"items":[{"sys":{"space":{"sys":{"type":"Link","linkType":"Space","id":"glvfzoppj8gr"}},"type":"Entry","contentType":{"sys":{"type":"Link","linkType":"ContentType","id":"6Rv9J0E95SmOkGiqyqw6IW"}},"id":"3Z6Th9bct2waYeKkWy8g82","revision":5,"createdAt":"2015-11-09T18:55:45.349Z","updatedAt":"2015-11-10T19:33:48.358Z","locale":"en-US"},"fields":{"title":"CholeCap - Base Template","siteId":"SID-0000003","stylesheet":{"sys":{"type":"Link","linkType":"Asset","id":"5JoD8IbDeo4CKmUkucIKIM"}},"bodyClassName":"zecuity","navigation":{"sys":{"type":"Link","linkType":"Entry","id":"75DRf5MJX2qwOSsW0CWg0C"}},"legalHtml":{"sys":{"type":"Link","linkType":"Asset","id":"HhSyhaX0KQqOAUYoi8maM"}},"footer":{"sys":{"type":"Link","linkType":"Entry","id":"COWeYQrBsWIuu4CGwMu0w"}}}}],"includes":{"Entry":[{"sys":{"space":{"sys":{"type":"Link","linkType":"Space","id":"glvfzoppj8gr"}},"type":"Entry","contentType":{"sys":{"type":"Link","linkType":"ContentType","id":"5fBVdLRru0Mq8Wm0gIOWuM"}},"id":"5dtZUHp9AsUMo2Kme8EymY","revision":3,"createdAt":"2015-11-09T18:52:52.509Z","updatedAt":"2015-11-10T19:34:29.945Z","locale":"en-US"},"fields":{"title":"CholeCap - Important Safety Information","siteId":"SID-0000003","label":"Important Safety Information","order":0,"url":"#isi-panel","iconClass":"fa-exclamation-triangle safety-icon"}},{"sys":{"space":{"sys":{"type":"Link","linkType":"Space","id":"glvfzoppj8gr"}},"type":"Entry","contentType":{"sys":{"type":"Link","linkType":"ContentType","id":"2kLv0lhAMAQCm8SiK4IKS4"}},"id":"75DRf5MJX2qwOSsW0CWg0C","revision":7,"createdAt":"2015-11-09T18:54:09.839Z","updatedAt":"2015-11-10T23:11:39.401Z","locale":"en-US"},"fields":{"title":"CholeCap - Navigation","siteId":"SID-0000003","className":"zecuity-nav","logo":{"sys":{"type":"Link","linkType":"Asset","id":"2kzZy1aFxammAqWQWCCMae"}},"backgroundImage":null,"menuItems":[{"sys":{"type":"Link","linkType":"Entry","id":"5dtZUHp9AsUMo2Kme8EymY"}}],"backgroundColor":"#7F6EA6"}},{"sys":{"space":{"sys":{"type":"Link","linkType":"Space","id":"glvfzoppj8gr"}},"type":"Entry","contentType":{"sys":{"type":"Link","linkType":"ContentType","id":"2WhdxnOuAEIg8OqmqKgYUK"}},"id":"COWeYQrBsWIuu4CGwMu0w","revision":5,"createdAt":"2015-11-09T18:46:33.251Z","updatedAt":"2015-11-10T19:33:37.292Z","locale":"en-US"},"fields":{"title":"CholeCap - Footer","logo":{"sys":{"type":"Link","linkType":"Asset","id":"2kzZy1aFxammAqWQWCCMae"}},"backgroundColor":"#7F6EA6","backgroundImage":null,"footerText":"© 2015 Verteo Biopharma Inc. All rights reserved. August 2015"}}],"Asset":[{"fields":{"file":{"fileName":"Cholecap Logo.png","contentType":"image/png","details":{"image":{"width":260,"height":130},"size":10472},"url":"//images.contentful.com/glvfzoppj8gr/2kzZy1aFxammAqWQWCCMae/987d91330908d75a66fa28da731c9768/Cholecap_Logo.png"},"title":"Cholecap Logo"},"sys":{"space":{"sys":{"type":"Link","linkType":"Space","id":"glvfzoppj8gr"}},"type":"Asset","id":"2kzZy1aFxammAqWQWCCMae","revision":2,"createdAt":"2015-11-09T20:46:11.525Z","updatedAt":"2015-11-09T21:05:43.332Z","locale":"en-US"}},{"fields":{"file":{"fileName":"colecap.css","contentType":"text/css","details":{"size":8155},"url":"//assets.contentful.com/glvfzoppj8gr/5JoD8IbDeo4CKmUkucIKIM/d716e397b4654ac913f712e77371671f/colecap.css"},"title":"colecap","description":"CSS for Colecap"},"sys":{"space":{"sys":{"type":"Link","linkType":"Space","id":"glvfzoppj8gr"}},"type":"Asset","id":"5JoD8IbDeo4CKmUkucIKIM","revision":4,"createdAt":"2015-11-09T21:18:43.993Z","updatedAt":"2015-11-10T23:08:14.925Z","locale":"en-US"}},{"fields":{"file":{"fileName":"legal-colocap.html","contentType":"text/html","details":{"size":1624},"url":"//assets.contentful.com/glvfzoppj8gr/HhSyhaX0KQqOAUYoi8maM/8ff9cf76e245afc2a48dec4fecc26638/legal-colocap.html"},"title":"legal-colocap"},"sys":{"space":{"sys":{"type":"Link","linkType":"Space","id":"glvfzoppj8gr"}},"type":"Asset","id":"HhSyhaX0KQqOAUYoi8maM","revision":3,"createdAt":"2015-11-09T21:25:16.522Z","updatedAt":"2015-12-08T19:15:12.084Z","locale":"en-US"}}]}}09:51:34.119(119982652)|USER_DEBUG|[122]|DEBUG|{"title":"CholeCap - Base Template","siteId":"SID-0000003","stylesheet":{"sys":{"type":"Link","linkType":"Asset","id":"5JoD8IbDeo4CKmUkucIKIM"}},"bodyClassName":"zecuity","navigation":{"sys":{"type":"Link","linkType":"Entry","id":"75DRf5MJX2qwOSsW0CWg0C"}},"legalHtml":{"sys":{"type":"Link","linkType":"Asset","id":"HhSyhaX0KQqOAUYoi8maM"}},"footer":{"sys":{"type":"Link","linkType":"Entry","id":"COWeYQrBsWIuu4CGwMu0w"}}}';

        ContentfulCalloutMockMVN mock = new ContentfulCalloutMockMVN(200, 'success', null);

        Test.setMock(HttpCalloutMock.class, mock);

        Test.startTest();

        ContentfulResponseMVN resp = ContentfulUtilityMVN.getEntryById('21xcifGVeMIkKc0owaIisk', 'en-US');

    }

    @isTest
    private static void testSendRequestError() {

        ContentfulCalloutMockMVN mock = new ContentfulCalloutMockMVN(200, 'error', null);

        Test.setMock(HttpCalloutMock.class, mock);

        Test.startTest();

        ContentfulResponseMVN resp = ContentfulUtilityMVN.getEntryById('21xcifGVeMIkKc0owaIisk', 'en-US');
    }

    @isTest
    private static void testGetHTMLForAssets() {

        //String assetString = '{"fields":{"title":"Nyan Cat","file":{"contentType":"image/png","fileName":"Nyan_cat_250px_frame.png","upload":"//images.contentful.com/cfexampleapi/4gp6taAwW4CmSgumq2ekUm/9da0cd1936871b8d72343e895a00d611/Nyan_cat_250px_frame.png","details":{"image":{"width":250,"height":250},"size":12273}}},"sys":{"id":"nyancat","type":"Asset","space":{"sys":{"type":"Link","linkType":"Space","id":"5smsq22uwt4m"}},"createdAt":"2015-05-18T11:29:46.809Z","updatedAt":"2015-05-18T11:29:46.809Z","locale":"en-US","revision":1}}';
        ContentfulCalloutMockMVN mock = new ContentfulCalloutMockMVN(200, 'success', null);

        ContentfulEntryMVN ce = ContentfulEntryMVN.parse(mock.getResponseByEntryId('65x0bwNBSwQcWkiKQyAgSS'));
        List<ContentfulEntryMVN.Asset> assets = ce.includes.Asset;
        Set<String> assetIds = new Set<String> { assets[0].sys.id };

        Test.setMock(HttpCalloutMock.class, mock);

        Test.startTest();

        Map<String, String> resp = ContentfulUtilityMVN.getHtmlForAssets(assetIds, assets);

        //System.assertEquals(mock.getHTMLAsset(), resp.get('nyancat'));
    }
}