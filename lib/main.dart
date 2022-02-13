import 'package:areen/screens/auth/entry_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates:const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ar", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale("ar", "IR") ,
      debugShowCheckedModeBanner: false,
      home: EntryScreen(),
    );
  }
}