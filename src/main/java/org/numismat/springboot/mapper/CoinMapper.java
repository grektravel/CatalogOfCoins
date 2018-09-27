package org.numismat.springboot.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.numismat.springboot.model.Coin;
import org.springframework.stereotype.Repository;

import com.github.pagehelper.Page;

@Repository
@Mapper
public interface CoinMapper {

	Page<Coin> getAllCoins();

	Page<Coin> searchCoins(Coin searchParams);

	void addCoin(Coin coin);

	void deleteCoinById(@Param("id") int id);

	void updateCoin(Coin coin);

}
