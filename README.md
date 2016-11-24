# Salesforce Contentful SDK

This is a Salesforce Apex library for [Contentful's](https://www.contentful.com/) Content Delivery API.

## About

[Contentful](https://www.contentful.com/) is a content management platform for web applications, mobile apps and connected devices. It allows you to create, edit & manage content in the cloud and publish it anywhere via a powerful API. Contentful offers tools for managing editorial teams and enabling cooperation between organizations.

## Getting Started

To start using the solution you should deploy the items within this repository to your Salesforce org. 

### Setup & Authentication

To prepare the solution for use the `Contentful_Settings_MVN__c` should be updated to include teh following values:
* API Key(`API_Key_MVN__c`) - your Contentful API key to enable access to the content
* Endpoint (`Endpoint_MVN__c`) - the Contentful API endpoint (typically https://cdn.contentful.com/spaces/)
* Space Id (`Space_Id_MVN__c`) - the Id of the Contentful space you wish to retrieve content from

The Contentful CDN and Contentful Assets endpoints should already be configured as remote sites for your solution through the deployment.

### Use

Methods to enable you to retrieve entries are provided in the ContentfulUtilityMVN class for you to use. Simply call these methods with the correct parameter set to retrieve the required entry and linked assets.

## Contributing

Submit any updates as a pull request for the solution.

## License

MIT