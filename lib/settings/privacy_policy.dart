import 'package:enchanteddiary/header/header.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  final Color darkBlue = Color(0xFF001244);
  final Color lightBlue = Color(0xFF005086);
  final Color skyBlue = Color(0xFF318fb5);
  final Color lightGray = Color(0xFFb0cac7);
  final Color lightYellow = Color(0xFFf7d6bf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      backgroundColor: lightYellow,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🍪 PRIVACY POLICY 🍪',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'We are committed to maintaining the accuracy, confidentiality, and security of your personally identifiable information ("Personal Information"). As part of this commitment, our privacy policy governs our actions as they relate to the collection, use and disclosure of Personal Information. Our privacy policy is based upon the values set by the French Standards Association\'s Model Code for the Protection of Personal Information and France\'s Personal Information Protection and Electronic Documents Act.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 16.0),
            Text(
              '1. Introduction',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We are responsible for maintaining and protecting the Personal Information under our control. We have designated an individual or individuals who is/are responsible for compliance with our privacy policy.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 16.0),
            Text(
              '2. Identifying Purposes',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We collect, use and disclose Personal Information to provide you with the product or service you have requested and to offer you additional products and services we believe you might be interested in. The purposes for which we collect Personal Information will be identified before or at the time we collect the information. In certain circumstances, the purposes for which information is collected may be clear, and consent may be implied, such as where your name, address and payment information is provided as part of the order process.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 16.0),
            Text(
              '3. Consent',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Knowledge and consent are required for the collection, use or disclosure of Personal Information except where required or permitted by law. Providing us with your Personal Information is always your choice. However, your decision not to provide certain information may limit our ability to provide you with our products or services. We will not require you to consent to the collection, use, or disclosure of information as a condition to the supply of a product or service, except as required to be able to supply the product or service.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),

            SizedBox(height: 16.0),
            Text(
              '4. Limiting Collection',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'The Personal Information collected will be limited to those details necessary for the purposes identified by us. With your consent, we may collect Personal Information from you in person, over the telephone or by corresponding with you via mail, facsimile, or the Internet.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 16.0),
            Text(
              '5. Limiting Use, Disclosure and Retention',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Personal Information may only be used or disclosed for the purpose for which it was collected unless you have otherwise consented, or when it is required or permitted by law. Personal Information will only be retained for the period of time required to fulfill the purpose for which we collected it or as may be required by law.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 16.0),
            Text(
              '6. Accuracy',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Personal Information will be maintained in as accurate, complete and up-to-date form as is necessary to fulfill the purposes for which it is to be used.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 16.0),
            Text(
              '7. Safeguarding Customer Information',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Personal Information will be protected by security safeguards that are appropriate to the sensitivity level of the information. We take all reasonable precautions to protect your Personal Information from any loss or unauthorized use, access or disclosure.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 16.0),
            Text(
              '8. Openness',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We will make information available to you about our policies and practices with respect to the management of your Personal Information.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 16.0),
            Text(
              '9. Customer Access',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Upon request, you will be informed of the existence, use and disclosure of your Personal Information, and will be given access to it. You may verify the accuracy and completeness of your Personal Information, and may request that it be amended, if appropriate. However, in certain circumstances permitted by law, we will not disclose certain information to you. For example, we may not disclose information relating to you if other individuals are referenced or if there are legal, security or commercial proprietary restrictions.',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 16.0),
            Text(
              '10. Handling Customer Complaints and Suggestions ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'You may direct any questions or enquiries with respect to our privacy policy or our practices by contacting:',
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 8.0),
            Text(
              'desticourt.matt@uphf.fr',
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                fontFamily: 'Poppins',
                color: lightBlue,
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

