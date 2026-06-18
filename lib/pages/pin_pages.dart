import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final _pinCtrl = TextEditingController();
  final String _correctPin = "1234"; // ganti PIN sesuai kebutuhan
  bool _isWrong = false;

  void _onUnlock() {
    if (_pinCtrl.text == _correctPin) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
        (route) => false,
      );
    } else {
      setState(() => _isWrong = true);
      _pinCtrl.clear();
    }
  }

  @override
  void dispose() {
    _pinCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Judul
              const Text(
                "Enter your PIN",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Subjudul
              const Text(
                "Please enter your pin that you have created",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),

              // Icon gembok merah
              const Icon(
                Icons.lock_outline,
                size: 60,
                color: Colors.red,
              ),
              const SizedBox(height: 24),

              // Input PIN
              TextField(
                controller: _pinCtrl,
                obscureText: true,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                textAlign: TextAlign.center,
                onChanged: (_) {
                  if (_isWrong) setState(() => _isWrong = false);
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: _isWrong ? Colors.red : Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: _isWrong ? Colors.red : Colors.blue,
                      width: 1.5,
                    ),
                  ),
                  errorText: _isWrong ? "PIN salah, coba lagi" : null,
                ),
              ),
              const SizedBox(height: 20),

              // Tombol unlock biru
              SizedBox(
                width: 120,
                height: 48,
                child: ElevatedButton(
                  onPressed: _onUnlock,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Icon(Icons.lock_open, size: 26),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
