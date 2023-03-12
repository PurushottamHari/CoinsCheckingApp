package com.cashrich.user.repo;

import com.cashrich.user.models.UserTime;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRestApiTimeRepository extends CrudRepository<UserTime, Long> {

}
