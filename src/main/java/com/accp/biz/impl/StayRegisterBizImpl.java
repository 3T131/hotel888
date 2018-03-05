package com.accp.biz.impl;

import com.accp.biz.StayRegisterBiz;
import com.accp.dao.RoomDao;
import com.accp.dao.StayRegisterDao;
import com.accp.entity.Pager;
import com.accp.entity.StayRegister;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StayRegisterBizImpl implements StayRegisterBiz {

    @Resource
    private StayRegisterDao stayRegisterDao;

    @Resource
    private RoomDao roomDao;

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
