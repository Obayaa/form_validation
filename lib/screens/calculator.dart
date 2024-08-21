import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String selectedOperator = '+';

  TextEditingController num1Controller = TextEditingController();

  TextEditingController num2Controller = TextEditingController();

  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 239, 239),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 1, 48),
        title: const Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Enter First Number'),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 50,
              width: 100,
              child: DropdownButton<String>(
                // alignment: Alignment.centerRight,
                // alignment: AlignmentDirectional(20, 0),
                value: selectedOperator,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOperator = newValue!;
                  });
                },
                items: <String>['+', '-', '*', '/']
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Enter Second Number'),
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 35, 1, 48),
                  ),
                ),
                onPressed: () {
                  calculate();
                },
                child: const Text('Calculate'),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Result: $result',
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 245, 45, 45)),
            ),
          ],
        ),
      ),
    );
  }

  void calculate() {
    double num1 = double.tryParse(num1Controller.text) ?? 0.0;
    double num2 = double.tryParse(num2Controller.text) ?? 0.0;

    setState(() {
      switch (selectedOperator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          result = num1 / num2;
          break;
        default:
          result = 0.0;
      }
    });
  }
}
