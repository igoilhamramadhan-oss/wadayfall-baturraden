import 'package:curug/screens/user/login_screen.dart';
import 'package:flutter/material.dart';

class SandiBaru extends StatefulWidget {
  const SandiBaru({Key? key}) : super(key: key);

  @override
  _SandiBaruState createState() => _SandiBaruState();
}

class _SandiBaruState extends State<SandiBaru> {
  // kontroler utk menangkap input kata sandi
  final TextEditingController _sandiBaruController = TextEditingController();
  final TextEditingController _konfirmasiSandiController =
      TextEditingController();

  bool _isSandiBaruVisible = false;
  bool _isKonfirmasiSandiVisible = false;

  // Berishkan kontroler dr memori saat halaman ditutup
  @override
  void dispose() {
    // TODO: implement dispose
    _sandiBaruController.dispose();
    _konfirmasiSandiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFF31582B),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Logo
              Container(
                height: 180,
                width: 180,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo_curug.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Judul
              const Text(
                'WADAYFALL\nBATURRADEN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: Colors.white,
                  letterSpacing: 2,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Divider
              const Divider(color: Colors.white, thickness: 1),
              const SizedBox(height: 20),

              // Subjudul
              const Text(
                'BUAT KATA SANDI BARU',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 30),

              // Input Kata Sandi Baru
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: const Text(
                    'Masukkan Kata Sandi Baru',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: 270,
                height: 50,
                child: TextField(
                  controller: _sandiBaruController,
                  obscureText: !_isSandiBaruVisible, // nilai dinamis berdasarkan state
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    // Menambahkan icon mata
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isSandiBaruVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isSandiBaruVisible = !_isSandiBaruVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Inpur Konfirmasi Kata Sandi Baru
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: const Text(
                    'Konfirmasi Kata Sandi Baru',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: 270,
                height: 50,
                child: TextField(
                  controller: _konfirmasiSandiController,
                  obscureText: !_isKonfirmasiSandiVisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    // Menambahkan ikon mata
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isKonfirmasiSandiVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isKonfirmasiSandiVisible = !_isKonfirmasiSandiVisible;
                        });
                      },
                    )
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Tombol Konfirmasi
              SizedBox(
                width: 270,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_sandiBaruController.text ==
                            _konfirmasiSandiController.text &&
                        _sandiBaruController.text.isNotEmpty) {
                      // Pop up Sukses
                      showDialog(
                        context: context,
                        barrierDismissible: false, // biar pop up ga ketutup pas di klik di luar kotak
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min, // membungkus konten agar tidak memenuhi layar
                                children: [
                                  // Ikon centang Hijau
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF90EE90),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // Teks Judul
                                  const Text(
                                    'Kata sandi berhasil diperbarui.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 12),

                                  // Teks Deskripsi
                                  const Text(
                                    'Silahkan masuk kembali dengan kata sandi baru anda.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  // Tombol Login
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen(),
                                          ),
                                          (Route<dynamic> route) => false,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFFCEEEBD,
                                        ),
                                        foregroundColor: Colors.black,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      // Aksi sandi jika tidak cocok atau kosong
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Kata sandi tidak cocok atau kosong!'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCEEEBD),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(40),
                    ),
                  ),
                  child: const Text(
                    'Konfirmasi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
