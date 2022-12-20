package com.zc.service.Impl;

import com.zc.dao.CharaMapper;
import com.zc.pojo.Chara;
import com.zc.service.CharaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service

public class CharaImpl implements CharaService {//CharaService
    @Autowired
    private CharaMapper charaMapper;
    @Override
    public List<Chara> getAllChara() {
        return charaMapper.getAllChara();
    }
    @Override
    public Chara getCharaById(int charaId) { return charaMapper.getCharaById(charaId); }
    @Override
    public int addChara(Chara charas) {
        return charaMapper.addChara(charas);
    }
    @Override
    public int deleteChara(int charaId) {
        return charaMapper.deleteChara(charaId);
    }
    @Override
    public int updateChara(Chara chara) { return charaMapper.updateChara(chara); }
}
