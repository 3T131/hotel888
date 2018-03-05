package com.accp.biz.impl;

import com.accp.biz.AttributeDetailsBiz;
import com.accp.dao.AttributeDetailsDao;
import com.accp.entity.AttributeDetails;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class AttributeDetailsBizImpl implements AttributeDetailsBiz {

    @Resource
    private AttributeDetailsDao attributeDetailsDao;

    public List<AttributeDetails> listByAttributeName(int attributeID) {
        return attributeDetailsDao.listByAttributeName(attributeID);
    }
}
