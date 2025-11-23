import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:islami/core/api/api_manager.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/main_layout/radio/models/radio_model.dart';
import 'package:islami/main_layout/radio/models/reciters_model.dart';
import 'package:just_audio/just_audio.dart';

class RadioProvider extends ChangeNotifier {
  RadioProvider() {
    getRadio();
  }
  int currentValue = 0;

  void changeValue(int value) {
    currentValue = value;
    notifyListeners();
  }

  TextStyle textStyleSwitcher(int index) {
    final TextStyle baseStyle = TextStyle(
      color: AppColors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    final bool isSelected = currentValue == index;
    return isSelected ? baseStyle : baseStyle.copyWith(color: AppColors.white);
  }

  bool radioLoading = false; // loading state
  String radioFailureMessage = ''; // failure state
  List<Radios> radios = []; // success state

  Future<void> getRadio() async {
    radioLoading = true; // loading state
    notifyListeners();
    try {
      // success state
      RadioModel radioModel = await ApiManager.getRadios();
      radios = radioModel.radios ?? [];
      radioLoading = false;
      notifyListeners();
    } catch (exception) {
      // failure state
      radioFailureMessage = "Something went wrong, please try again";
      log(exception.toString());
      radioLoading = false;
      notifyListeners();
    }
  }

  bool recitersLoading = false; // loading state
  String recitersFailureMessage = ''; // failure state
  List<Reciters> reciters = []; // success state

  Future<void> getReciters() async {
    recitersLoading = true; // loading state
    notifyListeners();
    try {
      // success state
      RecitersModel recitersModel = await ApiManager.getReciters();
      reciters = recitersModel.reciters ?? [];
      recitersLoading = false;
      notifyListeners();
    } catch (exception) {
      // failure state
      recitersFailureMessage = "Something went wrong, please try again";
      log(exception.toString());
      recitersLoading = false;
      notifyListeners();
    }
  }

  final AudioPlayer player = AudioPlayer();
  Radios? selecteRadio;
  Reciters? selectedReciter;
  Radios? selectedVolume;
  int _currentSura = 1;
  String get formattedSuraIndex => _currentSura.toString().padLeft(3, '0');

  Future<void> playRadio(Radios radio) async {
    if (selecteRadio == radio) {
      await player.pause();
      selecteRadio = null;
    } else {
      await player.setUrl(radio.url ?? '');
      player.play();
      selecteRadio = radio;
    }
    notifyListeners();
  }

  Future<void> changeVolume(Radios radio) async {
    if (selectedVolume == radio) {
      await player.setVolume(1);
      selectedVolume = null;
    } else {
      await player.setVolume(0);
      selectedVolume = radio;
    }
    notifyListeners();
  }

  Future<void> playReciters(Reciters reciter) async {
    if (selectedReciter == reciter) {
      await player.pause();
      selectedReciter = null;
    } else {
      String url = '${reciter.moshaf?.first.server}$formattedSuraIndex.mp3';
      await player.setUrl(url);
      player.play();
      selectedReciter = reciter;
    }
    notifyListeners();
  }

  Future<void> nextSura(Reciters reciter) async {
    if (_currentSura < 114) {
      _currentSura++;
      await player.pause();
      String url = '${reciter.moshaf?.first.server}$formattedSuraIndex.mp3';
      await player.setUrl(url);
      player.play();
      selectedReciter = reciter;
      notifyListeners();
    }
  }

  Future<void> previousSura(Reciters reciter) async {
    if (_currentSura > 1) {
      _currentSura--;
      await player.pause();
      String url = '${reciter.moshaf?.first.server}$formattedSuraIndex.mp3';
      await player.setUrl(url);
      player.play();
      selectedReciter = reciter;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
}
