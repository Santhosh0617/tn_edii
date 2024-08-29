import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/common/widgets/text_fields.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/context_extention.dart';

class CompletedCourseDetails extends StatefulWidget {
  const CompletedCourseDetails({super.key});

  @override
  State<CompletedCourseDetails> createState() => _CompletedCourseDetailsState();
}

class _CompletedCourseDetailsState extends State<CompletedCourseDetails> {
  final TextEditingController searchCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        color: Palette.bg,
        appBar: const AppBarCommon(
          automaticLeadingImplies: true,
          title: "My Courses",
          isText: false,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Container();
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 12)
        // ListView(
        //   shrinkWrap: true,
        //   physics:NeverScrollableScrollPhysics(),
        //   padding: const EdgeInsets.all(SizeUnit.xlg),

        //   children: [
        //     HeightFull(),
        //     Container(
        //       padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
        //       height: context.heightFull(),
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(22),
        //           color: Palette.pureWhite),
        //           child: SizedBox(
        //             height: context.heightFull(),
        //             child: ListView.separated(
        //               // physics: const NeverScrollableScrollPhysics(),
        //                 itemBuilder: (context, index) {
        //                   return  const Column(
        //                     children: [
        //                       Row(
        //                         children: [
        //                           TextCustom("Section 01 -",size: 14,fontWeight: FontWeight.w600,color: Palette.dark,),
        //                           TextCustom(" Title",size: 14,fontWeight: FontWeight.w600,color: Palette.primary,),

        //                         ],
        //                       )
        //                     ],
        //                   );
        //                 },
        //                 separatorBuilder: (context, index) {
        //                   return const Divider();
        //                 },
        //                 itemCount: 20),
        //           ) ,
        //     ),

        //   ],
        // ),
        );
  }
}
