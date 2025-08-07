import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aventeds/res/components/app_color.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const CustomVideoPlayer({super.key, required this.videoUrl});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    // Check if videoUrl is valid before initializing
    if (widget.videoUrl.isNotEmpty && Uri.tryParse(widget.videoUrl) != null) {
      _controller = VideoPlayerController.network(widget.videoUrl)
        ..initialize()
            .then((_) {
              setState(() {});
            })
            .catchError((error) {
              // Handle video loading errors
              print('Video loading error: $error');
              setState(() {});
            });
    }
  }

  @override
  void dispose() {
    if (widget.videoUrl.isNotEmpty && Uri.tryParse(widget.videoUrl) != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _togglePlayPause() {
    if (widget.videoUrl.isEmpty || Uri.tryParse(widget.videoUrl) == null) {
      return; // Do nothing if no valid video URL
    }

    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // You can replace with Responsive.h(25)

      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/welcome_card.png'),
          fit: BoxFit
              .cover, // This makes the image fill and crop to fit the container
        ),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green[700]!, Colors.green[900]!],
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:
                (widget.videoUrl.isNotEmpty &&
                    Uri.tryParse(widget.videoUrl) != null)
                ? (_controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: _togglePlayPause,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xCCECAD00).withOpacity(0.8),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    _isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: AppColor.textColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.videocam_off,
                          color: AppColor.textColor,
                          size: 40,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'No video available',
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),

          // Decorative lines
        ],
      ),
    );
  }
}
