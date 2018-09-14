package pl.coderslab.entity;

import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.NotBlank;


import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "beers")
@Data
@ToString(exclude = {"comments", "pubs"})
public class Beer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String name;

    @NotBlank
    private String breweryAddress;

    @NotNull
    @Min(0)
    private Integer volume;

    @NotNull
    @Min(0)
    private Double alcoholVolume;

    @NotBlank
    private String description;
    private String awards;

    @ManyToMany
    private List<Pub> pubs = new ArrayList<>();

    @ManyToOne
    TypeOfBeer typeOfBeer;


    @OneToMany(mappedBy = "beer")
    private List<CommentBeer> comment_beers;

    private String image;

}