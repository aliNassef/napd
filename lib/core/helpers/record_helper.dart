import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class RecordHelper {
  final AudioRecorder _recorder = AudioRecorder();
  bool _isInitialized = false;
  bool _isRecording = false;
  String? _filePath;

  Future<bool> initialize() async {
    if (_isInitialized) return true;
    try {
      if (!await _recorder.hasPermission()) {
        final status = await Permission.microphone.request();
        if (!status.isGranted) return false;
      }
      final directory = await getApplicationDocumentsDirectory();
      _filePath =
          '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.wav';
      await _recorder.start(const RecordConfig(encoder: AudioEncoder.wav),
          path: _filePath!);
      _isInitialized = true;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> startRecording() async {
    if (!_isInitialized || _isRecording) return false;
    try {
      await _recorder.start(const RecordConfig(encoder: AudioEncoder.wav),
          path: _filePath!);
      _isRecording = true;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> stopRecording() async {
    if (!_isRecording) return null;
    try {
      final path = await _recorder.stop();
      _isRecording = false;
      return path;
    } catch (e) {
      return null;
    }
  }

  Future<void> cancelRecording() async {
    if (!_isRecording) return;

    await _recorder.cancel();
    _isRecording = false;
  }

  Future<void> dispose() async {
    if (_isInitialized) {
      await _recorder.dispose();
      _isInitialized = false;
      _isRecording = false;
    }
  }

  String? getFilePath() => _filePath;
  bool isRecording() => _isRecording;
}
