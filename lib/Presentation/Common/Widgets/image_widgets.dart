import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hbkblanket/Presentation/Resources/colors_pallete.dart';



class AssetImageWidget extends StatelessWidget {
  final String url;
  final double? scale;
  final double? width;
  final double? height;
  final Color? color;
  const AssetImageWidget({
    Key? key,
    required this.url,
    this.scale = 1,
    this.width = 25,
    this.height = 25,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      fit: BoxFit.fill,
      color: color,
      width: width! * scale!,
      height: height! * scale!,
    );
  }
}

class CachedImage extends StatelessWidget {
  final String url;
  final double? scale;
  final double? radius;
  final bool? isCircle;
  final double? containerRadius;
  final double? bottomRadius;
  final double? topRadius;
  final BoxFit? fit;
  final double? width;
  final double? height;

  const CachedImage({
    super.key,
    required this.url,
    this.scale = 1,
    this.radius = 50,
    this.isCircle = true,
    this.containerRadius = 0,
    this.topRadius,
    this.bottomRadius,
    this.fit = BoxFit.fill,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(

      imageUrl: url,
      placeholder: (context, url) => isCircle!
          ? Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            )
          : Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(containerRadius!),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
      errorWidget: (context, url, error) {
       if(error.statusCode == 500)
         {
           return
             isCircle!
                 ?
             CircleAvatar(
             radius: radius,
             backgroundImage: const NetworkImage("https://www.si.com/.image/t_share/MTY4MTk3MTQ1NjcyMzYxODU3/tennis-inlinejpg.jpg")


           ):
                Image.network("https://www.si.com/.image/t_share/MTY4MTk3MTQ1NjcyMzYxODU3/tennis-inlinejpg.jpg");
         }
       else
         {
        return const Icon(Icons.error);}},

      imageBuilder: (context, imageProvider) => isCircle!
          ? CircleAvatar(
              radius: radius,
              backgroundImage: imageProvider,
            )
          : ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(topRadius ?? containerRadius!),
                topLeft: Radius.circular(topRadius ?? containerRadius!),
                bottomLeft: Radius.circular(bottomRadius ?? containerRadius!),
                bottomRight: Radius.circular(bottomRadius ?? containerRadius!),
              ),
              child: Image(
                image: imageProvider,
                width: width,
                height: height,
                fit: fit,
              ),
            ),
    );
  }
}
