import 'package:flutter/material.dart';
import '../controller/calculator.dart';

class CalculationPage extends StatefulWidget {
  @override
  _CalculationPageState createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  final _num1Controller = TextEditingController();
  final _num2Controller = TextEditingController();
  String _result = '';
  final _calculator = Calculator();

  void _calculate(String operation) {
    final num1 = int.tryParse(_num1Controller.text);
    final num2 = int.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        _result = 'Input tidak valid, masukkan angka saja';
      });
      return;
    }

    setState(() {
      if (operation == 'add') {
        _result = _calculator.add(num1, num2);
      } else if (operation == 'subtract') {
        _result = _calculator.subtract(num1, num2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                colors: [Color(0xFF9B4176), Color(0xFF5A1E6F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 12.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Kalkulator Sederhana',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Divider(thickness: 2, color: Color(0xFF5A1E6F)),
                          SizedBox(height: 8),
                          _buildTextField(_num1Controller, 'Angka 1'),
                          SizedBox(height: 16),
                          _buildTextField(_num2Controller, 'Angka 2'),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildCalcButton('Tambah', 'add'),
                              _buildCalcButton('Kurang', 'subtract'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            _result,
                            style: TextStyle(fontSize: 20, color: Color(0xFF9B4176)),
                          ),
                          SizedBox(height: 20),
                          _buildResetButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Color(0xFF9B4176)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Color(0xFF9B4176)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildCalcButton(String text, String operation) {
    return ElevatedButton(
      onPressed: () => _calculate(operation),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF5A1E6F),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildResetButton() {
    return ElevatedButton(
      onPressed: () {
        _num1Controller.clear();
        _num2Controller.clear();
        setState(() {
          _result = '';
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Reset',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
