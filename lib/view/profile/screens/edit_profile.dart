import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/bottom_sheets.dart';
import 'package:tn_edii/common/widgets/buttons.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';

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
        automaticLeadingImplies: true,
        title: "Edit Profile",
        isText: false,
      ),
      body: Column(
        children: [
          Stack(
            alignment: const Alignment(0, -1.1),
            children: [
              Container(
                width: context.widthFull(),
                padding: const EdgeInsets.all(SizeUnit.lg),
                margin: const EdgeInsets.all(SizeUnit.lg),
                // decoration: ThemeGuide.cardDecoration(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          alignment: const Alignment(1, 1),
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              padding: const EdgeInsets.all(6),
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Palette.primary),
                              child: img == null
                                  ? Container(
                                      height: 100,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: const NetworkImageCustom(logo: ""))
                                  : Container(
                                      height: 100,
                                      width: 100,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child:
                                          Image.file(img!, fit: BoxFit.cover),
                                    ),
                            ),
                            InkWell(
                              onTap: () {
                                commonBottomSheet(context, ImagePickerSelect(
                                  onPicked: (File? data) {
                                    img = data;
                                    setState(() {});
                                  },
                                ));
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                padding: const EdgeInsets.all(2),
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Palette.pureWhite),
                                child: const Icon(Icons.edit,
                                    color: Palette.primary, size: 22),
                              ),
                            )
                          ],
                        ),
                      ),
                      const HeightFull(multiplier: 2),
                      const TextCustom("Name", fontWeight: FontWeight.bold),
                      const HeightHalf(),
                      TextFormFieldCustom(
                          label: 'Name',
                          keyboardType: TextInputType.emailAddress,
                          controller: nameController,
                          isBorderLess: false,
                          hint: 'Enter your Name'),
                      const HeightFull(),
                      const TextCustom("Mobile", fontWeight: FontWeight.bold),
                      const HeightHalf(),
                      TextFormFieldCustom(
                          label: 'Mobile',
                          keyboardType: TextInputType.emailAddress,
                          controller: nameController,
                          hint: 'Enter your Mobile Number'),
                      const HeightFull(),
                      const TextCustom("Email", fontWeight: FontWeight.bold),
                      const HeightHalf(),
                      TextFormFieldCustom(
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          controller: nameController,
                          hint: 'Enter your Email Id'),
                      const HeightFull(multiplier: 2),
                      Center(
                          child: ButtonPrimary(
                              onPressed: hitAPI, label: "Update Profile"))
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  hitAPI() {
    context.pop();
  }
}

class ImagePickerSelect extends StatefulWidget {
  const ImagePickerSelect({super.key, required this.onPicked});
  final Function(File?) onPicked;
  @override
  State<ImagePickerSelect> createState() => _ImagePickerSelectState();
}

class _ImagePickerSelectState extends State<ImagePickerSelect> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80 + MediaQuery.of(context).viewInsets.bottom,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () => onPickImage(ImageSource.camera, context),
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Row(children: [
                Icon(Icons.camera, color: Palette.primary),
                SizedBox(width: SizeUnit.md),
                TextCustom("Camera",
                    fontWeight: FontWeight.w500, color: Palette.primary)
              ]),
            ),
          ),
          InkWell(
            onTap: () => onPickImage(ImageSource.gallery, context),
            splashFactory: NoSplash.splashFactory,
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Row(children: [
                Icon(Icons.photo_sharp, color: Palette.primary),
                SizedBox(width: SizeUnit.md),
                TextCustom("Gallery",
                    fontWeight: FontWeight.w500, color: Palette.primary)
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  void onPickImage(ImageSource source, BuildContext context) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;
    File file = File(pickedFile.path);
    widget.onPicked(file);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    setState(() {});
  }
}
