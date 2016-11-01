/*  ContentfulUtilityMVN
*
* Created By:  Jeremy Hayes
* Created Date: November 9th 2015 
* Description:  Methods to interact with Contentful resources.
*/
global class ContentfulUtilityMVN {

    public class ContententfulUtilityException extends Exception {}

    /* All methods bellow use the Contentful Delivery API */
    /*
    * Fetches entries with assets by entry id
    */
    public static ContentfulResponseMVN getEntryById(String entryId, String locale) {

        if(entryId == null  || String.isBlank(entryId)) {
            throw new ContententfulUtilityException(Label.EntryIdMustBeProvided);
        }

        if(locale == null  || String.isBlank(locale)) {
            throw new ContententfulUtilityException(Label.LocaleMustBeProvided);
        }

        Map<String, String> params = new Map<String, String>();
        params.put('sys.id', entryId);
        params.put('locale', locale);
        params.put('include', '3');

        ContentfulRequestMVN request = new ContentfulRequestMVN(params);
        return sendContentfulRequest(request);
    }

    /*
    * Performs callout and returns parsed response
    */
    public static ContentfulResponseMVN sendContentfulRequest(ContentfulRequestMVN request) {
        ContentfulResponseMVN response;
        try {
            Http http = new Http();
            HttpRequest req = request.getHttpRequest();
            HttpResponse res = http.send(req);
            response = new ContentfulResponseMVN(res.getBody());
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, e);
            System.debug(LoggingLevel.ERROR, e.getStackTraceString());
        }
        return response;
    }

    /*
    * Downloads HTML blocks and returns them mapped from Asset Id to HTML body
    */
    public static Map<String, String> getHtmlForAssets(Set<String> assetIds, List<ContentfulEntryMVN.Asset> assets) {
        Map<String, String> assetIdToUrl = new Map<String, String>();
        Map<String, String> assetIdToHTMLBody = new Map<String, String>();
        for (ContentfulEntryMVN.Asset a : assets) {
            if (assetIds.contains(a.sys.id)) {
                String url = 'https:'+a.fields.file.url;
                assetIdToUrl.put(a.sys.id, url);
            }
        }

        Http h = new Http();
        HttpRequest req;
        HttpResponse res;

        for (String s : assetIdToUrl.keySet()) {
            req = new HttpRequest();
            req.setEndpoint(assetIdToUrl.get(s));
            req.setMethod('GET');
            res = h.send(req);
            assetIdToHTMLBody.put(s, res.getBody());
        }
        return assetIdToHTMLBody;
    }

}