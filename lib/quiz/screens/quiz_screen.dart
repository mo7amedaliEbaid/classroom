
import 'package:classroom/quiz/screens/reviews_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubits/questions_cubit/cubit/questions_cubit.dart';
import '../global/global_data.dart';
import '../global/gradient_decoration.dart';
import '../shared/countdown_timer.dart';

class QuizScreen extends StatefulWidget {
  final String? test;
  final List questionsList;
  final int time;

  const QuizScreen(
      {super.key,
      required this.test,
      required this.questionsList,
      required this.time});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;

  @override
  void initState() {
    super.initState();
    context.read<QuestionsCubit>().index = 0;
  }

  void navOnTimeOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ReviewScreen(
            index: context.read<QuestionsCubit>().index - 1, score: score),
      ),
    );
  }

  void goBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFFE1F1FF),
            ),
            child: Column(
              children: [
                const Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor:
                            const Color.fromARGB(255, 254, 151, 56),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 19),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () async {
                        bool shouldNavigateBack = await showBackAlertDialog(
                            context,
                            'Do you want to go back to the previous screen?');
                        if (shouldNavigateBack) {
                          goBack();
                        }
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: BlocBuilder<QuestionsCubit, QuestionsState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor:
                                  const Color.fromARGB(255, 254, 151, 56),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () async {
                              bool shouldNavigateBack =
                                  await showBackAlertDialog(
                                      context, 'Do you want to end the quiz?');
                              if (shouldNavigateBack) {
                                navOnTimeOut();
                              }
                            },
                            child: Text(
                              'Complete',
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          body: DecoratedBox(
            decoration: blueGradient,
            child: SafeArea(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: (0.5 / 10),
                        left: 20,
                        right: 20,
                        top: (0.25 / 10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CountDown(
                              quizTime: widget.time, timeOut: navOnTimeOut),
                          BlocBuilder<QuestionsCubit, QuestionsState>(
                            builder: (context, state) {
                              return Text(
                                'Q.${context.read<QuestionsCubit>().index + 1}/${widget.questionsList.length}',
                                style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<QuestionsCubit, QuestionsState>(
                    builder: (context, state) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        height: 500,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE1F1FF),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                widget.questionsList[context
                                    .read<QuestionsCubit>()
                                    .index]["question"],
                                style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              for (int i = 0;
                                  i <
                                      (widget.questionsList[context
                                              .read<QuestionsCubit>()
                                              .index]["answers"] as List)
                                          .length;
                                  i++)
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (context
                                              .read<QuestionsCubit>()
                                              .index ==
                                          0) numbers.clear();
                                      int x = widget.questionsList[context
                                          .read<QuestionsCubit>()
                                          .index]["answers"][i]["score"] as int;
                                      score = score + x;
                                      numbers.add(x);

                                      if (context
                                              .read<QuestionsCubit>()
                                              .index ==
                                          widget.questionsList.length - 1) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReviewScreen(
                                                    index: context
                                                        .read<QuestionsCubit>()
                                                        .index,
                                                    score: score,
                                                  )),
                                        );
                                      } else {
                                        context
                                            .read<QuestionsCubit>()
                                            .updateIndex(context
                                                .read<QuestionsCubit>()
                                                .index);
                                      }
                                    },
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                vertical: 25, horizontal: 15)),
                                        backgroundColor: getColor(
                                            Colors.white,
                                            const Color.fromARGB(
                                                255, 254, 151, 56)),
                                        foregroundColor: getColor(
                                            Colors.black, Colors.white),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.grey, width: 0.5),
                                        ))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.questionsList[context
                                              .read<QuestionsCubit>()
                                              .index]["answers"][i]["ans"],
                                          style: GoogleFonts.quicksand(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Icon(Icons.arrow_forward,
                                            size: 16.0),
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    }

    return MaterialStateProperty.resolveWith(getColor);
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to go back to the previous screen?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }

  Future<bool> showBackAlertDialog(BuildContext context, String title) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: Text(title),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }
}
