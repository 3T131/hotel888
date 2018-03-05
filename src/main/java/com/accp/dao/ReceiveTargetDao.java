package com.accp.dao;

import com.accp.entity.Pager;
import com.accp.entity.ReceiveTarget;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReceiveTargetDao {
    /**
     * 分页查询&&模糊查询
     * @param pager
     * @return
     */
    List<ReceiveTarget> list(Pager<ReceiveTarget> pager);
    /**
     * 查询总行数
     * @param pager
     * @return
     */
    int totalRow(Pager<ReceiveTarget> pager);

    /**
     * 增加
     * @param receiveTarget
     * @return
     */
    int insertReceiveTarget(ReceiveTarget receiveTarget);

    /**
     * 删除
     * @param id
     * @return
     */
    int deleteReceiveTarget(String[] id);

    /**
     * 根据id查询
     * @param receivetargetId
     * @return
     */
    ReceiveTarget queryByid(@Param("receivetargetId") int receivetargetId);

    /**
     * 修改
     * @param receiveTarget
     * @return
     */
    int updateReceiveTarget(ReceiveTarget receiveTarget);

}