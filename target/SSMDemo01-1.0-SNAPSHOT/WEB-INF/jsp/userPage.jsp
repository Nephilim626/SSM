<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ include file="../jsp/head.jsp" %>
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <div class="layui-tab-content" style="overflow-y:auto;">
            <div class="x-body">
                <div class="layui-row">
                    <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath }/rest/user/findByName" method="get">
                        <input type="text" name="name" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="${param.name }">
                        <button class="layui-btn" lay-submit="" lay-filter="sreach" type="submit">
                            <i class="layui-icon">
                                &#xe615;
                            </i>
                        </button>
                    </form>
                    <button class="btn btn-primary col-lg-offset-11" id="addNew">新增</button>
                </div>
                <table class="layui-table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>姓名</th>
                            <th>身份证</th>
                            <th>性别</th>
                            <th>电话号码</th>
                            <th>创建时间</th>
                            <th>操作</th>
		                </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list }" var="user">
                        <tr>
                            <th>${user.id }</th>
                            <th>${user.user_name }</th>
                            <th>${user.password }</th>
                            <th>${user.real_name}</th>
                            <th>${user.id_card }</th>
                            <th>${user.sex }</th>
                            <th>${user.tel }</th>
                            <th>${user.create_time }</th>
                            <th>
                                <button class="btn btn-primary btn-sm  edit-btn" onclick="onclicks('${user.id}')">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm  delete-btn" onclick="delClick('${user.id}')">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                        </tr>
                    </tbody>
                </table>

                <div class="row">
                    <!--分页文字信息  -->
                    <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
                        页,总 ${pageInfo.total } 条记录</div>
                    <!-- 分页条信息 -->
                    <div class="col-md-6">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="${pageContext.request.contextPath }/rest/user/users?pn=1">首页</a></li>
                                <c:if test="${pageInfo.hasPreviousPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest/user/users?pn=${pageInfo.pageNum-1}"
                                           aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                    </a></li>
                                </c:if>


                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                        <li class="active"><a href="#">${page_Num }</a></li>
                                    </c:if>
                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                        <li><a href="${pageContext.request.contextPath }/rest/user/users?pn=${page_Num }">${page_Num }</a></li>
                                    </c:if>

                                </c:forEach>
                                <c:if test="${pageInfo.hasNextPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest/user/users?pn=${pageInfo.pageNum+1 }"
                                           aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                    </a></li>
                                </c:if>
                                <li><a href="${pageContext.request.contextPath }/rest/user/users?pn=${pageInfo.pages}">末页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--注册模态框--%>
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog modal-lg" role="document" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">账号新增</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputName" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" name="user_name" class="form-control" id="inputName" placeholder="User_name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputRealName" class="col-sm-2 control-label">真实姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="real_name" class="form-control" id="inputRealName" placeholder="Real_name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputIdCard" class="col-sm-2 control-label">身份证号码</label>
                        <div class="col-sm-10">
                            <input type="text" name="id_card" class="form-control" id="inputIdCard" placeholder="Id_card">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label for="inlineRadio1" class="col-sm-2 control-label" >性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="inlineRadio1" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="inlineRadio2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTel" class="col-sm-2 control-label">电话号码</label>
                        <div class="col-sm-10">
                            <input type="text" name="tel" class="form-control" id="inputTel" placeholder="Tel">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="User_Save1" >保存</button>
            </div>
        </div>
    </div>
</div>

<%--修改模态框--%>

<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog modal-lg" role="document" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">账号修改</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputName" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" name="user_name" class="form-control" id="UpdateName" placeholder="User_name">
                            <span class="help-block"></span>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control" id="UpdatePassword" placeholder="Password">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputRealName" class="col-sm-2 control-label">真实姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="real_name" class="form-control" id="UpdateRealName" placeholder="Real_name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputIdCard" class="col-sm-2 control-label">身份证号码</label>
                        <div class="col-sm-10">
                            <input type="text" name="id_card" class="form-control" id="UpdateIdCard" placeholder="Id_card">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label for="inlineRadio1" class="col-sm-2 control-label" >性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="inlineRadio3" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="inlineRadio4" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTel" class="col-sm-2 control-label">电话号码</label>
                        <div class="col-sm-10">
                            <input type="text" name="tel" class="form-control" id="UpdateTel" placeholder="Tel">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="User_Upadate" >修改</button>
            </div>
        </div>
    </div>
