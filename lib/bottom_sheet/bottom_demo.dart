// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';


class ModalBottomSheetDemo extends StatelessWidget {
  static const String routeName = '/material/modal-bottom-sheet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal bottom sheet'),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text('SHOW BOTTOM SHEET'),
          onPressed: () {
            showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
              return Container(
                height: 50,
                alignment: Alignment.center,
                child:  Text('test', textAlign: TextAlign.center,),
              );
            });
          },
        ),
      ),
    );
  }
}