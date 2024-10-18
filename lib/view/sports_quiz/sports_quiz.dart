import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:circular_countdown_timer/countdown_text_format.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizz_project/utils/constants/animation_constants.dart';
import 'package:quizz_project/utils/constants/color_constants.dart';
import 'package:quizz_project/view/dummydb.dart';
import 'package:quizz_project/view/result_screen/sports_result_screen.dart';

class SportsQuiz extends StatefulWidget {
  const SportsQuiz({super.key});

  @override
  State<SportsQuiz> createState() => _SportsQuizState();
}

class _SportsQuizState extends State<SportsQuiz> {
  bool _isAnswered = false;
  int currentIndex = 0;
  int questIndex = 0;
  int currentQuest = 1;
  int lastQuest = Dummydb.sportsQuestionList.length;
  int? selectedOption;
  int rightAnswerCount = 0;
  CountDownController timer = CountDownController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.BackgroundColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              "$currentQuest/${lastQuest - 1}",
              style: TextStyle(color: ColorConstants.TextColor),
            ),
          )
        ],
        backgroundColor: ColorConstants.BackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        Dummydb.sportsQuestionList[questIndex]["question"],
                        style: TextStyle(color: ColorConstants.TextColor),
                      ),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstants.TextColor,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: ColorConstants.BoxColor),
                  ),
                  if (selectedOption ==
                      Dummydb.sportsQuestionList[currentIndex]["answerIndex"])
                    Lottie.asset(AnimationConstants.rightAnswerAnimation),
                  Positioned(
                      top: 1,
                      right: 170,
                      child: CircleAvatar(
                        backgroundColor: ColorConstants.SubTextColor,
                        child: CircularCountDownTimer(
                          duration: 30,
                          initialDuration: 0,
                          controller: timer,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,
                          ringColor: Colors.grey[300]!,
                          ringGradient: null,
                          fillColor: Colors.purpleAccent[100]!,
                          fillGradient: null,
                          backgroundColor: Colors.purple[500],
                          backgroundGradient: null,
                          strokeWidth: 8.0,
                          strokeCap: StrokeCap.round,
                          textStyle: TextStyle(
                              fontSize: 33.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textFormat: CountdownTextFormat.S,
                          isReverse: false,
                          isReverseAnimation: false,
                          isTimerTextShown: true,
                          autoStart: true,
                          onStart: () {
                            debugPrint('0');
                          },
                          onComplete: () {
                            debugPrint('Countdown Ended');
                            selectedOption = null;
                            if (currentQuest < lastQuest - 1) {
                              currentQuest++;
                              questIndex++;
                              currentIndex++;
                              _isAnswered = true;
                              setState(() {});
                            }
                          },
                          onChange: (String timeStamp) {
                            debugPrint('Countdown Changed $timeStamp');
                          },
                          timeFormatterFunction:
                              (defaultFormatterFunction, duration) {
                            if (duration.inSeconds == 0) {
                              return "Start";
                            } else {
                              return Function.apply(
                                  defaultFormatterFunction, [duration]);
                            }
                          },
                        ),
                      ))
                ],
              ),
            ),
            Column(
              children: List.generate(
                Dummydb.sportsQuestionList[currentIndex]["options"].length,
                (optionindex) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        if (!_isAnswered) {
                          selectedOption = optionindex;
                          if (selectedOption ==
                              Dummydb.sportsQuestionList[currentIndex]
                                  ["answerIndex"]) {
                            rightAnswerCount = rightAnswerCount + 1;
                          }
                          setState(() {
                            _isAnswered = true;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: getColor(optionindex), width: 2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Dummydb.sportsQuestionList[currentIndex]
                                  ["options"][optionindex],
                              style: TextStyle(
                                color: ColorConstants.TextColor,
                                fontSize: 17,
                              ),
                            ),
                            Icon(
                              Icons.circle_outlined,
                              color: ColorConstants.TextColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (selectedOption != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    selectedOption = null;
                    if (currentQuest < lastQuest - 1) {
                      currentQuest++;
                      questIndex++;
                      currentIndex++;
                      _isAnswered = false;
                      //    _updatePercentage();
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              rightAnswerCount: rightAnswerCount,
                            ),
                          ));
                    }
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(33, 150, 243, 1),
                      border: Border.all(color: ColorConstants.TextColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: ColorConstants.TextColor, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Color getColor(int currentOptionIndex) {
    if (selectedOption != null &&
        currentOptionIndex ==
            Dummydb.sportsQuestionList[currentIndex]["answerIndex"]) {
      return ColorConstants.RightAnswerIndex;
    } else if (selectedOption == currentOptionIndex) {
      if (selectedOption ==
          Dummydb.sportsQuestionList[currentIndex]["answerIndex"]) {
        return ColorConstants.RightAnswerIndex;
      } else {
        return ColorConstants.WrongAnswerIndex;
      }
    } else {
      return ColorConstants.TextColor;
    }
  }
}
