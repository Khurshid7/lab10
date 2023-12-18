import 'package:flutter/material.dart';

class AnimatedCustomCard extends StatefulWidget {
  final String title;
  final String content;

  const AnimatedCustomCard({required this.title, required this.content});

  @override
  _AnimatedCustomCardState createState() => _AnimatedCustomCardState();
}

class _AnimatedCustomCardState extends State<AnimatedCustomCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Card(
            elevation: 7,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(widget.content),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedTextField extends StatefulWidget {
  @override
  _AnimatedTextFieldState createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _translateAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _translateAnimation,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Transform.translate(
            offset: Offset(_translateAnimation.value, 0.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Animated TextField',
                border: OutlineInputBorder(),
              ),
              onTap: () {
                _animationController.forward();
              },
              onSubmitted: (value) {
                _animationController.reverse();
              },
            ),
          ),
        );
      },
    );
  }
}



class AniButton extends StatefulWidget {
  @override
  _AniButtonState createState() => _AniButtonState();
}

class _AniButtonState extends State<AniButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 100,
              height: 50,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  'Bigger!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
