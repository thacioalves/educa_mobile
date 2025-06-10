import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortalAlunoApp());
}

class PortalAlunoApp extends StatelessWidget {
  const PortalAlunoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal do Aluno - Login',
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  bool _tutorialsExpanded = false;

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      // Simula envio e bloqueia botão (Recaptcha pode ser implementado aqui)
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enviando...')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text('Acesse utilizando seu e-mail institucional:'),
                  const SizedBox(height: 24),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'E-mail (@unitins.br)',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(
                                  r'^[\w.]+@unitins\.br$',
                                ).hasMatch(value)) {
                              return 'Use um e-mail @unitins.br válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _senhaController,
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          maxLength: 50,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Digite sua senha';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _onSubmit,
                          child: const Text('Entrar'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _tutorialsExpanded = !_tutorialsExpanded;
                      });
                    },
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
    );
  }

  Widget _buildLinkTile(String title, String url) {
    return ListTile(
      title: Text(title),
      leading: const Icon(Icons.link),
      onTap: () => _launchURL(url),
    );
  }
}
