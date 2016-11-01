/*  ContentfulResponseMVN
 *
 * Created By:  Jeremy Hayes, Joseph Ferraro, Paul Battisson
 * Created Date: November 9th 2015 
 * Description:  Encapsulates response data from Contentful.
 */
public class ContentfulResponseMVN {

  /**
   * Internal exception class for handling errors.
   */
  public class InvalidContenfulResponseException extends Exception {}

  /**
   * Parsed entry from the JSON returned.
   */
  public ContentfulEntryMVN entry;

  /**
   * Constructor
   * @param jsonInput - the JSON content to be parsed into a ContentfulResponseMVN
   * @return instance of ContentfulResponseMVN
   */
  public ContentfulResponseMVN(String jsonInput) {
    try {
      this.entry = ContentfulEntryMVN.parse(jsonInput);
    } catch(ContentfulEntryMVN.InvalidContentTypeException e) {
      System.debug(LoggingLevel.ERROR, e);
      throw new InvalidContenfulResponseException('Unable to parse Contentful response');
    }
  }
}