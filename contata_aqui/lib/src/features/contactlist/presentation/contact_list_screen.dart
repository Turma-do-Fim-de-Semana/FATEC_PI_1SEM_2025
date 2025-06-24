import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contata_aqui/src/features/userprofile/data/professional_viewmodel.dart';

class ContactListScreen extends ConsumerWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? categoryId =
        ModalRoute.of(context)?.settings.arguments as String?;

    final professionals =
        categoryId != null
            ? ref.watch(professionalsByCategoryProvider(categoryId))
            : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryId != null ? 'Profissionais' : 'Lista de Contatos'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child:
            categoryId == null
                ? const Center(child: Text('Categoria não informada.'))
                : professionals!.when(
                  data: (list) {
                    if (list.isEmpty) {
                      return const Center(
                        child: Text('Nenhum profissional encontrado.'),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final pro = list[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading:
                                pro.image != null
                                    ? CircleAvatar(
                                      backgroundImage: NetworkImage(pro.image!),
                                    )
                                    : const CircleAvatar(
                                      backgroundColor: Colors.orange,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ),
                            title: Text(pro.name),
                            subtitle: Text(pro.city ?? 'Cidade não informada'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/user',
                                arguments: pro,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                  error:
                      (err, _) => Center(child: Text('Erro ao carregar: $err')),
                ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (int index) {
          // Navegação de abas, se quiser usar futuramente
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
