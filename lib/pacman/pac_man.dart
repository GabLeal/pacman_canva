import 'package:flutter/material.dart';
import 'package:pacman/pacman/pac_man_canva.dart';

class PacMan extends StatefulWidget {
  const PacMan({Key? key}) : super(key: key);

  @override
  State<PacMan> createState() => _PacManState();
}

class _PacManState extends State<PacMan> with TickerProviderStateMixin {
  late AnimationController mouthController;
  late Animation mouthAnimation;

  late AnimationController foodController;
  late Animation foodAnimation;

  @override
  void initState() {
    super.initState();

    initMouthAnimation();
    initFoodAnimation();
  }

  void initMouthAnimation() {
    mouthController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    mouthAnimation = Tween<double>(begin: 100, end: 0).animate(
      CurvedAnimation(
        parent: mouthController,
        curve: Curves.easeInOut,
      ),
    );

    mouthController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        mouthController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        mouthController.forward();
      }
    });

    mouthController.forward();
  }

  void initFoodAnimation() {
    foodController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat();

    foodAnimation = Tween<double>(begin: 500, end: 0).animate(
      CurvedAnimation(
        parent: foodController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    mouthController.dispose();
    foodController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: mouthAnimation,
      builder: (context, _) {
        return AnimatedBuilder(
          animation: foodAnimation,
          builder: (context, _) {
            return Center(
              child: SizedBox(
                height: 230,
                width: 230,
                child: CustomPaint(
                  painter: PacManCanva(
                    mouthAnimation.value,
                    foodAnimation.value,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
