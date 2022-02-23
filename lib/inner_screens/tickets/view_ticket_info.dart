import 'package:areen/consts/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../consts/consts_methods.dart';
class ViewTicketInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'عرض التذاكر',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: getSize(context).width,
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSizedBoxTickets(),
                  buildCircleAvatarTickets(
                    color:  Colors.blue,
                    iconData: 1,
                    num: 1,
                  ),
                  buildSizedBoxTickets(),
                  buildCircleAvatarTickets(
                    color:  Colors.blue,
                    iconData: 1,
                    num: 2,
                  ),
                  buildSizedBoxTickets(),
                  buildCircleAvatarTickets(
                    color:  Kmaincolor,
                    num: 3,
                  ),
                  buildSizedBoxTickets()
                ],
              ),
              buildPaddingTitleOfSteps(context),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('tickets').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    try{
                      final docs = snapshot.data!.docs.firstWhere((element) =>element['user id']==FirebaseAuth.instance.currentUser!.uid);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      else if (snapshot.hasError) {
                        return const Center(child: Text("error"));
                      }
                      else if (snapshot.hasData && snapshot.data!.docs.length != 0) {
                        return buildAlertDialogTicketInfo(context,num: docs['numofTickets'],date: docs['date'].toDate());
                      }

                    }catch(e){

                    }
                    return Center(child: CircularProgressIndicator(color: Kmaincolor,));
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

}
