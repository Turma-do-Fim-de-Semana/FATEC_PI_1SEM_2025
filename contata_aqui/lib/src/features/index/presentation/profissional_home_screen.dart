// lib/src/features/index/presentation/profissional_home_screen.dart
import 'package:contata_aqui/src/features/index/data/client_viewmodel.dart';
import 'package:contata_aqui/src/features/index/presentation/edit_professional_screen.dart';
import 'package:contata_aqui/src/features/userprofile/data/professional_model.dart';
import 'package:contata_aqui/src/features/userprofile/data/professional_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contata_aqui/src/features/auth/data/auth_provider.dart';

class ProfissionalHomeScreen extends ConsumerWidget {
  const ProfissionalHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(authUserIdProvider);

    if (uid == null) {
      return const Center(child: Text("Usuário não autenticado"));
    }

    final profissionalData = ref.watch(professionalByIdProvider(uid));

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Meu Perfil", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: profissionalData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Erro ao carregar perfil: $e")),
        data: (prof) => _profileBody(context, prof),
      ),
    );
  }

  Widget _profileBody(BuildContext context, ProfessionalModel prof) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header laranja com foto
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Foto de perfil
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.orange[300],
                    backgroundImage:
                        (prof.image != null && prof.image!.isNotEmpty)
                            ? NetworkImage(prof.image!)
                            : null,
                    child:
                        (prof.image == null || prof.image!.isEmpty)
                            ? const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            )
                            : null,
                  ),
                ),
                const SizedBox(height: 16),
                // Nome
                Text(
                  prof.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),

          // Conteúdo com cards
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Card de informações
                _buildInfoCard([
                  _infoRow(Icons.email_outlined, "E-mail", prof.email),
                  _infoRow(Icons.phone_outlined, "Telefone", prof.phone),
                  _infoRow(
                    Icons.description_outlined,
                    "Descrição",
                    prof.description,
                  ),
                ]),

                const SizedBox(height: 16),

                // Card de localização
                _buildInfoCard([
                  _infoRow(
                    Icons.location_on_outlined,
                    "Endereço",
                    prof.address,
                  ),
                  _infoRow(Icons.markunread_mailbox_outlined, "CEP", prof.cep),
                  _infoRow(
                    Icons.location_city_outlined,
                    "Cidade / UF",
                    prof.city_state,
                  ),
                ]),

                const SizedBox(height: 16),

                // Card de horário
                _buildInfoCard([
                  _infoRow(
                    Icons.access_time_outlined,
                    "Horário de atendimento",
                    prof.schedule,
                  ),
                ]),

                const SizedBox(height: 30),

                // Botão editar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EditProfessionalScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit, size: 20),
                    label: const Text(
                      "Editar informações",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () async {
                      final result = await becomeClient(prof.id_professional);

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            result
                                ? "Agora você também está cadastrado como cliente!"
                                : "Você já possui cadastro como cliente.",
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person_add, size: 20),
                    label: const Text(
                      "Quero ser cliente também",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: children),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.orange, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
