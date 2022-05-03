import 'package:floria/scripts/productlist.dart';

class PurchaseFunctions {
  List setList(String lastproduct) {
    switch (lastproduct) {
      case 'Zambak':
        return gerbera;
      case 'Gül':
        return rose;
      case 'Papatya':
        return daisy;
      case 'Şakayık':
        return peony;
      default:
        return gerbera;
    }
  }

  String productCaller (productname){
    
    return productname;
  }

  
}
