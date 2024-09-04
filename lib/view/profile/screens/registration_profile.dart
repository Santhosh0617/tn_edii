import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/user.dart';
import 'package:tn_edii/providers/providers.dart';
import 'package:tn_edii/providers/user_provider.dart';
import 'package:tn_edii/repositories/user_repository.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/form_extension.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';

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
  // DateTime? date;

  bool get isRegistration => (GoRouterState.of(context).extra ?? false) as bool;
  File? img;
  // datePick() async {
  //   FocusScope.of(context).unfocus();

  //   DateTime date = dateController.text.strToDate ?? CustomDateTime().now;
  //   DateTime? pickedDate = await showDatePicker(
  //       builder: (BuildContext context, Widget? child) {
  //         return Theme(
  //           data: ThemeData.light().copyWith(
  //             primaryColor: Palette.primary,
  //             hintColor: Colors.red,
  //             colorScheme: const ColorScheme.light(primary: Palette.primary),
  //             buttonTheme: const ButtonThemeData(
  //               textTheme: ButtonTextTheme.primary,
  //             ),
  //           ),
  //           child: child!,
  //         );
  //       },
  //       context: context,
  //       initialDate: date,
  //       firstDate: DateTime(1940),
  //       lastDate: DateTime(2025));
  //   if (pickedDate != null) {
  //     String formattedDate = pickedDate.toString().ddMMYYYY;
  //     setState(() {
  //       dateController.text = formattedDate;
  //     });
  //   } else {}
  // }

  Future<void> datePick({String dateFormatString = 'dd/MM/yyyy'}) async {
    FocusScope.of(context).unfocus();

    // Define your date format based on the input parameter
    final DateFormat dateFormat = DateFormat(dateFormatString);

    // Parse the manually entered date using the dateFormat
    DateTime date;
    try {
      date = dateFormat.parseLoose(dateController.text);
    } catch (e) {
      date = DateTime.now(); // Fallback to current date if parsing fails
    }

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
      initialDate: date,
      firstDate: DateTime(1700),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      // Format the picked date using the dateFormat
      String formattedDate = pickedDate.toString().ddMMYYYY;
      setState(() {
        dateController.text = formattedDate;
      });
    }
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t) => init());
    super.initState();
  }

  void init() {
    User? user = authProvider.user;
    if (user == null) return;
    nameController.text = user.name ?? '';
    mobileController.text = user.phonenumber ?? '';
    emailController.text = user.email ?? '';
    dateController.text = user.dateOfBirth?.ddMMYYYY ?? '';
    ageController.text = user.age ?? '';
    districtController.text = user.location ?? '';
    seletedGender = gender.firstWhere(
        (e) =>
            e['title'].toString().toLowerCase() == user.gender?.toLowerCase(),
        orElse: () => null);
    seletedcommunity = community.firstWhere((e) => e['title'] == user.community,
        orElse: () => null);
    seletedreligion = religion.firstWhere(
        (e) =>
            e['title'].toString().toLowerCase() == user.religion?.toLowerCase(),
        orElse: () => null);
    if (user.differentlyAbled != null) {
      seletedabled = user.differentlyAbled! ? abled.first : abled.last;
    }
    seleteQualification = qualification.firstWhere(
        (e) => e['title'] == user.qualification,
        orElse: () => null);
    universityController.text = user.nameOfUniversity ?? '';
    degreeController.text = user.nameOfDegree ?? '';
    gradeController.text = user.percentageOfMarks ?? '';
    yearController.text = user.yearOfCompletion ?? '';
    fatherNameController.text = user.fatherName ?? '';
    motherNameController.text = user.motherName ?? '';
    fatherPhnController.text = user.guardianNumber ?? '';
    permanentAddController.text = user.permanentAddress ?? '';
    communicationAddController.text = user.addressOfCommunication ?? '';
    setState(() {});
  }

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
                      // Expanded(
                      //   child: TextFormFieldCustom(
                      //       label: 'Age',
                      //       keyboardType: TextInputType.number,
                      //       controller: ageController,
                      //       hint: 'Enter your Age'),
                      // ),
                      // const WidthFull(),
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
                              value: gender[i],
                              title: TextCustom(gender[i]['title'] ?? ''),
                              groupValue: seletedGender,
                              onChanged: (e) {
                                seletedGender = gender[i];
                                logger.e(seletedGender);
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
                              groupValue: seletedcommunity,
                              title: TextCustom(community[i]['title'] ?? ''),
                              value: community[i],
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
                              groupValue: seletedreligion,
                              title: TextCustom(religion[i]['title'] ?? ''),
                              value: religion[i],
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
                              groupValue: seletedabled,
                              title: TextCustom(abled[i]['title'] ?? ''),
                              value: abled[i],
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
                              groupValue: seleteQualification,
                              title:
                                  TextCustom(qualification[i]['title'] ?? ''),
                              value: qualification[i],
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
            Consumer<UserProvider>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                child: Row(children: [
                  Expanded(
                    child: ButtonPrimary(
                        onPressed: hitAPI,
                        isLoading: value.isLoading,
                        label: "Submit"),
                  ),
                ]),
              ),
            ),
            const HeightFull(multiplier: 2),
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
        email: emailController.text,
        dateOfBirth: dateController.text.strToDate.toString(),
        // age: ageController.text,
        location: districtController.text,
        nameOfUniversity: universityController.text,
        nameOfDegree: degreeController.text,
        yearOfCompletion: yearController.text,
        percentageOfMarks: gradeController.text,
        fatherName: fatherNameController.text,
        motherName: motherNameController.text,
        guardianNumber: fatherPhnController.text,
        permanentAddress: permanentAddController.text,
        addressOfCommunication: communicationAddController.text,
        religion: seletedreligion?['title'],
        differentlyAbled: seletedabled?['id'] == 1,
        qualification: seleteQualification?['title'],
        community: seletedcommunity?['title'],
        gender: seletedGender?['title']);
    logger.e(user?.toJson());
    bool value =
        await UserRepository().updateUser(context, user?.toJson() ?? {});
    // if (!value) return;
    // context.pop(value);

    // showMessage("Register Successfully...!");
  }
}
