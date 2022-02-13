import 'package:areen/consts/consts_methods.dart';
import 'package:flutter/material.dart';

import '../consts/colors.dart';
class TicketsField extends StatelessWidget {
final  title;
 final String hint;
 final  enable;
 final TextEditingController? textEditingController;
 final TextInputType? textInputType;

  const TicketsField({Key? key,required this.title,required this.hint,required this.enable, this.textEditingController, this.textInputType=TextInputType.number}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Container(
          width: getSize(context).width,
          height: 50,
          color: const Color(0xffF3F3F2),
          child: TextFormField(
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
