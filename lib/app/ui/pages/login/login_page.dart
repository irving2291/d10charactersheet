import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:d10charactersheet/app/domain/repositories/authentication_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();
  bool loading = false;
  TextStyle textStyle = const TextStyle(fontSize: 15,);

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void validateSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      GetIt.I<AuthenticationRepository>().signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ).then((value) {
        if (value == 'sign in') {
          value = 'welcome';
        }
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).cardColor,
              content: Text(value!),
            )
        );
        setState(() {
          loading = false;
        });
      }).catchError((error) {
        setState(() {
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffE01F36),
      body: Form(
        key: _formKey,
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffE01F36),
                    Color(0xff151535)
                  ]
              )
          ),
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                    top: 50,
                    right: 1,
                    left: 1,
                    child: Image.asset('assets/img/logoblank.png', height:140.0,),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: queryData.size.width > 600?500:double.infinity,
                      padding: const EdgeInsets.fromLTRB(30.0, 200.0, 30.0, 0.0),
                      child: Card(
                        //color: Color(0xffE01F36),
                        color: Colors.white,
                        elevation: 4,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    focusNode: _focusEmail,
                                    controller: emailController,
                                    style: textStyle,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.email),
                                      border: InputBorder.none,
                                      hintText: "Email",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter email';
                                      }
                                      return null;
                                    },
                                  ),
                                  const Divider(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    style: textStyle,
                                    controller: passwordController,
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.visiblePassword,
                                    focusNode: _focusPassword,
                                    decoration: const InputDecoration(
                                      //contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                      prefixIcon: Icon(Icons.lock),
                                      border: InputBorder.none,
                                      hintText: "Password",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter password';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: !loading?ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Theme.of(context).accentColor,
                                          elevation: 2,
                                          textStyle: const TextStyle(color: Colors.white)
                                      ),
                                      onPressed: () {
                                        validateSubmit(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.email),
                                          SizedBox(width: 10,),
                                          Text("login")
                                        ],
                                      ),
                                    ):const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 0.2,
                        color: Colors.white,
                      ),
                    ),
                    Text('  or  ', style: TextStyle(color: Colors.white),),
                    Expanded(
                      child: Divider(
                        thickness: 0.2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Column(
                children: [
                  Platform.isAndroid?Container(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: !loading?ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                            elevation: 2,
                            textStyle: const TextStyle(color: Colors.white)
                        ),
                        onPressed: () {
                          GetIt.I<AuthenticationRepository>().signUpWithGoogle();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(FontAwesomeIcons.google),
                            SizedBox(width: 10,),
                            Text('sign up with google')
                          ],
                        ),
                      ):const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ):Container(),
                  Platform.isIOS?Container(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: !loading?ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff212226),
                            elevation: 2,
                            textStyle: const TextStyle(color: Colors.white)
                        ),
                        onPressed: () {
                          GetIt.I<AuthenticationRepository>().signUpWithApple();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(FontAwesomeIcons.apple),
                            SizedBox(width: 10,),
                            Text('log in with apple')
                          ],
                        ),
                      ):const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ):Container(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: !loading?ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white10,
                            elevation: 2,
                            textStyle: const TextStyle(color: Colors.black)
                        ),
                        onPressed: () {
                          GetIt.I<AuthenticationRepository>().signInAnonymously();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.person),
                            SizedBox(width: 10,),
                            Text('anonymous')
                          ],
                        ),
                      ):const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                ],
              ),
              /*Container(
              width: queryData.size.width > 600?500:double.infinity,
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {},
                  child: Text("resume password?",
                    style: textStyle.copyWith(color: Colors.white),),
                ),
              ),
            ),*/
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
