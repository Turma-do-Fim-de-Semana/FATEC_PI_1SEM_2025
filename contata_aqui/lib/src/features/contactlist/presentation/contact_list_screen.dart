import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contata_aqui/src/features/userprofile/data/professional_viewmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

                        // constrói a imagem a partir do bucket
                        String? imageUrl;

                        if (pro.image != null && pro.image!.isNotEmpty) {
                          if (pro.image!.startsWith('http')) {
                            // já é uma URL completa
                            imageUrl = pro.image!;
                          } else {
                            // gera URL a partir do bucket
                            imageUrl = Supabase.instance.client.storage
                                .from('professionals')
                                .getPublicUrl(pro.image!);
                          }
                        }

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading:
                                imageUrl != null
                                    ? CircleAvatar(
                                      backgroundImage: NetworkImage(imageUrl),
                                    )
                                    : const CircleAvatar(
                                      backgroundColor: Colors.orange,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ),
                            title: Text(pro.name),
                            subtitle: Text(
                              pro.city_state?.isNotEmpty == true
                                  ? pro.city_state!
                                  : 'Cidade não informada',
                            ),
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
    );
  }
}
