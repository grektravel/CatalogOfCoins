package org.numismat.springboot.controller;

import org.numismat.springboot.model.Coin;
import org.numismat.springboot.model.DataTableResultInfo;
import org.numismat.springboot.mapper.CoinMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@RestController
@RequestMapping("api/coins")
public class MainRESTController {

	@Autowired
	private CoinMapper mapper;

	@GetMapping(value = {"/",""})
	public DataTableResultInfo getAllCoins(
			@RequestParam(value = "start", required = false, defaultValue = "0") Integer start,
			@RequestParam(value = "length", required = false, defaultValue = "10") Integer length,
			@RequestParam(value = "draw", required = false, defaultValue = "0") Integer draw) {

		int pageNo = (start) / length + 1;
		PageHelper.startPage(pageNo, length);
		Page<Coin> pageInfo = mapper.getAllCoins();
		DataTableResultInfo dataTableResultInfo = new DataTableResultInfo(pageInfo, draw, length, pageInfo.getTotal(), pageInfo.getTotal());
		return dataTableResultInfo;
	}
	
	
	@GetMapping(value = "/search")
	public DataTableResultInfo searchCoinsByPage(
			@ModelAttribute Coin coin,
			@RequestParam(value = "start", required = false, defaultValue = "0") Integer start,
			@RequestParam(value = "length", required = false, defaultValue = "10") Integer length,
			@RequestParam(value = "draw", required = false, defaultValue = "0") Integer draw) {

		int pageNo = (start) / length + 1;
		PageHelper.startPage(pageNo, length);
		Page<Coin> pageInfo = mapper.searchCoins(coin);
		DataTableResultInfo dataTableResultInfo = new DataTableResultInfo(pageInfo, draw, length, pageInfo.getTotal(), pageInfo.getTotal());
		return dataTableResultInfo;
	}
	
	@PostMapping(value = "/add")
	public void addCoin(@ModelAttribute Coin coin) {
		mapper.addCoin(coin);
	}

	@DeleteMapping(value = "/delete/{id}")
	public void deleteCoin(@PathVariable("id") int id) {
		mapper.deleteCoinById(id);
	}

	@PostMapping(value = "/edit")
	public void updateCoin(@ModelAttribute Coin coin) {
		mapper.updateCoin(coin);
	}

}
