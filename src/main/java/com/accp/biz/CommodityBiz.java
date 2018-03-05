package com.accp.biz;

import com.accp.entity.Commodity;
import com.accp.entity.Pager;
import org.apache.ibatis.annotations.Param;

public interface CommodityBiz {

    /**
     * (分页)
     * @param pager
     * @return
     */
    void listByCommodityNameNew(Pager<Commodity> pager);

    /**
     * 新增商品信息
     * @param commodity
     * @return
     */
    Integer add(Commodity commodity);

//    Integer newadd(Commodity commodity);

    /**
     * 获得商品信息id
     * @param commodityId
     * @return
     */
    Commodity getCommodityId(@Param("commodityId") Integer commodityId);


    /**
     * 修改商品信息
     * @param commodity
     * @return
     */
    Boolean updatenew(Commodity commodity);

    /**
     * 删除商品信息
     * @param commodityId
     * @return
     */
    Boolean deleteByCommodityId(String[] commodityId);
}
