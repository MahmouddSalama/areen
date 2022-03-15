import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapModel {
  final String url;
  final String desc;
  final LatLng latLng;

  MapModel({
    required this.url,
    required this.desc,
    required this.latLng,
  });
}

List<MapModel> mapModelList = [
  MapModel(
    url:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Lion_d%27Afrique.jpg/550px-Lion_d%27Afrique.jpg?20150506193838',
    desc:
        'الأسد حيوان من الثدييات من فصيلة السنوريات وأحد السنوريات الأربعة الكبيرة المنتمية لجنس النمور (باللاتينية: Panthera)، وهو يُعد ثاني أكبر السنوريات في العالم بعد الببر، حيث تفوق كتلة الذكور الكبيرة منه 250 كيلوغراما',
    latLng: LatLng(24.677579416154575, 46.73724062740803),
  ),
  MapModel(
    url:
        'https://storage.googleapis.com/alghad-media/2021/11/e53816a27f791fd1645c4bd2275b12f6.jpg',
    desc:
        'الدب من الثديات المفترسة من عائلة الدبيّات المنتشرة في أماكن كثيرة من بقاع العالم. يسمّى الذكر في العربيّة دب، والأنثى دبّة، والصغار جراء أو دياسم.',
    latLng: LatLng(24.678248134068482, 46.7371467500925),
  ),
  MapModel(
    url:
        'https://images.skynewsarabia.com/images/v1/2021/01/08/1405698/1100/619/1-1405698.jpg',
    desc:
        'التمساح (بالإنجليزية: Crocodile)‏ من أضخم الزواحف الحية. ينتمي إلى فصيلة التمساحيات، له جسم طويل وأرجل قصيرة وذنب طويل قوي يمكنه من السباحة، وأسنان حادة',
    latLng: LatLng(24.67673133927055, 46.73759189946299),
  ),
  MapModel(
    url:
        'https://alwafd.news/images/thumbs/752/news/ccb57f03de3aaf4e65ce1e333620f2ae.jpg',
    desc:
        'الزرافات من اطول الحيوانات فى العالم والتى تتميز بجسم كبير الحجم وعنق طويل للغاية والذي يمثل الطول الاكبر فى الجسم بجانب الاقدام والقوام المشدودة ، تنتشر الزرافات فى المناطق البرية وهي من الثديات آكلة الاعشاب وتظهر فى شمال وسط افريقيا ',
    latLng: LatLng(24.677832296344764, 46.73601838163948),
  ),
  MapModel(
    url:
        'https://media.gemini.media/img/large/2018/11/3/2018_11_3_16_7_57_525.jpg',
    desc:
        'تعريف و معنى إلاما في معجم المعاني الجامع - معجم عربي عربي · الاَّ: (حرف/اداة). حرف مركّب من إن الشرطيّة ولا النافية ',
    latLng: LatLng(24.6776964645041, 46.73578235396596),
  ),
  MapModel(
    url: 'https://gate.ahram.org.eg/Media/News/2020/2/14/19_2020-637172783505081646-508.jpg',
    desc: 'الببغاء (بالإنجليزية: Parrot)‏ طائر معروف بألوانه الزاهية التي تتراوح بين الأخضر والأحمر والأزرق والأصفر، وتقليد بعض أنواعه للأصوات وهو ما جعلها طيور محببة ',
    latLng: LatLng(24.676109365717505, 46.73695462474448),
  ),
  MapModel(
    url: 'https://www.albayan.ae/polopoly_fs/1.3860103.1589594047!/image/image.jpg',
    desc: 'النَّمِرُ (الاسم العلمي: Panthera pardus) هو أحد أنواع فصيلة السنوريات وأصغر السنوريات الأربعة الكبرى المنتمية لجنس النمور (باللاتينية: Panthera)؛',
    latLng: LatLng(24.677186721235284, 46.73684073023103),
  ),
  MapModel(
    url: 'https://almalomat.com/wp-content/uploads/2019/07/6_4_or_1494245927.jpg',
    desc: 'الفيل أضخم حيوان يعيش على الأرض .قامة الفيل الأفريقية تتراوح مابين 3 إلى 4 متر، ووزنها أيضا مابين 4000 إلى 7000 كجم .بينما قامة الفيلة الآسيوية تتراوح مابين 2 ...',
    latLng: LatLng(24.677802525509847, 46.737550919361006),
  ),
  MapModel(
    url: 'https://tfaseal.com/wp-content/uploads/2021/09/%D8%A7%D9%84%D9%82%D8%B1%D8%AF-%D9%81%D9%8A-%D8%A7%D9%84%D9%85%D9%86%D8%A7%D9%85-%D8%A8%D8%B4%D8%A7%D8%B1%D8%A9-%D8%AE%D9%8A%D8%B1-748x470.jpg',
    desc: 'لقرد (نطق: /erd/; انجليزى: monkey; فرنساوى: singe; فارسى: میمون) هوه حيوان ثديي بينتمي لرتبة الرئيسيات و فى منها 254 نوع على الاقل.',
    latLng: LatLng(24.67626479485451, 46.737719449299945),
  ),
  MapModel(
    url: 'https://www.maw9i3i.net/wp-content/uploads/2021/11/%D9%85%D8%A7-%D9%87%D9%88-%D8%A7%D8%B3%D9%85-%D8%B5%D8%BA%D9%8A%D8%B1-%D8%A7%D9%84%D8%BA%D8%B2%D8%A7%D9%84-780x470.jpg',
    desc: 'الغزال هو حيوان ثديي. توجد الغزلان في الغالب في الصحاري والأراضي العشبية والسافانا في إفريقيا. وأيضًا في جنوب غرب ووسط آسيا وشبه القارة الهندية.',
    latLng: LatLng(24.676380461494897, 46.736656848400955),
  ),
  MapModel(
    url: 'https://read.opensooq.com/wp-content/uploads/2020/03/%D9%85%D8%B9%D9%84%D9%88%D9%85%D8%A7%D8%AA-%D8%B9%D8%A7%D9%85%D8%A9-%D8%B9%D9%86-%D8%AD%D9%8A%D9%88%D8%A7%D9%86-%D8%A7%D9%84%D8%AC%D9%85%D9%84.jpg',
    desc: 'الجمل هو حيوان من رتبة شفعيات الأصابع، من فصيلة الجمليات. يشتهر بالكتلة الدهنية على ظهره التي تسمى السنام، ويسمى شعر الجمل بالوبر',
    latLng: LatLng(24.675968084286406, 46.736584901465086),
  ),
  MapModel(
    url: 'https://shms.ps/thumb/750x390/uploads/images/9Uavv.jpg',
    desc: 'الدب الأسمر أو الدب البني هو نوع من الدببة، منتشر في أوروبا وآسيا وأمريكا الشمالية. ... يُمكن أن يزن من 300 إلى 780 كغم، وأكبرالانواع حجماً من الدببة البنية هي ...',
    latLng: LatLng(24.6772705881378, 46.73661810774319),
  ),
  MapModel(
    url: 'https://lh5.googleusercontent.com/p/AF1QipPH8SodF54qnTfliaIAPVBtAlrTbQRftunKHY08=w408-h544-k-no',
    desc: 'مطعم زوو جريل',
    latLng: LatLng(24.677175221196478, 46.73615825191821),
  ),
  MapModel(
    url: 'https://images-eu.ssl-images-amazon.com/images/I/31J3BwzAEvL._SY300_SX300_QL70_FMwebp_.jpg',
    desc: 'دوراه مياه',
    latLng: LatLng(24.676939362791497, 46.73580077512835),
  ),
  // MapModel(
  //   url: '',
  //   desc: '',
  //   latLng: LatLng(),
  // ),
  // MapModel(
  //   url: '',
  //   desc: '',
  //   latLng: LatLng(),
  // ),
  // MapModel(
  //   url: '',
  //   desc: '',
  //   latLng: LatLng(),
  // ),
];
