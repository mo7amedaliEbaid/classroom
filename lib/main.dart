import 'package:classroom/paymob/shared/network/dio.dart';
import 'package:classroom/quiz/cubits/questions_cubit/cubit/questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'common_screens/onboarding_screen.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await DioHelperPayment.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  initializeDateFormatting().then(
    (_) => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => QuestionsCubit()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
