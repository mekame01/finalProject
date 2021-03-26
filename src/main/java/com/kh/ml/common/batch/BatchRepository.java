package com.kh.ml.common.batch;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BatchRepository {

	@Insert("insert into tb_baseball(rank,team_name,match,win,loose,tie,rate,reg_date)"
			+ "values(#{rank},#{teamName},#{match},#{win},#{loose},#{tie},#{rate},sysdate)")
	public void insertBaseBall(Map<String, String> data);
	
}
