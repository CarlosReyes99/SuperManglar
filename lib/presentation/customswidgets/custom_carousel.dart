import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarouselWidget extends StatefulWidget {
  final List<String> images;

  const CustomCarouselWidget({super.key, required this.images});

  @override
  State<CustomCarouselWidget> createState() => _CustomCarouselWidgetState();
}

class _CustomCarouselWidgetState extends State<CustomCarouselWidget> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, // Center the entire carousel

      // Set width and height as needed
      width: 500,
      height: 700,

      child: Scaffold(
        backgroundColor: const Color(0xff0597F2),
        body: CarouselSlider(
          options: CarouselOptions(
            height: 700, // Set height based on received value
            viewportFraction: 0.8, // Adjust viewport size if needed
            enableInfiniteScroll: true, // Optionally enable infinite looping
            autoPlay: true, // Optionally enable autoplay
            autoPlayInterval:
                const Duration(seconds: 2), // Set autoplay delay if enabled
            onPageChanged: (index, reason) =>
                setState(() => _currentImageIndex = index),
          ),
          items: widget.images.map((image) {
            return Container(
              // Apply shadow and rounded corners for a card-like effect
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset: const Offset(2.0, 2.0),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover, // Ensure image covers the container
                  width: double.infinity, // Scale image to container width
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
