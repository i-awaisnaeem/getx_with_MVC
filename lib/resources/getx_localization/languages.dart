
import 'package:get/get.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String,String>> get keys => {

    'en_US' : {
      'Language' : 'English',
      // We can add more text here, like below
      'Network_Exception' : 'No Internet \n Please Check your Internert connection'
    },
    'ur_UR' : {
      'Language' : 'Urdu'
    }

  };

}