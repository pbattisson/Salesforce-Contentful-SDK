@isTest
private class ContentfulRequestTestMVN {
	
	@isTest
  private static void testInstantiateNoParams() {
    Contentful_Settings_MVN__c settings = new Contentful_Settings_MVN__c();
    settings.API_Key_MVN__c = 'TEST_KEY';
    settings.Endpoint_MVN__c = 'http://contentful.com/';
    settings.Space_Id_MVN__c = 'spacedid';
    insert settings;

	ContentfulRequestMVN contentfulReq = new ContentfulRequestMVN();
    HttpRequest req = contentfulReq.getHttpRequest();

    System.assertEquals('http://contentful.com/spacedid/entries?access_token=TEST_KEY', req.getEndpoint());
	}

	@isTest
  private static void testInstantiateWithParams() {
    Contentful_Settings_MVN__c settings = new Contentful_Settings_MVN__c();
    settings.API_Key_MVN__c = 'TEST_KEY';
    settings.Endpoint_MVN__c = 'http://contentful.com/';
    settings.Space_Id_MVN__c = 'spacedid';
    insert settings;

    Map<String, String> params = new Map<String, String>();
    params.put('param1', 'value1');
    params.put('param2', 'value2');

    ContentfulRequestMVN contentfulReq = new ContentfulRequestMVN(params);
    HttpRequest req = contentfulReq.getHttpRequest();

    System.assertEquals('http://contentful.com/spacedid/entries?param1=value1&param2=value2&access_token=TEST_KEY', req.getEndpoint());
  }

  @isTest
  private static void testAddParams() {
    Contentful_Settings_MVN__c settings = new Contentful_Settings_MVN__c();
    settings.API_Key_MVN__c = 'TEST_KEY';
    settings.Endpoint_MVN__c = 'http://contentful.com/';
    settings.Space_Id_MVN__c = 'spacedid';
    insert settings;

    Map<String, String> params = new Map<String, String>();
    params.put('param1', 'value1');
    params.put('param2', 'value2');

    ContentfulRequestMVN contentfulReq = new ContentfulRequestMVN();
    contentfulReq.addParameters(params);
    HttpRequest req = contentfulReq.getHttpRequest();

    System.assertEquals('http://contentful.com/spacedid/entries?param1=value1&param2=value2&access_token=TEST_KEY', req.getEndpoint());
  }

  @isTest
  private static void testAddFields() {
    Contentful_Settings_MVN__c settings = new Contentful_Settings_MVN__c();
    settings.API_Key_MVN__c = 'TEST_KEY';
    settings.Endpoint_MVN__c = 'http://contentful.com/';
    settings.Space_Id_MVN__c = 'spacedid';
    insert settings;

    Map<String, String> params = new Map<String, String>();
    params.put('param1', 'value1');
    params.put('param2', 'value2');

    ContentfulRequestMVN contentfulReq = new ContentfulRequestMVN();
    contentfulReq.addFields(params);
    HttpRequest req = contentfulReq.getHttpRequest();

    System.assertEquals('http://contentful.com/spacedid/entries?fields.param1=value1&fields.param2=value2&access_token=TEST_KEY', req.getEndpoint());
  }
}