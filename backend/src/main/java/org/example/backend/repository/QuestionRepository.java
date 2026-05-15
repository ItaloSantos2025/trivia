package org.example.backend.repository;

import org.example.backend.entity.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {
    // O JpaRepository já entrega o CRUD completo (salvar, listar, deletar) por padrão.
}