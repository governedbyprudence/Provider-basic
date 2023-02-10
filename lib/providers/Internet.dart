import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class InternetProvider with ChangeNotifier {
  bool _isConnected = false;
  bool get isConnected => _isConnected;

 InternetProvider(){
   initialize();
 }
  void initialize()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    final subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result==ConnectivityResult.none){
        _isConnected = false;
      }
      else{
        _isConnected = true;
      }
      notifyListeners();
    });
  }
}