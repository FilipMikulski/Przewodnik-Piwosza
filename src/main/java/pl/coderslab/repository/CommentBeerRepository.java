package pl.coderslab.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.entity.CommentBeer;

import java.util.List;

public interface CommentBeerRepository extends JpaRepository<CommentBeer, Long> {


    @Query("SELECT s.beer.name, avg(s.rating) as av from CommentBeer s group by s.beer.name ORDER BY av desc ")
    List<Object[]> averageGrateBeer(Pageable pageable);



    List<CommentBeer> findCommentBeerByBeerId (Long id);
}
