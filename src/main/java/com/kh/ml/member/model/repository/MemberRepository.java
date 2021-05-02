package com.kh.ml.member.model.repository;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.ml.member.model.vo.Member;

@Mapper
public interface MemberRepository {

	@Select("select * from tb_member where user_id = #{userId}")
	Member selectMemberById(String userId);
	
	@Select("select * from tb_member where user_id = #{userId} and is_leave=0")
	Member selectMemberByForAuth(String userId);
	
	@Select("select count(*) from tb_member where email = #{email}")
	int selectMemberByEmail(String userId);
	
	@Select("select count(*) from tb_member where gender = #{gender}")
	int selectMemberByTell(String userId);
	
	@Insert("insert into tb_member(user_id,password,email,gender)"
			+ " values(#{userId},#{password},#{email},#{gender})")
	int insertMember(Member member);
	
	
	
}
