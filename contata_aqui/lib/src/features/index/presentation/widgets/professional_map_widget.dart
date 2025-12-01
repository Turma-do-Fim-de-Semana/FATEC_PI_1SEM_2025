import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfessionalMapWidget extends StatefulWidget {
  final String categoryId;

  const ProfessionalMapWidget({super.key, required this.categoryId});

  @override
  State<ProfessionalMapWidget> createState() => _ProfessionalMapWidgetState();
}

class _ProfessionalMapWidgetState extends State<ProfessionalMapWidget> {
  final supabase = Supabase.instance.client;
  Set<Marker> _marcadores = {};
  LatLng? _minhaPosicao;
  bool _carregando = true;

  @override
  void initState() {
    super.initState();
    _buscarDados();
  }

  Future<void> _buscarDados() async {
    // 1. Permissões de GPS
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      setState(() => _carregando = false);
      return;
    }

    try {
      // 2. Pega sua posição atual
      Position pos = await Geolocator.getCurrentPosition();

      if (!mounted) return;

      setState(() {
        _minhaPosicao = LatLng(pos.latitude, pos.longitude);
      });

      // 3. Busca no Supabase (Raio de 45km para o teste de Araras/Leme)
      final List<dynamic> data = await supabase.rpc(
        'buscar_profissionais_proximos',
        params: {
          'lat_usuario': pos.latitude,
          'long_usuario': pos.longitude,
          'raio_km': 45, // Mantido 45km para o teste
          'filtro_category_id': widget.categoryId,
        },
      );

      // ====================================================
      // 🔍 ÁREA DE DEBUG (O QUE VOCÊ VAI PROCURAR NO CONSOLE)
      // ====================================================
      print("\n\n🔵 ============ INÍCIO DO DEBUG DO MAPA ============");
      print("📍 Minha Localização (GPS): ${pos.latitude}, ${pos.longitude}");
      print("🔍 Categoria ID buscada: ${widget.categoryId}");
      print("📦 Quantidade encontrada no banco: ${data.length}");
      
      if (data.isNotEmpty) {
        print("✅ DADOS RETORNADOS (Primeiro item):");
        print("   Nome: ${data[0]['name']}");
        print("   Lat/Long: ${data[0]['latitude']} / ${data[0]['longitude']}");
      } else {
        print("❌ NENHUM DADO ENCONTRADO. Verifique:");
        print("   1. O ID da Categoria no banco é IGUAL a ${widget.categoryId}?");
        print("   2. As coordenadas estão com PONTO (ex: -22.18)?");
      }
      print("🔵 =================================================\n\n");
      // ====================================================

      Set<Marker> markers = {};

      // Marcador do Usuário (Azul)
      markers.add(Marker(
        markerId: const MarkerId('eu'),
        position: _minhaPosicao!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: const InfoWindow(title: 'Você está aqui'),
      ));

      // Marcadores dos Profissionais
      for (var item in data) {
        // Verifica se latitude e longitude existem e não são nulos
        if (item['latitude'] != null && item['longitude'] != null) {
          
          // Tenta converter de forma segura (funciona para número ou string numérica)
          final double lat = (item['latitude'] is String) 
              ? double.tryParse(item['latitude']) ?? 0.0 
              : (item['latitude'] as num).toDouble();
              
          final double long = (item['longitude'] is String) 
              ? double.tryParse(item['longitude']) ?? 0.0 
              : (item['longitude'] as num).toDouble();

          // Só adiciona se a conversão deu certo (diferente de 0.0 se não for no equador)
          if (lat != 0.0 && long != 0.0) {
            final String nome = item['name'] ?? 'Profissional';
            final String id = item['id'].toString();

            markers.add(Marker(
              markerId: MarkerId(id),
              position: LatLng(lat, long),
              icon: BitmapDescriptor.defaultMarker, // Vermelho
              infoWindow: InfoWindow(
                title: nome,
                snippet: 'Toque para ver',
              ),
              onTap: () {
                print("Clicou no pino de: $nome");
              },
            ));
          }
        }
      }

      setState(() {
        _marcadores = markers;
        _carregando = false;
      });
    } catch (e, stackTrace) {
      // Debug de Erro
      print("\n\n🔴 ERRO GRAVE NO MAPA:");
      print(e);
      print(stackTrace);
      print("\n\n");
      
      if (mounted) setState(() => _carregando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_carregando) return const Center(child: CircularProgressIndicator());

    if (_minhaPosicao == null) {
      return const Center(child: Text("Localização não encontrada."));
    }

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: _minhaPosicao!,
        zoom: 10,
      ),
      markers: _marcadores,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
    );
  }
}