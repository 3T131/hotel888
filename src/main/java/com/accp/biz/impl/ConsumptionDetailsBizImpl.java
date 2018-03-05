package com.accp.biz.impl;

import com.accp.biz.ConsumptionDetailsBiz;
import com.accp.dao.ConsumptionDetailsDao;
import com.accp.entity.ConsumptionDetails;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ConsumptionDetailsBizImpl implements ConsumptionDetailsBiz {

    @Resource
    private ConsumptionDetailsDao consumptionDetailsDao;

    /**
     * 按stayRegisterId查询
     * @param stayRegisterId
     * @return
     */
    public List<ConsumptionDetails> listByStayRegister(int stayRegisterId) {
        ConsumptionDetails consumptionDetails=new ConsumptionDetails();
        consumptionDetails.setStayRegisterID(stayRegisterId);
         return consumptionDetailsDao.listByParam(consumptionDetails);
    }

    /**
     * 删除多项
     * @param ids
     * @return
     */
    public boolean deleteByIds(String[] ids) {
        return consumptionDetailsDao.deleteByIds(ids)>0;
    }
}
