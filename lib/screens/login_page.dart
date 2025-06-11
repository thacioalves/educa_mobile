import 'package:flutter/material.dart';

void main() {
  runApp(const PortalAlunoApp());
}

class PortalAlunoApp extends StatelessWidget {
  const PortalAlunoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal do Aluno - Login',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home_page': (context) => const HomePage(),
      },
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo com imagem
          Positioned.fill(
            child: Image.network(
              'https://www.plot.pt/wp-content/uploads/2020/07/imagemheader.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Sombra escura — sem IgnorePointer
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),

          // Conteúdo principal
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://www.unitins.br/uniPerfil/Logomarca/Imagem/09997c779523a61bd01bb69b0a789242',
                        height: 80,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Portal do Aluno',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text('Acesse utilizando seu e-mail institucional:'),
                      const SizedBox(height: 24),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'E-mail (@unitins.br)',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _senhaController,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        maxLength: 50,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home_page');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                        ),
                        child: const Text('Entrar'),
                      ),
                      const SizedBox(height: 24),
                      const Divider(),
                      const Text(
                        '2025 - Unitins - Todos os direitos reservados.',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Desenvolvido pela Diretoria de Tecnologia da Informação',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Tela Home (placeholder)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página Inicial')),
      body: const Center(child: Text('Bem-vindo ao Portal do Aluno!')),
    );
  }
}
