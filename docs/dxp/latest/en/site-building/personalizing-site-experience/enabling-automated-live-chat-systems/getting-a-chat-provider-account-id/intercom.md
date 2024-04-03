---
taxonomy-category-names:
- Personalization
- Intercom
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 52cebc90-ff77-4ec3-8f63-38d615934d85
---
# Intercom

[Intercom](https://www.intercom.com/) is a customer service solution that helps the user reducing the support volume with a breakthrough AI Chatbot. Here, you will learn to install and locate your Intercom Account ID.

## Installing and Locating your Intercom Account ID

To get the Messenger to appear on your web app copy and paste the snippet below before the </body> tag on every page where you want the Messenger to appear for website visitors.
Now, you add your Account ID. You can find this value in the URL when you are logged into Intercom. It will be a string of numbers and letters directly after apps/. So for https://app.intercom.com/a/apps/ecahpwf5/home the workspace ID is ecahpwf5.

```bash
 //Set your APP_ID
var APP_ID = "Your-Account-ID";

window.intercomSettings = {
    app_id: APP_ID
  };
(function(){var w=window;var ic=w.Intercom;if(typeof ic==="function"){ic('reattach_activator');ic('update',w.intercomSettings);}else{var d=document;var i=function(){i.c(arguments);};i.q=[];i.c=function(args){i.q.push(args);};w.Intercom=i;var l=function(){var s=d.createElement('script');s.type='text/javascript';s.async=true;s.src='https://widget.intercom.io/widget/' + APP_ID;var x=d.getElementsByTagName('script')[0];x.parentNode.insertBefore(s, x);};if(document.readyState==='complete'){l();}else if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})(); 
```

To see more in detail, click [here](https://developers.intercom.com/installing-intercom/web/installation/).