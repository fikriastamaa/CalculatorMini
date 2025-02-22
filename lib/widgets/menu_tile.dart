import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final Widget page;
  final IconData icon;

  const MenuTile({required this.title, required this.page, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Icon(icon, color: Color(0xFF9B4176), size: 30), // Icon color to match theme
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        onTap: () {
          // Navigate to the page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
