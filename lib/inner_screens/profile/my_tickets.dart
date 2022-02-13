import 'package:flutter/material.dart';
import '../../consts/consts_methods.dart';
class MyTickets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'تذاكري',
          style: styleText(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, indx) {
          return buildPaddingTickets(context, function: () {
            showDialog(
                context: context,
                builder: (context) {
                  return buildAlertDialogTicketInfo(context);
                });
          }, title: 'الخميس', date: '2/12-2021');
        },
      ),
    );
  }

}
