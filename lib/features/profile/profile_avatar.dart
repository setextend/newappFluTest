import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageAssetPath;
  final double size;
  final VoidCallback onTap;
  final Color borderColor;
  final double borderWidth;

  const ProfileAvatar({
    super.key,
    this.imageAssetPath,
    this.size = 50,
    required this.onTap,
    this.borderColor = Colors.white,
    this.borderWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: borderWidth),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: imageAssetPath != null
              ? Image.asset(
                  imageAssetPath!,
                  fit: BoxFit.cover,
                  width: size,
                  height: size,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildPlaceholder(),
                )
              : _buildPlaceholder(),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: Icon(Icons.person, size: size * 0.6, color: Colors.grey[600]),
    );
  }
}
