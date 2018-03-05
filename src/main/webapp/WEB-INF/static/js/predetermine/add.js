
//项目绝对路径
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/proj/meun.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： proj/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPath = curWwwPath.substring(0, pos);
    return(localhostPath );
}

var shijian="";
function pickedFunc() {
    shijian = $dp.cal.getNewDateStr();
}

function selectRoom(){
    var tbody = document.getElementById("tbodyTwo");
    var name=document.getElementById("txtnameid").value;
    var i=0;
    $("#tbodyTwo").empty();                              // 删除 tbody 所有行
    $.ajax({
        cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
        type: "POST",                                           //上面3行都是必须要的
        url: getRootPath()+'/Predetermine/selectRoom.do',       //地址 type 带参数
        data:"roomNumber="+name,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
//        dataType:"json",                                       // json 数据类型提交
        async:false,                                          // 是否 异步 提交
        success: function (result) {
            for (var key in result) {
                i++;
                var item = result[key];
                var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数

                var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                var tdroomNumber = tr.insertCell(-1);
                var tdguestRoomLevelName = tr.insertCell(-1);
                var tdroomName = tr.insertCell(-1);
                var tdroomAmount = tr.insertCell(-1);
                var tdstandardPriceDay = tr.insertCell(-1);

                tdcheckbox.innerHTML = "<input type='checkbox' name='idTwo' value='"+item.id+"'>";
                tdroomNumber.innerHTML = item.roomNumber;
                tdguestRoomLevelName.innerHTML = item.guestRoomLevelName;
                tdroomName.innerHTML =item.roomName;         //中间这个是数据
                tdroomAmount.innerHTML =item.roomAmount;
                tdstandardPriceDay.innerHTML ='￥'+item.standardPriceDay;
            }
            if(i==0){
                alert("很抱歉！没有查找到你要找的数据");
            }
        },
        error: function(data) {

        }
    });
}

var roomIdShuZu=[];

function confirmfunction(){
    /*  roomIdShuZu.empty(); */
    var chk_value=[];
    var tableOne=document.getElementById("tbodyOne");
    var table=document.getElementById("tbodyTwo");
    var selectedIndex="";
    var roomNumber=[];
    var roomLevel=[];
    var roomAmount=[];
    var roomPrice=[];
    $('#tbodyOne').empty();
    $('input[name="idTwo"]:checked').each(function(){             // 遍历获取input被checked的
        chk_value.push($(this).val());                             // 获取选中的ID
        roomIdShuZu=chk_value;
        selectedIndex=this.parentNode.parentNode.rowIndex;
        roomNumber.push(table.rows[selectedIndex-1].cells[1].innerHTML);
        roomLevel.push(table.rows[selectedIndex-1].cells[2].innerHTML);
        roomAmount.push(table.rows[selectedIndex-1].cells[4].innerHTML);
        roomPrice.push(table.rows[selectedIndex-1].cells[5].innerHTML);
    });
    for(var i=0;i<chk_value.length;i++){
        var tr = tableOne.insertRow(-1);            // FireFox必须使用-1这个参数

        var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
        var tdroomNumber = tr.insertCell(-1);
        var tdguestRoomLevelName = tr.insertCell(-1);
        var tdroomAmount = tr.insertCell(-1);
        var tdstandardPriceDay = tr.insertCell(-1);

        tdcheckbox.innerHTML = "<input type='radio' name='idOne' value='"+chk_value[i]+"'>";
        tdroomNumber.innerHTML = roomNumber[i];
        tdguestRoomLevelName.innerHTML = roomLevel[i];
        tdroomAmount.innerHTML =roomAmount[i];
        tdstandardPriceDay.innerHTML =roomPrice[i];
    }
}

function addfunction(){
    if(document.getElementById("predetermineDayId").value==""){
        alert("预订天数  是必填项，不能为空哦！");
        document.getElementById("predetermineDayId").focus();
        return false;
    }else if(document.getElementById("depositId").value==""){
        alert("押金  是必填项，不能为空哦！");
        document.getElementById("depositId").focus();
        return false;
    }else if(document.getElementById("arriveTimeId").value==""){
        alert("抵达时间  是必填项，不能为空哦！");
        document.getElementById("arriveTimeId").focus();
        return false;
    }else if(document.getElementById("predetermineDayId").value.length>10){
        alert("你输入的   预订天数   太过长了  请不要超出  10 位长度");
        document.getElementById("predetermineDayId").focus();
        return false;
    }else if(document.getElementById("depositId").value.length>8){
        alert("你输入的   押金   太过长了  请不要超出  8 位长度");
        document.getElementById("depositId").focus();
        return false;
    }else if(document.getElementById("arriveTimeId").value.length>20){
        alert("你输入的   抵达时间   太过长了  请不要超出  20 位长度抵达时间");
        document.getElementById("arriveTimeId").focus();
        return false;
    }
    if(document.getElementById("tbodyOne").rows.length==0){
        alert("还没有添加房间哦！请选择房间");
        return false;
    }
    var id= document.getElementById("lvkeorteamId").value;
    var teamId= document.getElementById("teamId").value;

    form1.action="${ctx}/Predetermine/add.do?id="+id+"&type="+teamId+"&roomIdShuZu="+roomIdShuZu;
    form1.submit();
}

function lastStep(){
    parent.document.getElementById('Mainid').src='${ctx}/Predetermine/tolist.do';
}



//验证
function onchangeOne(){
    //预订天数
    if(document.getElementById("predetermineDayId").value!=""){
        document.getElementById("divOne").style.display="none";
        if(!document.getElementById("predetermineDayId").value.trim().match("^[0-9]*[1-9][0-9]*$"))
        {
            document.getElementById("predetermineDayId").focus();
            document.getElementById("predetermineDayId").value="";
            document.getElementById("divOne").style.display="block"; //显示
            alert("预订天数:请输入正整数");
        }
    }else{
        document.getElementById("divTwo").style.display="block"; //显示
    }
    //押金
    if(document.getElementById("depositId").value!=""){
        document.getElementById("divTwo").style.display="none";
        if(!document.getElementById("depositId").value.trim().match("^[0-9]+(\\.[0-9]+)?$"))
        {
            document.getElementById("depositId").focus();
            document.getElementById("depositId").value="";
            document.getElementById("divTwo").style.display="block"; //显示
            alert("押金 :请输入正数");
        }
    }else{
        document.getElementById("divTwo").style.display="block"; //显示
    }
    //抵达时间
    if(document.getElementById("arriveTimeId").value!=""){
        document.getElementById("divThree").style.display="none";
    }else{
        document.getElementById("divThree").style.display="block"; //显示
    }
}