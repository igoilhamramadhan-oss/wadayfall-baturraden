import 'package:curug/screens/user/sandi_baru.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LupaSandi extends StatefulWidget {
  const LupaSandi({Key? key}) : super(key: key);

  @override
  _LupaSandiState createState() => _LupaSandiState();
}

class _LupaSandiState extends State<LupaSandi> {
  // Bikin kontroler untuk mendapatkan inputan
  final TextEditingController _akunController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _akunController.dispose();
    super.dispose();
  }

  // harus hapus kontroler dari memori saat halaman ditutup
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
                height: 200,
                width: 200,
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
              const SizedBox(height: 5),

              // Judul
              const Text(
                'WADAYFALL\nBATURRADEN',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: Colors.white,
                  letterSpacing: 2,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Garis Pemisah
              const Divider(color: Colors.white, thickness: 1),
              const SizedBox(height: 20),

              // Subjudul
              const Text(
                'LUPA SANDI',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 20),

              // Masukkan Akun
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: const Text(
                    'Masukkan Akun',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: 275,
                height: 51,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Akun',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
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
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 275,
                height: 43,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCEEEBD),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    'Kirim',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Garis
              const Divider(color: Colors.white, thickness: 1),
              const SizedBox(height: 30),

              // Masukkan kode verifikasi (OTP)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: const Text(
                    'Masukkan Kode Verifikasi',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Kotak Kode OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        counterText:
                            "", //menghilangkan text penghitung karakter
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        // otomatis pindah ke kotak selanjutnya jika sudah diisi
                        if (value.isNotEmpty) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),

              // teks kirim ulang kode
              RichText(
                text: TextSpan(
                  text: 'Jika tidak mendapatkan kode! ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Kirim Ulang',
                      style: TextStyle(
                        color: const Color(0xFFFD0303),
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Tombol periksa
              SizedBox(
                width: 275,
                height: 43,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SandiBaru(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFCEEEBD),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(40),
                    ),
                  ),
                  child: Text(
                    'Periksa',
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
