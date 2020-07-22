import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:meta/meta.dart';

/// 这里是网络请求
class UserRepository {
  final String username;
  final String password;

  UserRepository({
    this.username,
    this.password,
  });

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
//    return true;
  }
}
