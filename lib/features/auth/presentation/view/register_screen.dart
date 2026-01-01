import 'package:flutter/material.dart';
import 'package:gamezone_flutter/app/di/di.dart';
import 'package:gamezone_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:gamezone_flutter/features/auth/domain/use_case/register_user_use_case.dart';
import 'package:gamezone_flutter/features/auth/presentation/view/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // 1. Define Controllers
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController =
      TextEditingController(); // Using Email as username or add a field
  final _passwordController = TextEditingController();
  final _cpasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _cpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),

              // Full Name (Example: splitting by space for fname/lname)
              TextField(
                controller: _emailController, // Link Controller
                decoration: InputDecoration(
                  labelText: "email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Phone Number
              TextField(
                controller: _phoneController, // Link Controller
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Username/Email
              TextField(
                controller: _usernameController, // Link Controller
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password
              TextField(
                controller: _passwordController, // Link Controller
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              //confirm password
              TextField(
                controller: _cpasswordController, // Link Controller
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Register Button
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // 2. Create the User Entity
                    final user = UserEntity(
                      fname: _emailController.text.trim(),
                      lname: "User", // Or add a separate lname controller
                      phone: _phoneController.text.trim(),
                      username: _usernameController.text.trim(),
                      password: _passwordController.text.trim(),
                    );

                    // 3. Get UseCase from Locator and Call it
                    final registerUseCase = locator<RegisterUseCase>();
                    final result = await registerUseCase.call(user);

                    // 4. Handle Result
                    result.fold(
                      (failure) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(failure.message),
                          backgroundColor: Colors.red,
                        ),
                      ),
                      (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Registration Successful!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
