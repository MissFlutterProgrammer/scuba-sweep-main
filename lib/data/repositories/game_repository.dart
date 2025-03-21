import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scuba_sweep/data/models/score_info_model.dart';

class GameRepository {
  GameRepository(this._firestore, this._auth);
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  Future<String> getNickname() async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      final doc = await _firestore.collection('highScores').doc(userId).get();
      if (doc.exists) {
        return doc.data()!['nickname'];
      }
    }
    return '';
  }

  Future<void> saveHighScore(int score, String nickname) async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      await _firestore.collection('highScores').doc(userId).set({
        'score': score,
        'nickname': nickname,
      });
    }
  }

  Future<void> saveNickname(String nickname) async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      await _firestore
          .collection('highScores')
          .doc(userId)
          .set({'nickname': nickname});
    }
  }

  Future<ScoreInfo?> getHighScore() async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      final doc = await _firestore.collection('highScores').doc(userId).get();
      if (doc.exists) {
        final score = ScoreInfo.fromJson(doc.data()!);
        return score;
      }
    }
    return null;
  }

  Future<List<ScoreInfo>> getTopHighScores() async {
    final querySnapshot = await _firestore
        .collection('highScores')
        .orderBy('score', descending: true)
        .limit(6)
        .get();
    return querySnapshot.docs
        .map<ScoreInfo>(
          (doc) => ScoreInfo.fromJson(doc.data()),
        )
        .toList();
  }
}
