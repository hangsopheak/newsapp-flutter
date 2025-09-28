import 'package:flutter/material.dart';
import 'package:newsapp_flutter/data/onboarding_section_data.dart';
import 'package:newsapp_flutter/ui/onboarding/onboarding_section_widget.dart';
import 'package:newsapp_flutter/ui/onboarding/onboarding_indicator_widget.dart';
import 'package:newsapp_flutter/ui/onboarding/onboarding_button_widget.dart';

class OnboardingScreenWidget extends StatefulWidget {
  const OnboardingScreenWidget({super.key});

  @override
  State<OnboardingScreenWidget> createState() => _OnboardingScreenWidgetState();
}

class _OnboardingScreenWidgetState extends State<OnboardingScreenWidget> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sections = OnboardingSectionData.getMainOnboardingSections();
    final int lastPage = sections.length - 1;

    // Button state logic
    String leftButtonText = '';
    String rightButtonText = '';
    if (_currentPage == 0) {
      leftButtonText = '';
      rightButtonText = 'Next';
    } else if (_currentPage == lastPage) {
      leftButtonText = 'Back';
      rightButtonText = 'Start';
    } else {
      leftButtonText = 'Back';
      rightButtonText = 'Next';
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: sections.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: OnboardingSectionWidget(
                      onboardingSection: sections[index],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0, left: 16, right: 16, top: 8),
              child: Column(
                children: [
                  OnboardingIndicatorWidget(
                    pageSize: sections.length,
                    currentPage: _currentPage,
                    alignment: MainAxisAlignment.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (leftButtonText.isNotEmpty)
                        OnboardingButtonWidget(
                          text: leftButtonText,
                          onPressed: () {
                            if (_currentPage > 0) {
                              _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                            }
                          },
                          backgroundColor: Colors.grey[200],
                          textColor: Colors.black54,
                        )
                      else
                        const SizedBox(width: 80),
                      OnboardingButtonWidget(
                        text: rightButtonText,
                        onPressed: () {
                          if (_currentPage < lastPage) {
                            _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                          } else {
                            // TODO: Handle onboarding completion (navigate, etc.)
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
