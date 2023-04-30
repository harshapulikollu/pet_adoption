import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

/// Widget to display Credits and source code links
class CreditsText extends StatelessWidget {
  const CreditsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: 'Developed by ', style: GoogleFonts.caveat(color: Colors.amberAccent)),
        TextSpan(
          text: 'Harsha Pulikollu. ',
          style: GoogleFonts.caveat(color: Colors.blue, fontSize: 20.0),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              _launchUrl('https://www.linkedin.com/in/harshapulikollu/');
            },
        ),
        TextSpan(
          text: '|| source code here.',
          style: GoogleFonts.caveat(color: Colors.green,fontSize: 18.0),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              _launchUrl('https://github.com/harshapulikollu/pet_adoption');
            },
        ),
      ]),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      debugPrint('cant launch url');
    }
  }
}
