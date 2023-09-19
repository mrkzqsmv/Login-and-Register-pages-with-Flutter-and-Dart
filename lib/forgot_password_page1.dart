import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'forgot_password_page2.dart';

class ForgotPasswordPage1 extends StatefulWidget {
  const ForgotPasswordPage1({super.key});

  @override
  State<ForgotPasswordPage1> createState() => _ForgotPasswordPage1State();
}

class _ForgotPasswordPage1State extends State<ForgotPasswordPage1> {
  late String kullaniciTarafindanGirilenEmail;
  var formKey = GlobalKey<FormState>();
  final FocusNode _focusNode1 = FocusNode();
  @override
  void dispose() {
    _focusNode1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Forgot Password'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Please write your email to receive a confirmation code to set a new password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 12,
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    focusNode: _focusNode1,
                    decoration: InputDecoration(
                      hintText: 'jiaramartins@gmail.com',
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
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
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: 380,
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
                              'Your email address has been accepted',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        );
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage2()));
                      }
                    },
                    child: const Text('Confirm Mail'),
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
