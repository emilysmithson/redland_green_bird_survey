import 'package:flutter/material.dart';

import '../../widgets/page_template.dart';
import 'my_details_controller.dart';
import 'widgets/authenticated_content.dart';
import 'widgets/awaiting_verification_content.dart';
import 'widgets/login_content.dart';
import 'widgets/register_content.dart';
import 'widgets/unauthenticated_content.dart';

class MyDetailsPage extends StatefulWidget {
  const MyDetailsPage({super.key});

  @override
  _MyDetailsPageState createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  late MyDetailsController controller;

  @override
  void initState() {
    controller = MyDetailsController();
    controller.initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.content,
      builder: (context, MyDetailsView content, child) {
        late Widget currentWidget;
        switch (content) {
          case MyDetailsView.authenticated:
            currentWidget = AuthenticatedContent(controller: controller);
            break;
          case MyDetailsView.unauthenticated:
            currentWidget = UnauthenticatedContent(controller: controller);
            break;
          case MyDetailsView.login:
            currentWidget = LoginContent(controller: controller);
            break;
          case MyDetailsView.register:
            currentWidget = RegisterContent(controller: controller);
            break;
          case MyDetailsView.awaitingVerification:
            currentWidget = AwaitingVerificationContent(controller: controller);
            break;
        }
        return PageTemplate(
          title: 'My Details',
          image: 'assets/coaltit1.png',
          widgetList: [currentWidget],
          heroTag: 'my_details',
        );
      },
    );
  }
}
