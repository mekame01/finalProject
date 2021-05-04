package com.kh.ml.avatar.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.ml.avatar.model.vo.Avatar;


@Mapper
public interface AvatarRepository {
	
	@Select("select * from tb_avatar where avatar_idx = #{avatarIdx}")
	Avatar selectOneAvatar(int avatarIdx);
	
	@Select("select * from tb_avatar "
			+ "where avatar_idx = (select max(avatar_idx) from tb_avatar where user_id = #{userId})")
	Avatar selectMaxAvatarByUserId(String userId);
	
	@Insert("insert into tb_avatar(avatar_idx,user_id,model_f_idx,top,top_x,top_y"
			+ ",bottom,bottom_x,bottom_y,shoes,shoes_x,shoes_y,f_idx)"
			+ "values(sc_avatar_idx.nextval,#{userId},#{modelFIdx},#{top},#{topX},#{topY}"
			+ ",#{bottom},#{bottomX},#{bottomY},#{shoes},#{shoesX},#{shoesY},sc_file_idx.currval)")
	int insertAvatar(Avatar avatar);
}
