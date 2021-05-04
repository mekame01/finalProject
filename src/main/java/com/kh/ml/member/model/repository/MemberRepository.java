package com.kh.ml.member.model.repository;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.ml.member.model.vo.Member;
import com.kh.ml.avatar.model.vo.Avatar;
import com.kh.ml.common.util.file.FileVo;

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
	
	int updateMember(@Param("userId")String userId,@Param("originFileName")String oriname,@Param("renameFileName")String rename,@Param("savePath")String path);

	@Select("select * from tb_avatar where user_id = #{userId} order by avatar_idx desc")
	List<Avatar> selectAvatarList(String userId);
	
	@Select("select * from tb_file where f_idx = #{fIdx}")
	FileVo selectOneFile(int fIdx);
}
