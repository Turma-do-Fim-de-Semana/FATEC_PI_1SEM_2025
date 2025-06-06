import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Adicione esta importação

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  final List<Map<String, dynamic>> services = [
    {'name': 'Taxi', 'color': Colors.blue, 'icon': 'assets/image/taxi.svg'},
    {
      'name': 'Barbeiro',
      'color': Colors.red,
      'icon': 'assets/image/barber.svg',
    },
    {
      'name': 'Advogado',
      'color': Colors.orange,
      'icon': 'assets/image/advogado.svg',
    },
    {
      'name': 'Eletricista',
      'color': Colors.red[400],
      'icon': 'assets/image/eletricista.svg',
    },
    {
      'name': 'Jardineiro',
      'color': Colors.green,
      'icon': 'assets/image/jardineiro.svg',
    },
    {
      'name': 'Faxina',
      'color': Colors.yellow[700],
      'icon': 'assets/image/faxina.svg',
    },
    {
      'name': 'Motoboy',
      'color': Colors.amber,
      'icon': 'assets/image/motoboy.svg',
    },
    {
      'name': 'Engenheiro',
      'color': Colors.teal,
      'icon': 'assets/image/engenheiro.svg',
    },
    {'name': 'Pintor', 'color': Colors.grey, 'icon': 'assets/image/pintor.svg'},
    {
      'name': 'Arquiteto',
      'color': Colors.amber,
      'icon': 'assets/image/arquiteto.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Barra de pesquisa
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Qual serviço você procura?',
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),
            ),
            // Mapa placeholder
            Container(
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text('Mapa', style: TextStyle(color: Colors.grey[600])),
              ),
            ),
            SizedBox(height: 20),
            // Título Serviços
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Serviços',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Grid de serviços
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/contactlist',
                          arguments: service['name'],
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: service['color'],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Use SvgPicture.asset em vez de Text
                            SvgPicture.asset(
                              service['icon'],
                              width: 40,
                              height: 40,
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              service['name'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
