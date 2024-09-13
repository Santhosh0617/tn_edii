import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/training.dart';
import 'package:tn_edii/models/user.dart';
import 'package:tn_edii/providers/auth_provider.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/providers/training_provider.dart';
import 'package:tn_edii/providers/user_provider.dart';
import 'package:tn_edii/repositories/training_repository.dart';
import 'package:tn_edii/services/route/routes.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/theme/theme_guide.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';
import 'dart:math' as math;
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key, required this.training});
  final Training training;
  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, TrainingProvider>(
      builder: (context, value, training, child) {
        User? user = value.user;

        return Scaffold(
          backgroundColor: Palette.dark.withOpacity(.5),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: context.widthFull(),
                padding: EdgeInsets.all(SizeUnit.lg),
                margin: EdgeInsets.all(SizeUnit.lg),
                decoration: ThemeGuide.cardDecoration(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                          child: TextCustom('Registration Profile',
                              size: 16, fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                            onPressed: onEdit,
                            icon: Icon(Icons.edit_note_outlined,
                                color: Palette.dark))
                      ]),
                      Row(children: [
                        Expanded(
                          child: TextColumn(
                              head: 'Name',
                              value: user?.name ?? '',
                              isStart: true),
                        ),
                        Expanded(
                          child: TextColumn(
                              head: 'Mobile',
                              value: user?.phonenumber ?? '',
                              isEnd: true),
                        ),
                      ]),
                      HeightFull(),
                      Row(children: [
                        Expanded(
                          child: TextColumn(
                              head: 'DOB',
                              value: (user?.dateOfBirth ?? '').ddMMYYYY,
                              isStart: true),
                        ),
                        Expanded(
                          child: TextColumn(
                              head: 'District',
                              value: user?.location ?? '',
                              isEnd: true),
                        ),
                      ]),
                      HeightFull(),
                      Row(children: [
                        Expanded(
                          child: TextColumn(
                              head: 'University',
                              value: (user?.nameOfUniversity ?? ''),
                              isStart: true),
                        ),
                        Expanded(
                          child: TextColumn(
                              head: 'Degree',
                              value: user?.qualification ?? '',
                              isEnd: true),
                        ),
                      ]),
                      HeightFull(),
                      Row(children: [
                        Expanded(
                          child: TextColumn(
                              head: 'Percentage/Grade',
                              value: (user?.percentageOfMarks ?? ''),
                              isStart: true),
                        ),
                        Expanded(
                          child: TextColumn(
                              head: 'Year Of Completion',
                              value: user?.yearOfCompletion ?? '',
                              isEnd: true),
                        ),
                      ]),
                      HeightFull(),
                      TextColumn(
                          head: 'Permenant Address',
                          value: user?.permanentAddress ?? '',
                          isStart: true),
                      HeightFull(),
                      TextColumn(
                          head: 'Address for Communication',
                          value: user?.addressOfCommunication ?? '',
                          isStart: true),
                      HeightFull(),
                      DoubleButton(
                          primaryLabel: 'Enroll',
                          secondarylabel: 'Cancel',
                          primaryOnTap: enRoll,
                          isLoading: training.isLoading,
                          secondaryOnTap: () => context.pop())
                    ]),
              ),
            ],
          )),
        );
      },
    );
  }

  void enRoll() async {
    if (widget.training.id == null) return;
    int paymentId = math.Random().nextInt(1000) + 10000;
    Map<String, dynamic> body = {
      'userId': authProvider.user?.id,
      'is_payment_done': true,
      'payment_id': paymentId
    };
    bool isRegistered = await TrainingRepository()
        .registerTraining(context, widget.training.id!, body);
    if (!isRegistered) return;
    context
      ..pop()
      ..pop();
  }

  void onEdit() {
    context.push(Routes.registerProfile);
  }
  // bool val = await context.push(Routes.registerProfile) ?? false;
  //   if (training.id == null || !val) return;
  //   int paymentId = math.Random().nextInt(1000) + 10000;
  //   Map<String, dynamic> body = {
  //     'userId': authProvider.user?.id,
  //     'is_payment_done': true,
  //     'payment_id': paymentId
  //   };
  //   bool isRegistered = await TrainingRepository()
  //       .registerTraining(context, training.id!, body);
  //   if (!isRegistered) return;
  //   context.pop();
}
