import 'package:flutter/material.dart';
import 'package:quizz_project/global_widget/Custom_section.dart';
import 'package:quizz_project/utils/constants/color_constants.dart';
import 'package:quizz_project/view/dummydb.dart';
import 'package:quizz_project/view/sports_quiz/sports_quiz.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Hi, John"), Text("Let's make this day productive")],
        ),
        actions: [
          CircleAvatar(
            radius: 30,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: ColorConstants.BoxColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ranking",
                      style: TextStyle(
                          color: ColorConstants.SubTextColor, fontSize: 18),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "Points",
                      style: TextStyle(
                          color: ColorConstants.SubTextColor, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Let's play",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1 / 1.15),
                itemBuilder: (context, index) {
                  return CustomSection(
                    section: Dummydball.quizList[index]["Categorry"],
                    onCardTaped: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SportsQuiz(
                                dataIndex: Dummydball.quizList[index]
                                    ["dataIndex"])),
                      );
                    },
                  );
                },
                itemCount: Dummydball.quizList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
