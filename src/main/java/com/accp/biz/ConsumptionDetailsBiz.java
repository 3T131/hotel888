package com.accp.biz;

import com.accp.entity.ConsumptionDetails;

import java.util.List;

public interface ConsumptionDetailsBiz {

    List<ConsumptionDetails> listByStayRegister(int stayRegisterId);

    boolean deleteByIds(String[] ids);

}
