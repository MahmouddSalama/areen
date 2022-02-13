import 'package:areen/consts/consts_methods.dart';
import '../inner_screens/profile/edit_profile_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../inner_screens/profile/game.dart';
import '../inner_screens/profile/my_tickets.dart';
import '../inner_screens/profile/questionnaire.dart';

class Profilescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: getSize(context).height * .1,
            ),
            Text('الملف الشخصي',
                style: GoogleFonts.almarai(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 10),
            buildGestureDetectorProfile(context,
                title: 'تحرير الملف الشخصي',
                icon: Icons.perm_identity_sharp,
                function: () {
                  navigate(context,EditProfileInfo());
                }),
            buildGestureDetectorProfile(context,
                title: 'تذاكري',
                icon: Icons.airplane_ticket_outlined,
                function: () {
                  navigate(context,MyTickets());
                }),
            buildGestureDetectorProfile(context,
                title: 'العب مع عرين',
                icon: Icons.videogame_asset,
                function: () {
                  navigate(context,Game());
                }),
            buildGestureDetectorProfile(context,
                title: 'اخبرمنا عن زيارتك',
                icon: Icons.messenger,
                function: () {
                  navigate(context,Questionnaire());
                }),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: getSize(context).width,
                    height: 55,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.logout,
                          color: Colors.red,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'تسجيل الخروج',
                          style: styleText(color: Colors.red, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
