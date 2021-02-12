import '../entities/image_e.dart';

class ImageC {
  final String imageUrl;
  final String thumbnailUrl;
  final String authorUsername;
  final String description;

  ImageC(
      this.imageUrl, this.authorUsername, this.thumbnailUrl, this.description);

  ImageC.fromImageE(ImageE imageE)
      : thumbnailUrl = imageE.urls['thumb'],
        authorUsername = imageE.userE.username,
        imageUrl = imageE.urls['full'],
        description = imageE.description ??
            imageE.alt_description ??
            "Im sorry the author did not provide a description"{
}
}
