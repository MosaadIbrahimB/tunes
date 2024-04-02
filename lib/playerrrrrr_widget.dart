// import 'dart:async';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:tunes/screen/dowa_sound_screen.dart';
//
//
//
//
// class PlayerrrrrWidget extends StatefulWidget {
// AudioPlayer player = AudioPlayer();
// static String playerStatePass="";
//
// PlayerrrrrWidget({required this.player});
//
//
//   @override
//   State<StatefulWidget> createState() {
//     return _PlayerrrrrWidgetState();
//   }
// }
//
// class _PlayerrrrrWidgetState extends State<PlayerrrrrWidget> {
//   PlayerState? _playerState;
//   Duration? _duration;
//   Duration? _position;
//
//   StreamSubscription? _durationSubscription;
//   StreamSubscription? _positionSubscription;
//   StreamSubscription? _playerCompleteSubscription;
//   StreamSubscription? _playerStateChangeSubscription;
//
//   bool get _isPlaying => _playerState == PlayerState.playing;
//
//   bool get _isPaused => _playerState == PlayerState.paused;
//
//   String get _durationText => _duration?.toString().split('.').first ?? '';
//
//   String get _positionText => _position?.toString().split('.').first ?? '';
//
//   // AudioPlayer get player => player;
//
//   @override
//   void initState() {
//     super.initState();
//     _playerState =widget. player.state;
//     widget.player.getDuration().then((value) => setState(() {
//         _duration = value;
//       })
//     );
//     widget. player.getCurrentPosition().then((value) => setState(() {
//         _position = value;
//       }));
//
// //---------------------------------------------
//     widget.player.setReleaseMode(ReleaseMode.stop);
//     WidgetsBinding.instance.addPostFrameCallback(
//           (_) async {
// print("QuranScreen.index ${DowaScreen.index}");
//         await widget.player.play(AssetSource(DowaScreen.listNameFileSound[DowaScreen.index]));
//         await widget.player.resume();
//
//       },
//     );
// //--------------------------------
//     _initStreams();
//   }
//
//   @override
//   void setState(VoidCallback fn) {
//     // Subscriptions only can be closed asynchronously,
//     // therefore events can occur after widget has been disposed.
//     if (mounted) {
//       super.setState(fn);
//     }
//   }
//
//   @override
//   void dispose() {
//     _durationSubscription?.cancel();
//     _positionSubscription?.cancel();
//     _playerCompleteSubscription?.cancel();
//     _playerStateChangeSubscription?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Color color =Colors.white ;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               key: const Key('play_button'),
//               onPressed: _isPlaying ? null : _play,
//               iconSize: 48.0,
//               icon: const Icon(Icons.play_arrow),
//               color: color,
//             ),
//             IconButton(
//               key: const Key('pause_button'),
//               onPressed: _isPlaying ? _pause : null,
//               iconSize: 48.0,
//               icon: const Icon(Icons.pause),
//               color: color,
//             ),
//             IconButton(
//               key: const Key('stop_button'),
//               onPressed: _isPlaying || _isPaused ? _stop : null,
//               iconSize: 48.0,
//               icon: const Icon(Icons.stop),
//               color: color,
//             ),
//           ],
//         ),
//         Slider(
//           activeColor: Colors.brown[400],
//           onChanged: (value) {
//             final duration = _duration;
//             if (duration == null) {
//               return;
//             }
//             final position = value * duration.inMilliseconds;
//             widget.player.seek(Duration(milliseconds: position.round()));
//           },
//           value: (_position != null &&
//               _duration != null &&
//               _position!.inMilliseconds > 0 &&
//               _position!.inMilliseconds < _duration!.inMilliseconds)
//               ? _position!.inMilliseconds / _duration!.inMilliseconds
//               : 0.0,
//         ),
//         Text(
//           _position != null
//               ? '$_positionText / $_durationText'
//               : _duration != null
//               ? _durationText
//               : '',
//           style: const TextStyle(fontSize: 16.0),
//         ),
//       ],
//     );
//   }
//
//   void _initStreams() {
//     _durationSubscription =  widget. player.onDurationChanged.listen((duration) {
//       setState(() => _duration = duration);
//     });
//
//     _positionSubscription =  widget. player.onPositionChanged.listen(
//           (p) => setState(() => _position = p),
//     );
//
//     _playerCompleteSubscription =  widget. player.onPlayerComplete.listen((event) {
//       setState(() {
//         _playerState = PlayerState.stopped;
//         _position = Duration.zero;
//       });
//     });
//
//     _playerStateChangeSubscription =
//           widget.player.onPlayerStateChanged.listen((state) {
//           setState(() {
//             _playerState = state;
//           });
//         });
//   }
//
//   Future<void> _play() async {
//     await   widget.player.resume();
//     setState(() => _playerState = PlayerState.playing);
//
//     PlayerrrrrWidget.playerStatePass=_playerState.toString();
//     // print("_playerState $_playerState");
//   }
//
//   Future<void> _pause() async {
//     await   widget.player.pause();
//     setState(() => _playerState = PlayerState.paused);
//     PlayerrrrrWidget.playerStatePass=_playerState.toString();
//     // print("_playerState $_playerState");
//   }
//
//   Future<void> _stop() async {
//     await   widget.player.stop();
//     setState(() {
//       _playerState = PlayerState.stopped;
//       _position = Duration.zero;
//       PlayerrrrrWidget.playerStatePass=_playerState.toString();
//     });
//     // print("_playerState $_playerState");
//
//   }
// }
//
// //#endregion