import 'package:contata_aqui/core/app_providers.dart';
import 'package:contata_aqui/src/features/userprofile/data/professional_model.dart';
import 'package:contata_aqui/src/features/userprofile/data/professional_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contata_aqui/src/features/auth/data/auth_provider.dart';

class EditProfessionalScreen extends ConsumerStatefulWidget {
  const EditProfessionalScreen({super.key});

  @override
  ConsumerState<EditProfessionalScreen> createState() =>
      _EditProfessionalScreenState();
}

class _EditProfessionalScreenState
    extends ConsumerState<EditProfessionalScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameCtrl;
  late TextEditingController phoneCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController descriptionCtrl;
  late TextEditingController cepCtrl;
  late TextEditingController addressCtrl;
  late TextEditingController cityCtrl;
  late TextEditingController scheduleCtrl;

  bool _loading = false;
  ProfessionalModel? _model;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    descriptionCtrl = TextEditingController();
    cepCtrl = TextEditingController();
    addressCtrl = TextEditingController();
    cityCtrl = TextEditingController();
    scheduleCtrl = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
  }

  Future<void> _load() async {
    final uid = ref.read(authUserIdProvider);
    if (uid == null) return;

    final profile = await ref.read(professionalByIdProvider(uid).future);

    setState(() {
      _model = profile;
      nameCtrl.text = profile.name;
      phoneCtrl.text = profile.phone ?? '';
      emailCtrl.text = profile.email;
      descriptionCtrl.text = profile.description ?? '';
      cepCtrl.text = profile.cep ?? '';
      addressCtrl.text = profile.address ?? '';
      cityCtrl.text = profile.city_state ?? '';
      scheduleCtrl.text = profile.schedule ?? '';
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    final uid = ref.read(authUserIdProvider);
    if (uid == null) return;

    final supabase = ref.read(supabaseClientProvider);

    await supabase
        .from('professional')
        .update({
          'name': nameCtrl.text,
          'phone': phoneCtrl.text,
          'description': descriptionCtrl.text,
          'cep': cepCtrl.text,
          'address': addressCtrl.text,
          'city_state': cityCtrl.text,
          'schedule': scheduleCtrl.text,
        })
        .eq('id_professional', uid);

    setState(() => _loading = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Informações atualizadas com sucesso ✔")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Informações"),
        backgroundColor: Colors.orange,
      ),
      body:
          (_model == null)
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _field("Nome completo", nameCtrl),
                      _field("Telefone", phoneCtrl),
                      _field("Descrição", descriptionCtrl, maxLines: 3),
                      _field("CEP", cepCtrl),
                      _field("Endereço", addressCtrl),
                      _field("Cidade/UF", cityCtrl),
                      _field("Agenda / Horário de atendimento", scheduleCtrl),

                      const SizedBox(height: 32),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: _loading ? null : _save,
                        child: Text(
                          _loading ? "Salvando..." : "Salvar alterações",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  Widget _field(String label, TextEditingController ctrl, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextFormField(
        controller: ctrl,
        maxLines: maxLines,
        validator: (v) => (v == null || v.isEmpty) ? "Campo obrigatório" : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
