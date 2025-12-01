import 'package:flutter/material.dart';

class ChooseRoleScreen extends StatelessWidget {
  final String userId;

  const ChooseRoleScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1), // fundo suave
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Escolher tipo de acesso",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ícone topo
              const Icon(
                Icons.account_circle_rounded,
                size: 90,
                color: Colors.orange,
              ),
              const SizedBox(height: 20),

              const Text(
                "Como você deseja entrar?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 50),

              // BOTÃO CLIENTE
              _roleButton(
                context,
                label: "Entrar como Cliente",
                color: Colors.blue,
                icon: Icons.person_outline,
                route: "/index",
              ),

              const SizedBox(height: 20),

              // BOTÃO PROFISSIONAL
              _roleButton(
                context,
                label: "Entrar como Profissional",
                color: Colors.orange,
                icon: Icons.engineering_outlined,
                route: "/profissional_home",
              ),

              const SizedBox(height: 50),

              Text(
                "Você pode alternar entre Cliente e Profissional quando quiser.",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roleButton(
    BuildContext context, {
    required String label,
    required Color color,
    required IconData icon,
    required String route,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: () => Navigator.pushReplacementNamed(context, route),
        icon: Icon(icon, color: Colors.white, size: 24),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 6,
          // ignore: deprecated_member_use
          shadowColor: color.withOpacity(0.5),
        ),
      ),
    );
  }
}
