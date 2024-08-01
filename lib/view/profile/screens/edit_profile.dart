import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/user.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/repositories/profile_repository.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/custom_date_time.dart';
import 'package:tn_edii/utilities/extensions/form_extension.dart';

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
          automaticLeadingImplies: true, title: "Edit Profile", isText: false),
      body: Form(
        key: formkey,
        child: ListView(
          // padding: const EdgeInsets.all(SizeUnit.lg),
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
                      keyboardType: TextInputType.emailAddress,
                      controller: nameController,
                      hint: 'Enter your name'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Mobile',
                      keyboardType: TextInputType.emailAddress,
                      controller: mobileController,
                      hint: 'Enter your mobile number'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      hint: 'Enter your email id'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Date Of Birth',
                      // keyboardType: TextInputType.emailAddress,
                      controller: dateController,
                      isOptional: true,
                      onTap: () => datePick(),
                      hint: 'Enter your date'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Age',
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      hint: 'Enter your Age'),
                  const HeightFull(),
                  const TextCustom("Gender",
                      color: Palette.grey,
                      size: 14,
                      fontWeight: FontWeight.w700),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Age',
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      hint: 'Enter your Age'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'University',
                      // keyboardType: TextInputType.number,
                      controller: districtController,
                      hint: 'Enter your district'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Degree',
                      // keyboardType: TextInputType.number,
                      controller: degreeController,
                      hint: 'Enter your degree'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Year of completion ',
                      // keyboardType: TextInputType.number,
                      controller: yearController,
                      hint: 'Enter your year of completion'),
                  const HeightFull(),
                  TextFormFieldCustom(
                      label: 'Percentage/Grade',
                      // keyboardType: TextInputType.number,
                      controller: gradeController,
                      hint: 'Enter your percentage/grade'),
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
                      // keyboardType: TextInputType.number,
                      controller: communicationAddController,
                      hint: 'Enter your communication address'),
                ],
              ),
            ),

            SizedBox(
              height: 50,
              child: ListView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 0),
                itemCount: gender.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isSelect = seletedGender?["id"] == gender[index]["id"];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            seletedGender = gender[index];
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: SizeUnit.lg - 6, right: SizeUnit.lg - 6),
                            height: 58,
                            width: 125,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelect
                                    ? Palette.primary
                                    : Palette.secondary),
                            child: Center(
                              child: TextCustom(gender[index]["title"],
                                  fontWeight: FontWeight.w700,
                                  size: 14,
                                  color: isSelect ? Palette.pureWhite : null),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const HeightFull(),
            const Padding(
              padding: EdgeInsets.only(left: SizeUnit.lg),
              child: TextCustom("Community",
                  color: Palette.grey, size: 14, fontWeight: FontWeight.w700),
            ),
            const HeightHalf(),
            SizedBox(
              height: 50,
              child: ListView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 0),
                itemCount: community.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isSelect =
                      seletedcommunity?["id"] == community[index]["id"];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            seletedcommunity = community[index];
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: SizeUnit.lg - 6, right: SizeUnit.lg - 6),
                            height: 58,
                            width: 125,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelect
                                    ? Palette.primary
                                    : Palette.secondary),
                            child: Center(
                              child: TextCustom(community[index]["title"],
                                  fontWeight: FontWeight.w700,
                                  size: 14,
                                  color: isSelect ? Palette.pureWhite : null),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const HeightFull(),
            const Padding(
              padding: EdgeInsets.only(left: SizeUnit.lg),
              child: TextCustom(
                "Religion",
                size: 14,
                fontWeight: FontWeight.w700,
                color: Palette.grey,
              ),
            ),
            const HeightHalf(),
            SizedBox(
              height: 50,
              child: ListView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 0),
                itemCount: religion.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isSelect =
                      seletedreligion?["id"] == religion[index]["id"];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            seletedreligion = religion[index];
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: SizeUnit.lg - 6, right: SizeUnit.lg - 6),
                            height: 58,
                            width: 125,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelect
                                    ? Palette.primary
                                    : Palette.secondary),
                            child: Center(
                              child: TextCustom(religion[index]["title"],
                                  fontWeight: FontWeight.w700,
                                  size: 14,
                                  color: isSelect ? Palette.pureWhite : null),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const HeightFull(),
            const Padding(
              padding: EdgeInsets.only(left: SizeUnit.lg),
              child: TextCustom("Are you differently abled?",
                  color: Palette.grey, size: 14, fontWeight: FontWeight.w700),
            ),
            const HeightHalf(),
            SizedBox(
              height: 50,
              child: ListView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 0),
                itemCount: abled.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isSelect = seletedabled?["id"] == abled[index]["id"];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            seletedabled = abled[index];
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: SizeUnit.lg - 6, right: SizeUnit.lg - 6),
                            height: 58,
                            width: 125,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelect
                                    ? Palette.primary
                                    : Palette.secondary),
                            child: Center(
                              child: TextCustom(abled[index]["title"],
                                  fontWeight: FontWeight.w700,
                                  size: 14,
                                  color: isSelect ? Palette.pureWhite : null),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const HeightFull(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              child: TextFormFieldCustom(
                  label: 'District',
                  // keyboardType: TextInputType.number,
                  controller: districtController,
                  hint: 'Enter your district'),
            ),
            const HeightFull(),
            const Padding(
              padding: EdgeInsets.only(left: SizeUnit.lg),
              child: TextCustom("Qualification",
                  color: Palette.grey, size: 14, fontWeight: FontWeight.w700),
            ),
            const HeightHalf(),
            SizedBox(
              height: 50,
              child: ListView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 0),
                itemCount: qualification.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isSelect =
                      seleteQualification?["id"] == qualification[index]["id"];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            seleteQualification = qualification[index];
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: SizeUnit.lg - 6, right: SizeUnit.lg - 6),
                            height: 58,
                            width: 125,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelect
                                    ? Palette.primary
                                    : Palette.secondary),
                            child: Center(
                              child: TextCustom(qualification[index]["title"],
                                  fontWeight: FontWeight.w700,
                                  size: 14,
                                  color: isSelect ? Palette.pureWhite : null),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            ///qua
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              child: Column(
                children: [],
              ),
            ),

            const HeightFull(multiplier: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              child: Row(children: [
                Expanded(
                  child:
                      ButtonPrimary(onPressed: hitAPI, label: "Update Profile"),
                ),
              ]),
            ),
            const HeightFull(),
          ],
        ),
      ),
    );
  }

  hitAPI() {
    if (formkey.hasError) return;
    User? user = authProvider.user;
    user = user?.copywith(name: 'Sandy');
    ProfileRepository().updateUser(context, user?.toJson() ?? {});
    // context.pop();
  }
}
