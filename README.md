# Generate Event ID - Google Tag Manager Variable Template
A Variable Template for Google Tag Manager Client Side. This Variable will help you use the same Event ID for different tags within the same event.

## How this works
This Variable helps you create Event IDs that can easily be used for different Tags within the same Event.

The Template creates a random string that is stored in the localStorage and uses the **dataLayer** variables **gtm.start** and **gtm.uniqueEventId** in order to create a full string for each event it will be used in.

Note: A fallback is added for those cases where the localStorage doesn't exist or is disabled by the user. In those cases we use the dataLayer variable **event**. For the fallback case, there is a super duper slight chance of events for different users match on the same eventId, but this would be less in one in a billion that it would happen. But it can be good to mention anyway.
