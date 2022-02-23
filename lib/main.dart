import 'package:areen/consts/colors.dart';
import 'package:areen/screens/auth/auth_stste/auth_state.dart';
import 'package:areen/screens/auth/entry_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Kmaincolor
        )
      ),
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
      home: AuthState(),
    );
  }
}