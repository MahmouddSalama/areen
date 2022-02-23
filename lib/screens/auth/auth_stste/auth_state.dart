
import 'package:areen/layout/main_layout.dart';
import 'package:areen/screens/auth/entry_screen.dart';
import 'package:areen/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AuthState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,snapshot){
              if(snapshot.data==null)
                return EntryScreen();
              else if(snapshot.hasData)
                return MainLayOut();
              else
                return Scaffold(
                  body: Center(
                    child: Text('Some error happened'),
                  ),
                );
            },
    );
  }
}
