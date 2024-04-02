import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tunes/widget/doaa_widget/volume_controller_wdget.dart';

import '../../shared/dowa_provider_model.dart';



class PlayerWidget extends StatelessWidget {

List<String>listNameFile=  DowaProviderModel.listNameFileSound;

late int index;

@override

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<DowaProviderModel>(context);
    index=provider.index;
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          )),
      padding: const EdgeInsets.only(left: 5, bottom: 5),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              provider.onClick(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Icon(
                  provider.isPlay ?
                  Icons.pause :
                  Icons.play_circle,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              provider.onStop();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.stop_circle_rounded,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ),
// وقت  الصوت
          SizedBox(
            width: 40,
            child: Center(
              child: Text(
                "${provider.currentDuration.inMinutes.toString()}:${provider.currentDuration.inSeconds.toString()}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Flexible(
            child: SliderTheme(
              data: SliderThemeData(
                // thumbShape: SliderComponentShape.noThumb,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
                overlayShape: SliderComponentShape.noOverlay,
                trackHeight: 5,
              ),
              child: Slider(
                inactiveColor: Colors.black26,
                activeColor: Colors.black,
                min: 0,
                max: provider.soundLengthAll.inSeconds.toDouble(),
                onChanged: (double value) {
                  provider.onSeek(value.toInt());

                },
                value: provider.currentDuration.inSeconds.toDouble(),
              ),
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: 50,
            child: Center(
              child: Text(
                "${provider.soundLengthAll.inMinutes.toString()}:"
                    "${provider.soundLengthAll.inSeconds.toString()}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // زيادة و تقليل الصوت
          volumeControllerWidget()
        ],
      ),
    );
  }}
