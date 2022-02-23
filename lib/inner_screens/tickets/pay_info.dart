import 'package:areen/consts/colors.dart';
import 'package:areen/inner_screens/tickets/view_ticket_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../compponents/auth_button.dart';
import '../../compponents/tikets_field.dart';
import '../../consts/consts_methods.dart';
class PayInfo extends StatefulWidget {
  final String numOfTicket;
  final DateTime time;

   PayInfo({Key? key,required this.numOfTicket,required this.time}) : super(key: key);

  @override
  State<PayInfo> createState() => _PayInfoState();


}

class _PayInfoState extends State<PayInfo> {
  final TextEditingController name=TextEditingController();

  final TextEditingController num=TextEditingController();

  final TextEditingController safe=TextEditingController();

  final TextEditingController date=TextEditingController();
  static DateTime? picked;
  final _formKey=GlobalKey<FormState>();
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الدفع',
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
                    color: Kmaincolor,
                    num: 2,
                  ),
                  buildSizedBoxTickets(),
                  buildCircleAvatarTickets(
                    color: const Color(0xffD2E3FE),
                    num: 3,
                  ),
                  buildSizedBoxTickets()
                ],
              ),
              buildPaddingTitleOfSteps(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                        TicketsField(
                          validetor: (v){
                            if(v.toString().isEmpty){
                              return 'من فضلك ادخل الاسم صحيح';
                            }
                          },
                          title: '',
                          textInputType: TextInputType.name,
                          enable: true,
                          hint: 'اسم صاحب البطاقه',
                          textEditingController: num,
                        ),
                      const SizedBox(height: 20),
                        TicketsField(
                          validetor: (v){
                            if(v.toString().isEmpty){
                              return 'من فضلك رقم الاسم صحيح';
                            }
                          },
                          title: '',
                          enable: true,
                          hint: 'رقم البطاقه',
                          textInputType: TextInputType.number,
                          textEditingController: num,
                        ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:   [
                          Flexible(
                              child: TicketsField(
                                validetor: (v){
                                  if(v.toString().isEmpty){
                                    return 'من فضلك ادخل رقم الامان صحيح';
                                  }
                                },
                                  title: ' ',
                                  enable: true,
                                  textInputType: TextInputType.number,
                                  hint: 'الامان',
                                  textEditingController: safe,
                              )),
                          SizedBox(width: 30),
                          Flexible(
                              child: GestureDetector(
                                onTap: (){
                                  pickedDialog(context);
                                },
                                child: TicketsField(
                                  validetor: (v){
                                    if(v.toString().isEmpty){
                                      return 'من فضلك ادخل التاريخ صحيح';
                                    }
                                  },
                                    title: '',
                                    enable: false,
                                    hint: 'تاريخ الانتهاء',
                                    textEditingController: date,
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 50,),
                    loading?const Center(child: CircularProgressIndicator(color: Kmaincolor,)) : AuthButton(title: 'الدفع', function: (){
                      pay();
                      },color: Kmaincolor,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   pickedDialog(context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null) {
      //return picked!;
      date.text='${picked!.year}/${picked!.month}/${picked!.day}';
      setState(() {});
    } else {
      return null!;
    }
  }

  pay()async {
    String error = '';
    if(_formKey.currentState!.validate()){
      setState(() {
        loading = true;
      });
      try {
        await FirebaseFirestore.instance
            .collection('tickets')
            .doc()
            .set({
          'user id': FirebaseAuth.instance.currentUser!.uid,
          'name': name.text,
          'cridetNum': num.text,
          'createdAt': Timestamp.now(),
          'safe':safe.text,
          'cridetDate':date.text,
          'numofTickets':widget.numOfTicket,
          'money':'${int.parse(widget.numOfTicket)*10}',
          'date':widget.time,
        });
        navigateReplace(context, ViewTicketInfo());
      } on FirebaseAuthException catch (e) {
        setState(() {
          loading = false;
        });
        if (e.code == 'weak-password') {
          error = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          error = 'The account already exists for that email.';
        }
        showErrorDialog('error is${e.toString()}',context);
      } catch (e) {
        print(e);
      }
    }
    setState(() {
      loading = false;
    });
  }
}
