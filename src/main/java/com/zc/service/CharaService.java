package com.zc.service;

import com.zc.pojo.Chara;

import java.util.List;

public interface CharaService {
    List<Chara> getAllChara();
    Chara getCharaById(int charaId);
    int addChara(Chara charas);
    int deleteChara(int charaId);
    int updateChara(Chara chara);
}
