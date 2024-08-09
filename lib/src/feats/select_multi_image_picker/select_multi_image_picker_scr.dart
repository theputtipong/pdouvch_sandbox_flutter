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
      body: Obx(() => ctl.isLoading.value
          ? buildCircularProgressIndicator()
          : ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          await ctl.pickFile(source: ImageSource.camera, isReplace: false);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                            ),
                            Text('ถ่ายภาพ'),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await ctl.pickFile(source: ImageSource.gallery, isReplace: false);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.photo_size_select_actual_rounded,
                              size: 40,
                            ),
                            Column(
                              children: [
                                Text('เลือกภาพจากคลังภาพ'),
                                Text(
                                  '(ครั้งละไม่เกิน 10 รูป)',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Obx(() => ctl.photoPlots.isEmpty ? const Center(child: Text('ไม่พบรูปภาพ')) : buildGrid(ctl)),
              ],
            )),
    );
  }

  GridView buildGrid(SelectMultiImagePickerCtl ctl) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5.0, mainAxisSpacing: 5.0, childAspectRatio: 0.75),
      itemCount: ctl.photoPlots.length,
      itemBuilder: (context, index) {
        ImagePlot valuePlot = ctl.photoPlots[index];
        return Column(
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
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () async {
                      valuePlot.fileUpload = await ctl.pickFile(source: ImageSource.camera, isReplace: true);
                    },
                    icon: const Icon(Icons.camera_alt_outlined),
                  ),
                  IconButton(
                    onPressed: () async {
                      valuePlot.fileUpload = await ctl.pickFile(source: ImageSource.gallery, isReplace: true);
                    },
                    icon: const Icon(
                      Icons.photo_size_select_actual_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  buildCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
