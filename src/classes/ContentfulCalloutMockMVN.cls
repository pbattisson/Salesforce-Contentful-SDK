/*
* ContentfulCalloutMockMVN
* 
* Created By:   Paul Battisson 
* Created Date: December 10th 2015
* Description:  This is the mock class for the contentful callouts.
*/
@isTest
public class ContentfulCalloutMockMVN implements HttpCalloutMock {

    protected Integer code;
    protected String status;
    protected String body;
    protected Map<String, String> responseHeaders;

    public ContentfulCalloutMockMVN(Integer code, String status, Map<String, String> responseHeaders) {
        this.code = code;
        this.status = status;
        this.body = body;
        this.responseHeaders = responseHeaders;
    }

    public HTTPResponse respond(HTTPRequest req) {

        PageReference p = new PageReference(req.getEndpoint());
        String contentfulEntryId = p.getParameters().get('sys.id');

        HttpResponse res = new HttpResponse();
        if(responseHeaders != null) {
            for (String key : this.responseHeaders.keySet()) {
                res.setHeader(key, this.responseHeaders.get(key));
            }
        }
        res.setBody(getResponseByEntryId(contentfulEntryId));
        res.setStatusCode(this.code);
        res.setStatus(this.status);
        return res;
    }

    public String getResponseByEntryId(String entryId) {

        String result;
        if (entryId == null) {
          result = getUnknownTemplate();
        } else if (entryId.equalsIgnoreCase('6N4eZ50R32W0eAI4QCEQcO')) {
          result = getRegistrationTemplate();
        } else if (entryId.equalsIgnoreCase('65x0bwNBSwQcWkiKQyAgSS')) {
          result = getLoginTemplate();
        } else if (entryId.equalsIgnoreCase('1CrMQ5Xg8AkOsCquuGSWKw')) {
          result = getForgotPasswordTemplate();
        } else if (entryId.equalsIgnoreCase('1OZToMRyfCeYcEYMoUeawm')) {
          result = getSetPasswordTemplate();
        } else if (entryId.equalsIgnoreCase('6Rv9J0E95SmOkGiqyqw6IW')) {
          result = getIdentityBaseTemplate();
        } else if (entryId.equalsIgnoreCase('21xcifGVeMIkKc0owaIisk')) {
          result = getProfileTemplate();
        } else if (entryId.equalsIgnoreCase('HTMLAsset')) {
          result = getHTMLAsset();
        } else {
          result = getUnknownTemplate();
        }
        return result;
      }

    private String getRegistrationTemplate() { 
        return '{' + 
        '  "sys": {' + 
        '    "type": "Array"' + 
        '  },' + 
        '  "total": 1,' + 
        '  "skip": 0,' + 
        '  "limit": 100,' + 
        '  "items": [' + 
        '    {' + 
        '      "sys": {' + 
        '        "space": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Space",' + 
        '            "id": "ek3t8do0hkga"' + 
        '          }' + 
        '        },' + 
        '        "id": "6mjhuWlAc0CyaamO0egS0y",' + 
        '        "type": "Entry",' + 
        '        "createdAt": "2016-01-19T14:41:00.305Z",' + 
        '        "updatedAt": "2016-01-20T16:45:06.309Z",' + 
        '        "revision": 4,' + 
        '        "contentType": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "ContentType",' + 
        '            "id": "6OdrXoPOLK2Qoe8WC6AwAs"' + 
        '          }' + 
        '        },' + 
        '        "locale": "en-US"' + 
        '      },' + 
        '      "fields": {' + 
        '        "title": "Lilly Identity - Register",' + 
        '        "baseTemplate": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Entry",' + 
        '            "id": "3D9pUQo0BikUoAGMqcYcgM"' + 
        '          }' + 
        '        },' + 
        '        "siteId": "SID-0000003",' + 
        '        "pageTitle": "Lilly Services | Register",' + 
        '        "htmlTop": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Asset",' + 
        '            "id": "40e0UvyuXSIgOuWSWmYgse"' + 
        '          }' + 
        '        },' + 
        '        "backgroundColor": "#efefef"' + 
        '      }' + 
        '    }' + 
        '  ],' + 
        '  "includes": {' + 
        '    "Entry": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "22w41SsqgEs6W8WKak6y2i",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:24:20.548Z",' + 
        '          "updatedAt": "2016-02-11T03:40:35.334Z",' + 
        '          "revision": 2,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Copyright",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Copyright",' + 
        '          "url": "http://lilly.co.uk/en/copyright-information.aspx",' + 
        '          "order": 2,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2A1I84injiOUWEyEUKsksm",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:48:23.838Z",' + 
        '          "updatedAt": "2016-02-10T22:33:17.227Z",' + 
        '          "revision": 7,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2WhdxnOuAEIg8OqmqKgYUK"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Footer",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundColor": "#c00",' + 
        '          "backgroundImage": null,' + 
        '          "footerText": "Â© Eli Lilly 2016. All rights reserved.",' + 
        '          "menuItems": [' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "5qxIsaraJaYiAEKSGoi2w0"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "6GqmIpeCiWgYmQAggC40oG"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "22w41SsqgEs6W8WKak6y2i"' + 
        '              }' + 
        '            }' + 
        '          ]' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2TNZk1MmHKWAYQSsiqsusY",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:44:40.340Z",' + 
        '          "updatedAt": "2016-02-10T22:21:50.040Z",' + 
        '          "revision": 11,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2kLv0lhAMAQCm8SiK4IKS4"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Navigation",' + 
        '          "siteId": "SID-0000003",' + 
        '          "className": "lilly-nav",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundImage": null,' + 
        '          "backgroundColor": "#c00"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "3D9pUQo0BikUoAGMqcYcgM",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:31:19.405Z",' + 
        '          "updatedAt": "2016-01-21T21:20:38.067Z",' + 
        '          "revision": 9,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "6Rv9J0E95SmOkGiqyqw6IW"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Base Template",' + 
        '          "siteId": "SID-0000003",' + 
        '          "stylesheet": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "6QrBAS35F6EMKeguMsmWk8"' + 
        '            }' + 
        '          },' + 
        '          "bodyClassName": "lilly",' + 
        '          "navigation": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Entry",' + 
        '              "id": "2TNZk1MmHKWAYQSsiqsusY"' + 
        '            }' + 
        '          },' + 
        '          "footer": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Entry",' + 
        '              "id": "2A1I84injiOUWEyEUKsksm"' + 
        '            }' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "5qxIsaraJaYiAEKSGoi2w0",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T17:36:06.148Z",' + 
        '          "updatedAt": "2016-02-11T03:40:50.100Z",' + 
        '          "revision": 4,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Terms and Conditions",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Terms & Conditions",' + 
        '          "url": "http://lilly.co.uk/en/terms-and-conditions.aspx",' + 
        '          "order": 0,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6GqmIpeCiWgYmQAggC40oG",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:23:17.373Z",' + 
        '          "updatedAt": "2016-02-11T03:40:06.484Z",' + 
        '          "revision": 3,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Privacy",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Privacy & Cookie Policy",' + 
        '          "url": "http://lilly.co.uk/en/privacy.aspx",' + 
        '          "order": 1,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      }' + 
        '    ],' + 
        '    "Asset": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "13olsIUZ0K286GAcs4a6eK",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-18T20:23:11.924Z",' + 
        '          "updatedAt": "2016-01-18T20:23:11.924Z",' + 
        '          "revision": 1,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Logo",' + 
        '          "file": {' + 
        '            "url": "//images.contentful.com/ek3t8do0hkga/13olsIUZ0K286GAcs4a6eK/cdea1bedb89f944d6fb20767cdf56b91/logo.png",' + 
        '            "details": {' + 
        '              "size": 2539,' + 
        '              "image": {' + 
        '                "width": 59,' + 
        '                "height": 35' + 
        '              }' + 
        '            },' + 
        '            "fileName": "logo.png",' + 
        '            "contentType": "image/png"' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "40e0UvyuXSIgOuWSWmYgse",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-20T16:38:39.165Z",' + 
        '          "updatedAt": "2016-02-11T03:43:53.605Z",' + 
        '          "revision": 13,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "lilly-register-top",' + 
        '          "file": {' + 
        '            "url": "//assets.contentful.com/ek3t8do0hkga/40e0UvyuXSIgOuWSWmYgse/0ad07b5fcafd4a348e9edf9ef8682384/lilly-register-top.html",' + 
        '            "details": {' + 
        '              "size": 1716' + 
        '            },' + 
        '            "fileName": "lilly-register-top.html",' + 
        '            "contentType": "text/html"' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6QrBAS35F6EMKeguMsmWk8",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-20T15:49:13.338Z",' + 
        '          "updatedAt": "2016-02-11T03:41:29.659Z",' + 
        '          "revision": 33,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "lilly.css",' + 
        '          "file": {' + 
        '            "url": "//assets.contentful.com/ek3t8do0hkga/6QrBAS35F6EMKeguMsmWk8/4654136963dd5fd6baa479ec1e69cb30/lilly.css",' + 
        '            "details": {' + 
        '              "size": 13572' + 
        '            },' + 
        '            "fileName": "lilly.css",' + 
        '            "contentType": "text/css"' + 
        '          }' + 
        '        }' + 
        '      }' + 
        '    ]' + 
        '  }' + 
        '}'; 
    }

