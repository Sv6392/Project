import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class CheckPermission {

  isStoragePermission() async {
    var isStoragePermission = await Permission.storage.status;
    var isAccessMediaLocationPermission = await Permission.accessMediaLocation.status;
    var isManageExternalResourcesPermission = await Permission.manageExternalStorage.status;
    if (!isStoragePermission.isGranted || !isAccessMediaLocationPermission.isGranted || !isManageExternalResourcesPermission.isGranted) {
      await Permission.storage.request();
      await Permission.manageExternalStorage.request();
      await Permission.accessMediaLocation.request();
      if (!isStoragePermission.isGranted || !isAccessMediaLocationPermission.isGranted || !isManageExternalResourcesPermission.isGranted) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  static  Future<bool> requestStoragePermission() async {
   
    PermissionStatus storageStatus = await Permission.storage.status;
    // PermissionStatus mediaLocationStatus = await Permission.accessMediaLocation.status;
    // PermissionStatus cameraStatus = await Permission.camera.status;
    // PermissionStatus microphoneStatus = await Permission.microphone.status;
    log("this is a storage permission $storageStatus");

    if (storageStatus.isDenied || storageStatus.isPermanentlyDenied) {
      log("this is access for permissin ");
      storageStatus = await Permission.storage.request();
    }

    // if (mediaLocationStatus.isDenied || mediaLocationStatus.isPermanentlyDenied) {
    //   mediaLocationStatus = await Permission.accessMediaLocation.request();
    // }

    // if (cameraStatus.isDenied || cameraStatus.isPermanentlyDenied) {
    //   cameraStatus = await Permission.camera.request();
    // }

    // if (microphoneStatus.isDenied || microphoneStatus.isPermanentlyDenied) {
    //   microphoneStatus = await Permission.microphone.request();
    // }

    return storageStatus.isGranted  ;
    // &&
    //     mediaLocationStatus.isGranted &&
    //     cameraStatus.isGranted &&
    //     microphoneStatus.isGranted;
  }
  }
