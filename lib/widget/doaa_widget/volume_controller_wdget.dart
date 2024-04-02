import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

class volumeControllerWidget extends StatefulWidget {
  @override
  State<volumeControllerWidget> createState() => _volumeControllerWidgetState();
}

class _volumeControllerWidgetState extends State<volumeControllerWidget> {
  bool isMute = false;
  double _setVolumeValue = 0;
  @override
  void initState() {
    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.only(left: 5),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.black45,
              iconSize: 20,
            ),
            color: Colors.white,
            padding: const EdgeInsets.only(left: 0),
            onPressed: onMute,
            icon: Icon(
              (isMute || _setVolumeValue == 0)
                  ? Icons.volume_off
                  : Icons.volume_down,
            ),
          ),
        ),
        const SizedBox(width: 1),
        SizedBox(
          width: 70,
          child: SliderTheme(
            data: SliderThemeData(
              // thumbShape: SliderComponentShape.noThumb,
              thumbShape:  RoundSliderThumbShape(enabledThumbRadius: isMute?0: 7),
              overlayShape: SliderComponentShape.noOverlay,
              trackHeight:3,
            ),
            child: Slider(
              min: 0,
              max: 1,
              onChanged: (double value) {
                setState(() {
                  isMute = false;
                  _setVolumeValue = value;
                  VolumeController().setVolume(_setVolumeValue);
                });
              },
              value: _setVolumeValue,
              inactiveColor: Colors.black26,
              activeColor:
              isMute?
              Colors.black26:
              Colors.black87,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }

  onMute() {
    if (!isMute) {
      setState(() {
        isMute = true;
        VolumeController().muteVolume();
      });
    } else {
      setState(() {
        VolumeController().setVolume(_setVolumeValue);
        isMute = false;
      });
    }
  }
}
