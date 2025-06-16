import 'package:dio/dio.dart';

class ChatRemoteSource {
  final Dio dio;
  final String apiKey;

  ChatRemoteSource({required this.dio, required this.apiKey});

  Future<String> getGeminiAnswer(String question) async {
    final String prompt = '''
    أنت خبير في مجال الأمومة ورعاية الأطفال والتغذية الخاصة بهما.
    مهمتك هي الإجابة فقط على الأسئلة المتعلقة برعاية الأم والطفل، والتغذية، والوصفات المناسبة لهما.
    قدم معلومات دقيقة ومختصرة ومفيدة في **خمس نقاط محددة فقط**.
    تجنب الإجابة على أي أسئلة خارج هذا النطاق.
    الرد يجب أن يكون باللغة ${question.contains(RegExp('[أ-ي]')) ? 'العربية' : 'الإنجليزية'}.

    السؤال: $question
    ''';

    final String apiUrl =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey';

    final Map<String, dynamic> requestBody = {
      "contents": [
        {
          "parts": [
            {"text": prompt}
          ]
        }
      ],
      "generationConfig": {
        "temperature": 0.7,
        "maxOutputTokens": 300,
        "topP": 0.95,
        "topK": 40,
      }
    };

    try {
      final response = await dio.post(
        apiUrl,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: requestBody,
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData['candidates'] != null &&
            responseData['candidates'].isNotEmpty &&
            responseData['candidates'][0]['content'] != null &&
            responseData['candidates'][0]['content']['parts'] != null &&
            responseData['candidates'][0]['content']['parts'].isNotEmpty) {
          return responseData['candidates'][0]['content']['parts'][0]['text'];
        } else {
          throw Exception('No valid answer received from Gemini.');
        }
      } else {
        throw Exception(
            'Error: ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Network error or unable to process response: $e');
    }
  }
}
