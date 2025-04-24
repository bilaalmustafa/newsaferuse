import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> launchAppUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  static void launchDialer(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
  }

  static Future<File> _compressImage({
    required File file,
    int quality = 75,
    int maxWidth = 600,
    int maxHeight = 600,
    String targetPath = '',
  }) async {
    final image = img.decodeImage(await file.readAsBytes());
    final resizedImage = img.copyResize(
      image!,
      width: maxWidth,
      height: maxHeight,
    );
    final compressedBytes = img.encodeJpg(resizedImage, quality: quality);
    final compressedFile = File(targetPath)
      ..writeAsBytesSync(Uint8List.fromList(compressedBytes));
    return compressedFile;
  }

  static Future<File> getCompressedFile(File imageFile) async {
    final directory = await getTemporaryDirectory();
    final targetPath = '${directory.path}/compressed_image.jpg';
    final compressedImage = await _compressImage(
      file: imageFile,
      targetPath: targetPath,
    );

    return compressedImage;
  }
}
