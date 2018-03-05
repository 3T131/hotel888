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

function verify(){
}

function returnfunction(){
    var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value
    parent.document.getElementById('Mainid').src=getRootPath()+'/StayRegister/tolist.do?LvKeLeiXingId='+55;
}

function deletefunction(){
    var isBillID=document.getElementById("isBillID").value;
    if(isBillID==69){
        alert("很抱歉！该数据已经结账没法进行此操作！");
        return;
    }
    var chk_value=[];                                                      // 设置数组变量
    var consumptionStayRegisterID=document.getElementById("consumptionStayRegisterID").value;
    $('input[name="id"]:checked').each(function(){             // 遍历获取input被checked的
        chk_value.push($(this).val());                             // 获取选中的ID
    });
    if(chk_value!=""){
        parent.document.getElementById('Mainid').src=getRootPath()+'/StayRegister/consumptionDelete.do?id='
            +chk_value+'&consumptionStayRegisterID='+consumptionStayRegisterID;
    }else{
        alert("还没有选择数据删除哦");
    }
}

function ajaxSelect(){
    var isBillID=document.getElementById("isBillID").value;
    if(isBillID==69){
        alert("很抱歉！该数据已经结账没法进行此操作！");
        $("#dd").removeAttr("href");
        return;
    }
    var tbody = document.getElementById("tbodyTwo");
    var name=document.getElementById("txtnameid").value;
    var cboid=document.getElementById("selectCboId").value;
    var i=0;
    $("#tbodyTwo").empty();
    $.ajax({
        cache:false,
        type: "POST",
        url: '${ctx}/StayRegister/tianJiaShangPin.do',
        data:"name="+name+"&cboid="+cboid,
        async:false,
        success: function (result) {
            for (var key in result) {
                i++;
                var item = result[key];
                var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数

                var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                var tdCommodityName = tr.insertCell(-1);
                var tdCommodityTypeName = tr.insertCell(-1);
                var tdUOMName = tr.insertCell(-1);
                var tdSalePrice = tr.insertCell(-1);
                var tdNumber = tr.insertCell(-1);

                tdcheckbox.innerHTML = "<input type='checkbox' name='idTwo' value='"+item.id+"'>";
                tdCommodityName.innerHTML = item.commodityName;
                tdCommodityTypeName.innerHTML = item.commodityTypeName;
                tdUOMName.innerHTML =item.uOMName;         //中间这个是数据
                tdSalePrice.innerHTML =item.salePrice;
                tdNumber.innerHTML ="<input style='width:100%;border-color:green'>";
            }
            if(i==0){
                alert("很抱歉！没有查找到你要找的数据");
            }
        },
        error: function(data) {
        }
    });
}

function confirmFunction(){
    var chk_value=[];
    var table=document.getElementById("tbodyTwo");
    var selectedIndex="";
    var Number=[];
    var i=0;
    var LvKeLeiXingId=document.getElementById("LvKeLeiXingId").value;
    var consumptionStayRegisterID=document.getElementById("consumptionStayRegisterID").value;
    $('input[name="idTwo"]:checked').each(function(){
        chk_value.push($(this).val());
        selectedIndex=this.parentNode.parentNode.rowIndex;
        Number.push(table.rows[selectedIndex-1].cells[5].childNodes[0].value);
        if(table.rows[selectedIndex-1].cells[5].childNodes[0].value==""){
            i=1;
        }
    });
    if(Number=="" || Number==null){
        return false;
    }else if(i==1){
        return false;
    }
    for (var j=0;j<Number.length ;j++ )
    {
        if(!parseInt(Number[j])){
            alert("你输入的数量不是正整数。请仔细检查！");
            return false;
        }else{
            if(Number[j].length>8){
                alert("你输入的数量太大了，请注意控制为 8 位长度");
                return false;
            }
        }
    }
    if(chk_value!=""){
        parent.document.getElementById("Mainid").src='${ctx}/StayRegister/consumption.do?id='+chk_value
            +'&Number='+Number+'&consumptionStayRegisterID='+consumptionStayRegisterID+'&LvKeLeiXingId='+LvKeLeiXingId;
    }else{
    }
}


