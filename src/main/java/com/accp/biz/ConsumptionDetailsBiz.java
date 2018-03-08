package com.accp.biz;

import com.accp.entity.ConsumptionDetails;

import java.util.List;

public interface ConsumptionDetailsBiz {

    /**
     * 新增
     * @param consumptionDetails
     * @return
     */
    boolean insertConsumptionDetails(ConsumptionDetails consumptionDetails);

    List<ConsumptionDetails> listByStayRegister(int stayRegisterId);

    boolean deleteByIds(String[] ids);

}
