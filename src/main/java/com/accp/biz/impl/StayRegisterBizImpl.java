package com.accp.biz.impl;

import com.accp.biz.StayRegisterBiz;
import com.accp.dao.*;
import com.accp.entity.*;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class StayRegisterBizImpl implements StayRegisterBiz {

    @Resource
    private StayRegisterDao stayRegisterDao;

    @Resource
    private RoomDao roomDao;

    @Resource
    private PassengerDao passengerDao;

    @Resource
    private CommodityDao commodityDao;

    @Resource
    private ConsumptionDetailsDao consumptionDetailsDao;

    /**
     * 新增开房记录（新增多条）
     * @param stayRegister
     * @param map 商品k 数量v
     * @param jsonArray 房间k对应旅客v
     * @return
     */
    public boolean insertStayRegisters(StayRegister stayRegister, Map map, JSONArray jsonArray) {
        int error=-1;//错误
        int sid=0;//最后一个登记id,用于新增消费记录
        int gPid=0;//共用的旅客id
        for (int i = 0; i <jsonArray.size() ; i++) {
            JSONObject jsonObject=jsonArray.getJSONObject(i);
            Map<String, Object> rp = jsonObject.getInnerMap();
            Iterator<Map.Entry<String, Object>> entries = rp.entrySet().iterator();
            while (entries.hasNext()) {
                Map.Entry<String, Object> entry = entries.next();
                JSONArray array= (JSONArray)entry.getValue();
                if(array!=null&&array.size()>0){
                    gPid = Integer.parseInt((String)array.get(0));

                    System.out.println(gPid);
                    break;
                }
            }

        }
        for (int i = 0; i <jsonArray.size() ; i++) {
            JSONObject jsonObject=jsonArray.getJSONObject(i);
            Map<String, Object> rp = jsonObject.getInnerMap();
            Iterator<Map.Entry<String, Object>> entries = rp.entrySet().iterator();
            while (entries.hasNext()) {
                Map.Entry<String, Object> entry = entries.next();
                int roomId=Integer.parseInt(entry.getKey());
                Room room = roomDao.roomById(roomId);
                Float total=0f;
                if(stayRegister.getRentOutTypeID()==26){
                    total=room.getStandardPriceDay()*stayRegister.getStayNumber();
                }else if(stayRegister.getRentOutTypeID()==25){
                    total=room.getStandardPrice()*stayRegister.getStayNumber();
                }
                stayRegister.setRoomID(roomId);
                stayRegister.setSumConst(total);
                if(stayRegister.getPayWayID()==72){
                    stayRegister.setIsBillID(68);
                }else{
                    stayRegister.setPayTime(new Date());
                    stayRegister.setIsBillID(73);
                }
                JSONArray array= (JSONArray)entry.getValue();
                error=roomDao.updateState(65,roomId);
                if(array!=null&&array.size()>0){
                    if(array.size()>=2){
                        stayRegister.setLvKeLeiXingId(56);
                    }else{
                        stayRegister.setLvKeLeiXingId(55);
                    }
                    error=stayRegisterDao.insertStayRegisters(stayRegister);
                    sid = passengerDao.last_insert_id();
                    for (int j = 0; j <array.size() ; j++) {
                        StayRegisterDetails stayRegisterDetails=new StayRegisterDetails(sid,Integer.parseInt((String)array.get(j)));
                        error=stayRegisterDao.insertStayRegisterDetails(stayRegisterDetails);
                    }
                }else{
                    stayRegister.setLvKeLeiXingId(55);
                    error=stayRegisterDao.insertStayRegisters(stayRegister);
                    sid = passengerDao.last_insert_id();
                    StayRegisterDetails stayRegisterDetails=new StayRegisterDetails(sid,gPid);
                    error=stayRegisterDao.insertStayRegisterDetails(stayRegisterDetails);
                }
            }
        }
        //新增消费记录表
        Iterator entries2 = map.entrySet().iterator();
        while (entries2.hasNext()) {
            Map.Entry entry = (Map.Entry) entries2.next();
            Integer cId=0;
            Integer number=0;
            JSONObject numberJson=(JSONObject) entry.getValue();
            Map<String, Object> innerMap = numberJson.getInnerMap();
            Iterator<Map.Entry<String, Object>> entries = innerMap.entrySet().iterator();
            while (entries.hasNext()) {
                Map.Entry<String, Object> entry2 = entries.next();
                cId=Integer.parseInt(entry2.getKey());
                number=(Integer) entry2.getValue();
                System.out.println(cId+number);
            }
            Commodity c = commodityDao.getId(cId);
            Float total=c.getSalePrice()*number;
            ConsumptionDetails consumptionDetails=new ConsumptionDetails();
            consumptionDetails.setConsumptionMoney(total);
            consumptionDetails.setStayRegisterID(sid);
            consumptionDetails.setcID(cId);
            consumptionDetails.setConsumptionNumber(number);
            error=consumptionDetailsDao.insertConsumptionDetails(consumptionDetails);
        }
        if(error>0){
            return true;
        }
        return false;
    }

    /**
     * 分页查询带参数
     * @param pager
     */
    public void listByPager(Pager<StayRegister> pager) {
        if(pager.getParams().getLvKeLeiXingId()==null){
            pager.getParams().setLvKeLeiXingId(55);
        }
        if(pager.getParams().getIsBillID()==null){
            pager.getParams().setIsBillID(68);
        }
        pager.setTotalRows(stayRegisterDao.totalRow(pager));//设置总行数
        pager.setDatas(stayRegisterDao.listByPager(pager));//查询数据放到pager对象的datas中
    }

    public StayRegister getStayRegister(StayRegister stayRegister) {
        List<StayRegister> stayRegistersList = stayRegisterDao.listByParam(stayRegister);
        if(stayRegistersList!=null){
            return stayRegistersList.get(0);
        }
        return null;
    }

    /**
     * 散客结账
     * @param stayRegister
     * @return
     */
    public boolean updateIsBill(StayRegister stayRegister) {
        stayRegister.setIsBillID(69);
        return stayRegisterDao.updateByParam(stayRegister)>0
                &&roomDao.updateState(1,stayRegister.getRoomID())>0;
    }


}
