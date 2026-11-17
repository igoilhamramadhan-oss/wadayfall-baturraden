import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  // 1. Controller untuk menangkap input kata sandi
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // 2. Bersihkan controller dari memori saat halaman ditutup
  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF31582B), // Warna background hijau gelap
      body: SafeArea(
        child: SingleChildScrollView( // Mencegah error overflow saat keyboard muncul
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              
              // Logo
              Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.jpeg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 50),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Judul Aplikasi
              const Text(
                'WADAYFALL\nBATURRADEN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Colors.white,
                  letterSpacing: 2,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Garis Pemisah (Divider)
              const Divider(color: Colors.white54, thickness: 1),
              const SizedBox(height: 20),

              // Sub-judul BUAT KATA SANDI BARU
              const Text(
                'BUAT KATA SANDI BARU',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16, // Disesuaikan agar tidak terlalu besar
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 30),

              // Input: Masukkan Kata Sandi Baru
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Masukkan Kata Sandi Baru',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _newPasswordController,
                obscureText: true, // Menyembunyikan teks (titik-titik)
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
              ),
              const SizedBox(height: 20),

              // Input: Konfirmasi Kata Sandi Baru
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Konfirmasi Kata Sandi Baru',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true, // Menyembunyikan teks (titik-titik)
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
              ),
              const SizedBox(height: 40),

              // Tombol Konfirmasi
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Validasi sederhana: pastikan sandi sama
                    if (_newPasswordController.text == _confirmPasswordController.text) {
                      print("Sandi berhasil dibuat!");
                      // Tambahkan navigasi kembali ke halaman Login di sini
                    } else {
                      print("Sandi tidak cocok!");
                      // Tampilkan notifikasi error (opsional)
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCEEEBD), // Hijau muda
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Konfirmasi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}