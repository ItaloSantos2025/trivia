package org.example.backend.service;

import org.example.backend.entity.Question;
import org.example.backend.repository.QuestionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class QuestionService {

    private final QuestionRepository repository;

    public QuestionService(QuestionRepository repository) {
        this.repository = repository;
    }

    public List<Question> listarTodas() {
        return repository.findAll();
    }

    @Transactional
    public Question salvar(Question question) {
        return repository.save(question);
    }

    @Transactional
    public void deletarTudo() {
        repository.deleteAll();
    }
}