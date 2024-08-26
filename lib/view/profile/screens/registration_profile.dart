import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/custom_date_time.dart';
import 'package:tn_edii/utilities/extensions/form_extension.dart';
import 'package:tn_edii/utilities/message.dart';

class RegistrationProfile extends StatefulWidget {
  const RegistrationProfile({super.key});

  @override
  State<RegistrationProfile> createState() => _RegistrationProfileState();
}

class _RegistrationProfileState extends State<RegistrationProfile> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController fatherPhnController = TextEditingController();
  final TextEditingController permanentAddController = TextEditingController();
  final TextEditingController communicationAddController =
      TextEditingController();
  DateTime? date;

  bool get isRegistration => (GoRouterState.of(context).extra ?? false) as bool;
  File? img;
  datePick() async {
    FocusScope.of(context).unfocus();
    DateTime? pickedDate = await showDatePicker(
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Palette.primary,
              hintColor: Colors.red,
              colorScheme: const ColorScheme.light(primary: Palette.primary),
              buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: date ?? CustomDateTime().now,
        firstDate: DateTime(1990),
        lastDate: DateTime(2025));
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        dateController.text = formattedDate;
        date = pickedDate;
      });
    } else {}
  }

  Map? seletedGender;
  List gender = [
    {"id": 1, "title": "Male"},
    {"id": 2, "title": "Female"},
    {"id": 3, "title": "Trangender"}
  ];
  Map? seletedcommunity;
  List community = [
    {"id": 1, "title": "SC/GT"},
    {"id": 2, "title": "MBC"},
    {"id": 3, "title": "BC"},
    {"id": 4, "title": "OC"},
  ];
  Map? seletedreligion;
  List religion = [
    {"id": 1, "title": "Hindu"},
    {"id": 2, "title": "Christian"},
    {"id": 3, "title": "Muslim"},
    {"id": 4, "title": "Other"},
  ];
  Map? seletedabled;
  List abled = [
    {"id": 1, "title": "Yes"},
    {"id": 2, "title": "No"},
  ];
  Map? seleteQualification;
  List qualification = [
    {"id": 1, "title": "UG"},
    {"id": 2, "title": "PG"},
    {"id": 3, "title": "UG(final year)"},
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isStackedAppBar: false,
      appBar: const AppBarCommon(
          automaticLeadingImplies: true,
          title: "Complete Registration",
          isText: false),
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
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldCustom(
                            label: 'Name',
                            keyboardType: TextInputType.name,
                            controller: nameController,
                            hint: 'Enter your name'),
                      ),
                      const WidthFull(),
                      Expanded(
                        child: TextFormFieldCustom(
                            label: 'Mobile',
                            keyboardType: TextInputType.number,
                            controller: mobileController,
                            maxLength: 10,
                            hint: 'Enter your mobile number'),
                      ),
                    ],
                  ),
                  const HeightFull(),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldCustom(
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            hint: 'Enter your email id'),
                      ),
                      const WidthFull(),
                      Expanded(
                        child: TextFormFieldCustom(
                            label: 'Date Of Birth',
                            controller: dateController,
                            onTap: () => datePick(),
                            hint: 'Enter your date'),
                      ),
                    ],
                  ),
                  const HeightFull(),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldCustom(
                            label: 'Age',
                            keyboardType: TextInputType.number,
                            controller: ageController,
                            hint: 'Enter your Age'),
                      ),
                      const WidthFull(),
                      Expanded(
                        child: TextFormFieldCustom(
                            label: 'District',
                            // keyboardType: TextInputType.number,
                            controller: districtController,
                            hint: 'Enter your district'),
                      ),
                    ],
                  ),
                  const HeightFull(),
                  const TextCustom("Gender",
                      color: Palette.grey,
                      size: 14,
                      fontWeight: FontWeight.w700),
                  Wrap(
                      children: List.generate(
                          gender.length,
                          (i) => RadioListTile(
                              value: seletedGender,
                              title: TextCustom(gender[i]['title'] ?? ''),
                              groupValue: gender,
                              onChanged: (e) {
                                seletedGender = gender[i];
                                setState(() {});
                              }))),
                  const HeightFull(),
                  const TextCustom("Community",
                      color: Palette.grey,
                      size: 14,
                      fontWeight: FontWeight.w700),
                  Wrap(
                      children: List.generate(
                          community.length,
                          (i) => RadioListTile(
                              value: seletedcommunity,
                              title: TextCustom(community[i]['title'] ?? ''),
                              groupValue: community,
                              onChanged: (e) {
                                seletedcommunity = community[i];
                                setState(() {});
                              }))),
                  const HeightFull(),
                  const TextCustom("Religion",
                      color: Palette.grey,
                      size: 14,
                      fontWeight: FontWeight.w700),
                  Wrap(
                      children: List.generate(
                          religion.length,
                          (i) => RadioListTile(
                              value: seletedreligion,
                              title: TextCustom(religion[i]['title'] ?? ''),
                              groupValue: religion,
                              onChanged: (e) {
                                seletedreligion = religion[i];
                                setState(() {});
                              }))),
                  const HeightFull(),
                  const TextCustom("Are you differently abled?",
                      color: Palette.grey,
                      size: 14,
                      fontWeight: FontWeight.w700),
                  Wrap(
                      children: List.generate(
                          abled.length,
                          (i) => RadioListTile(
                              value: seletedabled,
                              title: TextCustom(abled[i]['title'] ?? ''),
                              groupValue: abled,
                              onChanged: (e) {
                                seletedabled = abled[i];
                                setState(() {});
                              }))),
                  const HeightFull(),
                  const TextCustom("Qualification",
                      color: Palette.grey,
                      size: 14,
                      fontWeight: FontWeight.w700),
                  Wrap(
                      children: List.generate(
                          qualification.length,
                          (i) => RadioListTile(
                              value: seleteQualification,
                              title:
                                  TextCustom(qualification[i]['title'] ?? ''),
                              groupValue: qualification,
                              onChanged: (e) {
                                seleteQualification = qualification[i];
                                setState(() {});
                              }))),
                  const HeightFull(),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldCustom(
                            label: 'University',
                            // keyboardType: TextInputType.number,
                            controller: universityController,
                            hint: 'Enter your university'),
                      ),
                      const WidthFull(),
                      Expanded(
                        child: TextFormFieldCustom(
                            label: 'Degree',
                            // keyboardType: TextInputType.number,
                            controller: degreeController,
                            hint: 'Enter your degree'),
                      ),
                    ],
                  ),
                  const HeightFull(),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldCustom(
                            label: 'Percentage/Grade',
                            // keyboardType: TextInputType.number,
                            controller: gradeController,
                            hint: 'Enter your percentage/grade'),
                      ),
                      const WidthFull(),
                      Expanded(
                        child: TextFormFieldCustom(
                            label: 'Year of completion ',
                            keyboardType: TextInputType.number,
                            controller: yearController,
                            hint: 'Enter your year of completion'),
                      ),
                    ],
                  ),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Father/Guardian Name',
                      // keyboardType: TextInputType.number,
                      controller: fatherNameController,
                      hint: 'Enter your father/guardian name'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Mother Name',
                      // keyboardType: TextInputType.number,
                      controller: motherNameController,
                      hint: 'Enter your mother name'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Father/Guardian Contact Number',
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      controller: fatherPhnController,
                      hint: 'Enter your father/guardian contact number'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Permanent Address',
                      // keyboardType: TextInputType.number,
                      controller: permanentAddController,
                      hint: 'Enter your permanent address'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Communication Address',
                      // keyboardType: TextInputType.number,∂∂∂
                      controller: communicationAddController,
                      hint: 'Enter your communication address'),
                ],
              ),
            ),
            const HeightFull(multiplier: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              child: Row(children: [
                Expanded(
                  child: ButtonPrimary(onPressed: hitAPI, label: "Submit"),
                ),
              ]),
            ),
            const HeightFull(multiplier: 2),
          ],
        ),
      ),
    );
  }

  hitAPI() {
    if (formkey.hasError) return;
    // User? user = authProvider.user;
    // user = user?.copywith(name: 'Sandy');
    // UserRepository().updateUser(context, user?.toJson() ?? {});
    showMessage("Register Successfully...!");
    context.pop();
  }
}
