package com.accp.controller;

import com.accp.biz.AttributeDetailsBiz;
import com.accp.biz.PredetermineBiz;
import com.accp.biz.ReceiveTargetBiz;
import com.accp.biz.RoomBiz;
import com.accp.entity.Pager;
import com.accp.entity.Passenger;
import com.accp.entity.Predetermine;
import com.accp.entity.ReceiveTarget;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/Predetermine")
public class PredetermineController {
    @Resource
    private PredetermineBiz predetermineBiz;
    @Resource
    private ReceiveTargetBiz receiveTargetBiz;
    @Resource
    private AttributeDetailsBiz attributeDetailsBiz;
    @Resource
    private RoomBiz roomBiz;

    @RequestMapping("/toadd.do")
    public String toAdd(Model model) {
 model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(4));


        return "predetermine/add";
    }

    /**
     * ajax查询旅客
     *
     * @return
     */
    @RequestMapping("/selectPassenger.do")
    @ResponseBody
    public String selectPassenger(String name) {
        return JSON.toJSONString(predetermineBiz.listByPassenger(name));
    }

    @RequestMapping("/selectTarget.do")
    @ResponseBody
    public String selectTarget(String name) {

        return JSON.toJSONString(receiveTargetBiz.selectReceive(name));
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete.do")
    public String delete(String[] id) {
        predetermineBiz.delete(id);
        return "redirect:tolist.do";
    }

    /**
     * 修改客房登记
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/toupdate.do")
    public String toupdate(@ModelAttribute("predetermine")Predetermine predetermine, Model model, int id){
        model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(4));
        model.addAttribute("predetermine",predetermineBiz.selectById(id));
        model.addAttribute("roomSetPolist",roomBiz.selectRoom());
        return "predetermine/update";
    }
    @RequestMapping("/select.do")
    public String select(@RequestParam(required = false) Integer leiXin,
                          @ModelAttribute("name")String name,@ModelAttribute("predetermine")Predetermine predetermine,
                         @ModelAttribute("principal")String principal,@ModelAttribute("receiveTarget")ReceiveTarget receiveTarget,
                         Model model,@ModelAttribute("passenger")Passenger passenger,
                          @RequestParam(name = "currentPage", defaultValue = "1") Integer currentPage){
        Pager<Predetermine> pager = new Pager<Predetermine>();
        pager.setPageNo(currentPage);//设置当前页
        pager.setPageSize(5);//设置页面大小
        pager.setParams(predetermine);//设置参数
        predetermine.setReceivePrincipal(principal);//根据员工名字
        predetermine.setPassengerName(name); //根据旅客姓名
        predetermineBiz.list(pager);
        model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(16));
        model.addAttribute("list",pager);
        model.addAttribute("leiXin",leiXin);
        return "predetermine/list";
    }
}
