import 'package:file_picker/file_picker.dart';
import 'package:flight_booking/Utilities/Methods/Functions/save_selected_user_avatar.dart';
import 'package:get/get.dart';
import '../../../Screens/Login Screen/Controller/login_screen_controller.dart';
import 'error_snackBar_message.dart';

final loginScreenController = Get.find<LoginScreenController>();

void uploadUserAvatar() async{
  final photo = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['png', 'jpg']
  );
  if (photo == null){
    showErrorSnackBarMessage(
        title: 'Empty File',
        message: 'Sorry No File Was Selected',
    );
  }
  final path = photo?.files.single.path;
  loginScreenController.loadUserAvatarPath(path!);
  saveSelectedUserAvatar();
}