import 'package:flutter/material.dart';
import 'package:toktok/config/helpers/human_fortmats.dart';
import 'package:toktok/domain/entities/video_post.dart';
import 'package:animate_do/animate_do.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({
    super.key, 
    required this.video
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes, 
          icon: Icons.favorite, 
          color: Colors.red
        ),
        const SizedBox(height: 20,),
        _CustomIconButton(
          value: video.likes, 
          icon: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(height: 20,),
        Pulse(
          infinite: true,
          duration: const Duration(seconds: 3),
          child: const _CustomIconButton(
            value: 0,  
            icon: Icons.play_circle_outline,
          ),
        )
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color color;

  const _CustomIconButton({
    required this.value, 
    required this.icon, 
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {}, 
          icon: Icon(icon, color: color, size: 30,)
        ),
        if(value > 0)
        Text(HumanFormats.humanReadbleNumber(value.toDouble()), style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),)
      ],
    );
  }
}