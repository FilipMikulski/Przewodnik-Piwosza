package pl.coderslab.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.entity.CommentBeer;
import pl.coderslab.entity.CommentPub;

import java.util.List;

public interface CommentPubRepository extends JpaRepository<CommentPub, Long> {

    @Query("Select s.pub.name, avg(s.rating) as av from CommentPub s group by s.pub.name order by av desc ")
    List<Object[] > averageGratePub(Pageable pageable);



    List<CommentPub> findCommentPubByPubId (Long id);


}
