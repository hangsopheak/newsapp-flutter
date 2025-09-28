import 'package:flutter/material.dart';
import 'package:newsapp_flutter/model/onboarding_section.dart';

class OnboardingSectionWidget extends StatelessWidget {
  final OnboardingSection onboardingSection;

  const OnboardingSectionWidget({super.key, required this.onboardingSection});

  @override
  Widget build(BuildContext context) {
    // We use MediaQuery to get the screen size, although a simple Column
    // with crossAxisAlignment: CrossAxisAlignment.stretch achieves fillMaxWidth()
    return Column(
      crossAxisAlignment: CrossAxisAlignment
          .stretch, // Equivalent to Modifier.fillMaxWidth() for children
      children: <Widget>[
        // Spacer(90.dp)
        const SizedBox(height: 90.0),

        // Image(painter = painterResource(id = onboardingSection.imageRes), ...)
        Image.asset(
          onboardingSection.imagePath,
          fit: BoxFit.contain,
          width: double.infinity,
          height: 250, // Optional: fixed height to prevent excessive stretching
        ),

        const SizedBox(height: 80.0),

        // Text (Title)
        Text(
          onboardingSection.title,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                // color: MaterialTheme.colorScheme.onBackground, (Handled by Flutter Theme default)
              ),
        ),

        // Spacer(60.dp)
        const SizedBox(height: 60.0),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            onboardingSection.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
