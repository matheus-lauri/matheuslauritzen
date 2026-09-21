// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Matheus Baron Lauritzen - Portfólio';

  @override
  String get navHome => 'Início';

  @override
  String get navAbout => 'Sobre Mim';

  @override
  String get navSkills => 'Tecnologias';

  @override
  String get navProjects => 'Projetos';

  @override
  String get navContact => 'Contato';

  @override
  String heroGreeting(String name) {
    return 'Olá, eu sou $name';
  }

  @override
  String get heroTagline =>
      'Desenvolvedor Full Stack apaixonado por criar experiências digitais incríveis.';

  @override
  String get aboutText =>
      'Atualmente, estou cursando uma graduação em Ciência da Computação na Universidade do Vale do Itajaí (UNIVALI), após me formar em Análise e Desenvolvimento de Sistemas pelo SENAI em Brusque, Santa Catarina, Brasil. Sou um desenvolvedor full stack com experiência em diversas tecnologias. Tenho paixão por transformar ideias em interfaces de usuário bonitas e funcionais, e por construir sistemas robustos e escaláveis. Busco constantemente aprender novas tecnologias e aprimorar minhas habilidades para entregar soluções de alta qualidade.';

  @override
  String get projectsAccessButton => 'Acessar';

  @override
  String get projectPdfToolkitTitle => 'PDF Toolkit';

  @override
  String get projectPdfToolkitDescription =>
      'Aplicação web para manipulação de PDFs, sem necessidade de autenticação ou armazenamento externo, com todo o processamento feito em memória. Permite unir até 20 PDFs, extrair intervalos de páginas e aplicar marcas d\'água em texto. Backend em C# / ASP.NET Core 8 com Clean Architecture e PdfSharpCore, frontend em React com TypeScript e Vite.';

  @override
  String get projectScroogeTitle => 'Scrooge App';

  @override
  String get projectScroogeDescription =>
      'Projeto relacionado ao desenvolvimento do WebApp Scrooge, um aplicativo para auxiliar a vida financeira do usuário. O WPA tem como objetivo ajudar o usuário a controlar suas finanças de forma simples e eficiente, além de possuir uma seção de educação financeira.';

  @override
  String get projectImageProcessingTitle => 'Processamento de Imagens';

  @override
  String get projectImageProcessingDescription =>
      'O exercício consiste em comparar filtros no Domínio Espacial e no Domínio da Frequência usando a linguagem Python. Foi utilizada a biblioteca OpenCV para manipulação de imagens e a biblioteca NumPy para operações matemáticas, além de outras bibliotecas para processamento de imagens.';

  @override
  String get contactSubtitle =>
      'Interessado em trabalhar comigo? Entre em contato!';

  @override
  String get tooltipLinkedin => 'LinkedIn';

  @override
  String get tooltipGithub => 'GitHub';

  @override
  String get tooltipEmail => 'E-mail';

  @override
  String footerRights(int year, String name) {
    return '© $year $name. Todos os direitos reservados.';
  }

  @override
  String get themeToggleToLight => 'Ativar tema claro';

  @override
  String get themeToggleToDark => 'Ativar tema escuro';

  @override
  String get languageTogglePt => 'Mudar para português (Brasil)';

  @override
  String get languageToggleEn => 'Mudar para inglês (EUA)';
}
