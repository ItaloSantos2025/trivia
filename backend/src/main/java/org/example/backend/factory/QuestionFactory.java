package org.example.backend.factory;

import org.example.backend.entity.Answer;
import org.example.backend.entity.Question;
import java.util.ArrayList;

public class QuestionFactory {

    public static Question createQuestion(String text, String category) {
        return Question.builder()
                .text(text)
                .category(category)
                .answers(new ArrayList<>())
                .build();
    }

    public static Answer createAnswer(String text, boolean isCorrect, Question question) {
        Answer ans = Answer.builder()
                .text(text)
                .isCorrect(isCorrect)
                .build();
        ans.setQuestion(question);
        return ans;
    }
}
