import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proximus/screens/dashboard.dart';
import 'package:proximus/screens/login_page.dart';
import 'package:proximus/services/shared_preferences.dart';

class Routes {
  final Map<String, WidgetBuilder> routes = {
    '/login': (BuildContext context) => Login(),
    '/dashboard': (BuildContext context) => DashBoard(),
  };
  Routes() {
    runApp(MainWidget(routes));
  }
}

class MainWidget extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;
  MainWidget(this.routes);
  @override
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WaitScreen(),
      routes: routes,
    );
  }
}

class WaitScreen extends StatelessWidget {
  initMethod(context) {
    String user = local.returnUser();
    if (user.isEmpty) {
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/dashboard', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => initMethod(context));

    return Container();
  }
}
