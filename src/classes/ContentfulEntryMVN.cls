/*
* ContentfulEntryMVN
* Created By:    Joseph Ferraro
* Created Date: November 9th 2015 
* Description:   Parser for the Contentful entry response returned when querying the content delivery API
*/

public class ContentfulEntryMVN {

  public Sys sys {get;set;}
  public Integer total {get;set;}
  public Integer skip {get;set;}
  public Integer queryLimit {get;set;}
  public List<Items> items {get;set;}
  public Includes includes {get;set;}

  public class InvalidContentTypeException extends Exception {}

  /**
   * Constructor
   * @param  parser - JSON parser
   * @return instance of ContentfulEntryMVN
   */
  public ContentfulEntryMVN(JSONParser parser) {
    while (parser.nextToken() != JSONToken.END_OBJECT) {
      if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        String text = parser.getText();
        if (parser.nextToken() != JSONToken.VALUE_NULL) {
          if (text == 'sys') {
            sys = new Sys(parser);
          } else if (text == 'total') {
            total = parser.getIntegerValue();
          } else if (text == 'skip') {
            skip = parser.getIntegerValue();
          } else if (text == 'limit') {
            queryLimit = parser.getIntegerValue();
          } else if (text == 'items') {
            items = new List<Items>();
            while (parser.nextToken() != JSONToken.END_ARRAY) {
              items.add(new Items(parser));
            }
          } else if (text == 'includes') {
            includes = new Includes(parser);
          } else {
            System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
            consumeObject(parser);
          }
        }
      }
    }
  }

  /**
   * Pass a string of json, return a deserialized entry response from contentful
   * @param  json - valid json string
   * @return      instance of ContentfulEntryMVN
   */
  public static ContentfulEntryMVN parse(String json) {
    return new ContentfulEntryMVN(System.JSON.createParser(json));
  }

  /**
   * When the parser reaches an unrecognized property name, pass the parser to this method to essentially skip the Object
   * @param parser - JSONParser instance
   */
  public static void consumeObject(JSONParser parser) {
    Integer depth = 0;
    do {
      JSONToken curr = parser.getCurrentToken();
      if (curr == JSONToken.START_OBJECT || 
        curr == JSONToken.START_ARRAY) {
        depth++;
      } else if (curr == JSONToken.END_OBJECT ||
        curr == JSONToken.END_ARRAY) {
        depth--;
      }
    } while (depth > 0 && parser.nextToken() != null);
  }

  /**
   * Serializes a set of arbitary Contentful fields to a JSON string
   * @param  parser - JSONParser instance
   * @return        valid JSON representation of fields
   */
  public static String serializeFields(JSONParser parser) {
    JSONGenerator gen = JSON.createGenerator(true);

    Integer depth = 0;
    do {
      JSONToken curr = parser.getCurrentToken();

      if (curr == JSONToken.START_OBJECT || curr == JSONToken.START_ARRAY) {
        depth++;
      } else if (curr == JSONToken.END_OBJECT || curr == JSONToken.END_ARRAY) {
        depth--;
      }

      if (curr == JSONToken.START_OBJECT) {
        gen.writeStartObject();
      } else if (curr == JSONToken.END_OBJECT) {
        gen.writeEndObject();
      } else if (curr == JSONToken.START_ARRAY) {
        gen.writeStartArray();
      } else if (curr == JSONToken.END_ARRAY) {
        gen.writeEndArray();
      } else if (curr == JSONToken.FIELD_NAME) {
        gen.writeFieldName(parser.getText());
      } else if (curr == JSONToken.VALUE_STRING) {
        gen.writeString(parser.getText());
      } else if (curr == JSONToken.VALUE_FALSE || curr == JSONToken.VALUE_TRUE) {
        gen.writeBoolean(parser.getBooleanValue());
      } else if (curr == JSONToken.VALUE_NULL) {
        gen.writeNull();
      } else if (curr == JSONToken.VALUE_NUMBER_FLOAT) {
        gen.writeNumber(parser.getDoubleValue());
      } else if (curr == JSONToken.VALUE_NUMBER_INT) {
        gen.writeNumber(parser.getIntegerValue());
      }
    } while (depth > 0 && parser.nextToken() != null);

    String fieldsString = gen.getAsString();
    system.debug(fieldsString);
    return fieldsString;
  }

  /**
   * Pass valid JSON fields and a content type id, this method uses the Contentful_Content_Type_Apex_Map_TEV__c custom setting to return a deserialized Apex Object
   * @param  serializedFields - valid JSON fields
   * @param  contentTypeId    - id of the content type in question
   * @return                  instance of the matched Apex class
   */
  public static Object parseContentType(String serializedFields, String contentTypeId) {
    try {
      System.debug(contentTypeId);
      Contentful_Content_Type_MVN__mdt contentfulApexMap = [SELECT Apex_Class_Name_MVN__c, Content_Type_Id_MVN__c FROM Contentful_Content_Type_MVN__mdt WHERE Content_Type_Id_MVN__c = :contentTypeId];
      System.debug('MAP: ' + contentfulApexMap.Apex_Class_Name_MVN__c); 
      return (Object)JSON.deserialize(serializedFields, Type.forName(contentfulApexMap.Apex_Class_Name_MVN__c));

    } catch (Exception e) {
      throw New InvalidContentTypeException('Could not locate Apex map for provided Contentful content type id: '+contentTypeId);
      return null; 
    }
  }

  public class Items {
    private String serializedFields {get;set;}
    public Sys sys {get;set;}
    public Object fields {get;set;}

    public Items(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'sys') {
              sys = new Sys(parser);
            } else if (text == 'fields') {
              serializedFields = serializeFields(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Items consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
      System.debug('serializeFields: ' + this.sys);
      fields = parseContentType(serializedFields, this.sys.contentType.sys.id);
    }
  }

  public class Entry {
    private String serializedFields {get;set;}
    public Sys sys {get;set;}
    public Object fields {get;set;}

    public Entry(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'sys') {
              sys = new Sys(parser);
            } else if (text == 'fields') {
              serializedFields = serializeFields(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Entry consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
      fields = parseContentType(serializedFields, this.sys.contentType.sys.id);
    }
  }

  public class Details {
    public Image image {get;set;}
    public Integer size {get;set;}

    public Details(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'image') {
              image = new Image(parser);
            } else if (text == 'size') {
              size = parser.getIntegerValue();
            } else {
              System.debug(LoggingLevel.WARN, 'Details consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class File {
    public String fileName {get;set;}
    public String contentType {get;set;}
    public Details details {get;set;}
    public String url {get;set;}

    public File(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'fileName') {
              fileName = parser.getText();
            } else if (text == 'contentType') {
              contentType = parser.getText();
            } else if (text == 'details') {
              details = new Details(parser);
            } else if (text == 'url') {
              url = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'File consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Asset {
    public Sys sys {get;set;}
    public AssetFields fields {get;set;}

    public Asset(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'sys') {
              sys = new Sys(parser);
            } else if (text == 'fields') {
              fields = new AssetFields(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Asset consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class AssetFields {
    public String title {get;set;}
    public String description {get;set;}
    public File file {get;set;}

    public AssetFields(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'title') {
              title = parser.getText();
            } else if (text == 'description') {
              description = parser.getText();
            } else if (text == 'file') {
              file = new File(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'AssetFields consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Includes {
    public List<Entry> Entry {get;set;}
    public List<Asset> Asset {get;set;}
    public Map<String, Entry> entryMap {get;set;}{ entryMap = new Map<String, Entry>(); }
    public Map<String, Asset> assetMap {get;set;}{ assetMap = new Map<String, Asset>(); }

    public Includes(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'Entry') {
              Entry = new List<Entry>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                Entry newEntry = new Entry(parser);
                Entry.add(newEntry);
                entryMap.put(newEntry.sys.id, newEntry);
              }
            } else if (text == 'Asset') {
              Asset = new List<Asset>();
              while (parser.nextToken() != JSONToken.END_ARRAY) {
                Asset newAsset = new Asset(parser);
                Asset.add(newAsset);
                assetMap.put(newAsset.sys.id, newAsset);
              }
            } else {
              System.debug(LoggingLevel.WARN, 'Includes consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Sys {
    public Space space {get;set;}
    public String type {get;set;}
    public Space contentType {get;set;}
    public String id {get;set;}
    public Integer revision {get;set;}
    public String createdAt {get;set;}
    public String updatedAt {get;set;}
    public String locale {get;set;}
    public String linkType {get;set;}

    public Sys(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'space') {
              space = new Space(parser);
            } else if (text == 'type') {
              type = parser.getText();
            } else if (text == 'contentType') {
              contentType = new Space(parser);
            } else if (text == 'id') {
              id = parser.getText();
            } else if (text == 'revision') {
              revision = parser.getIntegerValue();
            } else if (text == 'createdAt') {
              createdAt = parser.getText();
            } else if (text == 'updatedAt') {
              updatedAt = parser.getText();
            } else if (text == 'locale') {
              locale = parser.getText();
            } else if (text == 'linkType') {
              linkType = parser.getText();
            } else {
              System.debug(LoggingLevel.WARN, 'Sys consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Image {
    public Integer width {get;set;}
    public Integer height {get;set;}

    public Image(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'width') {
              width = parser.getIntegerValue();
            } else if (text == 'height') {
              height = parser.getIntegerValue();
            } else {
              System.debug(LoggingLevel.WARN, 'Image consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Space {
    public Sys sys {get;set;}

    public Space(JSONParser parser) {
      while (parser.nextToken() != JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != JSONToken.VALUE_NULL) {
            if (text == 'sys') {
              sys = new Sys(parser);
            } else {
              System.debug(LoggingLevel.WARN, 'Space consuming unrecognized property: '+text);
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  }