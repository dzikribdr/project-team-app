import 'package:flutter/material.dart';

class DetailVibraScreen extends StatelessWidget {
  const DetailVibraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const mainPink = Color.fromARGB(255, 250, 184, 179);
    const textPink = Color.fromARGB(255, 228, 173, 191);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 184, 239),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // FOTO
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  color: mainPink,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/vibra.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // CARD PROFILE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Card(
                  elevation: 5,
                  shadowColor: mainPink.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    child: Column(
                      children: const [
                        Text(
                          'hawooo gaisss >_<',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: textPink,
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(
                          color: mainPink,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Vibra Ayu Karisma\n1123150115',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: mainPink,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Mahasiswa semester 5\nJurusan Software Engineering',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: mainPink),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // TOMBOL BACK
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainPink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
