import 'package:contata_aqui/src/features/chat_room/data/chat_room_model.dart';
import 'package:contata_aqui/src/features/index/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:contata_aqui/src/features/userprofile/data/professional_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final professional =
        ModalRoute.of(context)!.settings.arguments as ProfessionalModel;

    // Construção correta da URL da imagem do bucket
    String? imageUrl;
    if (professional.image != null && professional.image!.isNotEmpty) {
      if (professional.image!.startsWith('http')) {
        // Já está como URL completa
        imageUrl = professional.image!;
      } else {
        // Gera URL a partir do bucket "professionals"
        imageUrl = Supabase.instance.client.storage
            .from('professionals')
            .getPublicUrl(professional.image!);
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FOTO DO PROFISSIONAL
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipOval(
                  child:
                      imageUrl != null
                          ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (_, __, ___) => Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.grey[600],
                                ),
                          )
                          : Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.grey[600],
                          ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // CARD DE INFORMAÇÕES
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nome e horário
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        professional.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        professional.schedule ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Descrição
                  Text(
                    professional.description ??
                        'Descrição não informada pelo profissional.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Cidade
                  if (professional.city_state != null &&
                      professional.city_state!.isNotEmpty)
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 4),
                        Text(professional.city_state!),
                      ],
                    ),
                  const SizedBox(height: 8),

                  // Email
                  Row(
                    children: [
                      const Icon(Icons.email, size: 16),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          professional.email,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final supabase = Supabase.instance.client;

                  final userId = supabase.auth.currentUser?.id;
                  if (userId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Erro: usuário não autenticado'),
                      ),
                    );
                    return;
                  }

                  final existing =
                      await supabase
                          .from('chat_room')
                          .select()
                          .eq('client_id', userId)
                          .eq('professional_id', professional.id_professional)
                          .maybeSingle();

                  dynamic room = existing;
                  room ??=
                      await supabase
                          .from('chat_room')
                          .insert({
                            'client_id': userId,
                            'professional_id': professional.id_professional,
                          })
                          .select()
                          .single();

                  // 3️⃣ Vai para a conversa
                  Navigator.pushNamed(
                    // ignore: use_build_context_synchronously
                    context,
                    '/chat_screen',
                    arguments: ChatRoomModel.fromJson(room),
                  );
                },
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.white,
                ),
                label: const Text(
                  'Iniciar conversa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 2),
    );
  }
}
