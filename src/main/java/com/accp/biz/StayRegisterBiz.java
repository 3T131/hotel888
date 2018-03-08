package com.accp.biz;

import com.accp.entity.Pager;
import com.accp.entity.StayRegister;
import com.alibaba.fastjson.JSONArray;

import java.util.List;
import java.util.Map;

public interface StayRegisterBiz {

    /**
     * 新增开房记录（新增多条）
     * @param stayRegister
     * @param map 商品k 数量v
     * @param jsonArray 房间k对应旅客v
     * @return
     */
    boolean insertStayRegisters(StayRegister stayRegister, Map map, JSONArray jsonArray);

    void listByPager(Pager<StayRegister> pager);

    StayRegister getStayRegister(StayRegister stayRegister);

    boolean updateIsBill(StayRegister stayRegister);
}
