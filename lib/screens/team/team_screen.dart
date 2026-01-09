import 'package:flutter/material.dart';
import 'package:project_jasun/core/constants.dart';

// import semua detail screen
import 'detail_beryl_screen.dart';
import 'detail_dandi_screen.dart';
import 'detail_dzikri_screen.dart';
import 'detail_evan_screen.dart';
import 'detail_vibra_screen.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final members = [
      'Beryl Rafly Agatha',
      'Dandi Taufiqurrahman',
      'Dzikri Abdurrahman Haris',
      'Evan Alfeus Hendrik',
      'Vibra Ayu Kharisma',
    ];

    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      appBar: AppBar(
        title: const Text("Data Kelompok"),
        backgroundColor: AppConstants.primaryColor,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: members.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppConstants.cardBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                members[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white54,
              ),
              onTap: () {
                switch (members[index]) {
                  case 'Beryl Rafly Agatha':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DetailBerylScreen(),
                      ),
                    );
                    break;
                  case 'Dandi Taufiqurrahman':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DetailDandiScreen(),
                      ),
                    );
                    break;
                  case 'Dzikri Abdurrahman Haris':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DetailDzikriScreen(),
                      ),
                    );
                    break;
                  //case 'Evan Alfeus Hendrik':
                  //  Navigator.push(context,
                  //      MaterialPageRoute(builder: (_) => const DetailEvanScreen()));
                  //  break;
                  //case 'Vibra Ayu Kharisma':
                  //  Navigator.push(context,
                  //      MaterialPageRoute(builder: (_) => const DetailVibraScreen()));
                  //  break;
                }
              },
            ),
          );
        },
      ),
    );
  }
}
