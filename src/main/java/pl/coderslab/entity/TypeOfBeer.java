package pl.coderslab.entity;

import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "types_of_beer")
@Data
@ToString(exclude = {"beers"})
public class TypeOfBeer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    private String type;

    @OneToMany(mappedBy = "typeOfBeer")
    private List<Beer> beers = new ArrayList<>();

}
