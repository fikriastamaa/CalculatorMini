import 'package:flutter/material.dart';
import 'data_kelompok_page.dart';
import 'calculation_page.dart';
import 'odd_even_page.dart';
import 'total_sum_page.dart';
import 'login_page.dart'; // Ensure LoginPage is imported

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Container
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/menu.png'),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                colors: [Color(0xFF9B4176), Color(0xFF5A1E6F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 180), // Add extra space to lower the section

                      // Title for Menu Section
                      Text(
                        "Menu Section",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 10),

                      // Grid of Menu Cards
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two cards per row
                          crossAxisSpacing: 16.0, // Space between columns
                          mainAxisSpacing: 16.0, // Space between rows
                          childAspectRatio: 1.0, // Ensure cards are square-shaped
                        ),
                        itemCount: 4, // Total number of menu cards
                        itemBuilder: (context, index) {
                          switch (index) {
                            case 0:
                              return _MenuCard(
                                title: 'Data Kelompok',
                                page: DataKelompokPage(),
                                icon: Icons.group_add,
                              );
                            case 1:
                              return _MenuCard(
                                title: 'Calculator',
                                page: CalculationPage(),
                                icon: Icons.calculate,
                              );
                            case 2:
                              return _MenuCard(
                                title: 'Ganjil / Genap',
                                page: OddEvenPage(),
                                icon: Icons.shuffle,
                              );
                            case 3:
                              return _MenuCard(
                                title: 'Jumlah Total',
                                page: TotalSumPage(),
                                icon: Icons.add,
                              );
                            default:
                              return SizedBox(); // Empty case, shouldn't happen
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Logout Button in the top-right corner
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(40.0), // Adjust the padding here
              child: IconButton(
                icon: Icon(Icons.exit_to_app, color: Colors.white), // Set the icon color to white
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String title;
  final Widget page;
  final IconData icon;

  const _MenuCard({
    required this.title,
    required this.page,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Card(
            elevation: 12.0, // Add a subtle shadow for a more refined look
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              height: 130,
              width: 130,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF9B4176), Color(0xFF5A1E6F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, size: 50, color: Colors.white), // Larger icon size for better visibility
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
