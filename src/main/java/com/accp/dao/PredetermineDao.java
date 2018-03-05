package com.accp.dao;

import com.accp.entity.Pager;
import com.accp.entity.Predetermine;

import java.util.List;

public interface PredetermineDao {
    /**
     * 分页查询&&模糊查询
     * @param pager
     * @return
     */
    List<Predetermine> list(Pager<Predetermine> pager);
    /**
     * 查询总行数
     * @param pager
     * @return
     */
    int totalRow(Pager<Predetermine> pager);
}
