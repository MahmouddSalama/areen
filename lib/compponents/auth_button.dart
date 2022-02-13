import 'package:flutter/material.dart';
import '../consts/colors.dart';
import '../consts/consts_methods.dart';
class AuthButton extends StatelessWidget {
  final String title;
  final Function function;
  final Color color;
  const AuthButton({
    Key? key,
    required this.title,
    required this.function,
    this.color=Kmaincolor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>function(),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        elevation: 5,
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color
          ),
          alignment: Alignment.center,
          child: Text(title,
            style: styleText(
                fontSize: 20,
                color: Colors.white
            ),),
        ),
      ),
    );
  }
}