    private String getLoginTemplate() {
        return '{' + 
        '  "sys": {' + 
        '    "type": "Array"' + 
        '  },' + 
        '  "total": 1,' + 
        '  "skip": 0,' + 
        '  "limit": 100,' + 
        '  "items": [' + 
        '    {' + 
        '      "sys": {' + 
        '        "space": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Space",' + 
        '            "id": "ek3t8do0hkga"' + 
        '          }' + 
        '        },' + 
        '        "id": "2A5sXMRaEIS6aW0qcqmOwW",' + 
        '        "type": "Entry",' + 
        '        "createdAt": "2016-01-18T18:48:31.499Z",' + 
        '        "updatedAt": "2016-01-19T21:55:51.786Z",' + 
        '        "revision": 6,' + 
        '        "contentType": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "ContentType",' + 
        '            "id": "6OdrXoPOLK2Qoe8WC6AwAs"' + 
        '          }' + 
        '        },' + 
        '        "locale": "en-US"' + 
        '      },' + 
        '      "fields": {' + 
        '        "title": "Lilly Identity - Login",' + 
        '        "baseTemplate": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Entry",' + 
        '            "id": "3D9pUQo0BikUoAGMqcYcgM"' + 
        '          }' + 
        '        },' + 
        '        "siteId": "SID-0000003",' + 
        '        "pageTitle": "Login",' + 
        '        "htmlTop": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Asset",' + 
        '            "id": "3HtzWhpWswMMIO6uwaQmqg"' + 
        '          }' + 
        '        },' + 
        '        "backgroundColor": "#efefef"' + 
        '      }' + 
        '    }' + 
        '  ],' + 
        '  "includes": {' + 
        '    "Entry": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "22w41SsqgEs6W8WKak6y2i",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:24:20.548Z",' + 
        '          "updatedAt": "2016-02-11T03:40:35.334Z",' + 
        '          "revision": 2,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Copyright",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Copyright",' + 
        '          "url": "http://lilly.co.uk/en/copyright-information.aspx",' + 
        '          "order": 2,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2A1I84injiOUWEyEUKsksm",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:48:23.838Z",' + 
        '          "updatedAt": "2016-02-10T22:33:17.227Z",' + 
        '          "revision": 7,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2WhdxnOuAEIg8OqmqKgYUK"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Footer",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundColor": "#c00",' + 
        '          "backgroundImage": null,' + 
        '          "footerText": "Â© Eli Lilly 2016. All rights reserved.",' + 
        '          "menuItems": [' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "5qxIsaraJaYiAEKSGoi2w0"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "6GqmIpeCiWgYmQAggC40oG"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "22w41SsqgEs6W8WKak6y2i"' + 
        '              }' + 
        '            }' + 
        '          ]' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2TNZk1MmHKWAYQSsiqsusY",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:44:40.340Z",' + 
        '          "updatedAt": "2016-02-10T22:21:50.040Z",' + 
        '          "revision": 11,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2kLv0lhAMAQCm8SiK4IKS4"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Navigation",' + 
        '          "siteId": "SID-0000003",' + 
        '          "className": "lilly-nav",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundImage": null,' + 
        '          "backgroundColor": "#c00"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "3D9pUQo0BikUoAGMqcYcgM",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:31:19.405Z",' + 
        '          "updatedAt": "2016-01-21T21:20:38.067Z",' + 
        '          "revision": 9,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "6Rv9J0E95SmOkGiqyqw6IW"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Base Template",' + 
        '          "siteId": "SID-0000003",' + 
        '          "stylesheet": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "6QrBAS35F6EMKeguMsmWk8"' + 
        '            }' + 
        '          },' + 
        '          "bodyClassName": "lilly",' + 
        '          "navigation": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Entry",' + 
        '              "id": "2TNZk1MmHKWAYQSsiqsusY"' + 
        '            }' + 
        '          },' + 
        '          "footer": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Entry",' + 
        '              "id": "2A1I84injiOUWEyEUKsksm"' + 
        '            }' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "5qxIsaraJaYiAEKSGoi2w0",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T17:36:06.148Z",' + 
        '          "updatedAt": "2016-02-11T03:40:50.100Z",' + 
        '          "revision": 4,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Terms and Conditions",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Terms & Conditions",' + 
        '          "url": "http://lilly.co.uk/en/terms-and-conditions.aspx",' + 
        '          "order": 0,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6GqmIpeCiWgYmQAggC40oG",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:23:17.373Z",' + 
        '          "updatedAt": "2016-02-11T03:40:06.484Z",' + 
        '          "revision": 3,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Privacy",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Privacy & Cookie Policy",' + 
        '          "url": "http://lilly.co.uk/en/privacy.aspx",' + 
        '          "order": 1,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      }' + 
        '    ],' + 
        '    "Asset": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "13olsIUZ0K286GAcs4a6eK",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-18T20:23:11.924Z",' + 
        '          "updatedAt": "2016-01-18T20:23:11.924Z",' + 
        '          "revision": 1,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Logo",' + 
        '          "file": {' + 
        '            "url": "//images.contentful.com/ek3t8do0hkga/13olsIUZ0K286GAcs4a6eK/cdea1bedb89f944d6fb20767cdf56b91/logo.png",' + 
        '            "details": {' + 
        '              "size": 2539,' + 
        '              "image": {' + 
        '                "width": 59,' + 
        '                "height": 35' + 
        '              }' + 
        '            },' + 
        '            "fileName": "logo.png",' + 
        '            "contentType": "image/png"' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "3HtzWhpWswMMIO6uwaQmqg",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-18T22:22:20.172Z",' + 
        '          "updatedAt": "2016-02-08T19:54:32.129Z",' + 
        '          "revision": 11,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "lilly-login-top",' + 
        '          "file": {' + 
        '            "url": "//assets.contentful.com/ek3t8do0hkga/3HtzWhpWswMMIO6uwaQmqg/70d050e6b82904b49ec0fc47fe21d1c5/lilly-login.html",' + 
        '            "details": {' + 
        '              "size": 1208' + 
        '            },' + 
        '            "fileName": "lilly-login.html",' + 
        '            "contentType": "text/html"' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6QrBAS35F6EMKeguMsmWk8",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-20T15:49:13.338Z",' + 
        '          "updatedAt": "2016-02-11T03:41:29.659Z",' + 
        '          "revision": 33,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "lilly.css",' + 
        '          "file": {' + 
        '            "url": "//assets.contentful.com/ek3t8do0hkga/6QrBAS35F6EMKeguMsmWk8/4654136963dd5fd6baa479ec1e69cb30/lilly.css",' + 
        '            "details": {' + 
        '              "size": 13572' + 
        '            },' + 
        '            "fileName": "lilly.css",' + 
        '            "contentType": "text/css"' + 
        '          }' + 
        '        }' + 
        '      }' + 
        '    ]' + 
        '  }' + 
        '}'; 
    }

