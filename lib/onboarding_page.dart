import 'package:flutter/material.dart';
import 'main.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Freshness at Your Door',
      description: 'Get handpicked organic fruits and vegetables delivered from farm to table.',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBjFrEwW0hWwLStvoes0GSKj8yd-1t__dh7HoToHWsI2Rp2N-hy4EcGxlFW2R4AfKROUHvQkPRQjEv170O8ojKdKAY3_-rGBhNGQ3OOKzOsWSP9Bk50WPDy20nFk5s3-cx05XBuD4Dgtu0D6eXXbZV6WnDO-YZvvOsNXmRs0tOfqefMzgosfTxJU9qjZYKaLYPqVhXySGPXUtr8aFliJoqyP8q9W8p6_Y_dMxomjZaWgYhKe9KfArOvjjg9-54c8jPZIdSWGVwbVZA',
    ),
    OnboardingData(
      title: 'Swift Delivery System',
      description: 'We prioritize speed and quality, ensuring your groceries arrive within minutes.',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD5SSrVvs52kpsiDlrp1BjWJTJc45sSEGTPG2LIErSIL-nF0V9cnU9flckH9hndVxmmt_lY6Tdbwrd7hPpidXFeiAd5J-5mBV8p-l_MjVWGuZdnwowFWHGapvEffeYan4H8qijuM1GS-fyRzItGJ6eslp2RoqRYtONbOCEQ_-0-GN3UF_ZKEIXXn2jMarMhfdZ3-x6nQ9faK6HFYMXVE7Qe32g4EWBqbSAGxiK_YeuXxpx0kk82_AkLIUX87l3t9To4Eh_nD1IK12E',
    ),
    OnboardingData(
      title: 'Easy Payments',
      description: 'Secure and seamless checkout options for a stress-free shopping experience.',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBbJO29o3COfQdUHulO3q4IOpI8WfYS78-hScvfaWxo5ny2hw8IqV19WGSsoctxVxj2lpiN616j9X_1fxdyPFC1B1HvI1-4iuTzrMo1YS6b2P7GNbXbcICC2YEgPO7AwNvUDAH-mX4GyH-WgKwAfRgmhwsGTD1mQ5SCm0uVm5VhG1NeOTDXPvUl6oVpyzPbnvLbtKLYf5nOJY0ohAFCD8699GLlHRCj99QFxP4Xyk8p6VU6jEzNPZ3ovfkTYHwoj4e2B4Cpm2RX5EM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return OnboardingSlide(data: _pages[index]);
            },
          ),
          Positioned(
            bottom: 48,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) => _buildPageIndicator(index),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    if (_currentPage == _pages.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  backgroundColor: BlinkitApp.primaryColor,
                  child: Icon(
                    _currentPage == _pages.length - 1 ? Icons.check : Icons.arrow_forward_rounded,
                    color: BlinkitApp.accentColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            right: 24,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
              child: const Text(
                'SKIP',
                style: TextStyle(
                  color: BlinkitApp.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    bool isSelected = _currentPage == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: isSelected ? 24 : 8,
      decoration: BoxDecoration(
        color: isSelected ? BlinkitApp.primaryColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final OnboardingData data;

  const OnboardingSlide({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(data.imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 60),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
