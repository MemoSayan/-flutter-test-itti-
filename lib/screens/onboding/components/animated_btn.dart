import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

/*
 * @autor: Guillermo De la cruz  
 * @since: 22/05/2023
 * 
 */

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
          height: 64,
          width: double.infinity,
          child: Stack(
            children: [
              RiveAnimation.asset(
                "assets/RiveAssets/button.riv",
                controllers: [_btnAnimationController],
              ),
              const Positioned.fill(
                top: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      color: Color.fromARGB(255, 238, 79, 129),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Iniciar Sesión",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
