class OnboardingSection {
  final String title;
  final String subtitle;
  final String description;

  /// The local path to the image asset (e.g., 'assets/images/onboarding_section1.svg').
  final String imagePath;

  const OnboardingSection({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
  });
}
