import 'package:auth_page/components/buttons.dart';
import 'package:auth_page/components/textfields.dart';
import 'package:auth_page/components/tile.dart';
import 'package:auth_page/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passWordController = TextEditingController();

  // showPassword method
  bool isOpen = true;

  void showPassword() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  void signIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      // Sign in
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passWordController.text);
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      // Pop the loader before showing error
      if (mounted) {
        Navigator.pop(context);
        // error
        showErrorMsg(e.code);
      }
    }
  }

// error msg
  void showErrorMsg(String msg) {
    if (mounted) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(msg),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                // email field
                Textfields(
                  controller: emailController,
                  labelText: "Email",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 25,
                ),
                // password field
                Stack(
                  alignment:
                      Alignment.centerRight, // Align the icon to the right
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
                  text: "Sign In",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // google button
                    Tile(
                      imgPath: "assets/google.png",
                      onTap: () => AuthService().signInWithGoogle(),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    // apple button
                    Tile(
                      imgPath: "assets/apple.png",
                      onTap: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // not a member? Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("You're not a member?"),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register.",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