    private String getForgotPasswordTemplate() {
        return '{' + 
        '  "sys": {' + 
        '    "type": "Array"' + 
        '  },' + 
        '  "total": 1,' + 
        '  "skip": 0,' + 
        '  "limit": 100,' + 
        '  "items": [' + 
        '    {' + 
        '      "sys": {' + 
        '        "space": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Space",' + 
        '            "id": "ek3t8do0hkga"' + 
        '          }' + 
        '        },' + 
        '        "id": "RQP61bR2q20YSEY46OoAI",' + 
        '        "type": "Entry",' + 
        '        "createdAt": "2016-01-19T14:44:17.229Z",' + 
        '        "updatedAt": "2016-01-21T15:29:08.730Z",' + 
        '        "revision": 3,' + 
        '        "contentType": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "ContentType",' + 
        '            "id": "6OdrXoPOLK2Qoe8WC6AwAs"' + 
        '          }' + 
        '        },' + 
        '        "locale": "en-US"' + 
        '      },' + 
        '      "fields": {' + 
        '        "title": "Lilly Identity - Forgot Password",' + 
        '        "baseTemplate": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Entry",' + 
        '            "id": "3D9pUQo0BikUoAGMqcYcgM"' + 
        '          }' + 
        '        },' + 
        '        "siteId": "SID-0000003",' + 
        '        "pageTitle": "Lilly Services | Forgot Password",' + 
        '        "htmlTop": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Asset",' + 
        '            "id": "3DtECYhPWwuW4U2ySO2mIc"' + 
        '          }' + 
        '        },' + 
        '        "backgroundColor": "#efefef"' + 
        '      }' + 
        '    }' + 
        '  ],' + 
        '  "includes": {' + 
        '    "Entry": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "22w41SsqgEs6W8WKak6y2i",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:24:20.548Z",' + 
        '          "updatedAt": "2016-02-11T03:40:35.334Z",' + 
        '          "revision": 2,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Copyright",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Copyright",' + 
        '          "url": "http://lilly.co.uk/en/copyright-information.aspx",' + 
        '          "order": 2,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2A1I84injiOUWEyEUKsksm",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:48:23.838Z",' + 
        '          "updatedAt": "2016-02-10T22:33:17.227Z",' + 
        '          "revision": 7,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2WhdxnOuAEIg8OqmqKgYUK"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Footer",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundColor": "#c00",' + 
        '          "backgroundImage": null,' + 
        '          "footerText": "Â© Eli Lilly 2016. All rights reserved.",' + 
        '          "menuItems": [' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "5qxIsaraJaYiAEKSGoi2w0"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "6GqmIpeCiWgYmQAggC40oG"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "22w41SsqgEs6W8WKak6y2i"' + 
        '              }' + 
        '            }' + 
        '          ]' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2TNZk1MmHKWAYQSsiqsusY",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:44:40.340Z",' + 
        '          "updatedAt": "2016-02-10T22:21:50.040Z",' + 
        '          "revision": 11,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2kLv0lhAMAQCm8SiK4IKS4"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Navigation",' + 
        '          "siteId": "SID-0000003",' + 
        '          "className": "lilly-nav",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundImage": null,' + 
        '          "backgroundColor": "#c00"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "3D9pUQo0BikUoAGMqcYcgM",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:31:19.405Z",' + 
        '          "updatedAt": "2016-01-21T21:20:38.067Z",' + 
        '          "revision": 9,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "6Rv9J0E95SmOkGiqyqw6IW"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Base Template",' + 
        '          "siteId": "SID-0000003",' + 
        '          "stylesheet": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "6QrBAS35F6EMKeguMsmWk8"' + 
        '            }' + 
        '          },' + 
        '          "bodyClassName": "lilly",' + 
        '          "navigation": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Entry",' + 
        '              "id": "2TNZk1MmHKWAYQSsiqsusY"' + 
        '            }' + 
        '          },' + 
        '          "footer": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Entry",' + 
        '              "id": "2A1I84injiOUWEyEUKsksm"' + 
        '            }' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "5qxIsaraJaYiAEKSGoi2w0",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T17:36:06.148Z",' + 
        '          "updatedAt": "2016-02-11T03:40:50.100Z",' + 
        '          "revision": 4,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Terms and Conditions",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Terms & Conditions",' + 
        '          "url": "http://lilly.co.uk/en/terms-and-conditions.aspx",' + 
        '          "order": 0,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6GqmIpeCiWgYmQAggC40oG",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:23:17.373Z",' + 
        '          "updatedAt": "2016-02-11T03:40:06.484Z",' + 
        '          "revision": 3,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Privacy",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Privacy & Cookie Policy",' + 
        '          "url": "http://lilly.co.uk/en/privacy.aspx",' + 
        '          "order": 1,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      }' + 
        '    ],' + 
        '    "Asset": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "13olsIUZ0K286GAcs4a6eK",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-18T20:23:11.924Z",' + 
        '          "updatedAt": "2016-01-18T20:23:11.924Z",' + 
        '          "revision": 1,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Logo",' + 
        '          "file": {' + 
        '            "url": "//images.contentful.com/ek3t8do0hkga/13olsIUZ0K286GAcs4a6eK/cdea1bedb89f944d6fb20767cdf56b91/logo.png",' + 
        '            "details": {' + 
        '              "size": 2539,' + 
        '              "image": {' + 
        '                "width": 59,' + 
        '                "height": 35' + 
        '              }' + 
        '            },' + 
        '            "fileName": "logo.png",' + 
        '            "contentType": "image/png"' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "3DtECYhPWwuW4U2ySO2mIc",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-21T15:20:27.095Z",' + 
        '          "updatedAt": "2016-02-08T19:53:41.156Z",' + 
        '          "revision": 6,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "lilly-forgot-top",' + 
        '          "file": {' + 
        '            "url": "//assets.contentful.com/ek3t8do0hkga/3DtECYhPWwuW4U2ySO2mIc/27b972a3ec0fcd9545e11b3999b03de7/lilly-forgot-top.html",' + 
        '            "details": {' + 
        '              "size": 1011' + 
        '            },' + 
        '            "fileName": "lilly-forgot-top.html",' + 
        '            "contentType": "text/html"' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6QrBAS35F6EMKeguMsmWk8",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-20T15:49:13.338Z",' + 
        '          "updatedAt": "2016-02-11T03:41:29.659Z",' + 
        '          "revision": 33,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "lilly.css",' + 
        '          "file": {' + 
        '            "url": "//assets.contentful.com/ek3t8do0hkga/6QrBAS35F6EMKeguMsmWk8/4654136963dd5fd6baa479ec1e69cb30/lilly.css",' + 
        '            "details": {' + 
        '              "size": 13572' + 
        '            },' + 
        '            "fileName": "lilly.css",' + 
        '            "contentType": "text/css"' + 
        '          }' + 
        '        }' + 
        '      }' + 
        '    ]' + 
        '  }' + 
        '}'; 
    }

