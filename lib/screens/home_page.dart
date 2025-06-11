import 'package:flutter/material.dart';

void main() {
  runApp(const PortalAlunoApp());
}

class PortalAlunoApp extends StatelessWidget {
  const PortalAlunoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal do Aluno',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PortalAlunoHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortalAlunoHome extends StatelessWidget {
  const PortalAlunoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,  // Só uma aba agora
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Portal do Aluno'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Meus Aplicativos'),
            ],
          ),
          actions: [
            CircleAvatar(backgroundImage: AssetImage('assets/user-image.jpg')),
            const SizedBox(width: 10),
            const Center(child: Text('Thacio')),
            const SizedBox(width: 10),
          ],
        ),
        body: const TabBarView(children: [AplicativosTab()]),  // só essa aba
      ),
    );
  }
}

class AplicativosTab extends StatelessWidget {
  const AplicativosTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      AppCard(
        title: 'BOLETIM(SEMESTRE ATUAL)',
        description: 'Desempenho nas disciplinas do semestre atual.',
        url:
            'https://www.unitins.br/PortalAluno/SecurityAccount/Redirecionar/VW5pdGlucy5NVkMuQmlibGlvdGVjYQ==',
      ),
      AppCard(
        title: 'GRADE CURRICULAR',
        description: 'Selecione um curso e veja as disciplinas distribuidas por período.',
        url:
            'https://www.unitins.br/PortalAluno/SecurityAccount/Redirecionar/dW5pdGlucy5CaWJsaW90ZWNhVmlydHVhbC5tdmM=',
      ),
      AppCard(
        title: 'REMATRÍCULA ONLINE',
        description: 'Fazer a rematrícula nos semestres anteriores.',
        url:
            'https://www.unitins.br/PortalAluno/SecurityAccount/Redirecionar/dW5pdGlucy5CaWJsaW90ZWNhVmlydHVhbC5tdmM=',
      ),
      AppCard(
        title: 'SITUAÇÃO ACADÊMICA',
        description: 'Veja a sua situação junto a secretária e demais departamentos da unitins.',
        url:
            'https://www.unitins.br/PortalAluno/SecurityAccount/Redirecionar/dW5pdGlucy5CaWJsaW90ZWNhVmlydHVhbC5tdmM=',
      ),
      AppCard(
        title: 'ANÁLISE CURRICULAR',
        description: 'Análise curricular completa.',
        url:
            'https://www.unitins.br/PortalAluno/SecurityAccount/Redirecionar/dW5pdGlucy5CaWJsaW90ZWNhVmlydHVhbC5tdmM=',
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: Wrap(spacing: 12, runSpacing: 12, children: cards),
    );
  }
}

class AppCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;

  const AppCard({
    super.key,
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(description),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Ação para abrir o link (use url_launcher)
                  },
                  child: const Text('Acessar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
