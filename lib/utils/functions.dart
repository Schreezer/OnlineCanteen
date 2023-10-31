import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
  print("no image selected");
}

bool isValidPhoneNumber(String phoneNumber) {
  // Regular expression pattern to match a valid phone number
  RegExp regex = RegExp(r'^\+?[1-9]\d{1,14}$');

  // Check if the phone number matches the pattern
  if (regex.hasMatch(phoneNumber)) {
    return true;
  } else {
    return false;
  }
}

var VerificationId = '';