    private String getSetPasswordTemplate() {
        return '{' + 
        '  "sys": {' + 
        '    "type": "Array"' + 
        '  },' + 
        '  "total": 1,' + 
        '  "skip": 0,' + 
        '  "limit": 100,' + 
        '  "items": [' + 
        '    {' + 
        '      "sys": {' + 
        '        "space": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Space",' + 
        '            "id": "ek3t8do0hkga"' + 
        '          }' + 
        '        },' + 
        '        "id": "5RmvmLtYyWiEIGQcUIMK6Q",' + 
        '        "type": "Entry",' + 
        '        "createdAt": "2016-01-19T14:46:10.895Z",' + 
        '        "updatedAt": "2016-01-21T21:20:44.223Z",' + 
        '        "revision": 2,' + 
        '        "contentType": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "ContentType",' + 
        '            "id": "6OdrXoPOLK2Qoe8WC6AwAs"' + 
        '          }' + 
        '        },' + 
        '        "locale": "en-US"' + 
        '      },' + 
        '      "fields": {' + 
        '        "title": "Lilly Identity - Set Password",' + 
        '        "baseTemplate": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Entry",' + 
        '            "id": "3D9pUQo0BikUoAGMqcYcgM"' + 
        '          }' + 
        '        },' + 
        '        "siteId": "SID-0000003",' + 
        '        "pageTitle": "Lilly Services | Set Password",' + 
        '        "htmlTop": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Asset",' + 
        '            "id": "UojDveFfCoq8SmYQqaayG"' + 
        '          }' + 
        '        },' + 
        '        "backgroundColor": "#efefef"' + 
        '      }' + 
        '    }' + 
        '  ],' + 
        '  "includes": {' + 
        '    "Entry": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "22w41SsqgEs6W8WKak6y2i",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:24:20.548Z",' + 
        '          "updatedAt": "2016-02-11T03:40:35.334Z",' + 
        '          "revision": 2,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Copyright",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Copyright",' + 
        '          "url": "http://lilly.co.uk/en/copyright-information.aspx",' + 
        '          "order": 2,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2A1I84injiOUWEyEUKsksm",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:48:23.838Z",' + 
        '          "updatedAt": "2016-02-10T22:33:17.227Z",' + 
        '          "revision": 7,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2WhdxnOuAEIg8OqmqKgYUK"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Footer",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundColor": "#c00",' + 
        '          "backgroundImage": null,' + 
        '          "footerText": "Â© Eli Lilly 2016. All rights reserved.",' + 
        '          "menuItems": [' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "5qxIsaraJaYiAEKSGoi2w0"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "6GqmIpeCiWgYmQAggC40oG"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "22w41SsqgEs6W8WKak6y2i"' + 
        '              }' + 
        '            }' + 
        '          ]' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2TNZk1MmHKWAYQSsiqsusY",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:44:40.340Z",' + 
        '          "updatedAt": "2016-02-10T22:21:50.040Z",' + 
        '          "revision": 11,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2kLv0lhAMAQCm8SiK4IKS4"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Navigation",' + 
        '          "siteId": "SID-0000003",' + 
        '          "className": "lilly-nav",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundImage": null,' + 
        '          "backgroundColor": "#c00"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "3D9pUQo0BikUoAGMqcYcgM",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:31:19.405Z",' + 
        '          "updatedAt": "2016-01-21T21:20:38.067Z",' + 
        '          "revision": 9,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "6Rv9J0E95SmOkGiqyqw6IW"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Base Template",' + 
        '          "siteId": "SID-0000003",' + 
        '          "stylesheet": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "6QrBAS35F6EMKeguMsmWk8"' + 
        '            }' + 
        '          },' + 
        '          "bodyClassName": "lilly",' + 
        '          "navigation": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Entry",' + 
        '              "id": "2TNZk1MmHKWAYQSsiqsusY"' + 
        '            }' + 
        '          },' + 
        '          "footer": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Entry",' + 
        '              "id": "2A1I84injiOUWEyEUKsksm"' + 
        '            }' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "5qxIsaraJaYiAEKSGoi2w0",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T17:36:06.148Z",' + 
        '          "updatedAt": "2016-02-11T03:40:50.100Z",' + 
        '          "revision": 4,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Terms and Conditions",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Terms & Conditions",' + 
        '          "url": "http://lilly.co.uk/en/terms-and-conditions.aspx",' + 
        '          "order": 0,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6GqmIpeCiWgYmQAggC40oG",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:23:17.373Z",' + 
        '          "updatedAt": "2016-02-11T03:40:06.484Z",' + 
        '          "revision": 3,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Privacy",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Privacy & Cookie Policy",' + 
        '          "url": "http://lilly.co.uk/en/privacy.aspx",' + 
        '          "order": 1,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      }' + 
        '    ],' + 
        '    "Asset": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "13olsIUZ0K286GAcs4a6eK",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-18T20:23:11.924Z",' + 
        '          "updatedAt": "2016-01-18T20:23:11.924Z",' + 
        '          "revision": 1,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Logo",' + 
        '          "file": {' + 
        '            "url": "//images.contentful.com/ek3t8do0hkga/13olsIUZ0K286GAcs4a6eK/cdea1bedb89f944d6fb20767cdf56b91/logo.png",' + 
        '            "details": {' + 
        '              "size": 2539,' + 
        '              "image": {' + 
        '                "width": 59,' + 
        '                "height": 35' + 
        '              }' + 
        '            },' + 
        '            "fileName": "logo.png",' + 
        '            "contentType": "image/png"' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6QrBAS35F6EMKeguMsmWk8",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-20T15:49:13.338Z",' + 
        '          "updatedAt": "2016-02-11T03:41:29.659Z",' + 
        '          "revision": 33,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "lilly.css",' + 
        '          "file": {' + 
        '            "url": "//assets.contentful.com/ek3t8do0hkga/6QrBAS35F6EMKeguMsmWk8/4654136963dd5fd6baa479ec1e69cb30/lilly.css",' + 
        '            "details": {' + 
        '              "size": 13572' + 
        '            },' + 
        '            "fileName": "lilly.css",' + 
        '            "contentType": "text/css"' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "UojDveFfCoq8SmYQqaayG",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-21T21:20:21.222Z",' + 
        '          "updatedAt": "2016-02-08T19:00:01.629Z",' + 
        '          "revision": 2,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "lilly-resetpwd-top",' + 
        '          "file": {' + 
        '            "url": "//assets.contentful.com/ek3t8do0hkga/UojDveFfCoq8SmYQqaayG/919bd5b9b11e5ef193617a9491810bf0/lilly-resetpwd-top.html",' + 
        '            "details": {' + 
        '              "size": 252' + 
        '            },' + 
        '            "fileName": "lilly-resetpwd-top.html",' + 
        '            "contentType": "text/html"' + 
        '          }' + 
        '        }' + 
        '      }' + 
        '    ]' + 
        '  }' + 
        '}'; 
    }

