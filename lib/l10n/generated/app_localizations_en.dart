// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Matheus Baron Lauritzen - Portfolio';

  @override
  String get navHome => 'Home';

  @override
  String get navAbout => 'About Me';

  @override
  String get navSkills => 'Technologies';

  @override
  String get navProjects => 'Projects';

  @override
  String get navContact => 'Contact';

  @override
  String heroGreeting(String name) {
    return 'Hi, I\'m $name';
  }

  @override
  String get heroTagline =>
      'Full Stack Developer passionate about building amazing digital experiences.';

  @override
  String get aboutText =>
      'I\'m currently pursuing a degree in Computer Science at Universidade do Vale do Itajaí (UNIVALI), after graduating in Systems Analysis and Development from SENAI in Brusque, Santa Catarina, Brazil. I\'m a full stack developer with experience in a wide range of technologies such as HTML, CSS, JavaScript, PHP, React, Java, .NET (C#), Kotlin, React Native, C++, Python, Assembly, and Flutter. I\'m passionate about turning ideas into beautiful, functional user interfaces, and about building robust, scalable systems. I\'m always looking to learn new technologies and sharpen my skills to deliver high-quality solutions.';

  @override
  String get projectsAccessButton => 'View';

  @override
  String get projectSpringBootTitle => 'Spring Boot Backend';

  @override
  String get projectSpringBootDescription =>
      'This project\'s goal is to build the backend of a web application using Java Spring Boot, in order to practice and improve backend development skills.';

  @override
  String get projectScroogeTitle => 'Scrooge App';

  @override
  String get projectScroogeDescription =>
      'Project related to the development of the Scrooge WebApp, an application to help manage the user\'s personal finances. The PWA aims to help users control their finances in a simple and efficient way, and also includes a financial education section.';

  @override
  String get projectImageProcessingTitle => 'Image Processing';

  @override
  String get projectImageProcessingDescription =>
      'This exercise compares filters in the Spatial Domain and the Frequency Domain using Python. The OpenCV library was used for image manipulation and NumPy for mathematical operations, along with other image processing libraries.';

  @override
  String get contactSubtitle => 'Interested in working together? Get in touch!';

  @override
  String get tooltipLinkedin => 'LinkedIn';

  @override
  String get tooltipGithub => 'GitHub';

  @override
  String get tooltipEmail => 'Email';

  @override
  String footerRights(int year, String name) {
    return '© $year $name. All rights reserved.';
  }

  @override
  String get themeToggleToLight => 'Switch to light theme';

  @override
  String get themeToggleToDark => 'Switch to dark theme';

  @override
  String get languageTogglePt => 'Switch to Portuguese (Brazil)';

  @override
  String get languageToggleEn => 'Switch to English (US)';
}
