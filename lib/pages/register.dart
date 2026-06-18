import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_data.dart';
import 'home.dart';
import 'pin_pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nbiCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  final _instagramCtrl = TextEditingController();

  @override
  void dispose() {
    _namaCtrl.dispose();
    _nbiCtrl.dispose();
    _emailCtrl.dispose();
    _alamatCtrl.dispose();
    _instagramCtrl.dispose();
    super.dispose();
  }

  void _onDaftar() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Color(0xFF7BAE8E)),
              SizedBox(width: 8),
              Text("Konfirmasi"),
            ],
          ),
          content: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black87, fontSize: 14),
              children: [
                const TextSpan(text: "Apakah data berikut sudah benar?\n\n"),
                TextSpan(
                    text: "Nama       : ",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "${_namaCtrl.text}\n"),
                TextSpan(
                    text: "NBI        : ",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "${_nbiCtrl.text}\n"),
                TextSpan(
                    text: "Email      : ",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "${_emailCtrl.text}\n"),
                TextSpan(
                    text: "Alamat     : ",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "${_alamatCtrl.text}\n"),
                TextSpan(
                    text: "Instagram  : ",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "@${_instagramCtrl.text}"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Edit", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7BAE8E),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                final box = Hive.box<UserData>('pendaftaran');
                box.add(UserData(
                  nama: _namaCtrl.text,
                  nbi: _nbiCtrl.text,
                  email: _emailCtrl.text,
                  alamat: _alamatCtrl.text,
                  instagram: _instagramCtrl.text,
                ));

                Navigator.pop(ctx);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const PinPage()),
                  (route) => false,
                );
              },
              child: const Text("Ya, Daftar"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                // Icon / ilustrasi
                Image.asset(
                  'assets/images/d1.jpeg',
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.person_add,
                        size: 60, color: Colors.purple),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const Text(
                  "Praktikum PAB 2026",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 30),

                _buildField(
                  controller: _namaCtrl,
                  hint: "Masukan Nama",
                  icon: Icons.person_outline,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? "Nama tidak boleh kosong"
                      : null,
                ),
                _buildField(
                  controller: _nbiCtrl,
                  hint: "Masukan NBI",
                  icon: Icons.badge_outlined,
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty)
                      return "NBI tidak boleh kosong";
                    if (v.trim().length < 6) return "NBI minimal 6 digit";
                    return null;
                  },
                ),
                _buildField(
                  controller: _emailCtrl,
                  hint: "Masukan Email",
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty)
                      return "Email tidak boleh kosong";
                    if (!v.contains('@') || !v.contains('.'))
                      return "Format email tidak valid";
                    return null;
                  },
                ),
                _buildField(
                  controller: _alamatCtrl,
                  hint: "Masukan Alamat",
                  icon: Icons.location_on_outlined,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? "Alamat tidak boleh kosong"
                      : null,
                ),
                _buildField(
                  controller: _instagramCtrl,
                  hint: "Masukan Akun Instagram",
                  icon: Icons.alternate_email,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? "Instagram tidak boleh kosong"
                      : null,
                ),

                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _onDaftar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7BAE8E),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                    ),
                    child: const Text(
                      "Daftar",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          prefixIcon: Icon(icon, color: Colors.grey, size: 20),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF7BAE8E), width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
        ),
      ),
    );
  }
}
