package com.kh.ml.clothes.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.ml.clothes.model.vo.Clothes;
import com.kh.ml.common.util.file.FileVo;

@Mapper
public interface ClothesRepository {

	@Select("select * from tb_clothes where is_del = 0")
	List<Clothes> selectClothes();
	
	@Select("select * from tb_file where f_idx=#{fIdx}")
	FileVo selectClothesFile(int fIdx);
	
	@Insert("insert into tb_clothes(clothes_idx, clothes_code, clothes_f_idx)"
			+ "values(sc_clothes_idx.nextval,#{clothesCode},sc_file_idx.currval)")
	int insertClohtes(Clothes clothes);
	
	@Insert("insert into tb_file(f_idx, type_idx, origin_file_name, rename_file_name, save_path)"
			+ "values(sc_file_idx.nextval, ' ', #{originFileName}, #{renameFileName}, #{savePath})")
	int insertFile(FileVo fileVo);
}
