///Note file profile_bloc.dart

import 'dart:io';
import 'package:rxdart/rxdart.dart';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_booking_mobile_app/model/account.dart';
import 'package:flutter_booking_mobile_app/base/base_bloc.dart';
import 'package:flutter_booking_mobile_app/base/flutter_show_toast.dart';
import 'package:flutter_booking_mobile_app/app/fire_base/fire_base_auth.dart';

///
class ProfileBloc extends BaseBloc {
  /// khởi tạo stream
  BehaviorSubject<Account> accountStream = new BehaviorSubject();
  BehaviorSubject<UIState> accountStateStream = new BehaviorSubject();
  BehaviorSubject<File> fileIamgeStream = new BehaviorSubject();

  @override
  void dispose() {
    accountStream.close(); ///
    accountStateStream.close(); ///
    fileIamgeStream.close(); ///
  }

  @override
  void init() {
    _getAccount(); ///
  }

  /// lấy tài khoản
  void _getAccount() async {
    try {
      accountStateStream.add(UIState.LOADING); ///
      FirAuth().getUserByUID((val) {
        accountStream.add(val);
      });
      accountStateStream.add(UIState.SUCCESS); ///
    } catch (e) {
      accountStateStream.add(UIState.ERROR); ///
      FlutterToast().showToast(e.message); ///
    }
  }



  ///Get image from library lấy hính ảnh từ thư viên
  void getImageByGallery(ImagePicker picker) async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      File _file = File(pickedFile.path);
      fileIamgeStream.add(_file);
    } catch (e) {
      FlutterToast().showToast(e.message);
    }
  }

  ///Get image from camera
  void getImageByCamera(ImagePicker picker) async {
    try {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      File _file = File(pickedFile.path);
      fileIamgeStream.add(_file);
    } catch (e) {
      FlutterToast().showToast(e.message);
    }
  }


}
