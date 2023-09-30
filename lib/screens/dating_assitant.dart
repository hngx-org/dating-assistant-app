import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons/utils/colors.dart';

class DatingAssistantHome extends StatelessWidget {
  const DatingAssistantHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ProjectColors.white,
          title: ListTile(
            leading: Image.asset(
              'assets/logo.png',
              width: 50,
            ),
            title: const Text('Ai Assistant'),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Welcome to your Ai \n dating assistant',
              style: GoogleFonts.montserrat(
                  color: ProjectColors.pink,
                  fontSize: 32,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: ProjectColors.pink),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.speaker,
                  color: ProjectColors.black,
                ),
                title: Text('Generate quick conversation starters',
                    style: GoogleFonts.montserrat(
                        color: ProjectColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: ProjectColors.pink),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.message,
                  color: ProjectColors.black,
                ),
                title: Text('Craft engaging messages',
                    style: GoogleFonts.montserrat(
                        color: ProjectColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: ProjectColors.pink),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.gesture,
                  color: ProjectColors.black,
                ),
                title: Text('Get Dating advice',
                    style: GoogleFonts.montserrat(
                        color: ProjectColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            // FloatingActionButton(
              
            //   backgroundColor: ProjectColors.pink,
            //   onPressed: () {},
            //   child: const Icon(
            //     Icons.chat,
            //     color: ProjectColors.white,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
