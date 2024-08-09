import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'select_multi_image_picker_ctl.dart';

class SelectMultiImagePicker extends StatelessWidget {
  const SelectMultiImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    SelectMultiImagePickerCtl ctl = Get.put(SelectMultiImagePickerCtl());
    return Scaffold(
      body: Container(),
    );
  }
}
