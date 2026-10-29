import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TODO 1: Deklarasikan variabel
  final TextEditingController _usernameController =
  TextEditingController();

  final TextEditingController _passwordController =
  TextEditingController();

  String _errorText = '';
  bool _obscurePassword = true;

  void _signIn() {
    final name = _usernameController.text.trim();
    if (name.isEmpty)
      return;
    context.read<AuthProvider>().signIn(name);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2: Pasang AppBar
      appBar: AppBar(
        title: const Text('Sign In'),
      ),

      // TODO 3: Pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                // TODO 4: Atur alignment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TODO 5: TextFormField nama pengguna
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Nama Pengguna',
                      errorText:
                      _errorText.isNotEmpty ? _errorText : null,
                      border: const OutlineInputBorder(),
                    ),
                  ),

                  // TODO 6: TextFormField kata sandi
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),

                  // TODO 7: Tombol Sign In
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: _signIn,
                    child: const Text('Sign In'),
                  ),

                  // TODO 8: Tombol Sign Up
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman Sign Up
                    },
                    child: const Text(
                      'Belum punya akun? Daftar di sini.',
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