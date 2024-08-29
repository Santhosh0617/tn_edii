import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/custom_validator.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/providers/auth_provider.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/message.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  TextEditingController feedbackController = TextEditingController();
  int selectedIndex = -1;

  // hitAPI() {
  //   Navigator.pop(context);
  // }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      color: Palette.pureWhite,
      appBar: const AppBarCommon(
        automaticLeadingImplies: true,
        title: "Feedback",
        isText: false,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, profile, child) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const TextCustom(
              "How did we do?",
              fontWeight: FontWeight.normal,
            ),
            const HeightFull(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      // Toggle the selected star
                      if (selectedIndex == index) {
                        selectedIndex = -1;
                      } else {
                        selectedIndex = index;
                      }
                    });
                  },
                  child: Icon(
                    selectedIndex >= index ? Icons.star : Icons.star_outline,
                    size: 34,
                    color: selectedIndex >= index ? Colors.amber : Colors.grey,
                  ),
                );
              }),
            ),
            const HeightFull(
              multiplier: 2,
            ),
            FeedbackTextfield(
              controller: feedbackController,
              onChanged: (p0) => setState(() {
                hasError = p0.isEmpty;
              }),
              hint: "Please write your honest review",
            ),
            CustomValidator('The review field is required', isShow: hasError),
            const HeightFull(),
            const HeightFull(multiplier: 2),
            ButtonPrimary(
              onPressed: hitAPI,
              label: "Submit",
            )
          ],
        ),
      ),
    );
  }

  bool hasError = false;
  hitAPI() {
    if (feedbackController.text.isEmpty) {
      // return showMessage("Kindly Enter Review");
      hasError = true;
      setState(() {});
      return;
    }
    Navigator.of(context)
      ..pop()
      ..pop();
    showMessage("Review Submitted Successfully");
  }
}
