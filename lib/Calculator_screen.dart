import 'package:flutter/material.dart';
import 'package:flutter_application_1/button_values.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String n1 = "";
  String operat = "";
  String n2 = "";
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false, //so that this doesnt apply to the bottom
        child: Column(
          children: [
            //outputs
            Expanded(
              //used with scrollview to be more flexible
              child: SingleChildScrollView(
                reverse: true, //it scrolls from down to up
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "$n1$operat$n2".isEmpty ? "0" : "$n1$operat$n2",
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            //buttons
            Wrap(
              children: Btn.buttonValues
                  .map(
                    (value) => SizedBox(
                      width: value == Btn.n0
                          ? screenSize.width / 2
                          : (screenSize.width / 4),
                      height: screenSize.width / 5,
                      child: buildButton(value),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: getBtnColor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white24),
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          //this makes the button clickable
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }

  //function that gives the btn value when tapping
  void onBtnTap(String value) {
    if (value == Btn.del) {
      delete();
      return;
    }
    if (value == Btn.clr) {
      clearAll();
      return;
    }
    if (value == Btn.per) {
      converttoPerc();
      return;
    }
    if (value == Btn.calculate) {
      calculate();
      return;
    }
    appendvalue(value);
  }

  void calculate() {
    if (n1.isEmpty) return;
    if (operat.isEmpty) return;
    if (n2.isEmpty) return;

    final double num1 = double.parse(n1);
    final double num2 = double.parse(n2);

    var result = 0.0;
    switch (operat) {
      case Btn.add:
        result = num1 + num2;
        break;
      case Btn.subtract:
        result = num1 - num2;
        break;
      case Btn.multiply:
        result = num1 * num2;
      case Btn.divide:
        result = num1 / num2;
        break;
      default:
    }
    setState(() {
      n1 = "$result";

      if (n1.endsWith(".0")) {
        n1 = n1.substring(0, n1.length - 2);
      }
      operat = "";
      n2 = "";
    });
  }

  void converttoPerc() {
    if (n1.isNotEmpty && operat.isNotEmpty && n2.isNotEmpty) {}
    if (operat.isNotEmpty) {
      return;
    }
    final number = double.parse(n1);
    setState(() {
      n1 = "${(number / 100)}";
      operat = "";
      n2 = "";
    });
  }

  void clearAll() {
    setState(() {
      n1 = "";
      operat = "";
      n2 = "";
    });
  }

  void delete() {
    if (n2.isNotEmpty) {
      n2 = n2.substring(0, n2.length - 1);
    } else if (operat.isNotEmpty) {
      operat = "";
    } else if (n1.isNotEmpty) {
      n1 = n1.substring(0, n1.length - 1);
    }
    setState(() {});
  }

  void appendvalue(String value) {
    setState(() {
      // 1. If it's an operator (+, -, x, /)
      if (value != Btn.dot && int.tryParse(value) == null) {
        // If we have n1 and n2, maybe calculate first (optional for now)
        operat = value;
      }
      // 2. If we are still typing the first number
      else if (operat.isEmpty) {
        if (value == Btn.dot && n1.contains(Btn.dot)) return;
        if (value == Btn.dot && (n1.isEmpty || n1 == Btn.n0)) {
          n1 = "0.";
        } else {
          n1 += value;
        }
      }
      // 3. If we are typing the second number
      else {
        if (value == Btn.dot && n2.contains(Btn.dot)) return;
        if (value == Btn.dot && (n2.isEmpty || n2 == Btn.n0)) {
          n2 = "0.";
        } else {
          n2 += value;
        }
      }
    });
  }

  //function that assign color to button
  Color getBtnColor(value) {
    return [Btn.del, Btn.clr].contains(value)
        ? Colors.blueGrey
        : [
            Btn.per,
            Btn.multiply,
            Btn.add,
            Btn.subtract,
            Btn.subtract,
            Btn.calculate,
          ].contains(value)
        ? Colors.orange
        : Colors.black87;
  }
}
