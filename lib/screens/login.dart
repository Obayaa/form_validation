import 'package:flutter/material.dart';
// import 'package:form_validation/screens/calculator.dart';
import 'package:form_validation/screens/homepage.dart';
import 'package:form_validation/screens/register.dart';
import 'package:form_validation/variables/functions.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // final String email;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool _passwordvisibilty = true;

  // LoginScreen({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 228, 233),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome Back!",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
              ),
              Image.asset("assets/logo.png"),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (!validateEmail(value.toString())) {
                    emailController.text = "";
                    return "Please Enter a valid email";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Enter your Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: _passwordvisibilty,
                controller: passwordController,
                validator: (value) {
                  if (!validateStructure(value.toString())) {
                    passwordController.text = "";
                    return "Please Enter a valid password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Enter your Password",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    onPressed: (){
                  setState(() {
                    _passwordvisibilty = !_passwordvisibilty;
                  });
                    },
                    icon: Icon(
                      !_passwordvisibilty
                      ? Icons.visibility
                      : Icons.visibility_off_outlined,
                    ),
                    
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const InkWell(
                // onTap: (){},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 35, 1, 48),
                    shape: const LinearBorder()
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // if (passwordController.text == password) {
                      //   return ;
                      // }
                      // if (passwordController.text == password &&
                      //     emailController.text == email) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomePage();
                          },
                        ),
                      );
                      //   );
                    }
                    // }
                  },
                  child: const Text("Login"),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const RegisterScreen(
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
                      "Sign up",
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
