package org.example.backend.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.List; // IMPORTANTE: Resolve o erro "cannot find symbol"
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String text;
    private String category;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "question_id")
    @JsonManagedReference // ISSO garante que as respostas apareçam no JSON do Front
    private List<Answer> answers;
}