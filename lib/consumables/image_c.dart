import '../entities/image_e.dart';
class ImageC {
  final String imageUrl;
  final String thumbnailUrl;
  final String authorUsername;

  ImageC(this.imageUrl, this.authorUsername, this.thumbnailUrl);
  ImageC.fromImageE(ImageE imageE):thumbnailUrl = imageE.urls['thumb'],authorUsername = imageE.userE.username,imageUrl = imageE.urls['full'];
}