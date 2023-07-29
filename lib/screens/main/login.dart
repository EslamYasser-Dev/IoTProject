import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  _login() {
    try {
      setState(() {
        if (usrname == 'eslamqotb' && pwd == '123456') {
          isLoggedIN = true;
          Navigator.pushNamed(context, 'main_screen');
        } else {
          print("username wrong");
        }
      });
    } catch (err) {
      print(err);
    }
  }

  late String usrname, pwd;
  bool isLoggedIN = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.secondarySystemFill,
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             
                  Image.asset('assets/loginlogo.png',height: 128,width: 128, scale: 2.5,),
                     
              const Text(
                'Login',
                style: TextStyle(
                    color: CupertinoColors.activeBlue,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),const Text("IoT Tank Monitoring"),
              const SizedBox(
                height: 19,
              ),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    CupertinoTextFormFieldRow(
                      onChanged: (value) {
                        usrname = value;
                      },
                      prefix: const Center(
                          child: Icon(Icons.supervised_user_circle_sharp)),
                      placeholder: 'Email',
                      placeholderStyle: TextStyle(
                          color: CupertinoColors.darkBackgroundGray
                              .withOpacity(0.6)),
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: CupertinoColors.separator))),
                    ),
                    CupertinoTextFormFieldRow(
                      onChanged: (value) {
                        pwd = value;
                      },
                      prefix: const Center(child: Icon(Icons.password_sharp)),
                      obscureText: true,
                      placeholder: 'Password',
                      placeholderStyle: TextStyle(
                          color: CupertinoColors.darkBackgroundGray
                              .withOpacity(0.6)),
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.dark,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoButton.filled(
                      child: const FittedBox(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                      onPressed: _login)
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
