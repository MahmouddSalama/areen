import 'package:areen/compponents/auth_button.dart';
import 'package:areen/consts/colors.dart';
import 'package:areen/consts/consts_methods.dart';
import 'package:areen/screens/auth/login_screen.dart';
import 'package:areen/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: getSize(context).width,
              height: getSize(context).height,
              child: Image.asset(
                "assets/image/back1.png",
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getSize(context).height * .2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        ' اهلا بك في تطبيق عرين كيف تود الاستمرار ؟ ',
                        style: styleText(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  AuthButton(
                      title: 'زائر جديد',
                      function: () {
                        // go to regester Screen
                        navigate(context, RegisterScreen());
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthButton(
                      title: 'زائر مسجل',
                      function: () {
                       navigate(context, LoginScreen());
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
