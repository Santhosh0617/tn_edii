import 'package:flutter/material.dart';
import 'package:tn_edii/common/widgets/app_bars/app_bar_common.dart';
import 'package:tn_edii/common/widgets/custom_scaffold.dart';
import 'package:tn_edii/common/widgets/text.dart';

class AppInfoScreen extends StatefulWidget {
  const AppInfoScreen({super.key});

  @override
  State<AppInfoScreen> createState() => _AppInfoScreenState();
}

class _AppInfoScreenState extends State<AppInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: AppBarCommon(
        automaticLeadingImplies: true,
        title: "App Info",
        isText: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                  align: TextAlign.justify,
                  height: 2,
                  "An e-learning mobile application is a sophisticated platform designed to revolutionize the way people learn and access educational content on the go. At its core, such an app offers a comprehensive array Of courses spanning various subjects and levels of complexity, accessible directly from users' smartphones or tablets. These courses are typically enriched with multimedia elements like videos, interactive quizzes, and downloadable materials, ensuring a dynamic and engaging learning experience. Each user is equipped with a personalized profile that tracks their progress, achievements, and preferences, allowing for tailored recommendations and a sense of continuity across their learning journey. Interactivity is a key feature of these applications, fostering collaboration through discussion forums, live chat functionalities with instructors or peers, and opportunities for group projects. Notifications and reminders keep learners informed about upcoming classes, deadlines, or new content releases, promoting consistent engagement and organizatiom Feedback mechanisms, including quizzes, tests, and assignments, provide learners with valuable insights into their comprehension and improvement areas, while also facilitating instructors' ability to gauge teaching effectiveness, Successful completion Of courses often results in certificates or badges, which users can showcase to demonstrate their skills and knowledge acquisition. Many e-learning apps also integrate with other tools and platforms, such as learning management systems (LMS), social media, or productivity apps, thereby enhancing the overall learning experience and versatility of the application, Furthermore, security and privacy are paramount, with these apps employing robust measures to safeguard user data and ensure a safe learning environment. Support resources, including FAQs, help sections, and direct communication channels with support teams. are readily available to assist users with any technical or educational inquiries. In essence, e-learning mobile applications empower learners by providing flexibility, accessibility, and interactivity. thereby democratizing access to quality education and fostering continuous personal and professional development in today's digital age.")
            ],
          ),
        ),
      ),
    );
  }
}
