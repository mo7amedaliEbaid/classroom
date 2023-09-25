import 'package:classroom/paymob/modules/payment/referanceCode.dart';
import 'package:classroom/paymob/modules/payment/visaCard.dart';
import 'package:classroom/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../components.dart';
import '../../shared/styles/colors.dart';


class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: defColor,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Colors.black,
          title: const Text('Payment'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    NavigateTo(  VisaCardScreen(),context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(cardimage),
                          height: 250,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Payment With Card',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    NavigateTo(  RefCodeScreen(),context,);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: AssetImage(
                                paycardimage
                            ),
                            height: 250),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Payment Ref Code',
                          style: TextStyle(
                              fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
