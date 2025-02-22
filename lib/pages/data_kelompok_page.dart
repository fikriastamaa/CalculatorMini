import 'package:flutter/material.dart';
import 'main_menu_page.dart';

class DataKelompokPage extends StatelessWidget {
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
                              'Data Kelompok',
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
                          _buildMemberTile('Muhamad Rafif Rezha Firmansyah', '123220041'),
                          _buildMemberTile('Dhiya Aulya Achsa Fitrian', '123220055'),
                          _buildMemberTile('Tadeus Vito Gavra Sitanggang', '123220105'),
                          _buildMemberTile('Fikri Astama Putra', '123220108'),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Back Button
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenuPage()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberTile(String name, String id) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.person, color: Color(0xFF5A1E6F), size: 24),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              '$name ($id)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
