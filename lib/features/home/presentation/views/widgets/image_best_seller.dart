import 'package:flutter/material.dart';


class ImageBestSeller extends StatelessWidget {
  const ImageBestSeller({
    super.key, required this.image,
  });

  final String image ;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 70 / 105,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              image ,
            ),
          ),
        ),
      ),
    );
  }
}
