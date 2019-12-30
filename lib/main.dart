import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'Providers/colors.dart';
import 'Screens/home_screen.dart';

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
      
        
      ),
      
      home:  MultiProvider(
      providers: [
         Provider<MyColors>(create: (_) => MyColors()),
       
      ],
      child: HomeScreen(),
    ));
  }
}
