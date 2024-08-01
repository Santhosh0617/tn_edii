import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/network_image_cus.dart';
import 'package:tn_edii/common/widgets/text.dart';
import 'package:tn_edii/constants/size_unit.dart';
import 'package:tn_edii/constants/space.dart';
import 'package:tn_edii/models/expense_type.dart';
import 'package:tn_edii/models/user.dart';
import 'package:tn_edii/providers/user_provider.dart';
import 'package:tn_edii/theme/palette.dart';

class MentorDetailScreen extends StatefulWidget {
  const MentorDetailScreen({super.key});

  @override
  State<MentorDetailScreen> createState() => _MentorDetailScreenState();
}

class _MentorDetailScreenState extends State<MentorDetailScreen> {
  ExpenseType get expenseType => GoRouterState.of(context).extra as ExpenseType;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isStackedAppBar: false,
      appBar: AppBarCommon(
        automaticLeadingImplies: true,
        title: expenseType.expense,
        isText: false,
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          List<User> users = List.from(value.users);
          users.removeWhere((e) => e.role != expenseType.role);
          return ListView(
              padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
              shrinkWrap: true,
              children: [
                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    User user = users[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(
                        maxRadius: 35,
                        backgroundColor: Palette.accent,
                        child: NetworkImageCustom(logo: ''),
                      ),
                      title: TextCustom(
                        user.name ?? '',
                        size: 16,
                        fontWeight: FontWeight.w800,
                      ),
                      subtitle: TextCustom(
                        user.email ?? '',
                        size: 14,
                        fontWeight: FontWeight.w700,
                        color: Palette.grey,
                      ),
                    );
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
