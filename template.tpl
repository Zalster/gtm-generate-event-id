___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Generate Event ID",
  "description": "Generate Event ID for GA4 requests. This Variable will help you use the same Event ID for different tags within the same event.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromDataLayer = require('copyFromDataLayer');
const generateRandom = require('generateRandom');
const getTimestampMillis = require('getTimestampMillis');
const localStorage = require('localStorage');

const generateEventId = () => {
  // If localStorage is missing or disabled get the event name as backup
  if (!localStorage) {
    return copyFromDataLayer('event');
  }
  
  let lsEventId = localStorage.getItem('gtmEventId');
  if (lsEventId) {
    return lsEventId;
  }
  
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789';
  const randLoop = generateRandom(16,22);
  
  let eventId = '';
  for (let i = 0; i < randLoop; i++) {
    eventId += chars.charAt(generateRandom(0,60));
  }
  
  localStorage.setItem('gtmEventId', eventId);
  
  return eventId;
};

const getGTMUniqueEventId = () => {
  return copyFromDataLayer('gtm.uniqueEventId');
};

const getGTMStart = () => {
  return copyFromDataLayer('gtm.start');
};


return generateEventId() + '_' + getGTMStart() + '_' + getGTMUniqueEventId();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_local_storage",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtmEventId"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "event"
              },
              {
                "type": 1,
                "string": "gtm.start"
              },
              {
                "type": 1,
                "string": "gtm.uniqueEventId"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 17/06/2022, 13:01:18


