// import 'package:curug/user/lupa_sandi.dart';
import 'package:curug/ui/user/lupa_sandi.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Buat sembunyikan atau tampilkan password
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFF31582B),
      body: SafeArea(
        child: SingleChildScrollView(
          // biar ga error overflow saat keyboard muncul
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              // Logo
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Container(
                        height: 250,
                        width: 250,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // color: Colors.white,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/logo_curug.png',
                            fit: BoxFit.contain,
                            // Menambahkan errorBuilder untuk jaga-jaga jika gambar gagal dimuat
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),

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
              const SizedBox(height: 50),

              // Input Filed Akun
              SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Akun',
                    hintStyle: const TextStyle(color: Colors.black87),
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
              const SizedBox(height: 40),

              // Input Field Sandi
              SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Sandi',
                    hintStyle: const TextStyle(color: Colors.black87),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),

                    // Ikon mata untuk password
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black87,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure; //ubah state saat di klik
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Lupa sandi?
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => LupaSandi(),
                        ),
                      );
                    },
                    child: const Text(
                      'Lupa Sandi?',
                      style: TextStyle(
                        color: Color(0xFF00EAFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Tombol Masuk
              SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // link
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCEEEBD),
                    foregroundColor: const Color(0xFF31582B),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Login gug;l
              SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFFFFF),
                    foregroundColor: const Color(0xFF31582B),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google_icon.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Masuk dengan akun google',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
