import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/loaders.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/assets/local_images.dart';
import 'package:tn_edii/constants/keys.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/expense_type.dart';
import 'package:tn_edii/models/resource_model.dart';
import 'package:tn_edii/providers/resource_provider.dart';
import 'package:tn_edii/repositories/resource_repository.dart';
import 'package:tn_edii/theme/palette.dart';
import 'package:tn_edii/utilities/extensions/string_extenstion.dart';

class MentorDetailScreen extends StatefulWidget {
  const MentorDetailScreen({super.key});

  @override
  State<MentorDetailScreen> createState() => _MentorDetailScreenState();
}

class _MentorDetailScreenState extends State<MentorDetailScreen> {
  ExpenseType get expenseType => GoRouterState.of(context).extra as ExpenseType;
  // Resourses get resourceData => GoRouterState.of(context).extra as Resourses;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((e) => init());
    super.initState();
  }

  void init() {
    ResourceRepository().getUsers(context, expenseType.role);
    // Loader();
    // if (expenseType.role == "expert") {
    //   ResourceRepository().getResourseDataExpert(context);
    // } else if (expenseType.role == "mentor") {
    //   ResourceRepository().getResourseDataMentor(context);
    // } else {
    //   ResourceRepository().getResourseDataInvestor(context);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isStackedAppBar: false,
      color: Palette.bg,
      appBar: AppBarCommon(
        automaticLeadingImplies: true,
        title: expenseType.role.capitalize,
        isText: false,
      ),
      body: Consumer<ResourceProvider>(
        builder: (context, value, child) {
          // List<User> users = List.from(value.users);
          // users.removeWhere((e) => e.role != expenseType.role);
          return
              // value.resourseData.isEmpty?
              // SizedBox(
              //         height: 600,
              //         child: Center(
              //           child: TextCustom("${expenseType.role} not available"),
              //         ),
              //       ):
              ListView(
                  padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
                  shrinkWrap: true,
                  children: [
                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.resourseData.length,
                  itemBuilder: (context, index) {
                    // User user = users[index];
                    Resourses resourseReport = value.resourseData[index];
                    logger.w(resourseReport.toJson());
                    return Container(
                      height: 76,
                      padding: const EdgeInsets.all(SizeUnit.md),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Palette.pureWhite),
                      child: Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 37,
                            backgroundColor: Palette.accent,
                            child: NetworkImageCustom(
                                logo: '',
                                placeholderImage:
                                    LocalImages.profilePlaceholder),
                          ),
                          WidthHalf(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustom(
                                resourseReport.name ?? '',
                                size: 16,
                                fontWeight: FontWeight.w800,
                              ),
                              TextCustom(
                                resourseReport.email ?? '',
                                size: 14,
                                fontWeight: FontWeight.w700,
                                color: Palette.grey,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                    // ListTile(
                    //   // tileColor: Palette.pureWhite,
                    //   contentPadding: EdgeInsets.zero,
                    //   leading: const CircleAvatar(
                    //     maxRadius: 35,
                    //     backgroundColor: Palette.accent,
                    //     child: NetworkImageCustom(
                    //         logo: '',
                    //         placeholderImage: LocalImages.profilePlaceholder),
                    //   ),
                    //   title: TextCustom(
                    //     resourseReport.name ?? '',
                    //     size: 16,
                    //     fontWeight: FontWeight.w800,
                    //   ),
                    //   subtitle: TextCustom(
                    //     resourseReport.email ?? '',
                    //     size: 14,
                    //     fontWeight: FontWeight.w700,
                    //     color: Palette.grey,
                    //   ),
                    // );
                  },
                  separatorBuilder: (context, index) {
                    return const HeightFull();
                  },
                ),
                const HeightFull(),
              ]);
        },
      ),
    );
  }
}
