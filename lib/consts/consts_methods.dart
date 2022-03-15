import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../compponents/auth_button.dart';
import 'colors.dart';

 // style text
styleText({color=Kmaincolor,double fontSize=25}) {
  return GoogleFonts.almarai(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color
    );
}

 // get Size of device
Size getSize(context){
   return  MediaQuery.of(context).size;
 }

 // routing to screen
void navigate(context, scaffold){

   Navigator.push(context, PageTransition(
     child: scaffold,
     type: PageTransitionType.rightToLeft
   ));
 }

void navigateReplace(context, scaffold){

  Navigator.pushReplacement(context, PageTransition(
      child: scaffold,
      type: PageTransitionType.rightToLeft
  ));
}

 // togel betwen login & signup
RichText buildRichText({required Function function}) {
  return RichText(
    text: TextSpan(children: [
      const TextSpan(
          text: 'ليس لديك حساب ؟  ',
          style: TextStyle(fontSize: 14,color: Colors.black)),
      TextSpan(
        recognizer: TapGestureRecognizer()
          ..onTap = ()=>function(),
        text: 'انشاء حساب جديد',
        style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            decoration: TextDecoration.underline),
      ),
    ]),
  );
}

 // button in profile screen
GestureDetector buildGestureDetectorProfile(BuildContext context,{required String title,required IconData icon,required Function function}) {
  return GestureDetector(
    onTap: ()=>function(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          width: getSize(context).width,
          height: 60,
          alignment: Alignment.center,
          child:
          Row(
            children: [
              Icon(icon,color: Colors.grey,size: 30,),
              const SizedBox(width: 20,),
              Text(title,style: styleText(
                  color: Colors.black,
                  fontSize: 20
              ),),
              const Spacer(),
              const Icon(Icons.arrow_back,color: Colors.black,textDirection: TextDirection.ltr,),
              SizedBox(width: 20,)
            ],
          ),
        ),
      ),
    ),
  );
}

 // custom Calender
Container buildContainerTime({required text}) {
  return Container(
    height: 40,
    width: 150,
    color:Kmaincolor,
    child:   Padding(
      padding: const EdgeInsets.all(7),
      child: Text(text,style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
      ),),
    ),
  );
}

 // to Edit info profile
AlertDialog alertDialogEditInfo({context ,required Function function}) {
  return AlertDialog(
    title:  Text('حفظ تعديلات المعلومات الشخصيه ',style: styleText(
        fontSize: 18,
        color: Colors.black
    ),),
    content: SizedBox(
      height: 150,
      child: Column(
        children: [
          const Text('هل انت متأكد من حفظ التعديلات الحاليه  ',
            style: TextStyle(
                fontSize: 15,
                color: Colors.black54
            ),),
          const SizedBox(height: 10,),
          Row(
            children: [
              Flexible(
                child: AuthButton(title: 'نعم', function: ()=>function(),
                  color: const Color(0xff40CE71),),
              ),
              Flexible(
                child: AuthButton(title: 'لا', function: (){
                  Navigator.pop(context);
                },
                    color: const Color(0xff9B999A)),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

 // Confirm to edit
AlertDialog alertDialogConfirmEdit(c) {
  return AlertDialog(
    title:  Text('تم تعديل معلوماتك بنجاح! ',style: styleText(
        fontSize: 18,
        color: Colors.black
    ),),
    content: AuthButton(title: 'نعم', function: (){
      Navigator.pop(c);
    },
      color: const Color(0xff40CE71),),
  );
}

 // item of teckets in tecets screen
Padding buildPaddingTickets(BuildContext context,{required String title,required String date,required Function function}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: GestureDetector(
        onTap: ()=>function(),
        child: Container(
          width: getSize(context).width,
          height: 75,
          decoration: BoxDecoration(
            color: Kmaincolor,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: GoogleFonts.almarai(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700
                  ),),
                  const SizedBox(height: 5,),
                  Text(date,style: GoogleFonts.almarai(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),)
                ],
              ),
              SizedBox(width: 50,),
              Icon(Icons.arrow_back_rounded,textDirection: TextDirection.ltr,size: 30,color: Colors.white,)
            ],
          ),
        ),
      ),
    ),
  );
}

 // AlertDialog of info teckets
AlertDialog buildAlertDialogTicketInfo(BuildContext context,{required DateTime date,required num }) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)),
    contentPadding: EdgeInsets.zero,
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'حديقه حيوان الرياض',
                      style: styleText(
                        fontSize: 22,
                        color: Kmaincolor,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              SizedBox(height: 10,),
              Text(
                'التاريخ  ${date.year}/${date.month}/${date.day}',
                style: styleText(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'الوقت : 9:00ص-5:00م',
                style: styleText(
                  fontSize: 20,
                  color: Colors.black
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'عدد التذاكر: ${num}',
                style: styleText(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    'https://gray-kwch-prod.cdn.arcpublishing.com/resizer/LEO4ofps-J5a3E9tFke4IJqgoe4=/800x0/smart/filters:quality(85)/cloudfront-us-east-1.images.arcpublishing.com/gray/5A4FDMHJQVDCDDCUUUMVFQEZT4.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: AuthButton(title: 'إغلاق', function: (){
                 Navigator.pop(context);
               }),
             )
            ],
          ),
        ),
      ),
    ),
  );
}

 // Daialog of answer
AlertDialog buildAlertDialogAnswers(title,context) {
  return AlertDialog(
    content: Container(
      height: 100,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            '$title!',
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
          FloatingActionButton.small(
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.clear,),
          )
        ],
      ),
    ),
  );
}

// Animal Id Text
Padding buildPaddingAnimalId(BuildContext context,{required String string}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    child: Container(
      width: getSize(context).width,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(string,style: styleText(
          fontSize: 20,
          color: Colors.black
      )),
    ),
  );
}

// divider between numbers of steps in tickets
SizedBox buildSizedBoxTickets() {
  return const SizedBox(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 7),
      child: Divider(
        thickness: 1.5,
        color: Colors.grey,
      ),
    ),
    width: 60,
    height: 2,
  );
}

// Circile Avater whitch contain num of step
CircleAvatar buildCircleAvatarTickets({required num, required color,int iconData=0}) {
  return CircleAvatar(
        radius: 10,
        backgroundColor: color,
        child:iconData==0? Text('$num',style: const TextStyle(
            color: Colors.white
        ),):const Icon(Icons.check,size: 15,),
      );
}

// titles of steps
Padding buildPaddingTitleOfSteps(BuildContext context) {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: getSize(context).width*.13,vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text('اختيار التذاكر'),
        Text('الدفع'),
        Text('عرض التذاكر'),
      ],
    ),
  );
}

 showErrorDialog(error,context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: EdgeInsets.zero,
      title: const Text('معلومات غير صحيحه'),
      content: Container(
        height: 150,
        child: Center(
          child: Text(
            error,
            style: const TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('نعم'))
      ],
    ),
  );
}

//
