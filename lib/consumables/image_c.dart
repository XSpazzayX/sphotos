import '../entities/image_e.dart';
class ImageC {
  final String imageUrl;
  final String authorUsername;

  ImageC(this.imageUrl, this.authorUsername);
  ImageC.fromImageE(ImageE imageE):imageUrl = imageE.urls['thumb'],authorUsername = imageE.userE.username;
}