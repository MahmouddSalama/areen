class Question {
  final String questionHeader;
  final answers1;
  final answers2;
  final answers3;
  final rightAnswer;

  Question({
    required this.questionHeader,
    required this.answers1,
    required this.answers2,
    required this.answers3,
    required this.rightAnswer,
  });
}

List<Question> questions = [
  Question(
    questionHeader: 'متي يمكن لصغار النمر الاصتياد ؟',
    answers1: '1- إذا بلغت سته اشهر',
    answers2: '2- ذا بلغت سنه',
    answers3: '3- ذا بلغت سنه و نصف',
    rightAnswer: 3,
  ),
  Question(
    questionHeader: 'ما هو اسرع طائر ؟',
    answers1: '1- النسر',
    answers2: '2- الطائر الطنان',
    answers3: '3- الشهين',
    rightAnswer: 3,
  ),
  Question(
    questionHeader: 'ما هو اضخم حيوان  ؟',
    answers1: '1- الحوت',
    answers2: '2- الفيل',
    answers3: '3- الدرفيل',
    rightAnswer: 1,
  ),
  Question(
    questionHeader: 'كم تبلغ ذاكرة السمك ؟',
    answers1: '1- 5 ثوان',
    answers2: '2- 1 دقيقه',
    answers3: '3- 6 ثوان',
    rightAnswer: 1,
  ),
  Question(
    questionHeader: 'البطريق هو ؟',
    answers1: '1- ثديات',
    answers2: '2- طائر',
    answers3: '3- برمائيات',
    rightAnswer: 2,
  ),
  Question(
    questionHeader: 'الخفاش هو ؟',
    answers1: '1- ثديات',
    answers2: '2- طائر',
    answers3: '3- برمائيات',
    rightAnswer: 1,
  ),
  Question(
    questionHeader: 'الضفضع هو ؟',
    answers1: '1- ثديات',
    answers2: '2- طائر',
    answers3: '3- برمائيات',
    rightAnswer: 3,
  ),
  Question(
    questionHeader: 'االسمك يتنفس عن طريق ؟',
    answers1: '1- الفم',
    answers2: '2- الانف',
    answers3: '3- الخياشيم',
    rightAnswer: 3,
  ),
  Question(
    questionHeader: 'القرش هو ؟',
    answers1: '1- مائي',
    answers2: '2- ثديات',
    answers3: '3- برمائيات',
    rightAnswer: 3,
  ),
  Question(
    questionHeader: 'متي يمكن لصغار النمر الاصتياد ؟',
    answers1: 'إذا بلغت سته اشهر',
    answers2: 'ذا بلغت سنه',
    answers3: 'ذا بلغت سمه و نص',
    rightAnswer: 3,
  ),
];
