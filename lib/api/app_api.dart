import 'dart:convert';

import 'package:http/http.dart' as http;

class APIProvider {
  fetchQuestions() async {
    String url = "https://constructionapp-kilama.herokuapp.com/questions/";
    var res = await http.get(url);

    if (res.statusCode == 200) {
      var resJson = jsonDecode(res.body);
      // print(resJson);
      return resJson;
    }
  }

  fetchAnswers() async {
    String url = "https://constructionapp-kilama.herokuapp.com/answers/";
    var res = await http.get(url);

    if (res.statusCode == 200) {
      var resJson = jsonDecode(res.body);
      // print(resJson);
      return resJson;
    }
  }

  fetchOutput() async {
    String url = "https://constructionapp-kilama.herokuapp.com/answer-output/";
    var res = await http.get(url);

    if (res.statusCode == 200) {
      var resJson = jsonDecode(res.body);
      // print(resJson);
      return resJson;
    }
  }
}
