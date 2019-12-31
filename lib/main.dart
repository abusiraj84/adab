import 'package:adab/Screens/fovrites_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'Providers/colors.dart';
import 'Providers/videos.dart';
import 'Screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
          Provider<MyColors>(create: (_) => MyColors()),
          ChangeNotifierProvider<Videos>(create: (_) => Videos()),
        ],
        child: MaterialApp(
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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/favorite':
            return PageTransition(
              child: FavoriteScreen(),
              type: PageTransitionType.downToUp,
              settings: settings,
              duration: Duration(milliseconds: 500),alignment: Alignment.center
            );
            break;
          default:
            return null;
        }
      },
      home:HomeScreen(),
      ),
    );
  }
}
