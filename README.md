# sphotos

Photo app for job

## Things i know could have been done better

- Bad and inconsistent naming
- Caching works strange in flutter by default with CachedNetworkImage, cause memory issues which i noticed late
- I should have made a special entity for List<ImageC> like ImagesC, because the way it is implemented now is not
performant because I copy items of the existing List<ImageC> instead of just copying the reference. I can not copy
the reference in the current implementation because of the way StreamProvider works

