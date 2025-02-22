import 'package:flutter/material.dart';
import '../controller/total_sum.dart'; // Import kelas TotalSum

class TotalSumPage extends StatefulWidget {
  @override
  _TotalSumPageState createState() => _TotalSumPageState();
}

class _TotalSumPageState extends State<TotalSumPage> {
  final _numbersController = TextEditingController();
  String _result = '';
  final _totalSum = TotalSum(); // Instance dari kelas TotalSum

  // Fungsi untuk menghitung jumlah total angka
  void _calculateTotalSum() {
    final numbers = _numbersController.text
        .split(',')
        .map((e) => int.tryParse(e.trim()))
        .toList();

    if (numbers.contains(null)) {
      setState(() {
        _result = 'Input tidak valid, masukkan angka yang dipisahkan dengan koma';
      });
      return;
    }

    setState(() {
      _result = _totalSum.calculate(numbers.whereType<int>().toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Container
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
                // Logo di luar Card
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
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Jumlah Total Angka',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Divider(thickness: 2, color: Color(0xFF5A1E6F)),
                          SizedBox(height: 8),
                          TextField(
                            controller: _numbersController,
                            decoration: InputDecoration(
                              labelText: 'Masukkan Angka (pisahkan dengan koma)',
                              labelStyle: TextStyle(color: Color(0xFF9B4176)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Color(0xFF9B4176)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: _calculateTotalSum,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF5A1E6F),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text('Hitung'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _numbersController.clear();
                                  setState(() {
                                    _result = '';
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text('Reset'),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            _result,
                            style: TextStyle(fontSize: 20, color: Color(0xFF9B4176)),
                          ),
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
}
