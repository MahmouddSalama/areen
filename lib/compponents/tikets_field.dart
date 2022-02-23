import 'package:areen/consts/consts_methods.dart';
import 'package:flutter/material.dart';

import '../consts/colors.dart';
class TicketsField extends StatelessWidget {
final  title;
 final String hint;
 final  enable;
 final TextEditingController? textEditingController;
 final TextInputType? textInputType;
final String? Function(dynamic value) validetor;

   TicketsField({Key? key,required this.title,required this.hint,required this.enable, this.textEditingController, this.textInputType=TextInputType.number,required this.validetor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Container(
          decoration: BoxDecoration(
              color: const Color(0xffF3F3F2),
            border: Border.all(
              color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          width: getSize(context).width,
          height: 50,

          child: TextFormField(
            validator: (v)=>validetor(v),
            controller: textEditingController,
            enabled: enable,
            cursorColor: Kmaincolor,
            keyboardType: textInputType,
            decoration:  InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Colors.black
              ),
              contentPadding: const EdgeInsets.all(5),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
