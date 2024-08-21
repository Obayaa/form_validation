import 'package:flutter/material.dart';
import 'package:form_validation/screens/register.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 1, 48),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png'),
                  const Text(
                    "Welcome to Soko Aerial.\n The best place for refinery",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),

            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const RegisterScreen();
                  }),
                );
              },
              label: const Text("Get Started"),
            ),
            // onPressed: () {},
            // child: Text("Get Started"),
            // SizedBox(
            //   height: 10,
            // ),
            // ElevatedButton(onPressed: () {}, child: Text("Get Started"))
          ],
        ),
      ),
    );
  }
}
