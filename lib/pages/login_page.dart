import 'package:flutter/material.dart';
import '../controller/login.dart';
import 'main_menu_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _login = Login();

  void _loginAction() {
    if (_login.validateCredentials(
        _usernameController.text, _passwordController.text)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainMenuPage()),
      );
    } else {
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Icon(Icons.error_outline, color: Color(0xFF9B4176)),
              SizedBox(width: 10),
              Text(
                'Login Gagal',
                style: TextStyle(
                  color: Color(0xFF9B4176),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            'Username atau Password salah. Silakan coba lagi.',
            style: TextStyle(color: Colors.black54),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF5A1E6F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                shadowColor: Colors.black54,
              ),
              child: Text('OK', style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [Color(0xFF9B4176), Color(0xFF5A1E6F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.4, 0.8],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                  ),
                  SizedBox(height: 16),
                  Card(
                    elevation: 12.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white.withOpacity(0.75),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Icon(
                              Icons.account_circle,
                              size: 100,
                              color: Color(0xFF9B4176),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9B4176),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Please sign in to continue',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 40),
                          TextField(
                            controller: _usernameController,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                              labelText: 'Username',
                              labelStyle: TextStyle(color: Color(0xFF9B4176)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Color(0xFF9B4176)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Color(0xFF9B4176)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Color(0xFF9B4176)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: _loginAction,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF5A1E6F),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 6,
                            ),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
