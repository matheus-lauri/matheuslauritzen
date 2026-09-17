import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In pt, this message translates to:
  /// **'Matheus Baron Lauritzen - Portfólio'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In pt, this message translates to:
  /// **'Início'**
  String get navHome;

  /// No description provided for @navAbout.
  ///
  /// In pt, this message translates to:
  /// **'Sobre Mim'**
  String get navAbout;

  /// No description provided for @navSkills.
  ///
  /// In pt, this message translates to:
  /// **'Tecnologias'**
  String get navSkills;

  /// No description provided for @navProjects.
  ///
  /// In pt, this message translates to:
  /// **'Projetos'**
  String get navProjects;

  /// No description provided for @navContact.
  ///
  /// In pt, this message translates to:
  /// **'Contato'**
  String get navContact;

  /// No description provided for @heroGreeting.
  ///
  /// In pt, this message translates to:
  /// **'Olá, eu sou {name}'**
  String heroGreeting(String name);

  /// No description provided for @heroTagline.
  ///
  /// In pt, this message translates to:
  /// **'Desenvolvedor Full Stack apaixonado por criar experiências digitais incríveis.'**
  String get heroTagline;

  /// No description provided for @aboutText.
  ///
  /// In pt, this message translates to:
  /// **'Atualmente, estou cursando uma graduação em Ciência da Computação na Universidade do Vale do Itajaí (UNIVALI), após me formar em Análise e Desenvolvimento de Sistemas pelo SENAI em Brusque, Santa Catarina, Brasil. Sou um desenvolvedor full stack com experiência em diversas tecnologias. Tenho paixão por transformar ideias em interfaces de usuário bonitas e funcionais, e por construir sistemas robustos e escaláveis. Busco constantemente aprender novas tecnologias e aprimorar minhas habilidades para entregar soluções de alta qualidade.'**
  String get aboutText;

  /// No description provided for @projectsAccessButton.
  ///
  /// In pt, this message translates to:
  /// **'Acessar'**
  String get projectsAccessButton;

  /// No description provided for @projectSpringBootTitle.
  ///
  /// In pt, this message translates to:
  /// **'Backend Spring Boot'**
  String get projectSpringBootTitle;

  /// No description provided for @projectSpringBootDescription.
  ///
  /// In pt, this message translates to:
  /// **'Esse projeto tem como objetivo desenvolver o backend de uma aplicação web usando Spring Boot Java, com o intuito de praticar e aprimorar habilidades em desenvolvimento backend.'**
  String get projectSpringBootDescription;

  /// No description provided for @projectScroogeTitle.
  ///
  /// In pt, this message translates to:
  /// **'Scrooge App'**
  String get projectScroogeTitle;

  /// No description provided for @projectScroogeDescription.
  ///
  /// In pt, this message translates to:
  /// **'Projeto relacionado ao desenvolvimento do WebApp Scrooge, um aplicativo para auxiliar a vida financeira do usuário. O WPA tem como objetivo ajudar o usuário a controlar suas finanças de forma simples e eficiente, além de possuir uma seção de educação financeira.'**
  String get projectScroogeDescription;

  /// No description provided for @projectImageProcessingTitle.
  ///
  /// In pt, this message translates to:
  /// **'Processamento de Imagens'**
  String get projectImageProcessingTitle;

  /// No description provided for @projectImageProcessingDescription.
  ///
  /// In pt, this message translates to:
  /// **'O exercício consiste em comparar filtros no Domínio Espacial e no Domínio da Frequência usando a linguagem Python. Foi utilizada a biblioteca OpenCV para manipulação de imagens e a biblioteca NumPy para operações matemáticas, além de outras bibliotecas para processamento de imagens.'**
  String get projectImageProcessingDescription;

  /// No description provided for @contactSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Interessado em trabalhar comigo? Entre em contato!'**
  String get contactSubtitle;

  /// No description provided for @tooltipLinkedin.
  ///
  /// In pt, this message translates to:
  /// **'LinkedIn'**
  String get tooltipLinkedin;

  /// No description provided for @tooltipGithub.
  ///
  /// In pt, this message translates to:
  /// **'GitHub'**
  String get tooltipGithub;

  /// No description provided for @tooltipEmail.
  ///
  /// In pt, this message translates to:
  /// **'E-mail'**
  String get tooltipEmail;

  /// No description provided for @footerRights.
  ///
  /// In pt, this message translates to:
  /// **'© {year} {name}. Todos os direitos reservados.'**
  String footerRights(int year, String name);

  /// No description provided for @themeToggleToLight.
  ///
  /// In pt, this message translates to:
  /// **'Ativar tema claro'**
  String get themeToggleToLight;

  /// No description provided for @themeToggleToDark.
  ///
  /// In pt, this message translates to:
  /// **'Ativar tema escuro'**
  String get themeToggleToDark;

  /// No description provided for @languageTogglePt.
  ///
  /// In pt, this message translates to:
  /// **'Mudar para português (Brasil)'**
  String get languageTogglePt;

  /// No description provided for @languageToggleEn.
  ///
  /// In pt, this message translates to:
  /// **'Mudar para inglês (EUA)'**
  String get languageToggleEn;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
