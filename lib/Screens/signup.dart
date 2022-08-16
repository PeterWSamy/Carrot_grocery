import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final email = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/");
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    alignment: Alignment.topLeft,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter the Email";
                          }
                          return null;
                        },
                        controller: email,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Email",
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        obscureText: true,
                        key: _passKey,
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter the password";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Password"),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: password2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter the password";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Verify Password"),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: 390,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Processing data")));
                        signup;
                      }
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 390,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                          "By creating an account, you are agreeing to our ",
                          style: TextStyle(fontSize: 14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Terms of Service ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 82, 205, 109))),
                          Text("and ",
                              style: TextStyle(
                                fontSize: 14,
                              )),
                          Text("Privacy Policy ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 82, 205, 109))),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signup() {
    
  }
}
