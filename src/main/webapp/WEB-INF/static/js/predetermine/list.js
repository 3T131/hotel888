
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
$('#duixiang').modal().css({
    'width':'72%',
    'margin-left':function(){
        return -($(this).width()/2);
    }
});
$('#duixiang').modal('hide');

function addfunction(){
    var classone=document.getElementById("tabOneId").className;
    var one=document.getElementById("oneId").value;
    var two=document.getElementById("twoId").value;
    var lvKeName=document.getElementById("nameId").value;
    var teamName=document.getElementById("teamNameId").value;
    if(classone == "active"){
        if(one == ""){
            alert("你还没有添加对象信息哦！")
        }else{
            parent.document.getElementById('Mainid').src=getRootPath()+'/Predetermine/toadd.do?id='+one+
                '&name='+teamName+'&type=1';
        }
    }else{
        if(two == "" ){
            alert("你还没有添加旅客信息哦！")
        }else{
            parent.document.getElementById('Mainid').src=getRootPath()+'/Predetermine/toadd.do?id='+two+
                '&name='+lvKeName+'&type=2';
        }
    }

}

function updatefunction(){
    var chk_value=[];
    $('input[name="id"]:checked').each(function(){
        chk_value.push($(this).val());
    });
    if(chk_value!=""){
        if(chk_value.toString().indexOf(",")>0){
            alert("修改只能选择一条");
        }else{
            parent.document.getElementById("Mainid").src=getRootPath()+'/Predetermine/toupdate.do?id='+chk_value;
        }
    }else{
        alert("请选择一条数据进行修改");
    }
}

function deletefunction(){
    var chk_value=[];
    $('input[name="id"]:checked').each(function(){
        chk_value.push($(this).val());
    });
    if(chk_value!=""){
        var flag=window.confirm("注意：删除该预订信息会扣除该房间的押金的哦！您确定要永久删除该信息吗?");
        if(flag){
            parent.document.getElementById("Mainid").src=getRootPath()+'/Predetermine/delete.do?id='+chk_value;
        }
    }else{
        alert("请选择一条或多条数据进行删除");
    }
}



function souSuo(){
    var tbody = document.getElementById("tbodyThree");
    var name=document.getElementById("txtnameidThree").value;
    var i=0;
    $("#tbodyThree").empty();
    $.ajax({
        cache:false,
        type: "POST",
        url:getRootPath()+ '/Predetermine/selectPassenger.do',
        data:"txtname="+name,
        async:false,
        success: function (result) {
            for (var key in result) {
                i++;
                var item = result[key];
                var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数

                var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                var tdName = tr.insertCell(-1);
                var tdGender = tr.insertCell(-1);
                var tdPapersName = tr.insertCell(-1);
                var tdPapersNumber = tr.insertCell(-1);

                tdcheckbox.innerHTML = "<input type='radio' name='idThree' value='"+item.id+"'>";
                tdName.innerHTML = item.name;
                tdGender.innerHTML = item.genderName;
                tdPapersName.innerHTML =item.papersName;         //中间这个是数据
                tdPapersNumber.innerHTML =item.papersNumber;
            }
            if(i==0){
                alert("很抱歉！没有查找到你要找的数据");
            }
        },
        error: function(data) {
        }
    });
}


function confirmfunction(){
    var chk_value=[];
    var table=document.getElementById("tbodyThree");
    var selectedIndex="";
    var name="";
    var papersType="";
    var paperNumber="";
    $('input[name="idThree"]:checked').each(function(){
        chk_value.push($(this).val());
        selectedIndex=this.parentNode.parentNode.rowIndex;         // 获取选中的索引 单装他的变量不是数组，可以为数组
        name=table.rows[selectedIndex-1].cells[1].innerHTML;     // 获取选中的索引的 单元格的值
        papersType=table.rows[selectedIndex-1].cells[3].innerHTML;     // 获取选中的索引的 单元格的值
        papersNumber=table.rows[selectedIndex-1].cells[4].innerHTML;     // 获取选中的索引的 单元格的值
    });
    $.ajax({
        cache:false,
        type: "POST",
        url: getRootPath()+'${ctx}/Predetermine/confirmPassenger.do',
        data:"id="+chk_value,
        async:false,
        success: function (result) {
            document.getElementById("twoId").value=chk_value;
            document.getElementById("contactPhoneNumberId").value=result;
            document.getElementById("nameId").value=name;
            document.getElementById("papersTypeId").value=papersType;
            document.getElementById("papersNumberId").value=papersNumber;
        },
        error: function(data) {
        }
    });
}

