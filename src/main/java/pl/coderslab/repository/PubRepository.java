package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.entity.Pub;

import java.util.List;
import java.util.Set;


public interface PubRepository extends JpaRepository<Pub, Long> {

    @Query("SELECT b FROM Pub b WHERE name LIKE %?1%")
    Set<Pub> findAllbyName(String name);

}
