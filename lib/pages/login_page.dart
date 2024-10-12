import 'package:auth_page/components/buttons.dart';
import 'package:auth_page/components/textfields.dart';
import 'package:auth_page/components/tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controllers
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passWordController = TextEditingController();

  // showPassword method
  bool isOpen = true;

  void showPassword() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  // Sign In method
  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(
                height: 30,
              ),
              // welcome back msg
              Text("Welcome back you've been missed!",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16)),

              const SizedBox(
                height: 25,
              ),
              // Textfield
              // username field
              Textfields(
                controller: userNameController,
                labelText: "Username",
                obscureText: false,
              ),
              const SizedBox(
                height: 25,
              ),
              // password field
              Stack(
                alignment: Alignment.centerRight, // Align the icon to the right
                children: [
                  Textfields(
                    controller: passWordController,
                    obscureText: isOpen,
                    labelText: "Password",
                  ),

                  // Positioned icon inside the TextField
                  Positioned(
                    right: 20, // Align to the right edge
                    child: IconButton(
                      onPressed: showPassword,
                      icon: Icon(
                        isOpen ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              // Sign in button
              Buttons(
                onTap: signIn,
              ),
              // or continue ...
              const SizedBox(
                height: 20,
              ),

              // google or apple sign in
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.grey[800],
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "or continue with",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[800],
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // google button
                  Tile(imgPath: "assets/google.png"),
                  SizedBox(
                    width: 30,
                  ),
                  // apple button
                  Tile(imgPath: "assets/apple.png")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // not a member? Register now
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You're not a member?"),
                  Text(
                    "Register.",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
- Added images to file tree amd Yaml file,
- Created Components folder
- Created Custom Textfields 
*/
