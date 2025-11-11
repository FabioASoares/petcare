import 'package:flutter/material.dart';

class ColorsPC {
  static final amarelo = ColorsYellow();
  static final azul = ColorsBlue();
  static final cinza = ColorsGray();
  static final laranja = ColorsOrange();
  static final system = ColorsSystem();
  static final verde = ColorsGreen();
  static final vermelho = ColorsRed();
  static final turquesa = ColorsTurquesa();
}

class ColorsBlue {
  Color get x50 => const Color.fromARGB(255, 225, 235, 255);
  Color get x100 => const Color.fromARGB(255, 212, 228, 255);
  Color get x150 => const Color.fromARGB(255, 165, 216, 255);
  Color get x200 => const Color.fromARGB(255, 149, 202, 255);
  Color get x250 => const Color.fromARGB(255, 127, 191, 255);
  Color get x300 => const Color.fromRGBO(102, 170, 240, 1);
  Color get x350 => const Color.fromRGBO(51, 142, 235, 1);
  Color get x400 => const Color.fromRGBO(0, 114, 230, 1);
  Color get x450 => const Color.fromARGB(255, 1, 115, 229);
  Color get x500 => const Color.fromRGBO(0, 91, 184, 1);
  Color get x550 => const Color.fromARGB(255, 0, 100, 148);
  Color get x600 => const Color.fromARGB(255, 18, 76, 133);
  Color get x650 => const Color.fromARGB(255, 10, 66, 122);
  Color get x700 => const Color.fromRGBO(0, 46, 92, 1);
  Color get x750 => const Color.fromARGB(255, 19, 41, 61);
  Color get x800 => const Color.fromRGBO(0, 23, 46, 1);
}

class ColorsGray {
  Color get x50 => const Color.fromARGB(255, 235, 235, 235);
  Color get x100 => const Color.fromARGB(255, 224, 224, 224);
  Color get x150 => const Color.fromARGB(255, 210, 210, 210);
  Color get x200 => const Color.fromARGB(255, 194, 194, 194);
  Color get x250 => const Color.fromARGB(255, 173, 173, 173);
  Color get x300 => const Color.fromARGB(255, 164, 164, 164);
  Color get x350 => const Color.fromARGB(255, 165, 165, 165);
  Color get x400 => const Color.fromARGB(255, 140, 140, 140);
  Color get x450 => const Color.fromARGB(255, 125, 125, 125);
  Color get x500 => const Color.fromARGB(255, 110, 110, 110);
  Color get x550 => const Color.fromARGB(255, 95, 95, 95);
  Color get x600 => const Color.fromARGB(255, 80, 80, 80);
  Color get x650 => const Color.fromARGB(255, 65, 65, 65);
  Color get x700 => const Color.fromARGB(255, 50, 50, 50);
  Color get x750 => const Color.fromARGB(255, 35, 35, 35);
  Color get x800 => const Color.fromARGB(255, 20, 20, 20);
  Color get x850 => const Color.fromARGB(255, 5, 5, 5);
}

class ColorsGreen {
  Color get x50 => const Color.fromARGB(255, 232, 255, 232);
  Color get x100 => const Color.fromARGB(255, 210, 250, 210);
  Color get x150 => const Color.fromARGB(255, 180, 240, 180);
  Color get x200 => const Color.fromARGB(255, 150, 230, 150);
  Color get x250 => const Color.fromARGB(255, 120, 220, 120);
  Color get x300 => const Color.fromARGB(255, 100, 205, 100);
  Color get x350 => const Color.fromARGB(255, 80, 190, 80);
  Color get x400 => const Color.fromARGB(255, 70, 175, 70);
  Color get x450 => const Color.fromARGB(255, 60, 160, 60);
  Color get x500 => const Color.fromARGB(255, 50, 145, 50);
  Color get x550 => const Color.fromARGB(255, 40, 125, 40);
  Color get x600 => const Color.fromARGB(255, 30, 110, 30);
  Color get x650 => const Color.fromARGB(255, 25, 95, 25);
  Color get x700 => const Color.fromARGB(255, 20, 80, 20);
  Color get x750 => const Color.fromARGB(255, 15, 65, 15);
  Color get x800 => const Color.fromARGB(255, 10, 50, 10);
  Color get x850 => const Color.fromARGB(255, 5, 35, 5);
}

