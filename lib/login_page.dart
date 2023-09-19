import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_and_signup_pages/signup_page.dart';

import 'forgot_password_page1.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String kullaniciTarafindanGirilenEmail;
  late String kullaniciTarafindanGirilenSifre;
  final formKey = GlobalKey<FormState>();
  bool gizliText1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                  width: double.infinity,
                  height: 250,
                  child: const Icon(
                    Icons.assessment,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 650,
                  margin: const EdgeInsets.only(top: 260),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              const Column(
                                children: [
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Sign in to continue.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Form(
                                key: formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'EMAIL',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'jiaramartins@gmail.com',
                                          filled: true,
                                          fillColor: Colors.grey,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (email) {
                                          if (email!.isEmpty) {
                                            return 'An email address cannot be empty';
                                          } else if (!EmailValidator.validate(
                                              email)) {
                                            return 'Invalid email address';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (email) {
                                          kullaniciTarafindanGirilenEmail =
                                              email!;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'PASSWORD',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        obscureText: gizliText1,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                gizliText1 = !gizliText1;
                                              });
                                            },
                                            icon: Icon(gizliText1
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                          ),
                                          hintText: '********',
                                          filled: true,
                                          fillColor: Colors.grey,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        validator: (sifre) {
                                          if (sifre!.isEmpty) {
                                            return 'Password cannot be empty';
                                          } else if (sifre.length < 8) {
                                            return 'The password must contain at least 8 characters';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (sifre) {
                                          kullaniciTarafindanGirilenSifre =
                                              sifre!;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 300,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade900,
                                      ),
                                      onPressed: () {
                                        bool validate =
                                            formKey.currentState!.validate();
                                        if (validate) {
                                          formKey.currentState!.save();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                'You have logged into your account',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          );
                                          formKey.currentState!.reset();
                                        }
                                      },
                                      child: const Text('Log in'),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPasswordPage1(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  GestureDetector(
                                    child: const Text(
                                      'Signup!',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
