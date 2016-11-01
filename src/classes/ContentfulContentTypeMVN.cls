/*
* ContentfulContentTypeMVN
* 
* Created By:   Joseph Ferraro 
* Created Date: November 9th 2015 
* Description:  This is a wrapper class for the Apex Representation of Contentful Entries.   
*/
public with sharing class ContentfulContentTypeMVN {
    
    /*
    * Base Template Apex Class. 
    * Used to provide look and feel. 
    */
    public class BaseTemplate {
        public String title {get;set;}
        public String siteId {get;set;}
        public ContentfulEntryMVN.Space navigation {get;set;}
        public ContentfulEntryMVN.Space legalHtml {get;set;}
        public String bodyClassName {get;set;}
        public ContentfulEntryMVN.Space footer {get;set;}
        public ContentfulEntryMVN.Space stylesheet {get;set;}
    }
    
    /*
    * Navigation Apex Class. 
    * Part of the Base Template and the container of Menu Items.  
    */
    public class Navigation {
        public String siteId {get;set;}
        public ContentfulEntryMVN.Space logo {get;set;}
        public ContentfulEntryMVN.Space backgroundImage {get;set;}
        public String backgroundColor {get;set;}
        public String className {get;set;}
        public String title {get;set;}
        public List<ContentfulEntryMVN.Space> menuItems {get;set;}
    }
    
    /*
    * Menu Item Apex Class. 
    * Defines the individual menu items that are held in the Navigation class.  
    */
    public class MenuItem {
        public String siteId {get;set;}
        public String label {get;set;}
        public String url {get;set;}
        public Integer order {get;set;}
        public String title {get;set;}
        //public String className {get;set;}
        public String iconClass {get;set;}
    }

    /*
    * Footer Apex Class. 
    * Used to define the footer of the Base Template. 
    */
    public class Footer {
        public String title {get;set;}
        public ContentfulEntryMVN.Space logo {get;set;}
        public String backgroundColor {get;set;}
        public ContentfulEntryMVN.Space backgroundImage {get;set;}
        public String footerText {get;set;}
    }
    
    /**
     * Represents the child template content type. Login, Registration, Profile, etc. implement this template
     */
    public class ChildTemplate {
        public String title {get;set;}
        public String pageTitle {get;set;}
        public String backgroundColor {get;set;}
        public String promotionalText {get;set;}
        public String promotionalDisclaimer {get;set;}
        public ContentfulEntryMVN.Space htmlTop {get;set;}
        public ContentfulEntryMVN.Space htmlBottom {get;set;}
        public List<ContentfulEntryMVN.Asset> assets {get;set;}
        public Set<String> assetIds { 
            get {
                assetIds = new Set<String>();
                if (this.htmlTop != null) {
                    assetIds.add(this.htmlTop.sys.id);
                }
                if (this.htmlBottom != null) {
                    assetIds.add(this.htmlBottom.sys.id);
                }
                return assetIds;
            }
            private set;
        }
        public String htmlTopBody {
            get {
                if (this.htmlTop != null) {
                    return htmlMap.get(this.htmlTop.sys.id);                    
                }
                return null;
            }
        }
        public String htmlBottomBody {
            get {
                if (this.htmlBottom != null) {
                    return htmlMap.get(this.htmlBottom.sys.id);                 
                }
                return null;
            }
        }
        public Map<String,String> htmlMap {
            get {
                if (htmlMap == null) {
                    htmlMap = ContentfulUtilityMVN.getHtmlForAssets(this.assetIds, this.assets);                    
                }
                return htmlMap;
            }
            private set;
        }
    }
}