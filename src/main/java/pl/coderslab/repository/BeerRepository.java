package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.entity.Beer;
import pl.coderslab.entity.Pub;

import java.util.List;
import java.util.Set;

public interface BeerRepository extends JpaRepository<Beer, Long> {

    @Query("select b.pubs from Beer b where b.name like %?1%")
    Set<Pub> findAllByName(String name);
    
}
