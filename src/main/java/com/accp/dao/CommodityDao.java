package com.accp.dao;

import com.accp.entity.Commodity;
import com.accp.entity.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommodityDao {

    /**
     * 按商品名查询(分页)
     * @param pager
     * @return
     */
    List<Commodity> queryByCommodityName(Pager<Commodity> pager);

    /**
     * 设置总行数
     * @param pager
     * @return
     */
    int totalRows(Pager<Commodity> pager);

    /**
     *新增商品信息
     * @param commodity
     * @return
     */
    Integer insert(Commodity commodity);

    /**
     *修改商品信息
     * @param commodity
     * @return
     */
    Integer update(Commodity commodity);

    /**
     * 获得商品信息id
     * @param commodityId
     * @return
     */
    Commodity getId(@Param("commodityId") Integer commodityId);

    /**
     * 根据商品commodityId删除信息
     * @param commodityId
     * @return
     */
    Integer deleteByCommodityId(String[] commodityId);
}
