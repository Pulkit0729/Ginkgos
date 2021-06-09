import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class OtpIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(child: SizedBox(), flex: 1),
          Expanded(flex: 2, child: SvgPicture.asset('images/otp.svg')),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text('OTP Verification',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)))),
          ),
        ],
      ),
    );
  }
}
