import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String kullaniciTarafindanGirilenIsim;
  late String kullaniciTarafindanGirilenEmail;
  late String kullaniciTarafindanGirilenSifre;
  late String kullaniciTarafindanSecilenTarih;

  late DateTime suan = DateTime.now();
  late DateTime besAyOncesi = DateTime(2023, suan.month - 5, 1);
  late DateTime besAySonrasi = DateTime(2023, suan.month - 5, 1);
  final formKey = GlobalKey<FormState>();

  bool gizliText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 50,
            backgroundColor: Colors.blue.shade900,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 45,
                ),
                const Center(
                  child: Text(
                    'Create new',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                const Center(
                  child: Text(
                    'Account',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: const Text(
                        'Already Registered? Log in Here.',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'NAME',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Jiara martins',
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.name,
                          validator: (isim) {
                            if (isim!.isEmpty) {
                              return 'The name cannot be empty';
                            } else if (isim.length < 8) {
                              return 'Your name must have a minimum of 8 characters';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (isim) {
                            kullaniciTarafindanGirilenIsim = isim!;
                          },
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'EMAIL',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'jiaramartins.com',
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'An email address cannot be empty';
                            } else if (!EmailValidator.validate(email)) {
                              return 'Invalid email address';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (email) {
                            kullaniciTarafindanGirilenEmail = email!;
                          },
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'PASSWORD',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        TextFormField(
                          obscureText: gizliText,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  gizliText = !gizliText;
                                });
                              },
                              icon: Icon(gizliText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hintText: '********',
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
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
                            kullaniciTarafindanGirilenSifre = sifre!;
                          },
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'DATE OF BIRTH',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        GestureDetector(
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Container(
                              margin: const EdgeInsets.only(top: 21, left: 12),
                              child: const Text(
                                'SELECT',
                              ),
                            ),
                          ),
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(2018, 3, 5),
                                maxTime: DateTime(2019, 6, 7),
                                currentTime: DateTime.now(),
                                locale: LocaleType.az);
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
                          bool validate = formKey.currentState!.validate();
                          if (validate) {
                            formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'You have registered',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            );

                            formKey.currentState!.reset();
                          }
                        },
                        child: const Text('Sign up'),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
