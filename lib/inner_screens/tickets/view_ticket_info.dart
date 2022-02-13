import 'package:flutter/material.dart';

import '../../consts/consts_methods.dart';
class ViewTicketInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'عرض التذاكر',
          style: styleText(
            color: Colors.black,
          ),
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
                    color:  Colors.green,
                    num: 3,
                  ),
                  buildSizedBoxTickets()
                ],
              ),
              buildPaddingTitleOfSteps(context),
              const SizedBox(
                height: 20,
              ),
              buildAlertDialogTicketInfo(context),
            ],
          ),
        ),
      ),
    );
  }
}
