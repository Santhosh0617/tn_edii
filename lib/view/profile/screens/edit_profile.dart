import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/user.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/repositories/user_repository.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  File? img;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isStackedAppBar: false,
      appBar: const AppBarCommon(
          automaticLeadingImplies: true, title: "Edit Profile", isText: false),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(SizeUnit.lg),
          children: [
            const HeightFull(),
            TextFormFieldCustom(
                label: 'Name',
                keyboardType: TextInputType.emailAddress,
                controller: nameController,
                isBorderLess: false,
                hint: 'Enter your Name'),
            const HeightFull(),
            TextFormFieldCustom(
                label: 'Mobile',
                keyboardType: TextInputType.emailAddress,
                controller: nameController,
                hint: 'Enter your Mobile Number'),
            const HeightFull(),
            TextFormFieldCustom(
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: nameController,
                hint: 'Enter your Email Id'),
            const HeightFull(multiplier: 2),
            Row(children: [
              Expanded(
                child:
                    ButtonPrimary(onPressed: hitAPI, label: "Update Profile"),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  hitAPI() {
    User? user = authProvider.user;
    user = user?.copywith(name: 'Sandy');
    UserRepository().updateUser(context, user?.toJson() ?? {});
    // context.pop();
  }
}
