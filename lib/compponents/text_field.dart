import 'package:areen/consts/colors.dart';
import 'package:flutter/material.dart';

import '../consts/consts_methods.dart';
class DefaultTextField extends StatelessWidget {
  final IconData iconData;
  final String? Function(dynamic value) validetor;
  final bool isPass;

  const DefaultTextField({Key? key,required this.iconData,required this.validetor, this.isPass=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: SizedBox(
        width: getSize(context).width,
        height: 55,
        child: TextFormField(
          cursorColor: Kmaincolor,
          validator: (v)=>validetor(v),
          obscureText: isPass,
          keyboardType:TextInputType.emailAddress ,
          decoration:  InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Kmaincolor,
                width: 2
              )
            ),
            suffixIcon: Icon(iconData,color: Kmaincolor,),
          ),
        ),
      ),
    );
  }
}
class RegisterTextFiled extends StatelessWidget {
  final String title;
  final bool isPass;
  final int lines;
  final TextInputType textInputType;
  final String? Function(dynamic value) validetor;
  final TextEditingController? textEditingController;
  final bool enable;

  const RegisterTextFiled({Key? key,required this.title,required this.validetor, this.isPass=false, this.textInputType=TextInputType.emailAddress, this.lines=1, this.textEditingController,this.enable=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getSize(context).width,
      height: 100,

      child: TextFormField(
        enabled: enable,
        maxLines:lines,
        cursorColor: Kmaincolor,
        validator: (v) =>validetor(v),
        obscureText: isPass,
        controller: textEditingController,
        keyboardType: textInputType,
        decoration:  InputDecoration(

          label: Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Kmaincolor, width: 2),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
      ),
          disabledBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: Kmaincolor, width: 2),
          ) ,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Kmaincolor, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Kmaincolor, width: 2)),
        ),
      ),
    );
  }
}

