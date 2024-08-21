import 'package:flutter/material.dart';
import 'package:form_validation/classes/textform.dart';
// import 'package:form_validation/screens/calculator.dart';
import 'package:form_validation/screens/homepage.dart';
import 'package:form_validation/screens/login.dart';
import 'package:form_validation/variables/functions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();

  //Controller for fullname
  final TextEditingController fullname = TextEditingController();
  //controller for email
  final TextEditingController email = TextEditingController();
  //controller for password
  final TextEditingController password = TextEditingController();
  //controller for confirmPassword
  final TextEditingController confirmPassword = TextEditingController();

  //bool variables delcared to handle obscure text value
  bool _passwordvisibilty = true;
  bool _confirmPasswordvisibilty = true;
  @override
  Widget build(BuildContext context) {
    //Scaffold for content covering appbar and body
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 228, 233),
      body: Padding(
        padding: const EdgeInsets.only(top: 80, right: 20, left: 20),

        //Form widget for form validation
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const Text(
                "Welcome Onboard!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Let's help you meet up your tasks",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 40,
              ),

              //textformfield for User's full name

              CustomTextFormField(
                hintText: "Enter your Full Name",
                keyboardType: TextInputType.name,
                controller: fullname,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter your Full name";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 10,
              ),

              //textformfield for User's email
              CustomTextFormField(
                hintText: "Enter Your Email Address",
                keyboardType: TextInputType.emailAddress,
                controller: email,
                validator: (value) {
                  if (!validateEmail(value.toString())) {
                    email.text = "";
                    return "Please Enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),

              //textformfield for User's password
              CustomTextFormField(
                hintText: "Enter Password",
                controller: password,
                obscureText: _passwordvisibilty,
                suffixIcon: Icon(
                    color: Colors.grey,
                    !_passwordvisibilty
                        ? Icons.visibility
                        : Icons.visibility_off_outlined),
                onSuffixIconPressed: () {
                  setState(() {
                    _passwordvisibilty = !_passwordvisibilty;
                  });
                },
                validator: (value) {
                  if (!validateStructure(value.toString())) {
                    password.text = "";
                    return "Please Enter a valid password";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),

              //textformfield to confirm user's password
              CustomTextFormField(
                hintText: 'Confirm password',
                controller: confirmPassword,
                obscureText: _confirmPasswordvisibilty,
                suffixIcon: Icon(
                  color: Colors.grey,
                  !_confirmPasswordvisibilty
                      ? Icons.visibility
                      : Icons.visibility_off_outlined,
                ),
                onSuffixIconPressed: () {
                  setState(() {
                    _confirmPasswordvisibilty = !_confirmPasswordvisibilty;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please confirm your password";
                  } else if (value != password.text) {
                    confirmPassword.text = "";
                    return "Password does not match";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 10,
              ),

              //Elevated button to register user
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 35, 1, 48),
                    shape: const LinearBorder()
                  ),
                  // style: ButtonStyle(
                  //   shape: MaterialStateProperty.all<OutlinedBorder>(
                  //       const LinearBorder()),
                  //   backgroundColor: MaterialStateProperty.all<Color>(
                  //     const Color.fromARGB(255, 35, 1, 48),
                  //   ),
                  // ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const HomePage(
                              // username: fullname.text,
                              );
                        }),
                      );
                    }
                  },
                  child: const Text("Register"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //row to manage if the user has an account or wants to Sign In
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen(
                                // email: email.text,
                                // password: password.text,
                                );
                          },
                        ),
                      );
                      // setState(() {
                      //   dispose();
                      // });
                      // setState(() {
                      //   const LoginScreen();
                      // });
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
