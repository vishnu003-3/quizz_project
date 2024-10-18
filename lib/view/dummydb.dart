import 'package:quizz_project/view/biology_quiz/biology_quiz.dart';
import 'package:quizz_project/view/maths_quiz/maths_quiz.dart';
import 'package:quizz_project/view/movie_quiz/movie_quiz.dart';
import 'package:quizz_project/view/sports_quiz/sports_quiz.dart';

class Dummydb {
  static List sectionList = [
    {"SectionName": "Sports", "Navigation": SportsQuiz()},
    {"SectionName": "Maths", "Navigation": MathsQuiz()},
    {"SectionName": "Biology", "Navigation": BiologyQuiz()},
    {"SectionName": "Movie", "Navigation": MovieQuiz()},
  ];

  static List<Map<String, dynamic>> sportsQuestionList = [
    {
      "question": "Which country won the FIFA World Cup in 2018?",
      "options": ["Brazil", "France", "Germany", "Argentina"],
      "answerIndex": 1
    },
    {
      "question": "In which sport would you perform a slam dunk?",
      "options": ["Tennis", "Basketball", "Football", "Baseball"],
      "answerIndex": 1
    },
    {
      "question": "Which country hosts the Tour de France cycling race?",
      "options": ["Spain", "Italy", "France", "Germany"],
      "answerIndex": 2
    },
    {
      "question": "How many players are on a soccer team on the field?",
      "options": ["9", "10", "11", "12"],
      "answerIndex": 2
    },
    {
      "question": "Which tennis player has won the most Grand Slam titles?",
      "options": [
        "Roger Federer",
        "Rafael Nadal",
        "Novak Djokovic",
        "Pete Sampras"
      ],
      "answerIndex": 2
    },
    {
      "question": "How many rings are on the Olympic flag?",
      "options": ["4", "5", "6", "7"],
      "answerIndex": 1
    },
    {
      "question": "What sport is known as 'America's pastime'?",
      "options": ["Basketball", "Baseball", "Football", "Hockey"],
      "answerIndex": 1
    },
    {
      "question": "Which country won the first-ever FIFA World Cup in 1930?",
      "options": ["Brazil", "Uruguay", "Italy", "Argentina"],
      "answerIndex": 1
    },
    {
      "question":
          "What is the maximum score in a single frame of ten-pin bowling?",
      "options": ["100", "150", "200", "300"],
      "answerIndex": 3
    },
    {
      "question":
          "In golf, what is the term for one stroke under par on a hole?",
      "options": ["Birdie", "Eagle", "Bogey", "Par"],
      "answerIndex": 0
    },
    {
      "question":
          "Which country won the most gold medals at the 2020 Tokyo Olympics?",
      "options": ["China", "United States", "Japan", "Russia"],
      "answerIndex": 1
    }
  ];
}
