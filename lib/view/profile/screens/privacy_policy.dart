import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: AppBarCommon(
        automaticLeadingImplies: true,
        title: "Privacy Policy",
        isText: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                  align: TextAlign.justify,
                  height: 2,
                  "Ensuring privacy in e-learning mobile applications involves implementing robust measures to safeguard users' personal information and data. Key practices include data encryption, which encodes information to prevent unauthorized access, and obtaining user consent before collecting, processing, or sharing personal data. Anonymization techniques remove or alter identifiers to protect individuals' identities, while data minimization principles dictate collecting only necessary information and limiting unnecessary data collection. Security measures are crucial. encompassing both technical safeguards and organizational protocols to defend against unauthorized access, alteration, or destruction of data. Transparent privacy policies outline how data is collected, used, shared. and protected, ensuring clarity for users. Compliance with regulations like GDPR and CCPA further ensures adherence to stringent data protection standards. Effective incident response plans are essential for promptly addressing data breaches or privacy incidents. Providing users with access to their data and control over privacy settings enhances trust and compliance, fostering a secure and respectful environment for e-learning activities.")
            ],
          ),
        ),
      ),
    );
  }
}
