
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final focusOne = FocusNode();
  final focusTwo = FocusNode();
  final formKey = GlobalKey<FormState>();
  // final _authRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  void moveFocus(FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(current.context!).requestFocus(next);
  }


//================login With Otp


  // Future<void> loginWithOtp(
  //   Map<String, dynamic> data,
  //   Map<String, String> headers,
  //   BuildContext context,
  // ) async {
  //   setLoading(true);
  //   try {
  //     final response = await _authRepo.loginApi(data, headers);
  //     if (kDebugMode) {
  //       print("Login API Response: $response");
  //     }

  //     if (response['status'] == true) {
  //       final loginResponse = LoginResponseModel.fromJson(response);
  //       final currentContext = context;
  //       if (kDebugMode) {
  //         print(
  //           "Parsed LoginResponseModel: ${jsonEncode(loginResponse.toJson())}",
  //         );
  //       }

  //       // Check mounted before UI operations
  //       if (currentContext.mounted) {
  //         Utils.flushBarSuccessMessage("OTP sent successfully", context);
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (_) => OtpScreen(email: loginResponse.user.email),
  //           ),
  //         );
  //       }
  //     } else {
  //       final errorMessage =
  //           response['message'] ?? 'Invalid email or request failed';
  //       if (context.mounted) {
  //         Utils.flushBarErrorMassage(errorMessage, context);
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) print("OTP Login error: $e");
  //     if (context.mounted) {
  //       Utils.flushBarErrorMassage("Invalid email or request failed", context);
  //     }
  //   } finally {
  //     setLoading(false);
  //   }
  // }


//================Verify Otp



  // Future<void> verifyOtp({
  //   required String email,
  //   required int otp,
  //   required BuildContext context,
  // }) async {
  //   setLoading(true);
  //   final data = {"email": email, "otp": otp};
  //   final headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };

  //   try {
  //     final response = await _authRepo.verifyOtpApi(data, headers);
  //     debugPrint("OTP Verified: $response");
  //     final loginResponse = LoginResponseModel.fromJson(response);
  //     await UserPreferences().saveUser(loginResponse);
  //     debugPrint("User saved after OTP verification");
  //     final currentContext = context;

  //     if (currentContext.mounted) {
  //       Navigator.pushReplacementNamed(
  //         context,
  //         RoutesName.homeView,
  //         arguments: email,
  //       );
  //       Utils.flushBarSuccessMessage("OTP verified successfully", context);
  //     }
  //   } catch (e) {
  //     debugPrint("OTP Verification Error: $e");
  //     if (context.mounted) {
  //       Utils.flushBarErrorMassage("Invalid OTP", context);
  //     }
  //     rethrow;
  //   } finally {
  //     setLoading(false);
  //   }
  // }

//================Resend Otp


  // Future<void> resendOtp({
  //   required String email,
  //   required BuildContext context,
  // }) async {
  //   final data = {"email": email};
  //   final headers = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //   };

  //   try {
  //     final currentContext = context;
  //     final response = await _authRepo.resendOtpApi(data, headers);
  //     if (currentContext.mounted) {
  //       Utils.flushBarSuccessMessage("OTP resent successfully", context);
  //     }
  //     if (kDebugMode) {
  //       print("Resend OTP Response: $response");
  //     }
  //   } catch (e) {
  //     if (context.mounted) {
  //       Utils.flushBarErrorMassage("Failed to resend OTP", context);
  //     }
  //   }
  // }



//================Logout

  // Future<void> logout(BuildContext context) async {
  //   try {
  //     final user = await UserPreferences().getUser();
  //     await UserPreferences().clearUser();

  //     if (user != null && user.token.isNotEmpty) {
  //       final headers = {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer ${user.token}",
  //       };
  //       _authRepo.logoutApi(headers).catchError((e) {
  //         debugPrint("Logout API error: $e");
  //       });
  //     }
  //     final currentContext = context;

  //     if (currentContext.mounted) {
  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (_) => const OnboardingView()),
  //         (route) => false,
  //       );
  //       Utils.flushBarSuccessMessage("Logged out successfully", context);
  //     }
  //   } catch (e) {
  //     debugPrint("Logout error: $e");
  //     if (context.mounted) {
  //       Utils.flushBarErrorMassage("Logout failed", context);
  //     }
  //   }
  // }

  @override
  void dispose() {
    emailController.dispose();
    focusOne.dispose();
    focusTwo.dispose();
    super.dispose();
  }
}
