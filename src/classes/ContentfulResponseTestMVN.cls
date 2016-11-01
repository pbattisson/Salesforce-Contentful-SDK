@isTest
private class ContentfulResponseTestMVN {
	
	@isTest 
  private static void testInstantiateNoError() {
    String jsonInput = '{"sys":{"id" : "testId"}}';
		ContentfulResponseMVN response = new ContentfulResponseMVN(jsonInput);
    System.assertEquals('testId', response.entry.sys.id);
	}

  @isTest 
  private static void testInstantiateError() {
    String jsonInput = '{"sys": { "type": "Array" },"skip": 0,"limit": 100,"total": 1256,"items": [ {"fields":{"title":{"en-US":"Hello,World!"},"body":{"en-US":"Baconishealthy!"}},"sys":{"id":"helloworld","type":"Entry","version":1,"space":{"sys":{"type":"Link","linkType":"Space","id":"5smsq22uwt4m"}},"contentType":{"sys":{"type":"Link","linkType":"ContentType","id":"hfM9RCJIk0wIm06WkEOQY"}},"createdA":"2015-05-18T11:29:46.809Z","updatedAt":"201505-18T11:29:46.809Z","locale":"en-US","revision":1}} ]}';
    try {
      ContentfulResponseMVN response = new ContentfulResponseMVN(jsonInput);  
      System.assert(false, 'We should have received an error');
    } catch(Exception ex) {
      System.assertEquals('Unable to parse Contentful response', ex.getMessage(), 'Incorrect error message returned');
    } 
  }
	
}