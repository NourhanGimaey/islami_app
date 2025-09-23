import 'package:flutter/material.dart';
import 'package:islami/core/models/intro_screen_model.dart';
import 'package:islami/core/utils/app_assets.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = '/intro_screen';

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isLastPage =
        currentPageIndex == WelcomeDetials.welcomeDetails.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AppImages.islamiTopLogo,
              height: MediaQuery.of(context).size.height * .2,
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return Image.asset(
                    WelcomeDetials.welcomeDetails[index].imagePath,
                  );
                },
                itemCount: WelcomeDetials.welcomeDetails.length,
                onPageChanged: (value) {
                  currentPageIndex = value;
                  currentPageIndex = _pageController.page!.round();
                  setState(() {});
                },
                controller: _pageController,
              ),
            ),
            Column(
              children: [
                Text(
                  WelcomeDetials.welcomeDetails[currentPageIndex].title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  WelcomeDetials.welcomeDetails[currentPageIndex].subtitle,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 24),
            ListTile(
              leading: TextButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: Text(
                  'Back',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              title: Align(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: WelcomeDetials.welcomeDetails.length,
                  effect: const WormEffect(
                    dotColor: AppColors.lightGrey,
                    activeDotColor: AppColors.gold,
                    dotWidth: 7,
                    dotHeight: 7,
                  ),
                ),
              ),
              trailing: TextButton(
                onPressed: () {
                  isLastPage
                      ? Navigator.pushNamed(context, HomeScreen.routeName)
                      : _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                },
                child: Text(
                  isLastPage ? 'Finish' : 'Next',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
