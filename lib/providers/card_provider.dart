import 'package:flutter/material.dart';

import '../models/models.dart';

class CardProvider extends ChangeNotifier {
  List<CardModel> _flippedCards = [];

  void flipCard(CardModel card) {
    print('Flipped card: ' + card.toJson().toString());
    print('Flipped cards: ' + _flippedCards.toString());

    if (_flippedCards.contains(card)) {
      print('Card already flipped: ' + card.toJson().toString());
    } else {
      if (_flippedCards.length < 2) {
        _flippedCards.add(card);
      } else {
        _flippedCards = [];
      }
    }
    notifyListeners();
  }

  bool isCardFlipped(CardModel card) {
    return _flippedCards.contains(card);
  }

  void resetFlippedCards() {
    _flippedCards.clear();
    notifyListeners();
  }
}