function selectTarget(){
    var tbody = document.getElementById("tbodyTwo");
    var name=document.getElementById("txtnameidTwo").value;
    var i=0;
    $("#tbodyTwo").empty();
    $.ajax({
        cache:false,
        type: "POST",
        url: getRootPath()+'/Predetermine/selectTarget.do',
        data:"txtname="+name,
        async:false,
        success: function (result) {
            for (var key in result) {
                i++;
                var item = result[key];
                var tr = tbody.insertRow(-1);            // FireFox必须使用-1这个参数

                var tdcheckbox = tr.insertCell(-1);      // Table 有多少列就添加多少个这个
                var tdTargetTypeName = tr.insertCell(-1);
                var tdTeamName = tr.insertCell(-1);
                var tdTeamCode = tr.insertCell(-1);
                var tdPrincipal = tr.insertCell(-1);
                var tdRegisterTime = tr.insertCell(-1);
                var tdContactPhoneNUmber=tr.insertCell(-1);

                tdcheckbox.innerHTML = "<input type='radio' name='idTwo' value='"+item.id+"'>";
                tdTargetTypeName.innerHTML = item.targetTypeName;
                tdTeamName.innerHTML = item.teamName;
                tdTeamCode.innerHTML =item.teamCode;         //中间这个是数据
                tdPrincipal.innerHTML =item.principal;
                tdRegisterTime.innerHTML =new Date(item.registerTime).Format("yyyy-MM-dd hh:mm:ss");
                tdContactPhoneNUmber.innerHTML=item.contactPhoneNUmber;
            }
            if(i==0){
                alert("很抱歉！没有查找到你要找的数据");
            }
        },
        error: function(data) {
        }
    });
}

function confirmRarget(){
    var chk_value=[];
    var table=document.getElementById("tbodyTwo");
    var selectedIndex="";
    var teamName="";
    var teamCode="";
    var principal="";
    var contactPhoneNUmber="";
    var registerTime="";
    $('input[name="idTwo"]:checked').each(function(){
        chk_value.push($(this).val());
        selectedIndex=this.parentNode.parentNode.rowIndex;         // 获取选中的索引 单装他的变量不是数组，可以为数组
        teamName=table.rows[selectedIndex-1].cells[2].innerHTML;     // 获取选中的索引的 单元格的值
        teamCode=table.rows[selectedIndex-1].cells[3].innerHTML;     // 获取选中的索引的 单元格的值
        principal=table.rows[selectedIndex-1].cells[4].innerHTML;     // 获取选中的索引的 单元格的值
        contactPhoneNUmber=table.rows[selectedIndex-1].cells[6].innerHTML;     // 获取选中的索引的 单元格的值
        registerTime=table.rows[selectedIndex-1].cells[5].innerHTML;     // 获取选中的索引的 单元格的值
    });
    document.getElementById("oneId").value=chk_value;
    document.getElementById("teamNameId").value=teamName;
    document.getElementById("teamCodeId").value=teamCode;
    document.getElementById("principalId").value=principal;
    document.getElementById("contactPhoneNUmberId").value=contactPhoneNUmber;
    document.getElementById("registerTimeId").value=registerTime;
}



function selectOne(){
    var txtname=document.getElementById("txtnameid").value;
    var state=document.getElementById("stateId").value;
    parent.document.getElementById("Mainid").src=getRootPath()+'/Predetermine/tolist.do?txtname='
        +txtname+'&state='+state;
}

function selectTwo(){
    var state=document.getElementById("stateId").value;
    parent.document.getElementById("Mainid").src=getRootPath()+'/Predetermine/tolist.do?state='+state;
}

function arrangeRoom(){
    var chk_value=[];
    $('input[name="id"]:checked').each(function(){
        chk_value.push($(this).val());
    });
    if(chk_value!=""){
        var flag=window.confirm("注意：房间已安排成功，是否转到，住宿登记界面，便于登记旅客信息");
        if(flag){
            parent.document.getElementById("Mainid").src=getRootPath()+'/Predetermine/arrangeRoom.do?id='
                +chk_value+'&tiaoZhuang='+1;
        }else{
            parent.document.getElementById("Mainid").src=getRootPath()+'/Predetermine/arrangeRoom.do?id='
                +chk_value+'&tiaoZhuang='+2;
        }
    }else{
        alert("请选择一条或多条数据进行安排房间");
    }
}