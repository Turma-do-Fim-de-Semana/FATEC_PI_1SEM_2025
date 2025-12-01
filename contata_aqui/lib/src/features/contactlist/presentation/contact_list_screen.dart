import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:geolocator/geolocator.dart';

// Imports do seu projeto
import 'package:contata_aqui/src/features/index/presentation/widgets/professional_map_widget.dart';
import 'package:contata_aqui/src/features/userprofile/data/professional_model.dart';

class ContactListScreen extends ConsumerStatefulWidget {
  const ContactListScreen({super.key});

  @override
  ConsumerState<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends ConsumerState<ContactListScreen> {
  final supabase = Supabase.instance.client;

  // Estado local para a lista filtrada
  List<dynamic> _professionals = [];
  bool _isLoading = true;
  String? _erro;

  @override
  void initState() {
    super.initState();
    // Garante que a busca só acontece depois que a tela foi desenhada
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _buscarProfissionaisProximos();
    });
  }

  Future<void> _buscarProfissionaisProximos() async {
    final String? categoryId =
        ModalRoute.of(context)?.settings.arguments as String?;

    if (categoryId == null) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    try {
      // 1. Permissões de GPS
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        if (mounted) {
          setState(() {
            _erro =
                "Precisamos da localização para mostrar profissionais próximos.";
            _isLoading = false;
          });
        }
        return;
      }

      // 2. Pega Localização Atual
      Position pos = await Geolocator.getCurrentPosition();

      // 3. Chama a RPC no Supabase (Filtro de 20km)
      final List<dynamic> data = await supabase.rpc(
        'buscar_profissionais_proximos',
        params: {
          'lat_usuario': pos.latitude,
          'long_usuario': pos.longitude,
          'raio_km': 20, // <--- FILTRO DE 20KM AQUI
          'filtro_category_id': categoryId,
        },
      );

      // 4. Atualiza a tela com os dados encontrados
      if (mounted) {
        setState(() {
          _professionals = data;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Erro ao buscar lista: $e');
      if (mounted) {
        setState(() {
          _erro = "Erro ao carregar lista. Verifique sua conexão.";
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String? categoryId =
        ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            categoryId != null ? 'Profissionais (20km)' : 'Lista de Contatos'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: categoryId == null
            ? const Center(child: Text('Categoria não informada.'))
            : Column(
                children: [
                  // --- PARTE 1: O MAPA (Topo - 250px) ---
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ProfessionalMapWidget(categoryId: categoryId),
                  ),

                  // --- PARTE 2: A LISTA (Ocupa o resto da tela) ---
                  Expanded(
                    child: _buildListContent(),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildListContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_erro != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(_erro!, textAlign: TextAlign.center),
        ),
      );
    }

    if (_professionals.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Nenhum profissional encontrado num raio de 20km.'),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _professionals.length,
      itemBuilder: (context, index) {
        // Pega o dado cru (JSON) da lista
        final proJson = _professionals[index];

        // Mapeia os campos básicos para exibir no Card
        final String name = proJson['name'] ?? 'Sem nome';
        final String? cityState = proJson['city_state'];
        final String? imagePath = proJson['image'];

        // Lógica de URL da Imagem (Bucket Público ou Link Direto)
        String? imageUrl;
        if (imagePath != null && imagePath.isNotEmpty) {
          if (imagePath.startsWith('http')) {
            imageUrl = imagePath;
          } else {
            imageUrl = supabase.storage
                .from('professionals')
                .getPublicUrl(imagePath);
          }
        }

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          child: ListTile(
            leading: imageUrl != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    onBackgroundImageError: (_, __) {},
                  )
                : const CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
            title: Text(name),
            subtitle: Text(
              (cityState != null && cityState.isNotEmpty)
                  ? cityState
                  : 'Cidade não informada',
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // --- CORREÇÃO DO ERRO DE TYPE CAST ---
              try {
                // Converte o JSON em ProfessionalModel antes de navegar
                final professionalModel = ProfessionalModel.fromJson(proJson);

                Navigator.pushNamed(
                  context,
                  '/user',
                  arguments: professionalModel,
                );
              } catch (e) {
                debugPrint("Erro ao converter modelo: $e");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Erro ao abrir perfil do profissional'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}