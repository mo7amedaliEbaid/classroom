import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';


class CountDown extends StatelessWidget {
  final int quizTime;
  final Function timeOut;
  const CountDown({Key? key, required this.quizTime,required this.timeOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              Icons.timer_outlined,
              color: Colors.white,
              size: 18,
            ),
          ),
          TimerCountdown(
            format: CountDownTimerFormat.minutesSeconds,
            enableDescriptions: false,
            colonsTextStyle: const TextStyle(color: Colors.white),
            timeTextStyle: const TextStyle(
              color: Colors.white,
            ),
            endTime: DateTime.now().add(
              Duration(
                minutes: quizTime,
                seconds: 0,
              ),
            ),
            onEnd: () {
              timeOut();
            },
          ),
        ],
      ),
    );
  }
}
