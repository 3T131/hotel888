package com.accp.biz;

import com.accp.entity.AttributeDetails;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AttributeDetailsBiz {

    /**
     * 按属性名ID查询
     * @param attributeID
     * @return
     */
    List<AttributeDetails> listByAttributeName(@Param("attributeID") int attributeID);

}
