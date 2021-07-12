import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String uname = " ";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "android/assets/login.png",
                fit: BoxFit.cover,
              ),
              Text(
                "Welcome, $uname",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter username", labelText: "Username"),
                      onChanged: (value) {
                        uname = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          changeButton = true;
                        });
                        // Navigator.pushNamed(context, "/home");
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 50),
                        height: 50,
                        width: changeButton ? 50 : 150,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            // shape: changeButton
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 20)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
