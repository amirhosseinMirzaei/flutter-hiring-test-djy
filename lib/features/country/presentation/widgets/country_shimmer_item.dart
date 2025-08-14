import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountryShimmerItem extends StatelessWidget {
  const CountryShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            Container(width: 50, height: 30, color: Colors.white),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: double.infinity, height: 16, color: Colors.white),
                  const SizedBox(height: 8),
                  Container(width: 150, height: 14, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
