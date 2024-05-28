// ignore_for_file: file_names
import 'package:auth_app_user/controller/auth.dart';
import 'package:auth_app_user/utils/constants.dart';
import 'package:auth_app_user/view/widgets/login_textformfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: loginUsernameController.text,
          password: loginPasswordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  String errorMessage = '';
  final _formkey = GlobalKey<FormState>();
  final TextEditingController loginUsernameController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  bool isObscure = true;
  @override
  void initState() {
    super.initState();
    // userBox = Hive.box<User>('user_details');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: gradientColor),
        child: ListView(children: [
          Column(
            children: [
              kheight60,
              Row(
                children: [
                  kwidth70,
                  Column(
                    children: [
                      Animate(
                        effects: [
                          FadeEffect(duration: 800.ms),
                          const SlideEffect(curve: Curves.easeIn)
                        ],
                        child: const Text(
                          "Welcome Back",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Times',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Animate(
                        effects: [
                          FadeEffect(duration: 800.ms),
                          const SlideEffect(curve: Curves.easeIn)
                        ],
                        child: const Text(
                          "Login To Your Account",
                          style: TextStyle(
                              fontFamily: 'Courier',
                              color: Color.fromARGB(255, 50, 49, 49)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Animate(
                        effects: [
                          FadeEffect(duration: 800.ms),
                          const SlideEffect(curve: Curves.easeIn)
                        ],
                        child: LoginTextFormFieldWidget(
                          controller: loginUsernameController,
                          label: "UserName",
                          validationMsg: 'Please enter your username',
                          prefixIcon: Icons.email,
                          isSuffixrequired: false,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Animate(
                          effects: [
                            FadeEffect(duration: 800.ms),
                            const SlideEffect(curve: Curves.easeIn)
                          ],
                          child: LoginTextFormFieldWidget(
                            controller: loginPasswordController,
                            label: 'Password',
                            validationMsg: 'Please enter password',
                            prefixIcon: Icons.lock,
                            isSuffixrequired: true,
                            suffixIconTap: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 155,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: Animate(
                          effects: [
                            FadeEffect(duration: 800.ms),
                            const SlideEffect(curve: Curves.easeIn),
                            const FlipEffect(curve: Curves.easeIn)
                          ],
                          child: ElevatedButton(
                            onPressed: () async {
                              signInWithEmailAndPassword();
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                backgroundColor: Colors.transparent,
                                side: const BorderSide(color: Colors.black),
                                shadowColor:
                                    const Color.fromARGB(255, 117, 199, 134)
                                        .withOpacity(0.20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
