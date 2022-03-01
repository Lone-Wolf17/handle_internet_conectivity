import 'package:flutter/material.dart';
import 'package:handle_internet_conectivity/app/app.locator.dart';
import 'package:handle_internet_conectivity/app/app.router.dart';
import 'package:handle_internet_conectivity/ui/shared/setup_snackbar_ui.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await setUpSnackBarUI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Connectivity State",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}