import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'select_multi_image_picker_model.dart';

class SelectMultiImagePickerCtl extends GetxController {
  final ImagePicker picker = ImagePicker();
  String subsiteId = "";

  RxBool isLoading = true.obs, trickImage = false.obs;
  RxList<ImagePlot> photoPlots = RxList<ImagePlot>([]);

  @override
  void onInit() {
    checkArgument();
    super.onInit();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  Future<void> checkArgument() async {
    if (Get.arguments != null) {
      subsiteId = Get.arguments;
      await getPhotoPlots();
    } else {
      // Get.back();
      //TODO: mock
      subsiteId = '36165';
      await getPhotoPlots();
    }
    isLoading.value = false;
  }

  checkAuthentication() async {
    var headers = {
      'user_name': 'contractor',
      'password': 'Diamond1234',
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://68.183.187.67:8000/login/api'));
    request.fields.addAll({'user_name': 'contractor', 'password': 'Diamond1234'});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 204) {
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
    } else {
      //error
    }
  }

  getPhotoPlots() async {
    var token = await checkAuthentication();
    var headers = {
      'Authorization': 'Token ${token["my_info"]["token"]}',
    };
    var request =
        http.Request('GET', Uri.parse('http://68.183.187.67:8000/subcontractor/job-submit/photo-plot/$subsiteId/api'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 204) {
      var data = photoplotJobsubmitModelFromJson(await response.stream.bytesToString());
      photoPlots.value = data.photoPlot?.images ?? [];
    } else {
      //error
    }
  }

  Future<XFile?> pickFile(ImageSource source) async {
    XFile? image;
    switch (source) {
      case ImageSource.camera:
        image = await picker.pickImage(source: ImageSource.camera);
        break;
      case ImageSource.gallery:
        List<XFile>? tempImages = await picker.pickMultiImage(limit: 10);
        if (tempImages.isNotEmpty) {
          image = tempImages.firstOrNull;
          if (tempImages.length > 1) {}
        }
        break;
    }
    return image;
  }

  Future<bool> checkImageUrl(String url) async {
    try {
      if (url.contains("http")) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
