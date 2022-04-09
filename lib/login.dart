import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[50],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            ),
          ],
        ),
        body:const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = " ";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.cyanAccent[50],
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/pic.png",
                cacheHeight: 300,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[850],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username is empty";
                      }
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration:const InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is empty";
                        } else if (value.length < 6) {
                          return "Password should be atleast 6 characters";
                        }
                      }),
                 const SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                        duration:const Duration(seconds: 1),
                        height: 50,
                        width: changeButton ? 50 : 100,
                        decoration: BoxDecoration(
                          color: Colors.cyan[300],
                          borderRadius: changeButton
                              ? BorderRadius.circular(25)
                              : BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: changeButton
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              :const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                                ),
                        )),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