</div>

<script>
    $("#addNew").click(function (){
        $("#registerModal form")[0].reset();
        $("#registerModal").modal({
            backdrop:"static",
        });
    });


    function validate_add_form(){
        var userName=$("#inputName").val();
        var regName=/(^[a-z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(userName)){
            show_validate("#inputName","error","用户名可以是2-5位中文或者3到16位英文")
            return  false;
        }else {
            show_validate("#inputName","success","")
        }
        var inputPassword=$("#inputPassword").val();
        var reginputPassword=/^[a-z0-9_-]{6,18}$/;
        if(!reginputPassword.test(inputPassword)){
            show_validate("#inputPassword","error","密码可以是6-18位英文或者数字")
            return  false;
        }else {
            show_validate("#inputPassword","success","")
        }


        var RealName=$("#inputRealName").val();
        var regRealName=/^[\u2E80-\u9FFF]{2,4}/;
        if(!regRealName.test(RealName)){
            show_validate("#inputRealName","error","姓名可以是2到4位中文");
            return  false;
        }else {
            show_validate("#inputRealName","success","");
        }

        var IdCard=$("#inputIdCard").val();
        var regIdCard=/^[a-z0-9_-]{18}$/;
        if(!regIdCard.test(IdCard)){
            show_validate("#inputIdCard","error","身份证可以是18位数字");
            return  false;
        }else {
            show_validate("#inputIdCard","success","");
        }

        var Tel=$("#inputTel").val();
        var regTel=/^[0-9]{11}/;
        if(!regTel.test(Tel)){
            show_validate("#inputTel","error","电话号码可以是11位数字");
            return  false;
        }else {
            show_validate("#inputTel","success","");
        }

        return true;
    }

    function  show_validate(ele,status,msg){
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg)
        }else if("error"==status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg)
        }
    }

    $("#inputName").change(function () {
        var user_name=this.value;
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/user/checkUsername",
            data:"user_name="+user_name,
            type: "POST",
            success:function (result) {
                if(result.code==100){
                    show_validate("#inputName","success","用户名可用");
                    $("#User_Save1").attr("ajax","success");
                }
                else {
                    show_validate("#inputName","error","用户名不可用");
                    $("#User_Save1").attr("ajax","error");
                }
            }
        });
    });

    $("#User_Save1").click(function (){
        /*  /!*  alert($("#registerModal form").serialize());*!/*/
        if (!validate_add_form()){
            return false;
        }
        if ( $(this).attr("ajax")=="error"){
            return false;
        }

        $.ajax({
            url:"${pageContext.request.contextPath}/rest/user/register",
            type:"POST",
            data:$("#registerModal form").serialize(),
            success:function (result){
                $('#registerModal').modal('hide');
                alert(result.msg);
            }
        })
    });


    function onclicks(id){
        $("#User_Upadate").attr("edit_id",id);
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/user/selectbyId",
            type:"GET",
            data:{id:id},
            success:function (result) {
                var userDate=result.extend.user;
                $("#UpdateName").val(userDate.user_name);
                $("#UpdatePassword").val(userDate.password);
                $("#UpdateRealName").val(userDate.real_name);
                $("#UpdateIdCard").val(userDate.id_card);
                $("#UpdateTel").val(userDate.tel);
                $("#UpdateModal input[name=sex]").val([userDate.sex]);
            }
        })
        $("#UpdateModal").modal({
            backdrop:"static",
        });
    };


    $("#User_Upadate").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/user/editUser?id="+$(this).attr("edit_id"),
            type:"POST",
            data:$("#UpdateModal form").serialize(),
            success:function (result){
                $('#UpdateModal').modal('hide');
                alert(result.msg);
            }
        })
    });

    function delClick(id) {
        if(confirm("是否删除")){
        $.ajax({
                url:"${pageContext.request.contextPath}/rest/user/deleteUser",
                type:"GET",
                data:{id:id},
                success:function (result) {
                    alert(result.msg);
                }
            }
        )};
    }
</script>
