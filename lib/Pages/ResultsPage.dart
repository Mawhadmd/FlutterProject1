import 'package:flutter/material.dart';

class Resultspage extends StatefulWidget {
  const Resultspage({super.key, required this.results, required this.passmin});
  final List<Map<String, TextEditingController>> results;
  final int passmin;

  @override
  State<Resultspage> createState() => _ResultspageState();
}

class _ResultspageState extends State<Resultspage> {
  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (var grade in widget.results) {
      final gradeValue = double.tryParse(grade['grade']?.text ?? '0') ?? 0;
      final weight = double.tryParse(grade['weight']?.text ?? '0') ?? 0;
      total += gradeValue * weight / 100;
    }

    final average = total;

    // Calculate grade ranges based on passmin
    final gradeletter =
        average >= (widget.passmin + 30)
            ? 'A'
            : average >= (widget.passmin + 20)
            ? 'B'
            : average >= (widget.passmin + 10)
            ? 'C'
            : average >= widget.passmin
            ? 'D'
            : 'F';

    final gradelettercolor =
        average >= widget.passmin ? Colors.green : Colors.red;
    final passfail = average >= widget.passmin ? 'Passed' : 'Failed';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results Page'),
        centerTitle: true,
        backgroundColor: average >= widget.passmin ? Colors.green : Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'Your Average is: ${average.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(55, 0, 0, 0),
                      blurRadius: 1,
                      offset: Offset(2, 1),
                    ),
                  ],
                ),
              ),
              Text(
                'You $passfail with a grade of $gradeletter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: gradelettercolor,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                average >= widget.passmin
                    ? 'assets/success.png'
                    : 'assets/fail.png',
          
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Go Back'))
            ],
          ),
        ),
      ),
    );
  }
}
