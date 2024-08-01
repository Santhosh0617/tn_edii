// import 'package:flutter/material.dart';
// import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
// import 'package:tn_edii/common/widgets/custom_scaffold.dart';
// import 'package:tn_edii/constants/size_unit.dart';
// import 'package:tn_edii/constants/space.dart';
// import 'package:tn_edii/theme/theme_guide.dart';

// class ViewProfileScreen extends StatefulWidget {
//   const ViewProfileScreen({super.key});

//   @override
//   State<ViewProfileScreen> createState() => _ViewProfileScreenState();
// }

// class _ViewProfileScreenState extends State<ViewProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       isStackedAppBar: false,
//       appBar: const AppBarCommon(
//           automaticLeadingImplies: false, title: "View Profile"),
//       body: Column(
//         children: [
//           const HeightFull(),
//           Stack(
//             alignment: const Alignment(0, -1.1),
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(SizeUnit.lg),
//                 margin: const EdgeInsets.all(SizeUnit.lg),
//                 decoration: ThemeGuide.cardDecoration(),
//                 child: Column(children: [
//                   const HeightFull(multiplier: 3),
//                 ]),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
