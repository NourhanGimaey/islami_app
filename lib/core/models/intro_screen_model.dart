class WelcomeDetials {
  final String imagePath;
  final String title;
  final String subtitle;

  const WelcomeDetials({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  static List<WelcomeDetials> welcomeDetails = [
    WelcomeDetials(
      imagePath: 'assets/images/welcome1.png',
      title: 'Welcome to Islami App',
      subtitle: '',
    ),
    WelcomeDetials(
      imagePath: 'assets/images/welcome2.png',
      title: 'Welcome to Islami App',
      subtitle: '',
    ),
    WelcomeDetials(
      imagePath: 'assets/images/welcome3.png',
      title: 'Reading the Quran',
      subtitle: 'Read, Allah is the most generous',
    ),
    WelcomeDetials(
      imagePath: 'assets/images/welcome4.png',
      title: 'Duaa',
      subtitle: 'Praise the name of Allah',
    ),
    WelcomeDetials(
      imagePath: 'assets/images/welcome5.png',
      title: 'Holy Quran Radio',
      subtitle:
          'You can listen to the Holy Quran Radio through the application easily for free!',
    ),
  ];
}