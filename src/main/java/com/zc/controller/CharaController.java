package com.zc.controller;

import com.zc.pojo.Chara;
import com.zc.service.CharaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/chara.do")
public class CharaController {
    @Autowired
    private CharaService charaService;

    @RequestMapping(params = "method=allChara")
    public List<Chara> getAllChara() {
        List<Chara> allChara = charaService.getAllChara();
        return allChara;
    }

    @RequestMapping("/getCharaById")
    public Chara getCharaById(int id) {
        Chara charaById = charaService.getCharaById(id);
        return charaById;
    }

    @RequestMapping(params = "method=addChara")
    public void addChara(Chara chara) { charaService.addChara(chara); }

    @RequestMapping(params = "method=deleteChara")
    public void deleteChara(int id) { charaService.deleteChara(id); }

    @RequestMapping(params = "method=updateChara")
    public void updateChara(Chara chara) { charaService.updateChara(chara); }
}
