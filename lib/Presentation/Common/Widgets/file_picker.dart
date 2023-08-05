import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbkblanket/Presentation/Resources/colors_pallete.dart';
import 'package:hbkblanket/Presentation/Resources/text_styles.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';


import 'app_text.dart';


class PickFile {
  static Future pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
     // allowedExtensions: [".jpg",".png",".heic","jpeg"],
      allowMultiple: true,
    );
    if (result == null) return;
    final images = result.paths;
    return images;
  }

  static Future<FilePickerResult?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
      // allowedExtensions: [
      //   'jpg',
      //   'png',
      //   'jpeg',
      //   'docx',
      //   'doc',
      //   'pdf',
      //   'csv',
      //   'xls',
      //   'xlsx',
      //   'txt',
      //   'mp4',
      // ],
    );
    if (result == null) return null;
    return result;
  }
  static Future<List<PlatformFile>?> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
      // allowedExtensions: [
      //   'jpg',
      //   'png',
      //   'jpeg',
      //   'docx',
      //   'doc',
      //   'pdf',
      //   'csv',
      //   'xls',
      //   'xlsx',
      //   'txt',
      //   'mp4',
      // ],
    );
    if (result == null) return null;
    return result.files;
  }

  static Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    return imageTemporary;
  }
}

class DisplayFileImage extends StatelessWidget {
  final String fileImage;
  final VoidCallback onDeleteTap;
 // final  int index;

  const DisplayFileImage({
    super.key,
    required this.fileImage,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.primaryColor,
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 100.w,
              height: 92.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(fileImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 1,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: onDeleteTap,
            behavior: HitTestBehavior.opaque,
            child: Icon(
              Icons.delete,
              color: AppColors.redColor,
              size: 23.r,
            ),
          ),
        )
      ],
    );
  }
}

class DisplayFile extends StatelessWidget {
  final FilePickerResult file;
  final VoidCallback onDeleteTap;
final int index;
  const DisplayFile({
    super.key,
    required this.file,
    required this.index,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15).r,
      margin: const EdgeInsets.symmetric(vertical: 8).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AppText(
              file.files[index].name.toString(),
              maxLine: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.circularStdRegular(context),
            ),
          ),
          GestureDetector(
            onTap: onDeleteTap,
            behavior: HitTestBehavior.opaque,
            child: Icon(
              Icons.delete,
              color: AppColors.redColor,
              size: 23.r,
            ),
          ),
        ],
      ),
    );
  }
}
