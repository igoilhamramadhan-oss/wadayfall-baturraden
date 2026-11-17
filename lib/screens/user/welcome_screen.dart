import 'package:curug/screens/user/login_screen.dart';
import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

// Pisahkan MaterialApp ke widget tersendiri agar lebih rapi
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Di sinilah tempat Google Fonts dipasang!
      // theme: ThemeData(
      // textTheme: GoogleFonts.afacadTextTheme(),
      // ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
          Container(
            color: const Color(0xFF31582B),
            height: double.infinity,
            width: double.infinity,
          ),

          // Overlay gelap
          Container(
            // color: Colors.black.withOpacity(0.54), // Transparan
            height: double.infinity,
            width: double.infinity,
          ),

          // Teks, Logo, dan Tombol
          Positioned(
            top: MediaQuery.of(context).size.height * 0.13,
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
                    height: 180,
                    width: 180,
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
                  const SizedBox(height: 30),

                  // Judul Wadayfall
                  const Text(
                    'WADAYFALL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),

                  // Judul Baturraden
                  const Text(
                    'BATURRADEN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 30), //jarak ke deskripsi
                  // Teks deskripsi
                  const Text(
                    'Alam memanggil,\nWadayfall menemani!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400, // Regular lebih baik untuk deskripsi
                      fontSize: 20,
                      color: Colors.white70,
                      height: 1.5, // ngatur jarak per baris
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tombol dan tautan
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Tombol Masuk
                SizedBox(
                  // Mengganti Container dengan SizedBox (praktik terbaik)
                  width: 310,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: const Color(0xFF31582B),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Teks buat akun
                SizedBox(
                  // Mengganti Container dengan SizedBox (praktik terbaik)
                  width: 310,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: const Color(0xFF31582B),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Buat Akun',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // GestureDetector(
                //   onTap: () {
                //     // Tindakan saat teks ditekan
                //   },

                //   child: const Text(
                //     'Buat Akun',
                //     style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //       color: Colors.white70,
                //       decoration: TextDecoration.underline,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
