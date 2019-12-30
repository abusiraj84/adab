import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'Screens/home_screem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     localizationsDelegates: [
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
   GlobalCupertinoLocalizations.delegate,
 ],
 supportedLocales: [
    const Locale('ar'), // Arabic
   
  ],
      title: 'الأدب الخالد',
      theme: ThemeData(
        fontFamily: 'ExpoArabic',
      
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

