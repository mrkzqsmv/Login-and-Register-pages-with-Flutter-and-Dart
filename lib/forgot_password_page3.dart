import 'package:flutter/material.dart';
import 'package:login_and_signup_pages/login_page.dart';

class ForgotPasswordPage3 extends StatefulWidget {
  const ForgotPasswordPage3({super.key});

  @override
  State<ForgotPasswordPage3> createState() => _ForgotPasswordPage3State();
}

class _ForgotPasswordPage3State extends State<ForgotPasswordPage3> {
  late String kullaniciTarafindanGirilenSifre1;
  late String kullaniciTarafindanGirilenSifre2;
  late String yeniSifre;
  var formKey = GlobalKey<FormState>();
  bool _obscureText1 = true;
  bool _obscureText2 = true;
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
        title: const Text('New Password'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Please write your new password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: _obscureText1,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText1 =
                              !_obscureText1; // Durumu tersine çevir
                        });
                      },
                      icon: Icon(
                        _obscureText1 ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                    ),
                    labelText: 'Please enter the new password',
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
                    kullaniciTarafindanGirilenSifre1 = sifre!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: _obscureText2,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText2 =
                              !_obscureText2; // Durumu tersine çevir
                        });
                      },
                      icon: Icon(
                        _obscureText2 ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                    ),
                    labelText: 'Please re-enter your new password',
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
                    kullaniciTarafindanGirilenSifre2 = sifre!;
                  },
                ),
                const SizedBox(
                  height: 10,
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
                        // print(kullaniciTarafindanGirilenSifre1);
                        // print(kullaniciTarafindanGirilenSifre2);
                        if (kullaniciTarafindanGirilenSifre1 ==
                            kullaniciTarafindanGirilenSifre2) {
                          yeniSifre = kullaniciTarafindanGirilenSifre1;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Your password has been changed'),
                            ),
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content:
                                  Text('Your password has not been changed'),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text('Confirm Password'),
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
