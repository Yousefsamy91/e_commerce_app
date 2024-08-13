import 'package:flutter/material.dart';

class small_card extends StatelessWidget {
  final String categoryName;
  final String imageUrl;
  final VoidCallback onTap;

  const small_card({
    required this.categoryName,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100, 
        height: 120, 
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity, 
              height: 80, 
              decoration: BoxDecoration(
                color: Colors.white24, 
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    color: Colors.black.withOpacity(0.5),
                    width: 1.0), 
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    8.0), 
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8.0), 
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0), 
            Container(
              width: double.infinity, 
              color: Colors.white, 
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
