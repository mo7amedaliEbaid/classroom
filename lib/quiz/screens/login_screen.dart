import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import '../global/gradient_decoration.dart';
import 'category_screen.dart';

final userNameTextCont = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DecoratedBox(
          decoration: blueGradient,
          child: SafeArea(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: SvgPicture.asset(
                          'assets/images/logo.svg',
                          width: .15,
                          height: .15,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Color(0xEEF7FFFF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: GoogleFonts.quicksand(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: userNameTextCont,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username can not be empty';
                            } else if (value.length < 4) {
                              return "Username must be more than 9 characters";
                            } else if (!value[0].contains(RegExp(r'[A-Z]'))) {
                              return "First character in username must be uppercase ";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            prefixIcon: const Icon(Icons.person),
                            hintText: "Username",
                            hintStyle: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            filled: false,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CategoryScreen(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.quicksand(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
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
