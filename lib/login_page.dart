import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_india/main_page.dart';
import 'package:search_india/mobileLogin.dart';
import 'package:search_india/profile.dart';
import 'package:search_india/register_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:search_india/secondLoginPhone.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final key = new GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/maskGroup3.png'), fit: BoxFit.cover)),
      child: ModalProgressHUD(
        inAsyncCall: loading,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          key: key,
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomPadding: false,
          body: Container(
            height: double.infinity,
            child: ListView(
              reverse: false,
              children: <Widget>[
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: <Widget>[
//                      Container(
//                          color: Colors.black,
//                          height: 150,
//                          width: 170,
//                          child: Image(
//                            image: AssetImage('images/splash.png'),
//                            fit: BoxFit.cover,
//                          )),
//                    ],
//                  ),
                Container(
                  height: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo search.png")
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Login to Continue',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: TextField(
                          onChanged: (val) {
                            email = val;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              size: 25,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Email',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: TextField(
                          obscureText: true,
                          onChanged: (val) {
                            password = val;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 25,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () async {
                    if (email == null || email == "") {
                      final snackBar = new SnackBar(
                          content: new Text(
                            "Please fill your e-mail address above to get a password reset link",
                            style: TextStyle(fontSize: 15),
                          ),
                          duration: new Duration(milliseconds: 2800),
                          backgroundColor: Colors.grey.shade200);
                      key.currentState.showSnackBar(snackBar);
                    } else {
                      await _auth.sendPasswordResetEmail(email: email);
                      final snackBar = new SnackBar(
                          content: new Text(
                            "Check your e-mail to reset your password",
                            style: TextStyle(fontSize: 15),
                          ),
                          duration: new Duration(milliseconds: 2800),
                          backgroundColor: Colors.grey.shade200);
                      key.currentState.showSnackBar(snackBar);
                    }
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 32.0),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[700], fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
//                  InkWell(
//                    onTap: () {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => MobileLogin()));
//                    },
//                    child: Padding(
//                      padding: const EdgeInsets.all(5.0),
//                      child: Text("Sign-up using Mobile"),
//                    ),
//                  ),
                SizedBox(
                  height: 5,
                ),
//                  InkWell(
//                    onTap: () {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => OldLoginMobile()));
//                    },
//                    child: Padding(
//                      padding: const EdgeInsets.all(5.0),
//                      child: Text("Login using Mobile"),
//                    ),
//                  ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      setState(() {
                        loading = true;
                      });
                      FirebaseUser user =
                          (await _auth.signInWithEmailAndPassword(
                                  email: email, password: password))
                              .user;
                      if (user.isEmailVerified) {
                        setState(() {
                          loading = false;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
                      } else {
                        final snackBar = new SnackBar(
                            content: new Text(
                              "Please verify your account first",
                              style: TextStyle(fontSize: 15),
                            ),
                            duration: new Duration(milliseconds: 2800),
                            backgroundColor: Colors.grey.shade400);
                        key.currentState.showSnackBar(snackBar);
                        setState(() {
                          loading = false;
                        });
                      }
                    } catch (e) {
                      print(e);
                      final snackBar = new SnackBar(
                          content: new Text(
                            "An error has occured, $e.",
                            style: TextStyle(fontSize: 15),
                          ),
                          duration: new Duration(milliseconds: 2800),
                          backgroundColor: Colors.grey.shade400);
                      key.currentState.showSnackBar(snackBar);
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                  child: Container(
                    width: 220,
                    height: 40,
                    margin: EdgeInsets.only(left: 70, right: 70),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Container(
                    width: 220,
                    height: 40,
                    margin: EdgeInsets.only(left: 70, right: 70),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                    child: Center(
                      child: Text(
                        'REGISTER',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Back to Home',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
