# sphotos

Photo app for job

## Things i know could have been done better

1.Bad and inconsistent naming
2.Caching works strange in flutter by default with CachedNetworkImage, cause memory issues which i noticed late
3.I should have made a special entity for List<ImageC> like ImagesC, because the way it is implemented now is not
performant because I copy items of the existing List<ImageC> instead of just copying the reference. I can not copy
the reference in the current implementation because of the way StreamProvider works
4

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
