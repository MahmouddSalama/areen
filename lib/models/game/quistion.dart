import 'package:areen/consts/animal_names.dart';

class Question {
  final String questionHeader;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final int rightAnswer;

  Question({
    required this.questionHeader,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.rightAnswer,
  });
}

List<Question> questions = [
  Question(
      questionHeader: '-ما هو أبطأ حيوان في مملكة الحيوانات؟',
      image1: turtle,
      image2: ant,
      image3: sloth,
      image4: snail,
      rightAnswer: 3,
  ),
  Question(
    questionHeader: '-ما هو الحيوان الذي لا يمكنه القفز، والذي يعتبر أيضًا أكبر حيوان ثديي في العالم؟',
    image1: giraffe,
    image2: elephant,
    image3: dolphin,
    image4: bear,
    rightAnswer: 2,
  ),
  Question(
    questionHeader: '-ما هو الحيوان الذي لديه أطول ذيل؟',
    image1: giraffe,
    image2: lion,
    image3:elephant,
    image4: chimpanzee,
    rightAnswer: 1,
  ),
  Question(
    questionHeader: '-ما هو الحيوان الذي لا ينام؟',
    image1:sloth,
    image2: bear,
    image3: frog,
    image4: deer,
    rightAnswer: 3,
  ),
  Question(
    questionHeader: '-ماهي الطيور المعروفة بقدرتها على الطيران للخلف؟',
    image1: parrot,
    image2: bird,
    image3: hummingbird,
    image4: bat,
    rightAnswer: 3,
  ),
  Question(
    questionHeader: '-ما هو الطائر الذي لا يستطيع تحريك عينيه؟',
    image1: parrot,
    image2: bat,
    image3: owl,
    image4: hummingbird,
    rightAnswer: 3,
  ),
  Question(
    questionHeader: '-ما هو الحيوان الذي يقوم بغالبية الصيد؟',
    image1: lion,
    image2: bear,
    image3: tiger1,
    image4: tiger,
    rightAnswer: 3,
  ),
  Question(
    questionHeader: '-ما هو حيوان الذي وُصف وصفًا كاملًا في القرآن الكريم؟',
    image1: ant,
    image2: bee,
    image3: camel,
    image4: caw,
    rightAnswer: 4,
  ),
  Question(
    questionHeader: '-ما هو الحيوان الذي لا يشرب الماء ابدًا؟',
    image1: camel,
    image2: horse,
    image3: kangaroo,
    image4: bee,
    rightAnswer: 3,
  ),
  Question(
    questionHeader: '-ما هو أكبر حيوان في الكرة الأرضية؟',
    image1: whale,
    image2: elephant,
    image3: giraffe,
    image4: shark,
    rightAnswer: 1,
  ),
  Question(
    questionHeader: 'ما هو الحيوان الذي تكلم مع نبينا سليمان عليه السلام؟',
    image1: camel,
    image2: ant,
    image3: wolf,
    image4: hoopoe,
    rightAnswer: 4,
  ),
  Question(
    questionHeader: 'ما هو الحيوان الذي حُبس في بطنه نبي من أنبياء الله؟',
    image1: dog,
    image2: whale,
    image3: camel,
    image4: shark,
    rightAnswer: 2,
  ),
  Question(
    questionHeader: 'ما هو الحيوان الذي يشم من لسانه؟',
    image1: frog,
    image2: turtle,
    image3: dog,
    image4: snake,
    rightAnswer: 1,
  ),
  Question(
    questionHeader: 'من هو أذكى حيوان على وجه الأرض؟',
    image1: deer,
    image2: lion,
    image3: chimpanzee,
    image4: wolf,
    rightAnswer: 3,
  ),
  Question(
    questionHeader: 'ما هو الحيوان الذي يسمى صوته صهيل؟',
    image1: wolf,
    image2: horse,
    image3: caw,
    image4: lion,
    rightAnswer: 2,
  ),
  Question(
    questionHeader: 'ما هو الطائر الذي يبيض في عش آخر غير عشِّه؟',
    image1: parrot,
    image2: hoopoe,
    image3: hummingbird,
    image4: frog,
    rightAnswer: 4,
  ),
  Question(
    questionHeader: 'ما هو الحيوان الذي لا ينام؟',
    image1: giraffe,
    image2: snake,
    image3: raven,
    image4: frog,
    rightAnswer: 4,
  ),
  Question(
    questionHeader: ' ما هو الحيوان الذي يطلق عليه اسم هيثم؟',
    image1: raven,
    image2: eagle,
    image3: hoopoe,
    image4: hummingbird,
    rightAnswer: 2,
  ),
  Question(
    questionHeader: 'ما هو أكبر الطيور حجمًا؟',
    image1: eagle,
    image2: hummingbird,
    image3: owl,
    image4: ostrich,
    rightAnswer: 4,
  ),
  Question(
    questionHeader: 'ما هو الحيوان المعروف باسم الغضنفر؟',
    image1: lion,
    image2: tiger,
    image3: tiger1,
    image4: deer,
    rightAnswer: 1,
  ),
];
