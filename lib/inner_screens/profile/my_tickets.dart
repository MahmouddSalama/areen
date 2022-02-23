import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../consts/consts_methods.dart';
class MyTickets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
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
                    }, title: '${docs[indx]['createdAt'].toDate().year}/${docs[indx]['createdAt'].toDate().month}/${docs[indx]['createdAt'].toDate().day}',
                        date: '${docs[indx]['date'].toDate().year}/${docs[indx]['date'].toDate().month}/${docs[indx]['date'].toDate().day}');
                  },
                );
              }

            }catch(e){

            }
            return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, indx) {
        return buildPaddingTickets(context, function: () {
          showDialog(
              context: context,
              builder: (context) {
                return buildAlertDialogTicketInfo(context,date: DateTime.now(),num: 7);
              });
        }, title: 'الخميس', date: '2/12-2021');
      },
    );
  }

}
