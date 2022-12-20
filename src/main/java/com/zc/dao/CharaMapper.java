package com.zc.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import com.zc.pojo.Chara;
@Mapper
public interface CharaMapper {
    List<Chara> getAllChara();
    Chara getCharaById(int charaId);
    int addChara(Chara charas);
    int deleteChara(int charaId);
    int updateChara(Chara chara);
}

