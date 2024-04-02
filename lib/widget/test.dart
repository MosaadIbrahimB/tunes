import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  double _volumeListenerValue = 0;
  double _getVolume = 0;
  double _setVolumeValue = 0;
  double currentVol = 0;
  bool isMute = false;

  @override
  void initState() {
    super.initState();
    // Listen to system volume change
    VolumeController().listener((volume) {
      setState(() => _volumeListenerValue = volume);
    });

    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Volume Plugin example app'),
        ),
        body: Column(
          children: [
            Text('Current volume: ${(_volumeListenerValue * 100).toInt()}'),
            Row(
              children: [
                Text('Set Volume:'),
                Flexible(
                  child: Slider(
                    min: 0,
                    max: 1,
                    onChanged: (double value) {
                      _setVolumeValue = value;
                      currentVol = value;
                      VolumeController().setVolume(_setVolumeValue);
                      setState(() {});
                    },
                    value: _setVolumeValue,
                  ),
                ),
                IconButton(
                    onPressed: onMute,
                    icon: Icon(
                        _volumeListenerValue > 0
                        ? Icons.volume_down
                        : Icons.volume_off)
                ,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Volume is: $_getVolume'),
                TextButton(
                  onPressed: () async {
                    _getVolume = await VolumeController().getVolume();
                    setState(() {});
                  },
                  child: Text('Get Volume'),
                ),
              ],
            ),
            TextButton(
              onPressed: () => onMute(),
              child: Text('Mute Volume'),
            ),
            TextButton(
              onPressed: () => VolumeController().maxVolume(),
              child: Text('Max Volume'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show system UI:${VolumeController().showSystemUI}'),
                TextButton(
                  onPressed: () => setState(() => VolumeController()
                      .showSystemUI = !VolumeController().showSystemUI),
                  child: Text('Show/Hide UI'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  onMute() {
    if (!isMute) {
      VolumeController().muteVolume();
      isMute = true;
    } else {
      VolumeController().setVolume(currentVol);
      isMute = false;
    }
  }
}
