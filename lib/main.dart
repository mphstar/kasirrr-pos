import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sarpras_app/pages/home.dart';
import 'package:sarpras_app/providers/home_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
          title: 'Kasirrr', debugShowCheckedModeBanner: false, home: Home()),
    );
  }
}
