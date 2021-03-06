///Note file account_utils.dart

import 'package:flutter_booking_mobile_app/model/account.dart';

///Account utils
class AccountUtils {
  static final AccountUtils _singleton = AccountUtils._internal();

  AccountUtils._internal();

  factory AccountUtils() {
    return _singleton;
  }

  ///uid
  String uid;

  ///account
  Account account;

  void setAccount({
    String uid1,
    Account account1,
  }) {
    uid = uid1;
    account = account1;
  }
}
