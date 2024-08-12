import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_animator/flutter_animator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/BottomBar');
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff1478A4),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onboarding_data.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemBuilder: (context, index) => onboardingContent(
                title: onboarding_data[index].title,
                image: onboarding_data[index].image,
                note: onboarding_data[index].note,
              ),
            ),
          ),
          onBoardingNavigation(
            pageIndex: _pageIndex,
            pageController: _pageController,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class onBoardingNavigation extends StatelessWidget {
  const onBoardingNavigation({
    super.key,
    required int pageIndex,
    required PageController pageController,
  })  : _pageIndex = pageIndex,
        _pageController = pageController;

  final int _pageIndex;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          if (_pageIndex != 0)
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  _pageController.animateToPage(_pageIndex - 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Color(0xff1478A4),
                ),
              ),
            ),
          if (_pageIndex == 0) SizedBox(width: 40),
          const Spacer(),
          ...List.generate(
            onboarding_data.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: DotIndicator(
                isActive: index == _pageIndex,
              ),
            ),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xff1478A4),
            child: IconButton(
              onPressed: () {
                if (_pageIndex == onboarding_data.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  _pageController.animateToPage(_pageIndex + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }
              },
              icon: const Icon(
                Icons.arrow_forward,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 20 : 13,
      width: isActive ? 20 : 13,
      decoration: BoxDecoration(
          color: isActive ? const Color(0xff1478A4) : const Color(0xff1478A4),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}

class Onboard {
  late final String title;
  late final String image;
  late final String note;

  Onboard({required this.title, required this.image, required this.note});
}

final List<Onboard> onboarding_data = [
  Onboard(
    title: 'Welcome to Vertex Begin Your Journey',
    image: 'assets/images/Image-1.png',
    note:
        'Revolutionize your education with personalized learning. Track progress, engage in AI mock interviews, and access resources offline.',
  ),
  Onboard(
    title: 'AI-based Behavioral Interviews ',
    image: 'assets/images/Image-3.png',
    note:
        'Tailored and realistic behavioral interview simulations powered by artificial intelligence, enhancing your interview skills and readiness.',
  ),
  Onboard(
    title: 'Immersive Courses Content',
    image: 'assets/images/Image-2.png',
    note:
        'Dive into comprehensive notes, enlightening videos, and vivid slides that paint a clear picture of your technical voyage.',
  ),
];

class onboardingContent extends StatelessWidget {
  const onboardingContent(
      {super.key,
      required this.title,
      required this.image,
      required this.note});
  final String title;
  final String image;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.4,
            child: FadeIn(
              preferences: const AnimationPreferences(
                duration: Duration(milliseconds: 1000),
                offset: Duration(milliseconds: 500),
              ),
              child: Center(
                child: Image.asset(image),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: FadeIn(
            preferences: const AnimationPreferences(
              duration: Duration(milliseconds: 1000),
              offset: Duration(milliseconds: 500),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Roboto-Regular',
                fontSize: 24,
                color: Colors.amber,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: FadeIn(
            preferences: const AnimationPreferences(
              duration: Duration(milliseconds: 1000),
              offset: Duration(milliseconds: 500),
            ),
            child: Text(
              note,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Roboto-Regular',
                fontSize: 15,
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
