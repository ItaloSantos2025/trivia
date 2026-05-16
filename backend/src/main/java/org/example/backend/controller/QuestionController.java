package org.example.backend.controller;

import org.example.backend.entity.Question;
import org.example.backend.service.QuestionService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/questions")
@CrossOrigin(origins = "http://localhost:5173")
public class QuestionController {

    private final QuestionService service;

    public QuestionController(QuestionService service) {
        this.service = service;
    }

    @GetMapping
    public ResponseEntity<List<Question>> getAll(@RequestParam(required = false, defaultValue = "0") int limit) {
        if (limit > 0) {
            return ResponseEntity.ok(service.buscarAleatorias(limit));
        }
        return ResponseEntity.ok(service.listarTodas());
    }

    // Criar: Retorna 201 Created
    @PostMapping
    public ResponseEntity<Question> create(@RequestBody Question question) {
        Question salva = service.salvar(question);
        return ResponseEntity.status(HttpStatus.CREATED).body(salva);
    }

    // Deletar Tudo: Retorna 204 No Content (sucesso sem corpo de resposta)
    @DeleteMapping("/all")
    public ResponseEntity<Void> deleteAll() {
        service.deletarTudo();
        return ResponseEntity.noContent().build();
    }
}