import "package:flutter/material.dart";

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
