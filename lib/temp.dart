import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MotherBabyInfoApp());
}

class MotherBabyInfoApp extends StatelessWidget {
  const MotherBabyInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Mother & Baby Info',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter', // Using Inter font as requested
      ),
      home: const MotherBabyInfoScreen(),
    );
  }
}

class MotherBabyInfoScreen extends StatefulWidget {
  const MotherBabyInfoScreen({super.key});

  @override
  State<MotherBabyInfoScreen> createState() => _MotherBabyInfoScreenState();
}

class _MotherBabyInfoScreenState extends State<MotherBabyInfoScreen> {
  // IMPORTANT: In a real-world application, never hardcode your API key directly
  // in client-side code. Use environment variables or a secure backend.
  // For this Canvas environment demonstration, we'll use a placeholder.
  final String _apiKey = "YOUR_GEMINI_API_KEY"; // Replace with your actual Gemini API Key

  final TextEditingController _questionController = TextEditingController();
  String _answerText = 'Enter your question about new mothers or babies above!';
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  // Function to call the Gemini API
  Future<void> _getGeminiAnswer() async {
    // Clear any previous error messages
    setState(() {
      _errorMessage = null;
      _isLoading = true;
      _answerText = 'Fetching answer...';
    });

    // Construct the prompt with specific instructions for the Gemini model
    // This includes persona, task, and format constraints (5 points, concise)
    final String prompt = '''
    أنت خبير في مجال الأمومة ورعاية الأطفال والتغذية الخاصة بهما.
    مهمتك هي الإجابة فقط على الأسئلة المتعلقة برعاية الأم والطفل، والتغذية، والوصفات المناسبة لهما.
    قدم معلومات دقيقة ومختصرة ومفيدة في **خمس نقاط محددة فقط**.
    تجنب الإجابة على أي أسئلة خارج هذا النطاق.
    الرد يجب أن يكون باللغة العربية.
    
    السؤال: ${_questionController.text}
    ''';

    // Gemini API endpoint for gemini-2.0-flash model
    final String apiUrl =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$_apiKey';

    final Map<String, dynamic> requestBody = {
      "contents": [
        {
          "parts": [
            {"text": prompt}
          ]
        }
      ],
      "generationConfig": {
        "temperature": 0.7, // Controls randomness. Lower for more deterministic answers.
        "maxOutputTokens": 300, // Limit the response length to encourage conciseness for 5 points.
        "topP": 0.95,
        "topK": 40,
      }
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['candidates'] != null &&
            responseData['candidates'].isNotEmpty &&
            responseData['candidates'][0]['content'] != null &&
            responseData['candidates'][0]['content']['parts'] != null &&
            responseData['candidates'][0]['content']['parts'].isNotEmpty) {
          setState(() {
            _answerText = responseData['candidates'][0]['content']['parts'][0]['text'];
          });
        } else {
          setState(() {
            _answerText = 'No valid answer received from Gemini.';
          });
        }
      } else {
        // Handle non-200 responses (e.g., API errors, rate limits)
        setState(() {
          _errorMessage =
              'Error: ${response.statusCode} - ${response.body}';
          _answerText = 'Failed to get answer.';
        });
      }
    } catch (e) {
      // Handle network or parsing errors
      setState(() {
        _errorMessage = 'An error occurred: $e';
        _answerText = 'Network error or unable to process response.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Mother & Baby Info Hub', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink.shade300,
        centerTitle: true,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // User input text field
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.pink.shade50,
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.shade100.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _questionController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'اسأل عن رعاية الطفل، تغذية الأم، وصفات للأطفال...',
                  hintStyle: TextStyle(color: Colors.pink.shade400.withOpacity(0.7)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15.0),
                  prefixIcon: Icon(Icons.question_answer, color: Colors.pink.shade400),
                ),
                style: TextStyle(color: Colors.pink.shade800),
              ),
            ),
            const SizedBox(height: 20),
            // Get Answer button
            ElevatedButton(
              onPressed: _isLoading ? null : _getGeminiAnswer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade400,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 5,
                shadowColor: Colors.pink.shade200,
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'احصل على الإجابة',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
            ),
            const SizedBox(height: 30),
            // Display area for the answer
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.shade100.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _answerText,
                        style: TextStyle(fontSize: 16, color: Colors.pink.shade800),
                        textAlign: TextAlign.right, // Align right for Arabic text
                        textDirection: TextDirection.rtl, // Set text direction for Arabic
                      ),
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'خطأ: $_errorMessage',
                            style: const TextStyle(color: Colors.red, fontSize: 14),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
