import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:contata_aqui/src/features/index/data/category_viewmodel.dart';

class IndexScreen extends ConsumerStatefulWidget {
  const IndexScreen({super.key});

  @override
  ConsumerState<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends ConsumerState<IndexScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';

  final Map<String, Map<String, dynamic>> categoryStyles = {
    'Barbeiro': {
      'color': Colors.blueAccent,
      'icon': 'lib/assets/image/barber.svg',
    },
    'Cabelereira': {
      'color': Colors.redAccent,
      'icon': 'lib/assets/image/cabelereira.svg',
    },
    'Manicure e Pedicure': {
      'color': Colors.orangeAccent,
      'icon': 'lib/assets/image/unhas.svg',
    },
    'Jardineiro': {
      'color': Colors.greenAccent,
      'icon': 'lib/assets/image/jardineiro.svg',
    },
    'Eletricista': {
      'color': Colors.greenAccent,
      'icon': 'lib/assets/image/eletricista.svg',
    },
    'Engenheiro': {
      'color': Colors.amberAccent,
      'icon': 'lib/assets/image/engenheiro.svg',
    },
    'Pedreiro': {
      'color': Colors.tealAccent,
      'icon': 'lib/assets/image/pedreiro.svg',
    },
    'Pintor': {
      'color': Colors.grey,
      'icon': 'lib/assets/image/pintor.svg',
    },
    'Arquiteto': {
      'color': Colors.amberAccent,
      'icon': 'lib/assets/image/arquiteto.svg',
    },
    'Advogado': {
      'color': Colors.blueAccent,
      'icon': 'lib/assets/image/advogado.svg',
    },
  };

  @override
  Widget build(BuildContext context) {
    final categoryAsync = ref.watch(categoriesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            // 🔍 BARRA DE PESQUISA
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

            // 🟦 LISTA DE CATEGORIAS
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: categoryAsync.when(
                  data: (categories) {
                    final filtered = categories
                        .where((cat) =>
                            cat.description.toLowerCase().contains(searchText))
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
                        final style = categoryStyles[category.description] ??
                            {
                              'color': Colors.grey,
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
                                    color: Colors.black87,
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
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, _) =>
                      Center(child: Text('Erro ao carregar categorias: $err')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
