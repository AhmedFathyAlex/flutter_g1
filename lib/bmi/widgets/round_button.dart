import 'package:flutter/widgets.dart';
import 'package:flutter_g1/bmi/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key,required this.icon , this.onClick});
  final Widget icon;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 42,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.grey
        ),
        child: icon,
      ),
    );
  }
}