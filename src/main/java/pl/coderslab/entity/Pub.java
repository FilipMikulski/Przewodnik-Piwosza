package pl.coderslab.entity;

import lombok.Data;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;


import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Data
@Table(name = "pubs")
public class Pub {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    private String name;
    @NotBlank
    private String address;
    private String contact;
    @Email
    private String email;
    private String openingHours;
    @NotBlank
    private String description;

    private String latitude;
    private String longitude;

    @ManyToMany(mappedBy = "pubs")
    private List<Beer> beers = new ArrayList<>();



    @OneToMany(mappedBy = "pub")
    private List<CommentPub> comment_pubs;



}
