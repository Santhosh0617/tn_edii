import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/user.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/providers/user_provider.dart';
import 'package:tn_edii/repositories/user_repository.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/custom_date_time.dart';
import 'package:tn_edii/utilities/extensions/form_extension.dart';
import 'package:tn_edii/utilities/message.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  DateTime? date;

  @override
  void initState() {
    nameController.text = authProvider.user?.name ?? " ";
    mobileController.text = authProvider.user?.phonenumber ?? " ";
    emailController.text = authProvider.user?.email ?? " ";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isStackedAppBar: false,
      appBar: const AppBarCommon(
          automaticLeadingImplies: true, title: "Edit Profile", isText: false),
      body: Form(
        key: formkey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const HeightFull(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormFieldCustom(
                      label: 'Name',
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      hint: 'Enter your name'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Mobile',
                      keyboardType: TextInputType.number,
                      controller: mobileController,
                      maxLength: 10,
                      hint: 'Enter your mobile number'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      hint: 'Enter your email id'),
                ],
              ),
            ),
            const HeightFull(multiplier: 2),
            Consumer<UserProvider>(
              builder: (context, user, child) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                child: Row(children: [
                  Expanded(
                    child: ButtonPrimary(
                        onPressed: hitAPI,
                        isLoading: user.isLoading,
                        label: "Update Profile"),
                  ),
                ]),
              ),
            ),
            const HeightFull(),
          ],
        ),
      ),
    );
  }

  hitAPI() async {
    if (formkey.hasError) return;
    User? user = authProvider.user;
    user = user?.copywith(
        name: nameController.text,
        phonenumber: mobileController.text,
        email: emailController.text);
    bool isUpdated =
        await UserRepository().updateUser(context, user?.toJson() ?? {});
    if (!isUpdated) return;
    showMessage("Profile Updated Successfully...!");
    context.pop();
  }
}
