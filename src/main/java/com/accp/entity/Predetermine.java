package com.accp.entity;


import java.util.Date;

/**
 * 预定房间表
 */
public class Predetermine {

    private int predetermineId; //'预定ID',
    private int roomID; //'房间ID',
    private int predetermineTargetID; //'预定对象ID',
    private int passengerID; //'旅客ID',
    private int payWayID; //'支付方式 ID',
    private int predetermineStateID; //'预定状态ID',
    private Date arriveTime; //'抵达时间',
    private Float deposit; //'押金',
    private String predetermineDay; //'预定天数',
    private int remind; //'到时提示',

//    -------------------------------------------------------
    private Room room;//房间
    private ReceiveTarget Integer;//预定对象
    private Passenger passenger;//旅客
    private AttributeDetails payWay;//支付方式
    private AttributeDetails predetermineState;//预定状态

    public int getPredetermineId() {
        return predetermineId;
    }

    public void setPredetermineId(int predetermineId) {
        this.predetermineId = predetermineId;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getPredetermineTargetID() {
        return predetermineTargetID;
    }

    public void setPredetermineTargetID(int predetermineTargetID) {
        this.predetermineTargetID = predetermineTargetID;
    }

    public int getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(int passengerID) {
        this.passengerID = passengerID;
    }

    public int getPayWayID() {
        return payWayID;
    }

    public void setPayWayID(int payWayID) {
        this.payWayID = payWayID;
    }

    public int getPredetermineStateID() {
        return predetermineStateID;
    }

    public void setPredetermineStateID(int predetermineStateID) {
        this.predetermineStateID = predetermineStateID;
    }

    public Date getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(Date arriveTime) {
        this.arriveTime = arriveTime;
    }

    public Float getDeposit() {
        return deposit;
    }

    public void setDeposit(Float deposit) {
        this.deposit = deposit;
    }

    public String getPredetermineDay() {
        return predetermineDay;
    }

    public void setPredetermineDay(String predetermineDay) {
        this.predetermineDay = predetermineDay;
    }

    public int getRemind() {
        return remind;
    }

    public void setRemind(int remind) {
        this.remind = remind;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public ReceiveTarget getPredetermineTarget() {
        return Integer;
    }

    public void setPredetermineTarget(ReceiveTarget Integer) {
        this.Integer = Integer;
    }

    public Passenger getPassenger() {
        return passenger;
    }

    public void setPassenger(Passenger passenger) {
        this.passenger = passenger;
    }

    public AttributeDetails getPayWay() {
        return payWay;
    }

    public void setPayWay(AttributeDetails payWay) {
        this.payWay = payWay;
    }

    public AttributeDetails getPredetermineState() {
        return predetermineState;
    }

    public void setPredetermineState(AttributeDetails predetermineState) {
        this.predetermineState = predetermineState;
    }
}
