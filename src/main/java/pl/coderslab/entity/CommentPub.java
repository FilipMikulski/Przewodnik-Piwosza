package pl.coderslab.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

@Entity
@Table(name = "commentsPubs")
@Data
@ToString(exclude = {"pub"})
public class CommentPub {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Min(1)
    @Max(5)
    private Double rating;

    @Size(min = 5, max = 1000)
    private String text;

    @ManyToOne
    @JoinColumn(name = "pub_id")
    private Pub pub;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
