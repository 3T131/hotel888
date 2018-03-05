package com.accp.dao;

import com.accp.entity.Depoit;

import java.util.List;

public interface DepoitDao {

    /**
     * 按参数查询
     * @param depoit
     * @return
     */
    List<Depoit> listByParam(Depoit depoit);

    int updateDepositMoney(Depoit depoit);
}
