import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Profile.dart';
import 'package:login_app/Services/Firebaseauthservice.dart';
import 'package:login_app/SignUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController=TextEditingController();

  TextEditingController passwordController=TextEditingController();
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            spacing: 5,
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Enter your credentials to login",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 247, 221, 230),
                  prefixIcon: Icon(
                    Icons.person,
                    color: const Color.fromARGB(255, 8, 117, 219),
                  ),
                  hintText: "Username",
                  contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 247, 221, 230),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: const Color.fromARGB(255, 8, 117, 219),
                  ),
                  hintText: "Password",
                  contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(fontSize: 20),
                obscureText: true, // Hide password text
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent, fixedSize: Size(400, 40)),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await login(email: emailController.text, password:passwordController.text, context: context);
                  setState(() {
                    isLoading = false;
                  });
                  },
                child: isLoading?CircularProgressIndicator() :Text(
                  "Submit",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
              SizedBox(height: 50),
              // Forgot Password link
              TextButton(
                onPressed: () {
                  // Here you can implement the password reset logic
                  // For example, navigating to a "Forgot Password" screen
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPasswordScreen()));
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              // Don't have an account? Sign Up link
              TextButton(
                onPressed: () {
                  // Navigate to Sign Up screen or show the sign-up flow
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                },
                child:RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black), // Default text style
                  children: [
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black), // Black color for "Don't have an account?"
                    ),
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(color: Colors.purple), // Purple color for "Sign Up"
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Navigate to Sign Up screen or show the sign-up flow
                         Navigator.push(context, MaterialPageRoute(builder: (_) => Signup()));
                      },
                      
                    ),
                  ],
                ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
