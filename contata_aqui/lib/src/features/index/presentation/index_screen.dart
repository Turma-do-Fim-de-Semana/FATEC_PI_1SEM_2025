import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:contata_aqui/src/features/index/data/category_viewmodel.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class IndexScreen extends ConsumerStatefulWidget {
  const IndexScreen({super.key});

  @override
  ConsumerState<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends ConsumerState<IndexScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';

  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  Marker? _userMarker;

  final Map<String, Map<String, dynamic>> categoryStyles = {
    'Barbeiro': {
      'color': Colors.blue.shade100,
      'icon': 'lib/assets/image/barber.svg',
    },
    'Cabelereira': {
      'color': Colors.red.shade100,
      'icon': 'lib/assets/image/cabelereira.svg',
    },
    'Manicure e Pedicure': {
      'color': Colors.orange.shade100,
      'icon': 'lib/assets/image/unhas.svg',
    },
    'Jardineiro': {
      'color': Colors.green.shade100,
      'icon': 'lib/assets/image/jardineiro.svg',
    },
    'Eletricista': {
      'color': Colors.green.shade100,
      'icon': 'lib/assets/image/eletricista.svg',
    },
    'Engenheiro': {
      'color': Colors.amber.shade100,
      'icon': 'lib/assets/image/engenheiro.svg',
    },
    'Pedreiro': {
      'color': Colors.teal.shade100,
      'icon': 'lib/assets/image/pedreiro.svg',
    },
    'Pintor': {
      'color': Colors.grey.shade100,
      'icon': 'lib/assets/image/pintor.svg',
    },
    'Arquiteto': {
      'color': Colors.amber.shade100,
      'icon': 'lib/assets/image/arquiteto.svg',
    },
    'Advogado': {
      'color': Colors.blue.shade100,
      'icon': 'lib/assets/image/advogado.svg',
    },
  };

  Future<void> _getCurrentLocation() async {
    var status = await Permission.location.status;

    // Se ainda não foi concedida, mostra o aviso antes
    if (!status.isGranted) {
      bool? aceitou = await showDialog<bool>(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text("Permitir localização"),
              content: const Text(
                "Ative a localização para encontrar profissionais próximos de você.",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Agora não"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text("Permitir"),
                ),
              ],
            ),
      );

      if (aceitou != true) return; // Usuário recusou na explicação
    }

    // Agora pede a permissão real
    var result = await Permission.location.request();

    if (result.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      LatLng userLocation = LatLng(position.latitude, position.longitude);

      setState(() {
        _currentPosition = userLocation;
        _userMarker = Marker(
          markerId: const MarkerId('user'),
          position: userLocation,
          infoWindow: const InfoWindow(title: 'Você está aqui'),
        );
      });

      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(userLocation, 15),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permissão de localização negada')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Busca a localização assim que o widget inicia
  }

  @override
  Widget build(BuildContext context) {
    final categoryAsync = ref.watch(categoriesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Barra de pesquisa
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          searchText = value.toLowerCase();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Qual serviço você procura?',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Mapa real com botão de localização
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child:
                          _currentPosition != null
                              ? GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: _currentPosition!,
                                  zoom: 15,
                                ),
                                onMapCreated: (controller) {
                                  _mapController = controller;
                                },
                                markers:
                                    _userMarker != null
                                        ? {_userMarker!}
                                        : <Marker>{},
                                myLocationButtonEnabled: false,
                              )
                              : const Center(
                                child: CircularProgressIndicator(),
                              ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: _getCurrentLocation,
                      icon: const Icon(Icons.location_on),
                      label: const Text("Mostrar localização"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Serviços',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Lista de categorias
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: categoryAsync.when(
                  data: (categories) {
                    final filtered =
                        categories
                            .where(
                              (cat) => cat.description.toLowerCase().contains(
                                searchText,
                              ),
                            )
                            .toList();

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 12,
                          ),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final category = filtered[index];
                        final style =
                            categoryStyles[category.description] ??
                            {
                              'color': Colors.grey[300],
                              'icon': 'lib/assets/image/default.svg',
                            };

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/contactlist',
                              arguments: category.id_category,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: style['color'],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  style['icon'],
                                  width: 90,
                                  height: 90,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  category.description,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 21, 21, 21),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                  error:
                      (err, _) => Center(
                        child: Text('Erro ao carregar categorias: $err'),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
