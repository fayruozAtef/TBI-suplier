import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:map_launcher/map_launcher.dart';
import 'branches/presentation/screens/home_screen.dart';
import 'core/services/services_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: const Locale('ar'),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}
