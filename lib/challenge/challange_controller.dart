

import 'package:flutter/foundation.dart';

class ChallangeControler {

    final currentPageNotifier = ValueNotifier<int>(0);
    int get currentPage => currentPageNotifier.value;
    set currentPage (int value) => currentPageNotifier.value = value;
    
    int qntAcertos = 0;

}