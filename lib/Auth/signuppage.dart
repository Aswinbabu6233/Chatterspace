import 'package:chatterspace/Auth/firebasefunction.dart';
import 'package:chatterspace/utils/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginpage.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _passwordsignup = TextEditingController();

  final _confirmpasswordSignup = TextEditingController();
  final _UsernameChecker = TextEditingController();
  final _emailChecker = TextEditingController();

  final _state = GlobalKey<FormState>();

  bool _obscuretext = true;
  bool _obscuretext2 = true;

  String? _validemail(value) {
    if (value!.isEmpty) {
      return "Please enter an EMAIL";
    }
    RegExp emailregularexp =
        RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    if (!emailregularexp.hasMatch(value)) {
      return "Please enter valid Email";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: _state,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 250,
                      child: Text("Create new Account",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sansita(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: TextStyle(color: Colors.white),
                      controller: _UsernameChecker,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                        labelStyle: TextStyle(color: Colors.white54),
                        labelText: "Username",
                        prefixIcon: Icon(
                          CupertinoIcons.person,
                          color: Colors.white54,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "value is empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.white),
                        controller: _emailChecker,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30)),
                          labelStyle: TextStyle(color: Colors.white54),
                          labelText: "Email",
                          prefixIcon: Icon(
                            CupertinoIcons.mail,
                            color: Colors.white54,
                          ),
                        ),
                        validator: _validemail),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: TextStyle(color: Colors.white),
                      obscureText: _obscuretext2,
                      controller: _passwordsignup,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                        labelStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.white54,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscuretext2 = !_obscuretext2;
                            });
                          },
                          child: Icon(
                            color: Colors.white54,
                            _obscuretext2
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "value is empty";
                        }
                        if (value.length < 6) {
                          return "Password should be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: TextStyle(color: Colors.white),
                      obscureText: _obscuretext,
                      controller: _confirmpasswordSignup,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                        labelStyle: TextStyle(color: Colors.white54),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.white54,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscuretext = !_obscuretext;
                            });
                          },
                          child: Icon(
                            color: Colors.white54,
                            _obscuretext
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        labelText: " Confirm Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "value is empty";
                        }
                        if (value.length < 6) {
                          return "Password should be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                        color: Colors.white,
                        minWidth: MediaQuery.of(context).size.width,
                        height: 55,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () async {
                          if (_state.currentState!.validate()) {
                            if (_passwordsignup == _confirmpasswordSignup) {
                              await AuthService().signup(
                                  email: _emailChecker.text,
                                  password: _passwordsignup.text,
                                  context: context);
                            }
                          }
                        },
                        child: Text(
                          "Signup",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: GoogleFonts.sansita(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) {
                                  return Loginpage();
                                },
                              ));
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.sansita(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void check(BuildContext cntxx) {
  //   final _password = _passwordsignup.text;
  //   final _confirm = _confirmpasswordSignup.text;

  //   if (_password == _confirm) {
  //     Navigator.push(cntxx, MaterialPageRoute(
  //       builder: (contx1) {
  //         return Loginpage();
  //       },
  //     ));
  //   } else {
  //     ScaffoldMessenger.of(cntxx).showSnackBar(SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         margin: EdgeInsets.all(10),
  //         content: Text(
  //           "Password and confirm password Deosn't match",
  //           style: GoogleFonts.sansita(),
  //         )));
  //   }
  // }
}
