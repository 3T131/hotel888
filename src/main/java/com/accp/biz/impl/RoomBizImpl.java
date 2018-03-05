package com.accp.biz.impl;

import com.accp.biz.RoomBiz;
import com.accp.dao.RoomDao;
import com.accp.entity.Pager;
import com.accp.entity.Room;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoomBizImpl implements RoomBiz {
    @Resource
    private RoomDao roomDao;
    /**
     * 分页查询$$模糊查询
     * @param pager
     */
    public void listPage(Pager<Room> pager) {
        pager.setTotalRows(roomDao.totalRow(pager));//总行数
        pager.setDatas(roomDao.listPage(pager));//结果集
    }

    /**
     * 增加客房
     * @param room
     * @return
     */
    public int insertRoom(Room room) {
            return  roomDao.insertRoom(room);
    }

    /**
     * 删除客房
     * @param roomId
     * @return
     */
    public int deleteRoom(String[] roomId) {
        return roomDao.deleteRoom(roomId);
    }

    /**
     * 根据id查询客房
     * @param roomId
     * @return
     */
    public Room roomById(int roomId) {
        return roomDao.roomById(roomId);
    }

    /**
     * 修改客房信息
     * @param room
     * @return
     */
    public int updateRoom(Room room) {
        return roomDao.updateRoom(room);
    }
}
