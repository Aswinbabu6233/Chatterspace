import 'package:chatterspace/Auth/firebasefunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../Screens/mainpage.dart';
import 'signuppage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  bool _obscuretext = true;

  final _UsernameChecker = TextEditingController();

  final _PasswordChecker = TextEditingController();

  final _formstate = GlobalKey<FormState>();
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formstate,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text("Welcome Back!!",
                    style: GoogleFonts.sansita(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                Lottie.asset("assets/animation/login.json", height: 300),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _UsernameChecker,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30)),
                      labelStyle: TextStyle(color: Colors.white54),
                      labelText: "Email",
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: _validemail),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "value is empty";
                    } else {
                      return null;
                    }
                  },
                  obscureText: _obscuretext,
                  controller: _PasswordChecker,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscuretext = !_obscuretext;
                        });
                      },
                      child: Icon(
                        color: Colors.white54,
                        _obscuretext ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white54),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    color: Colors.grey[700],
                    minWidth: MediaQuery.of(context).size.width,
                    height: 55,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),

                    // style: ButtonStyle(
                    //     backgroundColor:
                    //         MaterialStateProperty.all(Colors.orange)),
                    onPressed: () async {
                      if (_formstate.currentState!.validate()) {
                        await AuthService().signin(
                            email: _UsernameChecker.text,
                            password: _PasswordChecker.text,
                            context: context);
                      }
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.sansita(
                          color: Colors.white, fontSize: 20),
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: GoogleFonts.sansita(
                          color: Colors.grey[500],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return Signuppage();
                            },
                          ));
                        },
                        child: Text(
                          "Signup",
                          style: GoogleFonts.sansita(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[300]),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  // void checker(BuildContext cnte) {
  //   final _username = _UsernameChecker.text;
  //   final _password = _PasswordChecker.text;
  //   final _erromessage = "Username and password is not match";

  //   if (_username == _password) {
  //     Navigator.pushReplacement(cnte, MaterialPageRoute(
  //       builder: (contx1) {
  //         return Mainpage();
  //       },
  //     ));
  //   } else {
  //     ScaffoldMessenger.of(cnte).showSnackBar(SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         margin: EdgeInsets.all(10),
  //         content: Text(_erromessage)));
  //   }
  // }
}
