import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'forgot_password_page3.dart';

class ForgotPasswordPage2 extends StatefulWidget {
  const ForgotPasswordPage2({super.key});

  @override
  State<ForgotPasswordPage2> createState() => _ForgotPasswordPage2State();
}

class _ForgotPasswordPage2State extends State<ForgotPasswordPage2> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode1.requestFocus();
    _controller1.addListener(() {
      if (_controller1.text.length == 1) {
        _focusNode2.requestFocus();
      }
    });
    _controller2.addListener(() {
      if (_controller2.text.length == 1) {
        _focusNode3.requestFocus();
      }
    });
    _controller3.addListener(() {
      if (_controller3.text.length == 1) {
        _focusNode4.requestFocus();
      }
    });
    _controller4.addListener(() {
      if (_controller4.text.length == 1) {
        _focusNode4.unfocus();
      }
    });
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
        title: const Text('Verification Code'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Verify email address',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Verification code sent to your email address',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                      child: TextFormField(
                        focusNode: _focusNode1,
                        controller: _controller1,
                        maxLength: 1,
                        cursorHeight: 38,
                        cursorWidth: 3,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                    child: TextFormField(
                      controller: _controller2,
                      focusNode: _focusNode2,
                      maxLength: 1,
                      cursorHeight: 38,
                      cursorWidth: 3,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                    ),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                    child: TextFormField(
                      controller: _controller3,
                      focusNode: _focusNode3,
                      maxLength: 1,
                      cursorHeight: 38,
                      cursorWidth: 3,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                    ),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                    child: TextFormField(
                      controller: _controller4,
                      focusNode: _focusNode4,
                      maxLength: 1,
                      cursorHeight: 38,
                      cursorWidth: 3,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                    ),
                  ),
                ],
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
                    bool validate = true;
                    if (validate) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            'Your code has been accepted',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage3()));
                    }
                  },
                  child: const Text('Confirm Code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
