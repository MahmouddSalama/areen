import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../consts/consts_methods.dart';
class MyTickets extends StatelessWidget {
  dynamic dayData = {
    "1" : "الاتنين",
    "2" : "الثلاثاء",
    "3" : "الاربعاء",
    "4" : "الخميس",
    "5" : "الجمعه",
    "6" : "السبت",
    "7" : "الاحد" };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'تذاكري',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('tickets').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            try{
              final List docs = snapshot.data!.docs.where((element) =>element['user id']==FirebaseAuth.instance.currentUser!.uid).toList();

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (snapshot.hasError) {
                return const Center(child: Text("error"));
              }
              else if (snapshot.hasData && snapshot.data!.docs.length != 0) {
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, indx) {
                    return buildPaddingTickets(context, function: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return buildAlertDialogTicketInfo(context,date:docs[indx]['date'].toDate() ,num:docs[indx]['numofTickets'] );
                          });
                    }, title: '${dayData["${docs[indx]['date'].toDate().weekday}"]}',
                        date: '${docs[indx]['date'].toDate().year}/${docs[indx]['date'].toDate().month}/${docs[indx]['date'].toDate().day}');
                  },
                );
              }
            }catch(e){

            }
            return const Center(child: CircularProgressIndicator());
          }
      ),
    );
  }
}
