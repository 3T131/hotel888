package com.accp.controller;

import com.accp.biz.*;
import com.accp.entity.*;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.support.spring.FastJsonJsonView;
import com.sun.tracing.dtrace.ModuleAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/StayRegister")
public class StayRegisterController {
    @Resource
    private StayRegisterBiz stayRegisterBiz;

    @Resource
    private AttributeDetailsBiz attributeDetailsBiz;

    @Resource
    private DepoitBiz depoitBiz;

    @Resource
    private ConsumptionDetailsBiz consumptionDetailsBiz;

    @Resource
    private PassengerBiz passengerBiz;

    /**
     * 查询，分页查询
     * @param model
     * @param stayRegister
     * @param currentPage
     * @return
     */
    @RequestMapping("/tolist.do")
    public String list(Model model
                     , @ModelAttribute("stayRegister") StayRegister stayRegister
                ,@RequestParam(name = "currentPage",defaultValue = "1")Integer currentPage
                ){
        Pager<StayRegister> pager=new Pager<StayRegister>();//创建分页对象
        pager.setPageNo(currentPage);//设置当前页
        pager.setPageSize(5);//设置页面大小
        pager.setParams(stayRegister);//设置参数
        stayRegisterBiz.listByPager(pager);//调用biz的方法

        List<AttributeDetails> attributeDetailsList = attributeDetailsBiz.listByAttributeName(17);
        model.addAttribute("listOne",attributeDetailsList);
        model.addAttribute("pager",pager);
        return "stayregister/list";
    }
    @RequestMapping("/topay.do")
    public String pay(StayRegister stayRegister,Model model){
        StayRegister stayRegister2 = stayRegisterBiz.getStayRegister(stayRegister);
        List<AttributeDetails> attributeDetailsList = attributeDetailsBiz.listByAttributeName(4);
        model.addAttribute("listOne",attributeDetailsList);
        model.addAttribute("timestamp",new Date());
        model.addAttribute("stayRegister2",stayRegister2);
        return "stayregister/pay";
    }
    @RequestMapping("/pay.do")
    public String payDo(StayRegister stayRegister,Model model){
        StayRegister stayRegister2 = stayRegisterBiz.getStayRegister(stayRegister);
        stayRegister2.setRemarks(stayRegister.getRemarks());
        stayRegister2.setPayTime(stayRegister.getPayTime());
        stayRegister2.setPayWayID(stayRegister.getPayWayID());
        stayRegister2.setRoomID(stayRegister.getRoomID());
        if(this.stayRegisterBiz.updateIsBill(stayRegister2)){
            return "redirect:/StayRegister/tolist.do";
        }else{
            model.addAttribute("error","结账失败");
            return "stayregister/pay";
        }
    }


    @RequestMapping("/toarrangeroom.do")
    public String toArrangeRoom(){
        return "stayregister/arrangeroom";
    }

    /**
     * 住宿登记
     * @param model
     * @return
     */
    @RequestMapping("/toStay.do")
    public String toDengji(Model model){
        model.addAttribute("listGender", attributeDetailsBiz.listByAttributeName(8));
        model.addAttribute("listNation", attributeDetailsBiz.listByAttributeName(9));
        model.addAttribute("listPassengerLevel", attributeDetailsBiz.listByAttributeName(13));
        model.addAttribute("listPapers", attributeDetailsBiz.listByAttributeName(10));
        return "dengji/dengji";
    }

    /**
     * 登记旅客
     * @param passenger
     * @param model
     * @return
     */
    @RequestMapping("/register.do")
    @ResponseBody
    public String register(Passenger passenger,Model model){
        passengerBiz.add(passenger);
        int i = passengerBiz.last_insert_id();
        Passenger passenger1 = passengerBiz.queryPassengerId(i);
        return JSON.toJSONString(passenger1);
    }


    @RequestMapping("/selectPassenger.do")
    @ResponseBody
    public String selectPassenger(Passenger passenger,Model model){
        Pager<Passenger> pager=new Pager<Passenger>();
        pager.setPageNo(1);//设置当前页
        pager.setPageSize(20);//设置页面大小
        pager.setParams(passenger);//设置参数
        passengerBiz.listPage(pager);
        List<Passenger> datas = pager.getDatas();
        return JSON.toJSONString(datas);
    }

    /**
     * 旅客消费
     * @param stayRegister
     * @param model
     * @return
     */
    @RequestMapping("/toconsumption.do")
    public String toConsumtion(@ModelAttribute("stayRegister") StayRegister stayRegister,Model model){
        List<ConsumptionDetails> consumptionDetailsList = consumptionDetailsBiz.listByStayRegister(stayRegister.getStayRegisterId());
        model.addAttribute("consumptionDetailsList",consumptionDetailsList);
        return "stayregister/consumption";
    }

    @RequestMapping("/consumptionDelete.do")
    public String consumptionDelete(String[] id,int consumptionStayRegisterID,Model model){
        consumptionDetailsBiz.deleteByIds(id);
        StayRegister stayRegister=new StayRegister();
        stayRegister.setStayRegisterId(consumptionStayRegisterID);
        return toConsumtion(stayRegisterBiz.getStayRegister(stayRegister),model);
    }
    /**
     * 押金
     * @return
     */
    @RequestMapping("/todeposit.do")
    public String toDeposit(@ModelAttribute("stayRegister") StayRegister stayRegister,Model model){
        Depoit depoit = depoitBiz.getDepoit(stayRegister.getDpId());
        model.addAttribute("depoit",depoit);
        return "stayregister/deposit";
    }

    /**
     * 追加押金
     * @param depoit
     * @return
     */
    @RequestMapping("/deposit.do")
    @ResponseBody
    public String doDepoit(Depoit depoit){
        if(depoitBiz.updateDepositMoney(depoit)){
            Depoit depoit2 = depoitBiz.getDepoit(depoit.getDepoitId());
            return "{\"success\":\""+depoit2.getDepositMoney()+"\"}";
        }else{
            return "{\"success\":\"false\"}";
        }
    }


}
