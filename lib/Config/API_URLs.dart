import 'package:itretail/Config/config.dart';

const String BaseURL = "https://admin.itretail.saurabhenterprise.com/";
const String UploadURL = "${BaseURL}uploads/";


class APIs{
  static String loginURL = BaseURL+"login.php";
  static String addCustomer = BaseURL+"registerUser.php";
  static String getAllCustomer = BaseURL+"admin_getAllUsers.php";
  static String getUserOnBoarding = BaseURL+"getOnBoarding.php";
}