package com.accp.dao;


import org.apache.ibatis.annotations.Param;

public interface RoomDao {

    int updateState(@Param("state")int state,@Param("roomId") int roomId);

}
