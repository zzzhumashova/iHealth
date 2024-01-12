import 'package:flutter/material.dart';
import 'package:ihealthapp/common_widgets/navigation.dart';
import 'package:ihealthapp/features/authentification/login.dart';

class SignUp extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 85),
              Image.asset(
                'assets/img/icon.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 48),
              _buildTextField(
                icon: Icons.person_2_outlined,
                label: 'Username',
                context: context,
                controller: usernameController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                icon: Icons.email_outlined,
                label: 'Email',
                context: context,
                controller: emailController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                icon: Icons.phone,
                label: 'Phone Number',
                context: context,
                controller: phoneNumberController,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                icon: Icons.lock_outline,
                label: 'Password',
                context: context,
                isPassword: true,
                controller: passwordController,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Пожалуйста, заполните все поля.'),
                        duration: Duration(
                            seconds: 3), 
                      ),
                    );
                  } else {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const NavigationPage()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xFFBBF2EF),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('LOG IN'),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) =>  LogIn()));
                },
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Уже есть аккаунт? '),
                      TextSpan(
                        text: 'Войти',
                        style: TextStyle(color: Color(0xFFBBF2EF)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String label,
    required BuildContext context,
    bool isPassword = false,
    required TextEditingController controller,
  }) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
        keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
        obscureText: isPassword,
      ),
    );
  }
}
