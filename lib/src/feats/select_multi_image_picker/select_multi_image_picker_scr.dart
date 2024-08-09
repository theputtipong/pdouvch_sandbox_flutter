import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'select_multi_image_picker_ctl.dart';
import 'select_multi_image_picker_model.dart';

class SelectMultiImagePicker extends StatelessWidget {
  const SelectMultiImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    SelectMultiImagePickerCtl ctl = Get.put(SelectMultiImagePickerCtl());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Multi Image Picker'),
      ),
      body: Obx(
        () => ctl.isLoading.value
            ? buildCircularProgressIndicator()
            : ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: ctl.photoPlots.length,
                itemBuilder: (BuildContext context, int index) {
                  ImagePlot valuePlot = ctl.photoPlots[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Obx(
                                () => ctl.trickImage.value
                                    ? const Center(child: CircularProgressIndicator())
                                    : Column(
                                        children: [
                                          valuePlot.fileUpload != null && valuePlot.fileUpload!.path.isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    // String image = valuePlot.fileUpload!.path;
                                                    // await Get.to(HeroImagePage(image: image, isLocal: true));
                                                  },
                                                  child: Image.file(
                                                    File(valuePlot.fileUpload!.path),
                                                    height: 120,
                                                    width: 120,
                                                    fit: context.isLandscape ? BoxFit.fitHeight : BoxFit.fitWidth,
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () async {
                                                    // String image = '${ctl.baseUrl}${valuePlot.after}';
                                                    // bool checkImage = await ctl.checkImageUrl(image);
                                                    // if (checkImage) {
                                                    //   await Get.to(HeroImagePage(image: image, isLocal: false));
                                                    // }
                                                  },
                                                  child: CachedNetworkImage(
                                                    imageUrl: 'http://68.183.187.67:8000${valuePlot.image}',
                                                    placeholder: (context, url) => SizedBox(
                                                      height: 120,
                                                      width: 120,
                                                      child: LinearProgressIndicator(
                                                        color: Get.theme.primaryColor,
                                                      ),
                                                    ),
                                                    errorWidget: (context, url, error) => const SizedBox(
                                                      height: 120,
                                                      width: 120,
                                                      child: Icon(Icons.error),
                                                    ),
                                                    fit: context.isLandscape ? BoxFit.fitHeight : BoxFit.fitWidth,
                                                    height: 120,
                                                    width: 120,
                                                  ),
                                                ),
                                          SizedBox(
                                            height: 40,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () async {
                                                    valuePlot.fileUpload = await ctl.pickFile(ImageSource.camera);
                                                    ctl.trickImage.refresh();
                                                  },
                                                  icon: const Icon(Icons.camera_alt_outlined),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                IconButton(
                                                  onPressed: () async {
                                                    valuePlot.fileUpload = await ctl.pickFile(ImageSource.gallery);
                                                    ctl.trickImage.refresh();
                                                  },
                                                  icon: const Icon(
                                                    Icons.photo_size_select_actual_rounded,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                    ],
                  );
                }),
      ),
    );
  }

  buildCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