    private String getProfileTemplate() {
        return '{' + 
        '  "sys": {' + 
        '    "type": "Array"' + 
        '  },' + 
        '  "total": 1,' + 
        '  "skip": 0,' + 
        '  "limit": 100,' + 
        '  "items": [' + 
        '    {' + 
        '      "sys": {' + 
        '        "space": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Space",' + 
        '            "id": "ek3t8do0hkga"' + 
        '          }' + 
        '        },' + 
        '        "id": "1LuCaiGAgQGUMOAwiw8K8m",' + 
        '        "type": "Entry",' + 
        '        "createdAt": "2016-01-22T16:29:00.963Z",' + 
        '        "updatedAt": "2016-01-22T18:06:50.775Z",' + 
        '        "revision": 2,' + 
        '        "contentType": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "ContentType",' + 
        '            "id": "6OdrXoPOLK2Qoe8WC6AwAs"' + 
        '          }' + 
        '        },' + 
        '        "locale": "en-US"' + 
        '      },' + 
        '      "fields": {' + 
        '        "title": "Lilly Identity - Profile",' + 
        '        "baseTemplate": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Entry",' + 
        '            "id": "3D9pUQo0BikUoAGMqcYcgM"' + 
        '          }' + 
        '        },' + 
        '        "siteId": "SID-0000000",' + 
        '        "pageTitle": "Lilly Services | Profile",' + 
        '        "htmlTop": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Asset",' + 
        '            "id": "1Aek4Xlut2gYO2OIqkA6G0"' + 
        '          }' + 
        '        },' + 
        '        "backgroundColor": "#efefef"' + 
        '      }' + 
        '    }' + 
        '  ],' + 
        '  "includes": {' + 
        '    "Entry": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "22w41SsqgEs6W8WKak6y2i",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:24:20.548Z",' + 
        '          "updatedAt": "2016-02-11T03:40:35.334Z",' + 
        '          "revision": 2,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Copyright",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Copyright",' + 
        '          "url": "http://lilly.co.uk/en/copyright-information.aspx",' + 
        '          "order": 2,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2A1I84injiOUWEyEUKsksm",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:48:23.838Z",' + 
        '          "updatedAt": "2016-02-10T22:33:17.227Z",' + 
        '          "revision": 7,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2WhdxnOuAEIg8OqmqKgYUK"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Footer",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundColor": "#c00",' + 
        '          "backgroundImage": null,' + 
        '          "footerText": "Â© Eli Lilly 2016. All rights reserved.",' + 
        '          "menuItems": [' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "5qxIsaraJaYiAEKSGoi2w0"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "6GqmIpeCiWgYmQAggC40oG"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "22w41SsqgEs6W8WKak6y2i"' + 
        '              }' + 
        '            }' + 
        '          ]' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2TNZk1MmHKWAYQSsiqsusY",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:44:40.340Z",' + 
        '          "updatedAt": "2016-02-10T22:21:50.040Z",' + 
        '          "revision": 11,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2kLv0lhAMAQCm8SiK4IKS4"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Navigation",' + 
        '          "siteId": "SID-0000003",' + 
        '          "className": "lilly-nav",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundImage": null,' + 
        '          "backgroundColor": "#c00"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "3D9pUQo0BikUoAGMqcYcgM",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:31:19.405Z",' + 
        '          "updatedAt": "2016-01-21T21:20:38.067Z",' + 
        '          "revision": 9,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "6Rv9J0E95SmOkGiqyqw6IW"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Base Template",' + 
        '          "siteId": "SID-0000003",' + 
        '          "stylesheet": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "6QrBAS35F6EMKeguMsmWk8"' + 
        '            }' + 
        '          },' + 
        '          "bodyClassName": "lilly",' + 
        '          "navigation": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Entry",' + 
        '              "id": "2TNZk1MmHKWAYQSsiqsusY"' + 
        '            }' + 
        '          },' + 
        '          "footer": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Entry",' + 
        '              "id": "2A1I84injiOUWEyEUKsksm"' + 
        '            }' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "5qxIsaraJaYiAEKSGoi2w0",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T17:36:06.148Z",' + 
        '          "updatedAt": "2016-02-11T03:40:50.100Z",' + 
        '          "revision": 4,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Terms and Conditions",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Terms & Conditions",' + 
        '          "url": "http://lilly.co.uk/en/terms-and-conditions.aspx",' + 
        '          "order": 0,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6GqmIpeCiWgYmQAggC40oG",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:23:17.373Z",' + 
        '          "updatedAt": "2016-02-11T03:40:06.484Z",' + 
        '          "revision": 3,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Privacy",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Privacy & Cookie Policy",' + 
        '          "url": "http://lilly.co.uk/en/privacy.aspx",' + 
        '          "order": 1,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      }' + 
        '    ],' + 
        '    "Asset": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "13olsIUZ0K286GAcs4a6eK",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-18T20:23:11.924Z",' + 
        '          "updatedAt": "2016-01-18T20:23:11.924Z",' + 
        '          "revision": 1,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Logo",' + 
        '          "file": {' + 
        '            "url": "//images.contentful.com/ek3t8do0hkga/13olsIUZ0K286GAcs4a6eK/cdea1bedb89f944d6fb20767cdf56b91/logo.png",' + 
        '            "details": {' + 
        '              "size": 2539,' + 
        '              "image": {' + 
        '                "width": 59,' + 
        '                "height": 35' + 
        '              }' + 
        '            },' + 
        '            "fileName": "logo.png",' + 
        '            "contentType": "image/png"' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "1Aek4Xlut2gYO2OIqkA6G0",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-22T18:06:42.843Z",' + 
        '          "updatedAt": "2016-02-11T03:44:16.609Z",' + 
        '          "revision": 4,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "lilly-profile-top",' + 
        '          "file": {' + 
        '            "url": "//assets.contentful.com/ek3t8do0hkga/1Aek4Xlut2gYO2OIqkA6G0/9a6914ec825fdfb0b167b657dde64a0c/lilly-profile-top.html",' + 
        '            "details": {' + 
        '              "size": 327' + 
        '            },' + 
        '            "fileName": "lilly-profile-top.html",' + 
        '            "contentType": "text/html"' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6QrBAS35F6EMKeguMsmWk8",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-20T15:49:13.338Z",' + 
        '          "updatedAt": "2016-02-11T03:41:29.659Z",' + 
        '          "revision": 33,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "lilly.css",' + 
        '          "file": {' + 
        '            "url": "//assets.contentful.com/ek3t8do0hkga/6QrBAS35F6EMKeguMsmWk8/4654136963dd5fd6baa479ec1e69cb30/lilly.css",' + 
        '            "details": {' + 
        '              "size": 13572' + 
        '            },' + 
        '            "fileName": "lilly.css",' + 
        '            "contentType": "text/css"' + 
        '          }' + 
        '        }' + 
        '      }' + 
        '    ]' + 
        '  }' + 
        '}'; 
    }

