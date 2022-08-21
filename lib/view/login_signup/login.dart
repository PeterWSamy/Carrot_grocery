import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final email = TextEditingController();
  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void login(BuildContext context) {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No user found for that email.")));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Wrong password provided.")));
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Error happened")));
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: AssetImage("assets/images/login.png"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                        child: TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please Enter the email";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "Email",
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please Enter the password";
                          }
                          return null;
                        },
                        controller: password,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Password"),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    width: 400,
                    child: Text(
                      "Forgot password ?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 82, 205, 109),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 390,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Loading')),
                            );
                            login(context);
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?  ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/signup");
                        },
                        child: const Text(
                          "Create one",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 82, 205, 109),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
