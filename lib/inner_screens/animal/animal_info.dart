import 'package:areen/compponents/auth_button.dart';
import 'package:areen/consts/colors.dart';
import 'package:areen/inner_screens/animal/virtual_real.dart';
import 'package:areen/models/animal/animal_model.dart';
import 'package:areen/models/animal/animals_data.dart';
import 'package:flutter/material.dart';
import '../../consts/consts_methods.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
class AnimalInfo extends StatefulWidget {
  final String id;

   AnimalInfo({Key? key,required this.id}) : super(key: key);

  @override
  State<AnimalInfo> createState() => _AnimalInfoState();
}

class _AnimalInfoState extends State<AnimalInfo> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  Animalmodel? animalmodel;

   @override
  void initState() {
    // TODO: implement initState
     animalmodel=animals.firstWhere((element) => element.id==widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xff83B5FA),
        title: Text(
          'الحيوانات',
          style: styleText(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body:  Stack(
        children: [
          SizedBox(
            height: getSize(context).height,
            width: getSize(context).width,
            child: Image.network(
              "https://www.marylandzoo.org/wp-content/uploads/2017/12/osage-orange.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  buildPaddingAnimalId(context,
                      string: 'الحيوان الذي ادخلت رقمه التعرفي'),
                  Container(
                    //height: getSize(context).height * .6,
                    width: getSize(context).width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                               CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    animalmodel!.imageUrl
                                      //'https://th-thumbnailer.cdn-si-edu.com/F_HnNfT0IBSYIPo7ttW_WYGJ9DI=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/49/38/4938f123-986a-478c-8402-4c538201ebc4/gettyimages-1150889841.jpg'
                                  ),
                                  radius: 40),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    animalmodel!.name,
                                    style: styleText(),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    animalmodel!.nikName ,
                                    style: styleText(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  assetsAudioPlayer.open(
                                    Audio(animalmodel!.sound),
                                  );
                                  assetsAudioPlayer.play();
                                },
                                icon: const Icon(
                                  Icons.volume_down_rounded,
                                  color: Kmaincolor,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(animalmodel!.disc,
                          style: styleText(
                            fontSize: 17,
                            color: Colors.grey
                          ),
                          ),
                          const SizedBox(height: 20),
                          const Icon(Icons.map,color: Kmaincolor,size: 30,),
                          Text(animalmodel!.location,
                            style: styleText(
                                fontSize: 17,
                                color: Colors.grey
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Icon(Icons.food_bank,color: Kmaincolor,size: 30,),
                          Text(animalmodel!.eat,
                            style: styleText(
                                fontSize: 17,
                                color: Colors.grey
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: AuthButton(title: 'اظهار الحيوان في محيطي', function: (){
                              navigate(context, VirtualReal(image: animalmodel!.image,));
                            },),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
