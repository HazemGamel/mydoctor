import 'dart:io';

import 'package:image_picker/image_picker.dart';

fileUploadGallary() async {
  XFile? result = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (result != null) {
    return File(result.path);
  } else {
    return null;
  }
}
