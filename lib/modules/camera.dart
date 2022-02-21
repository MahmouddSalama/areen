import 'package:areen/compponents/auth_button.dart';
import 'package:areen/inner_screens/animal/animal_info.dart';
import 'package:flutter/material.dart';

import '../consts/colors.dart';
import '../consts/consts_methods.dart';
class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('الحيوانات'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
        children: [
          buildPaddingAnimalId(context,string: 'قم بإدخال رقم الحيوان الزي امامك'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            child: Container(
              color: Colors.white,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  label: const Text('ادخل كود الحيوان '),
                  labelStyle: styleText(color: Colors.black,fontSize: 12),
                  border:  const OutlineInputBorder(
                    borderSide: BorderSide(color: Kmaincolor, width: 2),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Kmaincolor, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Kmaincolor, width: 2)),
                ),
                ),
              ),
          ),

          AuthButton(title: 'تأكيد', function: (){
            // go to animal info screen
            //....
            navigate(context, AnimalInfo());
          })

        ],
        ),
      ),
    );
  }


}
