import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

/// Returns an text button with the specified color, message
/// [color] renders the color on button, default color is black
/// [message] text to be display on button
/// [callBack] fires an event on user taps on button
/// [fontSize] size of the text, default size is 13.sp
/// [fontFamily] font family of the text
/// [fontWeight] font weight of the text, default weight is FontWeight.w400
Widget textButton({
  required String message,
  Color? color,
  double? fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
  TextDecoration? textDecoration,
  VoidCallback? callBack,
}) {
  return TextButton(
    onPressed: callBack,
    child: Text(
      message,
      style: TextStyle(
        color: color ?? Colors.blue,
        fontSize: fontSize ?? 13.0,
        decoration: textDecoration,
        fontFamily: fontFamily,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    ),
  );
}

/// Returns an extended image with the specified url, height, width and fit
/// [icon] is the icon of the button
/// [color] renders the color on button, default color is blue
/// [size] size of the icon, default size is 20.0
/// [callBack] fires an event on user taps on button
Widget iconButton({
  required IconData icon,
  Color? color,
  double? size,
  required VoidCallback callBack,
}) {
  return IconButton(
    onPressed: callBack,
    icon: Icon(
      icon,
      color: color ?? Colors.red,
      size: size ?? 20.0,
    ),
  );
}

/// Returns an extended image with the specified url, height, width and fit
/// [url] is the image url / asset path
/// [height] is the height of the image
/// [width] is the width of the image
ExtendedImage extendedImage({
  required String url,
  double? height,
  double? width,
  BoxFit? fit,
}) {
  if (url.startsWith('assets/')) {
    return ExtendedImage.asset(
      url,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
    );
  } else {
    return ExtendedImage.network(
      url,
      fit: fit ?? BoxFit.cover,
      cache: true,
      height: height,
      width: width,
      cacheMaxAge: const Duration(hours: 1),
      cacheRawData: true,
      enableMemoryCache: false,
      enableLoadState: false,
      handleLoadingProgress: true,
      printError: false,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case LoadState.completed:
            return ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              fit: fit ?? BoxFit.cover,
            );
          case LoadState.failed:
            return GestureDetector(
              onTap: () {
                state.reLoadImage();
              },
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.error),
                    Text('load image failed, click to reload'),
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}
