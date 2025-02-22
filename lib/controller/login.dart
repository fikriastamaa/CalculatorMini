class Login {
  bool validateCredentials(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      return false;
    }
    return username == 'admin' && password == 'admin';
  }
}
