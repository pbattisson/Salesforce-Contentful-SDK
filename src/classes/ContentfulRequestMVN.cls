/*
* ContentfulRequestMVN
* Created By:    Joseph Ferraro, Paul Battisson
* Created Date:  December 9th 2015
* Description:   Parser for the Contentful entry response returned when querying the content delivery API
*/
public class ContentfulRequestMVN {

    private Map<String,String> parameters { get; private set; }

    /**
    * Constructor
    * @return instance of ContentfulRequestMVN
    */
    public ContentfulRequestMVN() {
        parameters = new Map<String,String>();
    }

    /**
    * Constructor
    * @param  params - Map of parameters for the query
    * @return instance of ContentfulRequestMVN
    */
    public ContentfulRequestMVN(Map<String,String> params) {
        this();
        parameters.putAll(params);
    }

    /**
    * Method to add fields for our query
    * @param  fields - Map of fields for the query
    */
    public void addFields(Map<String,String> fields) {
        for (String field : fields.keySet()) {
            parameters.put('fields.' + field, fields.get(field));
        }
    }

    /**
    * Method to add fields for our query
    * @param  params - Map of parameters for the query
    */
    public void addParameters(Map<String,String> params) {
        parameters.putAll(params);
    }

    /**
    * Method to retrieve constructed HTTP Request
    * @return HTTP Request for calling to Contentful
    */
    public HttpRequest getHttpRequest() {
        Contentful_Settings_MVN__c settings = Contentful_Settings_MVN__c.getInstance();
        parameters.put('access_token', settings.API_Key_MVN__c);
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');

        String requestString = settings.Endpoint_MVN__c + settings.Space_Id_MVN__c + '/entries' + '?';
        String paramString = '';
        for (String param : parameters.keySet()) {
            paramString += ('&' + param + '=' + EncodingUtil.urlEncode(parameters.get(param), 'UTF-8'));
        }
        request.setEndpoint(requestString + paramString.removeStart('&'));

        return request;
    }
}