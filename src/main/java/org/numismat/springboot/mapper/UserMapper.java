package org.numismat.springboot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.numismat.springboot.model.User;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserMapper {
	
    User getUserByLogin(@Param("login") String login);

}