class ColorsOrange {
  Color get x50 => const Color.fromARGB(255, 255, 245, 232);
  Color get x100 => const Color.fromARGB(255, 255, 235, 210);
  Color get x150 => const Color.fromARGB(255, 255, 220, 180);
  Color get x200 => const Color.fromARGB(255, 255, 205, 150);
  Color get x250 => const Color.fromARGB(255, 255, 190, 120);
  Color get x300 => const Color.fromARGB(255, 255, 175, 90);
  Color get x350 => const Color.fromARGB(255, 255, 160, 70);
  Color get x400 => const Color.fromARGB(255, 255, 145, 50);
  Color get x450 => const Color.fromARGB(255, 240, 130, 45);
  Color get x500 => const Color.fromARGB(255, 225, 115, 40);
  Color get x550 => const Color.fromARGB(255, 200, 100, 35);
  Color get x600 => const Color.fromARGB(255, 175, 85, 30);
  Color get x650 => const Color.fromARGB(255, 150, 70, 25);
  Color get x700 => const Color.fromARGB(255, 125, 60, 20);
  Color get x750 => const Color.fromARGB(255, 100, 45, 15);
  Color get x800 => const Color.fromARGB(255, 75, 35, 10);
  Color get x850 => const Color.fromARGB(255, 50, 25, 5);
}

class ColorsRed {
  Color get x50 => const Color.fromARGB(255, 255, 235, 235);
  Color get x100 => const Color.fromARGB(255, 255, 210, 210);
  Color get x150 => const Color.fromARGB(255, 255, 180, 180);
  Color get x200 => const Color.fromARGB(255, 255, 150, 150);
  Color get x250 => const Color.fromARGB(255, 255, 120, 120);
  Color get x300 => const Color.fromARGB(255, 230, 100, 100);
  Color get x450 => const Color.fromARGB(255, 233, 24, 24);
  Color get x350 => const Color.fromARGB(255, 205, 80, 80);
  Color get x400 => const Color.fromARGB(255, 180, 70, 70);
  Color get x500 => const Color.fromARGB(255, 140, 50, 50);
  Color get x550 => const Color.fromARGB(255, 120, 40, 40);
  Color get x600 => const Color.fromARGB(255, 100, 30, 30);
  Color get x650 => const Color.fromARGB(255, 80, 25, 25);
  Color get x700 => const Color.fromARGB(255, 60, 20, 20);
  Color get x750 => const Color.fromARGB(255, 45, 15, 15);
  Color get x800 => const Color.fromARGB(255, 30, 10, 10);
  Color get x850 => const Color.fromARGB(255, 20, 5, 5);
}

class ColorsSystem {
  Color get pureBlack => const Color.fromARGB(255, 23, 4, 4);
  Color get pureWhite => const Color.fromARGB(255, 255, 255, 255);
  Color get labelText => const Color.fromARGB(255, 125, 125, 125);
  Color get defaultText => const Color.fromARGB(255, 64, 64, 64);
  Color get background => const Color.fromRGBO(245, 245, 245, 1);
  Color get border => const Color.fromRGBO(196, 196, 196, 1);
  Color get disabled => const Color.fromARGB(255, 232, 232, 232);
}

class ColorsYellow {
  Color get x50 => const Color.fromARGB(255, 255, 255, 232);
  Color get x100 => const Color.fromARGB(255, 255, 255, 210);
  Color get x150 => const Color.fromARGB(255, 255, 255, 180);
  Color get x200 => const Color.fromARGB(255, 255, 255, 150);
  Color get x250 => const Color.fromARGB(255, 255, 255, 120);
  Color get x300 => const Color.fromARGB(255, 240, 230, 100);
  Color get x350 => const Color.fromARGB(255, 225, 215, 80);
  Color get x400 => const Color.fromARGB(255, 210, 200, 60);
  Color get x450 => const Color.fromARGB(255, 195, 185, 50);
  Color get x500 => const Color.fromARGB(255, 202, 191, 25);
  Color get x550 => const Color.fromARGB(255, 163, 150, 6);
  Color get x600 => const Color.fromARGB(255, 140, 130, 30);
  Color get x650 => const Color.fromARGB(255, 120, 110, 25);
  Color get x700 => const Color.fromARGB(255, 100, 90, 20);
  Color get x750 => const Color.fromARGB(255, 80, 70, 15);
  Color get x800 => const Color.fromARGB(255, 60, 50, 10);
  Color get x850 => const Color.fromARGB(255, 40, 30, 5);
}

class ColorsTurquesa {
  Color get x50 => const Color.fromARGB(255, 159, 253, 255); // mais clara
  Color get x100 => const Color.fromARGB(255, 121, 230, 232);
  Color get x150 => const Color.fromARGB(255, 99, 212, 213);
  Color get x200 => const Color.fromARGB(255, 73, 218, 220);
  Color get x250 => const Color.fromARGB(255, 39, 194, 196);
  Color get x300 => const Color.fromARGB(255, 26, 225, 228);
  Color get x350 => const Color.fromARGB(255, 18, 167, 169);
  Color get x400 => const Color.fromARGB(255, 5, 178, 181);
  Color get x450 => const Color(0xFF04BBC3); // 🌟 cor principal sugerida
  Color get x500 => const Color.fromARGB(255, 5, 140, 142);
  Color get x550 => const Color.fromARGB(255, 44, 174, 176);
  Color get x600 => const Color.fromARGB(255, 18, 101, 103);
  Color get x650 => const Color.fromARGB(255, 9, 73, 74); // mais escura
}
