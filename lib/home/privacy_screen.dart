import 'package:flutter/material.dart';
import 'package:ghcmobile/styles.dart';

class PrivacyPage extends StatefulWidget {
  @override
  PrivacyScreen createState() => PrivacyScreen();
}

class PrivacyScreen extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        //automaticallyImplyLeading: false,
        title: Text(
          'Gabriel Housing Corp - Privacy Policy',
          style: TextStyle(
              color: Colors.black,
              fontFamily: Styles.fontFamilyMedium,
              fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Container(
            child: new ListView(children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "WELCOME",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Gabriel Housing Corp. (“Gabriel”, “we”, “us”) is committed to protecting the privacy of your information. This Privacy Policy describes how we collect, use, store, process, share and use data (“personal information”) in connection with Gabriel directly and our mobile applications such as Gabriel Housing App (“the Service”).",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "By creating an account for the Service, in this case, Gabriel Housing, or by otherwise accessing, or using the Service, you expressly agree to our collection, use, and disclosure of your information as described in this Privacy Policy and in the Gabriel Terms & Conditions"
              "If you access the Service through a third party service that provides a gateway to the Service, such as iTunes or Google Play (a “Gateway Service”), you will have a separate, additional account relationship with that Gateway Service and the information you provide to that Gateway Service will be handled in accordance with their applicable privacy practices. This is not a direct partner or representative of Gabriel and we are not responsible for the acts regarding the collection and use of your information.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Before accessing or using the Service, please ensure that you have read and understood our collection, storage, use and disclosure of your personal information as described in this privacy policy. By accessing or using the service, you are accepting and consenting to the practices described in this privacy policy.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "SUMMARY",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "We may collect information that you provide to us in connection with your use of the Service when you register as a user of the service, send email messages, or voluntarily share with other users, in addition to general technical information that is automatically collected by our systems, including IP addresses, browser and mobile device information and cookies to provide a better user experience and generally improve the Service."
              "If you register for a Gabriel Housing account directly through the Service, you will be required to provide your email address and create a username and password.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Your personal information may be gathered from Gabriel Housing, websites you use that we operate, and third parties. Technical information about how you access and use the service, as well as information about your device, is automatically collected and used for Service operation, optimization, analytics, content promotion and enhancement of user experience. In accordance with applicable local law, we may use your information to contact you with relevant information about the Service and our other products and services.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "We do not disclose your personal information to others except as described in this Policy or in connection with the Service. Information that you choose to publish on our Website or social media accounts (blogs, testimonials, videos, text, music, reviews, deliveries) may be read, collected and used by others who access them.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "All of the information that you provide to us is stored on secure servers in a controlled environment with limited access. The personal information we collect may be transferred to and stored in countries outside of the jurisdiction you are in. These international transfers are made pursuant to appropriate safeguards to protect your personal information.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "You may exercise your rights in respect of your personal information that we hold by contacting us at reception@gabrielhousing.com. Additional information regarding the rights applicable to you are in the detailed terms of the Policy below.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "The above-noted summary contains highlights of our policy. We encourage you to read more about the information we collect and how we use it in the detailed terms of our Policy below.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "DETAILED TERMS",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Information Collected from You by Gabriel. Gabriel may collect personal information about you when you voluntarily register as a user of the Service, submit information directly to us by filling in forms on our website/apps or by corresponding with us via phone and email, participation in discussion boards, forums, or other social media functions. ",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Information You Share on the Service. Some Aspects of the Service allow you to submit comments, reviews, ratings, and share other content. This content may be reshared and displayed on the Service resulting in being viewable by other users of the Service. ",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Information Automatically Collected Through the Service. GabrielHousing may automatically collect information about you when you use the Service. With the Service being accessed solely through mobile devices, we will automatically collect information such as your mobile device ID, device type, and your use of features, functions, or notifications on the device, as well as signal strength relating to WiFi, battery level, and similar technical data. ",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "We may collect this information even if you are not logged in to the Service. If you access the Service through a computer, we will automatically collect information such as your browser type and version, computer and connection information, statistics on page views, traffic to and from the Service, Internet Protocol (IP) address and standard web log information. In addition we collect information about how you access and use the Service. For example, your social media profiles, how frequently you access the Service, the time you access the Service and how long you use it for, whether you open emails or click the links contained in emails, and other actions you take on the Service. ",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "We may link or combine personal information we collect and/or receive about you and the information we collect automatically. This allows us to provide you with a personalized experience. ",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "USE OF INFORMATION BY GabrielHousing Corporation",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Gabriel may use information that we collect about you through our Service to: ",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Provide access to the Service and provide users with requested services and customer support and to process and respond to customer inquiries; ",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "To let you know about developments in the Services ",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "To communicate with you about our products and services, including promotions and offers ",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "To improve your experience using the Services",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "To improve the functionality of the Services",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "analyze the accuracy, effectiveness, usability, or popularity of the Service;",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "generate and review reports and data about our user base and service usage patterns;",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "resolve disputes and troubleshoot problems;",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Using the Service on your mobile device, with your consent, we may send push notifications to your mobile device to provide updates about the Service and other relevant messages. You can manage push notifications from the “Settings” page within your account. You may also be able to manage them from your mobile device’s settings page; and",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "We will use all the personal information we collect to operate, maintain and provide to you the features and functionality of the Service, to monitor and improve the Service, our Website and business, for internal operations, including troubleshooting, data analysis, testing, research, statistical and survey purposes, to keep the Website safe and secure and to help us develop new products and services.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Generate marketing leads and determine news, alerts and other products and services that may be of interest to you for marketing purposes",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "DISCLOSURE OF YOUR PERSONAL INFORMATION",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "We do not sell or rent your personal information to third parties for their direct marketing purposes without your explicit consent.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "We may share your personal information with any member of our group. We will not share your personal information with any third parties except as described in this privacy policy or in connection with the Service. We may share your information with the selected third parties, including:",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Third Party Service Providers & Partners. Business partners, vendors, suppliers, and subcontractors who perform services on our behalf (these companies are authorized to use your personal information only as necessary to provide these services to us)"
              "Technical Providers. Analytics and search engine providers that may assist us win the improvement optimization of the Service.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "In certain situations, we may be required to disclose personal information in response to lawful requests by public authorities, including to meet law enforcement requirements."
              "We may be under a duty to disclose or share your personal data in order to comply with any legal obligation.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Publicly accessible blogs. Our Service includes publicly accessible blogs or community forums. Any information you provide in these areas may be read, collected and used by others who access them. This includes information posted on our public social media accounts. To request removal of your personal information from our blog or community forum, contact us at reception@gabrielhousing.com. In some cases, we may not be able to remove your personal information, in which case we will let you know if we are unable to do so and why.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "SECURITY",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Gabriel takes reasonable measures to protect the information you provide through the Service against loss, unauthorized use, disclosure, or modification. All information you provide to us is stored on secure servers in a controlled environment with limited access. Where we have given you (or where you have chosen) a verification code which enables you to access certain parts of our Service, you are responsible for keeping this password confidential. Users should not share their password with anyone.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "While no transmission of information via the internet is completely secure, we take reasonable measures to protect your personal information. We cannot guarantee the security of your personal information transmitted through our Service; any transmission is at your own risk. Once we have received your information, we will use strict procedures and security features to try to prevent unauthorized access.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "International Transfers of your Personal Information. The personal information we collect may be transferred to and stored in countries outside of the jurisdiction you are in where we and our third-party service providers have operations. Your information may not be processed or held in the jurisdiction in which you reside. If you wish to inquire further about these safeguards used, please contact us using the details set out at the end of this privacy policy.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "RETAINING YOUR INFORMATION",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "We will only retain your personal information for as long as necessary to fulfill the purposes we collected it for, including for the purposes of our legitimate business interests and satisfying any legal or reporting requirements.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "To determine the appropriate retention period for personal information, we consider the amount, nature, and sensitivity of the personal information, the potential risk of harm from unauthorized use or disclosure of your personal information, the purposes for which we process your personal information and the applicable legal requirements.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "COOKIES AND SIMILAR TECHNOLOGIES",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Our Service uses cookies and similar technologies (collectively referred to as cookies) to distinguish you from other users of our Service. This helps us to provide you with good service. This helps us enhance and personalize your user experience, to monitor and improve our Website and services, and for other internal purposes. As is true of most websites, we gather certain information automatically.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "We use the following types of cookies:",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Strictly necessary cookies. These cookies are required for the essential operation of our Service such as to authenticate you and prevent fraudulent use. They are used to recognize you when you return to our service. This enables us to personalize our content for you."
              "Analytical/performance cookies. These cookies allow us to recognize and count the number of visitors (including your visit) and to see how visitors move around our Service when they are using it. This helps us to improve the way our Service works, for example, by ensuring that you can find information easily. We will use this information to make our Service and the advertising displayed on it more relevant for your interests. We may also share this information with third parties for this purpose.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Please note that third parties (including, for example, advertising networks and providers of external services like web traffic analysis services) may also use cookies, over which we have no control. These cookies are likely to be analytical/performance cookies or targeting cookies."
              "We may partner with a third party to either display advertising on our Website or to manage our advertising on other sites."
              "Our third-party partner may use technologies such as cookies to gather information about your activities on this Website and other sites in order to provide you advertising based upon your browsing activities and interests."
              "If you wish to not have this information used to serve you interest-based ads you may opt-out by contacting us."
              "Please note this does not opt you out of being served ads."
              "You will continue to receive generic ads."
              "You block cookies by activating the setting on your browser or device that allows you to refuse the setting of all or some cookies. However, if you use your browser or device settings to block all cookies (including strictly necessary cookies) you may not be able to access all or parts of our site.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
           Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "Social Media. Our Service may eventually include social media features, such as Facebook Like button and widgets such as the Share button. These features may collect your IP address, which page you are visiting on our Website, and may set a cookie to enable the feature to function properly. Social media features and widgets are hosted on our site or by a third party, and your interactions with these features are governed by the privacy policy of the company providing it.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
           Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "USE OF SERVICES BY MINORS",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
           Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "The Service is not directed at persons under 18 and we do not intend to collect personal information from children under 18 in our capacity as a controller. If you become aware that a child has provided us with personal information without appropriate consent, then please contact us using the details below so that we can take the appropriate steps in accordance with our legal obligations and this privacy policy.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
           Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "CHANGES TO THIS POLICY",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "We may update this privacy policy from time to time and so you should review this page periodically. When we change this privacy policy in a material way, we will update the “last modified” date at the end of this privacy policy. Changes to this privacy policy are effective when they are posted on this page.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
           Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "NOTICE TO YOU",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
           Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "If we need to provide you with information about something, whether for legal, marketing or other business-related purposes, we will select what we believe is the best way to get in contact with you. We will usually do this through email or by placing a notice on our Website. The fact that we may send notices to you will not stop you from being able to opt out of certain types of contact as described in this privacy policy.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
           Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "CONTACTING US",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "If you have any questions about the Privacy Policy or our use of the information we collect from you in connection with the Service, you may contact us by email at reception@gabrielhousing.com, or by mail at 506 Lorne Street, Regina, SK S4R 2J7. Attn: GabrielHousing.",
              style:
                  TextStyle(fontSize: 13, fontFamily: Styles.fontFamilyMedium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new Text(
              "THIS PRIVACY POLICY WAS LAST MODIFIED March 30, 2021.",
              style: TextStyle(fontSize: 15, fontFamily: Styles.fontFamilyBold),
              textAlign: TextAlign.left,
            ),
          ),
        ])),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    // Navigator.push(
    //     context, new MaterialPageRoute(builder: (context) => Home()));
    Navigator.of(context).pop();
    return Future.value(false);
  }
}
