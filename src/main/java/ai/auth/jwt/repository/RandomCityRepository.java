package ai.auth.jwt.repository;

import ai.auth.jwt.domain.RandomCity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by suman.das on 11/28/18.
 */
@Repository
public interface RandomCityRepository extends JpaRepository<RandomCity, Long> {
}
