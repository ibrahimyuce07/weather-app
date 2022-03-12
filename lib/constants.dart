import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kTempTextStyle = GoogleFonts.ubuntu(
  fontSize: 200.0,
  letterSpacing: -10.0,
  shadows: [
    const Shadow(
      blurRadius: 10.0,
      color: Colors.white,
      offset: Offset(1.0, 1.0),
    ),
  ],
);

 TextStyle kMessageTextStyle = GoogleFonts.ubuntu(
  fontSize: 76.0,
  fontWeight: FontWeight.w800,
);

TextStyle kButtonTextStyle = GoogleFonts.ubuntu(
  fontSize: 30.0,
  color: Colors.white,
);

TextStyle kConditionTextStyle = GoogleFonts.ubuntu(
  fontSize: 100.0,
  color: Colors.white54,
);

var weatherAPIKey = '0dbe473c791a0c746126b9e0d872057e';