    private String getIdentityBaseTemplate() {
        return '{' + 
        '  "sys": {' + 
        '    "type": "Array"' + 
        '  },' + 
        '  "total": 1,' + 
        '  "skip": 0,' + 
        '  "limit": 100,' + 
        '  "items": [' + 
        '    {' + 
        '      "sys": {' + 
        '        "space": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Space",' + 
        '            "id": "ek3t8do0hkga"' + 
        '          }' + 
        '        },' + 
        '        "id": "3D9pUQo0BikUoAGMqcYcgM",' + 
        '        "type": "Entry",' + 
        '        "createdAt": "2016-01-18T18:31:19.405Z",' + 
        '        "updatedAt": "2016-03-09T19:23:41.351Z",' + 
        '        "revision": 11,' + 
        '        "contentType": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "ContentType",' + 
        '            "id": "6Rv9J0E95SmOkGiqyqw6IW"' + 
        '          }' + 
        '        },' + 
        '        "locale": "en-US"' + 
        '      },' + 
        '      "fields": {' + 
        '        "title": "Lilly Identity - Base Template",' + 
        '        "siteId": "SID-0000003",' + 
        '        "stylesheet": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Asset",' + 
        '            "id": "6QrBAS35F6EMKeguMsmWk8"' + 
        '          }' + 
        '        },' + 
        '        "bodyClassName": "lilly",' + 
        '        "navigation": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Entry",' + 
        '            "id": "2TNZk1MmHKWAYQSsiqsusY"' + 
        '          }' + 
        '        },' + 
        '        "footer": {' + 
        '          "sys": {' + 
        '            "type": "Link",' + 
        '            "linkType": "Entry",' + 
        '            "id": "2A1I84injiOUWEyEUKsksm"' + 
        '          }' + 
        '        }' + 
        '      }' + 
        '    }' + 
        '  ],' + 
        '  "includes": {' + 
        '    "Entry": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "22w41SsqgEs6W8WKak6y2i",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:24:20.548Z",' + 
        '          "updatedAt": "2016-02-11T03:40:35.334Z",' + 
        '          "revision": 2,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Copyright",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Copyright",' + 
        '          "url": "http://lilly.co.uk/en/copyright-information.aspx",' + 
        '          "order": 2,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2A1I84injiOUWEyEUKsksm",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:48:23.838Z",' + 
        '          "updatedAt": "2016-02-10T22:33:17.227Z",' + 
        '          "revision": 7,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2WhdxnOuAEIg8OqmqKgYUK"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Footer",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundColor": "#c00",' + 
        '          "backgroundImage": null,' + 
        '          "footerText": "Â© Eli Lilly 2016. All rights reserved.",' + 
        '          "menuItems": [' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "5qxIsaraJaYiAEKSGoi2w0"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "6GqmIpeCiWgYmQAggC40oG"' + 
        '              }' + 
        '            },' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "22w41SsqgEs6W8WKak6y2i"' + 
        '              }' + 
        '            }' + 
        '          ]' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "2TNZk1MmHKWAYQSsiqsusY",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-01-18T18:44:40.340Z",' + 
        '          "updatedAt": "2016-03-10T17:24:49.420Z",' + 
        '          "revision": 12,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "2kLv0lhAMAQCm8SiK4IKS4"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly Identity - Navigation",' + 
        '          "siteId": "SID-0000003",' + 
        '          "className": "lilly-nav",' + 
        '          "logo": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Asset",' + 
        '              "id": "13olsIUZ0K286GAcs4a6eK"' + 
        '            }' + 
        '          },' + 
        '          "backgroundImage": null,' + 
        '          "menuItems": [' + 
        '            {' + 
        '              "sys": {' + 
        '                "type": "Link",' + 
        '                "linkType": "Entry",' + 
        '                "id": "22w41SsqgEs6W8WKak6y2i"' + 
        '              }' + 
        '            }' + 
        '          ],' + 
        '          "backgroundColor": "#c00"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "5qxIsaraJaYiAEKSGoi2w0",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T17:36:06.148Z",' + 
        '          "updatedAt": "2016-02-11T03:40:50.100Z",' + 
        '          "revision": 4,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Terms and Conditions",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Terms & Conditions",' + 
        '          "url": "http://lilly.co.uk/en/terms-and-conditions.aspx",' + 
        '          "order": 0,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6GqmIpeCiWgYmQAggC40oG",' + 
        '          "type": "Entry",' + 
        '          "createdAt": "2016-02-10T22:23:17.373Z",' + 
        '          "updatedAt": "2016-02-11T03:40:06.484Z",' + 
        '          "revision": 3,' + 
        '          "contentType": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "ContentType",' + 
        '              "id": "5fBVdLRru0Mq8Wm0gIOWuM"' + 
        '            }' + 
        '          },' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Lilly - Privacy",' + 
        '          "siteId": "SID-0000003",' + 
        '          "label": "Privacy & Cookie Policy",' + 
        '          "url": "http://lilly.co.uk/en/privacy.aspx",' + 
        '          "order": 1,' + 
        '          "iconClass": "fa-footer"' + 
        '        }' + 
        '      }' + 
        '    ],' + 
        '    "Asset": [' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "13olsIUZ0K286GAcs4a6eK",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-18T20:23:11.924Z",' + 
        '          "updatedAt": "2016-01-18T20:23:11.924Z",' + 
        '          "revision": 1,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "Logo",' + 
        '          "file": {' + 
        '            "url": "//images.contentful.com/ek3t8do0hkga/13olsIUZ0K286GAcs4a6eK/cdea1bedb89f944d6fb20767cdf56b91/logo.png",' + 
        '            "details": {' + 
        '              "size": 2539,' + 
        '              "image": {' + 
        '                "width": 59,' + 
        '                "height": 35' + 
        '              }' + 
        '            },' + 
        '            "fileName": "logo.png",' + 
        '            "contentType": "image/png"' + 
        '          }' + 
        '        }' + 
        '      },' + 
        '      {' + 
        '        "sys": {' + 
        '          "space": {' + 
        '            "sys": {' + 
        '              "type": "Link",' + 
        '              "linkType": "Space",' + 
        '              "id": "ek3t8do0hkga"' + 
        '            }' + 
        '          },' + 
        '          "id": "6QrBAS35F6EMKeguMsmWk8",' + 
        '          "type": "Asset",' + 
        '          "createdAt": "2016-01-20T15:49:13.338Z",' + 
        '          "updatedAt": "2016-02-11T03:41:29.659Z",' + 
        '          "revision": 33,' + 
        '          "locale": "en-US"' + 
        '        },' + 
        '        "fields": {' + 
        '          "title": "lilly.css",' + 
        '          "file": {' + 
        '            "url": "//assets.contentful.com/ek3t8do0hkga/6QrBAS35F6EMKeguMsmWk8/4654136963dd5fd6baa479ec1e69cb30/lilly.css",' + 
        '            "details": {' + 
        '              "size": 13572' + 
        '            },' + 
        '            "fileName": "lilly.css",' + 
        '            "contentType": "text/css"' + 
        '          }' + 
        '        }' + 
        '      }' + 
        '    ]' + 
        '  }' + 
        '}';
    }

