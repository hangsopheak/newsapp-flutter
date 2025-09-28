import 'package:flutter/material.dart';

class OnboardingIndicatorWidget extends StatelessWidget {
  final int pageSize;
  final int currentPage;
  final MainAxisAlignment alignment;

  const OnboardingIndicatorWidget({
    Key? key,
    required this.pageSize,
    required this.currentPage,
    this.alignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: List.generate(pageSize, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Container(
            height: 14,
            width: index == currentPage ? 32 : 16,
            decoration: BoxDecoration(
              color: index == currentPage
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}
