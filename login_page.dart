import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _modoRegistro = false;
  bool _cargando = false;
  bool _mostrarPassword = false;

  Future<void> _autenticar() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _mensaje('Completa todos los campos.');
      return;
    }

    if (password.length < 6) {
      _mensaje('La contraseña debe tener mínimo 6 caracteres.');
      return;
    }

    setState(() {
      _cargando = true;
    });

    try {
      if (_modoRegistro) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        _mensaje('Cuenta creada correctamente 🎉');
      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
    } on FirebaseAuthException catch (e) {
      String mensaje;

      switch (e.code) {
        case 'email-already-in-use':
          mensaje = 'Este correo ya tiene una cuenta.';
          break;
        case 'invalid-email':
          mensaje = 'El correo no es válido.';
          break;
        case 'weak-password':
          mensaje = 'La contraseña es demasiado débil.';
          break;
        case 'user-not-found':
          mensaje = 'No existe una cuenta con este correo.';
          break;
        case 'wrong-password':
        case 'invalid-credential':
          mensaje = 'Correo o contraseña incorrectos.';
          break;
        case 'too-many-requests':
          mensaje = 'Demasiados intentos. Intenta nuevamente más tarde.';
          break;
        default:
          mensaje = 'Ocurrió un error. Intenta nuevamente.';
      }

      _mensaje(mensaje);
    } catch (e) {
      _mensaje('Ocurrió un error inesperado.');
    } finally {
      if (mounted) {
        setState(() {
          _cargando = false;
        });
      }
    }
  }

  void _mensaje(String mensaje) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Column(
                children: [
                  const Text(
                    '💰',
                    style: TextStyle(fontSize: 64),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Hábitos de Riqueza',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    _modoRegistro
                        ? 'Crea tu cuenta y comienza tu camino.'
                        : 'Construye tu riqueza, un hábito a la vez.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 35),

                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      labelStyle: const TextStyle(color: Colors.white70),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.cyan,
                      ),
                      filled: true,
                      fillColor: const Color(0xFF151B32),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: _passwordController,
                    obscureText: !_mostrarPassword,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: const TextStyle(color: Colors.white70),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.cyan,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _mostrarPassword = !_mostrarPassword;
                          });
                        },
                        icon: Icon(
                          _mostrarPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white70,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF151B32),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _cargando ? null : _autenticar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: _cargando
                          ? const SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                              ),
                            )
                          : Text(
                              _modoRegistro
                                  ? 'Crear mi cuenta'
                                  : 'Iniciar sesión',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  TextButton(
                    onPressed: _cargando
                        ? null
                        : () {
                            setState(() {
                              _modoRegistro = !_modoRegistro;
                            });
                          },
                    child: Text(
                      _modoRegistro
                          ? '¿Ya tienes una cuenta? Inicia sesión'
                          : '¿No tienes cuenta? Crear una',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 15,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Tus datos financieros serán asociados a tu cuenta.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 13,
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
