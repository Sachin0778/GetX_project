import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/presentation/controllers/voice/voice_controller.dart';

class VoicePage extends StatelessWidget {
  const VoicePage({super.key});
  @override
  Widget build(BuildContext context) {
    final VoiceController controller = Get.put(VoiceController());

    return Scaffold(
      appBar: AppBar(title: Text('voice'.tr)),
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.text.value, style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                if (controller.isListening.value) {
                  controller.stopListening();
                } else {
                  controller.startListening();
                }
              },
              child: Icon(controller.isListening.value ? Icons.mic : Icons.mic_off),
            ),
            SizedBox(height: 30),
            Text('Recognized Speech:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.speechList.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Text('#${index + 1}'),
                  title: Text(controller.speechList[index]),
                  trailing: Obx(() {
                    final isCurrent = controller.currentIndex.value == index;
                    if (isCurrent && controller.isPlaying.value) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.pause),
                            onPressed: controller.pauseSpeech,
                          ),
                          Text('${controller.estimatedDuration.value.toStringAsFixed(1)}s'),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.play_arrow),
                            onPressed: () => controller.playSpeech(controller.speechList[index], index),
                          ),
                          Text('${controller.estimateDuration(controller.speechList[index]).toStringAsFixed(1)}s'),
                        ],
                      );
                    }
                  }),
                ),
              )),
            ),
          ],
        )),
      ),
    );
  }
}