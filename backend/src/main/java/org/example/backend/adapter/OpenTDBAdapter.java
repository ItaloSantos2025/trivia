package org.example.backend.adapter;

import org.example.backend.entity.Question;
import org.example.backend.factory.QuestionFactory;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.HtmlUtils;
import java.util.List;
import java.util.Map;

public class OpenTDBAdapter {

    private final RestTemplate restTemplate = new RestTemplate();

    public Question fromExternalApi(Map<String, Object> result) {
        String rawText = HtmlUtils.htmlUnescape(result.get("question").toString());
        String rawCat = HtmlUtils.htmlUnescape(result.get("category").toString());
        String rawCorrect = HtmlUtils.htmlUnescape(result.get("correct_answer").toString());
        List<String> rawIncorrects = (List<String>) result.get("incorrect_answers");

        String translatedText = translate(rawText);
        String translatedCat = translate(rawCat);

        Question question = QuestionFactory.createQuestion(translatedText, translatedCat);

        question.getAnswers().add(QuestionFactory.createAnswer(translate(rawCorrect), true, question));

        for (String inc : rawIncorrects) {
            String incClean = HtmlUtils.htmlUnescape(inc);
            question.getAnswers().add(QuestionFactory.createAnswer(translate(incClean), false, question));
        }

        return question;
    }

    private String translate(String text) {
        try {
            String url = "https://api.mymemory.translated.net/get?q=" + text + "&langpair=en|pt-br";
            Map<String, Object> response = restTemplate.getForObject(url, Map.class);
            Map<String, Object> responseData = (Map<String, Object>) response.get("responseData");
            return responseData.get("translatedText").toString();
        } catch (Exception e) {
            return text;
        }
    }
}