    private String getUnknownTemplate() {
        return '   {  '  + 
        '       "sys": {  '  + 
        '           "type": "Array"  '  + 
        '       },  '  + 
        '       "total": 1,  '  + 
        '       "skip": 0,  '  + 
        '       "limit": 100,  '  + 
        '       "items": [  '  + 
        '           {  '  + 
        '               "fields": {  '  + 
        '                   "title": "Cholecap - Base Template",  '  + 
        '                   "siteId": "SID-00002",  '  + 
        '                   "navigation": {  '  + 
        '                       "sys": {  '  + 
        '                           "type": "Link",  '  + 
        '                           "linkType": "Entry",  '  + 
        '                           "id": "dG3GQhRrZ6iSkyyqIYiIG"  '  + 
        '                       }  '  + 
        '                   },  '  + 
        '                   "footer": {  '  + 
        '                       "sys": {  '  + 
        '                           "type": "Link",  '  + 
        '                           "linkType": "Entry",  '  + 
        '                           "id": "6KwNIK95NSSMuSWgoCacIM"  '  + 
        '                       }  '  + 
        '                   },  '  + 
        '                   "stylesheet": {  '  + 
        '                       "sys": {  '  + 
        '                           "type": "Link",  '  + 
        '                           "linkType": "Asset",  '  + 
        '                           "id": "4PxwM8dFP2EGyygyCYQMQU"  '  + 
        '                       }  '  + 
        '                   },  '  + 
        '                   "bodyClassName": "Cholecap",  '  + 
        '                   "legalHtml": {  '  + 
        '                       "sys": {  '  + 
        '                           "type": "Link",  '  + 
        '                           "linkType": "Asset",  '  + 
        '                           "id": "1XkX70kQiIMI8KY482aym4"  '  + 
        '                       }  '  + 
        '                   }  '  + 
        '               },  '  + 
        '               "sys": {  '  + 
        '                   "space": {  '  + 
        '                       "sys": {  '  + 
        '                           "type": "Link",  '  + 
        '                           "linkType": "Space",  '  + 
        '                           "id": "72ri2em955or"  '  + 
        '                       }  '  + 
        '                   },  '  + 
        '                   "type": "Entry",  '  + 
        '                   "contentType": {  '  + 
        '                       "sys": {  '  + 
        '                           "type": "Link",  '  + 
        '                           "linkType": "ContentType",  '  + 
        '                           "id": "SOME_UNKNOWN_CONTENT_TYPE"  '  + 
        '                       }  '  + 
        '                   },  '  + 
        '                   "id": "1RWuxrbK4U28aae2gIWUu2",  '  + 
        '                   "revision": 2,  '  + 
        '                   "createdAt": "2015-09-02T14:59:43.493Z",  '  + 
        '                   "updatedAt": "2015-09-24T20:27:41.714Z",  '  + 
        '                   "locale": "en-US"  '  + 
        '               }  '  + 
        '           }  '  + 
        '       ],  '  + 
        '       "includes": {  '  + 
        '           "Entry": [  '  + 
        '               {  '  + 
        '                   "fields": {  '  + 
        '                       "siteId": "SID-00002",  '  + 
        '                       "logo": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Asset",  '  + 
        '                               "id": "7ghKzv77sQmM8M4waiui68"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "background": null,  '  + 
        '                       "title": "Cholecap - Navigation",  '  + 
        '                       "menuItems": [  '  + 
        '                           {  '  + 
        '                               "sys": {  '  + 
        '                                   "type": "Link",  '  + 
        '                                   "linkType": "Entry",  '  + 
        '                                   "id": "CNJw7QroFEOiigEGQQuYS"  '  + 
        '                               }  '  + 
        '                           },  '  + 
        '                           {  '  + 
        '                               "sys": {  '  + 
        '                                   "type": "Link",  '  + 
        '                                   "linkType": "Entry",  '  + 
        '                                   "id": "3tfK061whWyywYuMaqOckE"  '  + 
        '                               }  '  + 
        '                           },  '  + 
        '                           {  '  + 
        '                               "sys": {  '  + 
        '                                   "type": "Link",  '  + 
        '                                   "linkType": "Entry",  '  + 
        '                                   "id": "6aAmEMt5zaiGIki6GeUou6"  '  + 
        '                               }  '  + 
        '                           },  '  + 
        '                           {  '  + 
        '                               "sys": {  '  + 
        '                                   "type": "Link",  '  + 
        '                                   "linkType": "Entry",  '  + 
        '                                   "id": "6oDQzQKVjyosCcyEeeqKgy"  '  + 
        '                               }  '  + 
        '                           }  '  + 
        '                       ],  '  + 
        '                       "backgroundColor2": "#4aade1",  '  + 
        '                       "class": "Cholecap-nav",  '  + 
        '                       "backgroundImage": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Asset",  '  + 
        '                               "id": "12Mg1iFcYcS224O2ySOwGi"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "className": "Cholecap-nav"  '  + 
        '                   },  '  + 
        '                   "sys": {  '  + 
        '                       "space": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Space",  '  + 
        '                               "id": "72ri2em955or"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "type": "Entry",  '  + 
        '                       "contentType": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "ContentType",  '  + 
        '                               "id": "2kLv0lhAMAQCm8SiK4IKS4"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "id": "dG3GQhRrZ6iSkyyqIYiIG",  '  + 
        '                       "revision": 2,  '  + 
        '                       "createdAt": "2015-09-02T14:59:46.031Z",  '  + 
        '                       "updatedAt": "2015-09-24T20:28:39.105Z",  '  + 
        '                       "locale": "en-US"  '  + 
        '                   }  '  + 
        '               },  '  + 
        '               {  '  + 
        '                   "fields": {  '  + 
        '                       "title": "Cholecap - Footer",  '  + 
        '                       "logo": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Asset",  '  + 
        '                               "id": "7ghKzv77sQmM8M4waiui68"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "backgroundColor": "#4aade1",  '  + 
        '                       "backgroundImage": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Asset",  '  + 
        '                               "id": "68uaGevgsg4iqUYCw26ESI"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "footerText": "© 2015 Verteo USA, Inc. All rights reserved. ZEC-40448 August 2015"  '  + 
        '                   },  '  + 
        '                   "sys": {  '  + 
        '                       "space": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Space",  '  + 
        '                               "id": "72ri2em955or"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "type": "Entry",  '  + 
        '                       "contentType": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "ContentType",  '  + 
        '                               "id": "2WhdxnOuAEIg8OqmqKgYUK"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "id": "6KwNIK95NSSMuSWgoCacIM",  '  + 
        '                       "revision": 2,  '  + 
        '                       "createdAt": "2015-09-02T14:59:43.021Z",  '  + 
        '                       "updatedAt": "2015-09-24T20:30:59.217Z",  '  + 
        '                       "locale": "en-US"  '  + 
        '                   }  '  + 
        '               },  '  + 
        '               {  '  + 
        '                   "fields": {  '  + 
        '                       "siteId": "SID-00002",  '  + 
        '                       "label": "For Healthcare Professionals",  '  + 
        '                       "url": "http://dev.cholecap.com/hcp/default.aspx",  '  + 
        '                       "order": 4,  '  + 
        '                       "title": "Cholecap - For Healthcare Professionals",  '  + 
        '                       "className": null,  '  + 
        '                       "iconClass": "fa-medkit"  '  + 
        '                   },  '  + 
        '                   "sys": {  '  + 
        '                       "space": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Space",  '  + 
        '                               "id": "72ri2em955or"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "type": "Entry",  '  + 
        '                       "contentType": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "ContentType",  '  + 
        '                               "id": "5fBVdLRru0Mq8Wm0gIOWuM"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "id": "6oDQzQKVjyosCcyEeeqKgy",  '  + 
        '                       "revision": 1,  '  + 
        '                       "createdAt": "2015-09-02T14:59:43.914Z",  '  + 
        '                       "updatedAt": "2015-09-02T14:59:43.914Z",  '  + 
        '                       "locale": "en-US"  '  + 
        '                   }  '  + 
        '               },  '  + 
        '               {  '  + 
        '                   "fields": {  '  + 
        '                       "siteId": "SID-00002",  '  + 
        '                       "label": "Prescribing Information",  '  + 
        '                       "url": "http://dev.cholecap.com/pdf/Cholecap_PI.pdf",  '  + 
        '                       "order": 3,  '  + 
        '                       "title": "Cholecap - Prescribing Information",  '  + 
        '                       "iconClass": "fa-info-circle"  '  + 
        '                   },  '  + 
        '                   "sys": {  '  + 
        '                       "space": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Space",  '  + 
        '                               "id": "72ri2em955or"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "type": "Entry",  '  + 
        '                       "contentType": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "ContentType",  '  + 
        '                               "id": "5fBVdLRru0Mq8Wm0gIOWuM"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "id": "6aAmEMt5zaiGIki6GeUou6",  '  + 
        '                       "revision": 1,  '  + 
        '                       "createdAt": "2015-09-02T14:59:44.367Z",  '  + 
        '                       "updatedAt": "2015-09-02T14:59:44.367Z",  '  + 
        '                       "locale": "en-US"  '  + 
        '                   }  '  + 
        '               },  '  + 
        '               {  '  + 
        '                   "fields": {  '  + 
        '                       "siteId": "SID-00002",  '  + 
        '                       "label": "Patient Information Leaflet",  '  + 
        '                       "url": "http://dev.cholecap.com/pdf/PatientInformationLeaflet.pdf",  '  + 
        '                       "order": 2,  '  + 
        '                       "title": "Cholecap - Patient Information Leaflet",  '  + 
        '                       "className": null,  '  + 
        '                       "iconClass": "fa-file-pdf-o"  '  + 
        '                   },  '  + 
        '                   "sys": {  '  + 
        '                       "space": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Space",  '  + 
        '                               "id": "72ri2em955or"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "type": "Entry",  '  + 
        '                       "contentType": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "ContentType",  '  + 
        '                               "id": "5fBVdLRru0Mq8Wm0gIOWuM"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "id": "3tfK061whWyywYuMaqOckE",  '  + 
        '                       "revision": 1,  '  + 
        '                       "createdAt": "2015-09-02T14:59:44.816Z",  '  + 
        '                       "updatedAt": "2015-09-02T14:59:44.816Z",  '  + 
        '                       "locale": "en-US"  '  + 
        '                   }  '  + 
        '               },  '  + 
        '               {  '  + 
        '                   "fields": {  '  + 
        '                       "siteId": "SID-00002",  '  + 
        '                       "label": "Important Safety Information",  '  + 
        '                       "url": "#isi-panel",  '  + 
        '                       "order": 1,  '  + 
        '                       "title": "Cholecap - Important Safety Information",  '  + 
        '                       "iconClass": "fa-exclamation-triangle safety-icon"  '  + 
        '                   },  '  + 
        '                   "sys": {  '  + 
        '                       "space": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Space",  '  + 
        '                               "id": "72ri2em955or"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "type": "Entry",  '  + 
        '                       "contentType": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "ContentType",  '  + 
        '                               "id": "5fBVdLRru0Mq8Wm0gIOWuM"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "id": "CNJw7QroFEOiigEGQQuYS",  '  + 
        '                       "revision": 1,  '  + 
        '                       "createdAt": "2015-09-02T14:59:45.212Z",  '  + 
        '                       "updatedAt": "2015-09-02T14:59:45.212Z",  '  + 
        '                       "locale": "en-US"  '  + 
        '                   }  '  + 
        '               }  '  + 
        '           ],  '  + 
        '           "Asset": [  '  + 
        '               {  '  + 
        '                   "fields": {  '  + 
        '                       "title": "Cholecap Logo",  '  + 
        '                       "file": {  '  + 
        '                           "contentType": "image/png",  '  + 
        '                           "fileName": "Cholecap-logo.png",  '  + 
        '                           "details": {  '  + 
        '                               "image": {  '  + 
        '                                   "width": 330,  '  + 
        '                                   "height": 179  '  + 
        '                               },  '  + 
        '                               "size": 16837  '  + 
        '                           },  '  + 
        '                           "url": "//images.contentful.com/72ri2em955or/7ghKzv77sQmM8M4waiui68/22874e8261ec079f19eb15de32519a47/Cholecap-logo.png"  '  + 
        '                       }  '  + 
        '                   },  '  + 
        '                   "sys": {  '  + 
        '                       "space": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Space",  '  + 
        '                               "id": "72ri2em955or"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "type": "Asset",  '  + 
        '                       "id": "7ghKzv77sQmM8M4waiui68",  '  + 
        '                       "revision": 1,  '  + 
        '                       "createdAt": "2015-09-02T15:04:18.155Z",  '  + 
        '                       "updatedAt": "2015-09-02T15:04:18.155Z",  '  + 
        '                       "locale": "en-US"  '  + 
        '                   }  '  + 
        '               },  '  + 
        '               {  '  + 
        '                   "fields": {  '  + 
        '                       "title": "header-bg",  '  + 
        '                       "file": {  '  + 
        '                           "contentType": "image/jpeg",  '  + 
        '                           "fileName": "header-bg.jpg",  '  + 
        '                           "details": {  '  + 
        '                               "image": {  '  + 
        '                                   "width": 1024,  '  + 
        '                                   "height": 130  '  + 
        '                               },  '  + 
        '                               "size": 16735  '  + 
        '                           },  '  + 
        '                           "url": "//images.contentful.com/72ri2em955or/12Mg1iFcYcS224O2ySOwGi/9ecff3002b15dd7b12b1765be34bbacb/header-bg.jpg"  '  + 
        '                       }  '  + 
        '                   },  '  + 
        '                   "sys": {  '  + 
        '                       "space": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Space",  '  + 
        '                               "id": "72ri2em955or"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "type": "Asset",  '  + 
        '                       "id": "12Mg1iFcYcS224O2ySOwGi",  '  + 
        '                       "revision": 1,  '  + 
        '                       "createdAt": "2015-09-02T15:04:23.249Z",  '  + 
        '                       "updatedAt": "2015-09-02T15:04:23.249Z",  '  + 
        '                       "locale": "en-US"  '  + 
        '                   }  '  + 
        '               },  '  + 
        '               {  '  + 
        '                   "fields": {  '  + 
        '                       "title": "footer-bg",  '  + 
        '                       "file": {  '  + 
        '                           "contentType": "image/jpeg",  '  + 
        '                           "fileName": "footer-bg.jpg",  '  + 
        '                           "details": {  '  + 
        '                               "image": {  '  + 
        '                                   "width": 1500,  '  + 
        '                                   "height": 433  '  + 
        '                               },  '  + 
        '                               "size": 69917  '  + 
        '                           },  '  + 
        '                           "url": "//images.contentful.com/72ri2em955or/68uaGevgsg4iqUYCw26ESI/9ff13332c8caa7b7e81c61c408ee2a03/footer-bg.jpg"  '  + 
        '                       }  '  + 
        '                   },  '  + 
        '                   "sys": {  '  + 
        '                       "space": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Space",  '  + 
        '                               "id": "72ri2em955or"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "type": "Asset",  '  + 
        '                       "id": "68uaGevgsg4iqUYCw26ESI",  '  + 
        '                       "revision": 1,  '  + 
        '                       "createdAt": "2015-09-02T15:05:35.260Z",  '  + 
        '                       "updatedAt": "2015-09-02T15:05:35.260Z",  '  + 
        '                       "locale": "en-US"  '  + 
        '                   }  '  + 
        '               },  '  + 
        '               {  '  + 
        '                   "fields": {  '  + 
        '                       "title": "Cholecap-overrides",  '  + 
        '                       "file": {  '  + 
        '                           "contentType": "text/css",  '  + 
        '                           "fileName": "Cholecap.css",  '  + 
        '                           "details": {  '  + 
        '                               "size": 8092  '  + 
        '                           },  '  + 
        '                           "url": "//assets.contentful.com/72ri2em955or/4PxwM8dFP2EGyygyCYQMQU/4cf1664633429c17aa8011df927a8b4b/Cholecap.css"  '  + 
        '                       }  '  + 
        '                   },  '  + 
        '                   "sys": {  '  + 
        '                       "space": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Space",  '  + 
        '                               "id": "72ri2em955or"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "type": "Asset",  '  + 
        '                       "id": "4PxwM8dFP2EGyygyCYQMQU",  '  + 
        '                       "revision": 1,  '  + 
        '                       "createdAt": "2015-09-02T15:05:12.636Z",  '  + 
        '                       "updatedAt": "2015-09-02T15:05:12.636Z",  '  + 
        '                       "locale": "en-US"  '  + 
        '                   }  '  + 
        '               },  '  + 
        '               {  '  + 
        '                   "fields": {  '  + 
        '                       "title": "legal",  '  + 
        '                       "file": {  '  + 
        '                           "contentType": "text/html",  '  + 
        '                           "fileName": "legal.html",  '  + 
        '                           "details": {  '  + 
        '                               "size": 7229  '  + 
        '                           },  '  + 
        '                           "url": "//assets.contentful.com/72ri2em955or/1XkX70kQiIMI8KY482aym4/7a5152812ddc441598fef0bafba6bb72/legal.html"  '  + 
        '                       }  '  + 
        '                   },  '  + 
        '                   "sys": {  '  + 
        '                       "space": {  '  + 
        '                           "sys": {  '  + 
        '                               "type": "Link",  '  + 
        '                               "linkType": "Space",  '  + 
        '                               "id": "72ri2em955or"  '  + 
        '                           }  '  + 
        '                       },  '  + 
        '                       "type": "Asset",  '  + 
        '                       "id": "1XkX70kQiIMI8KY482aym4",  '  + 
        '                       "revision": 1,  '  + 
        '                       "createdAt": "2015-09-02T15:05:18.997Z",  '  + 
        '                       "updatedAt": "2015-09-02T15:05:18.997Z",  '  + 
        '                       "locale": "en-US"  '  + 
        '                   }  '  + 
        '               }  '  + 
        '           ]  '  + 
        '       }  '  + 
        '  }  ' ; 
    }

    private String getHTMLAsset() {
        return 'This is some <b>test html</b>';
    }

}