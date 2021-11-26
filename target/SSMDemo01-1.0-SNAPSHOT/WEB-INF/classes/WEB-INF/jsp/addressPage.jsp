<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/3
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../jsp/head.jsp" %>
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <div class="layui-tab-content" style="overflow-y:auto;">
            <div class="x-body">
                <div class="layui-row">
                    <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath }/rest/address/findByName" method="get">
                        <input type="text" name="name" placeholder="请输入用户名" autocomplete="off" class="layui-input" value="${param.name }">
                        <button class="layui-btn" lay-submit="" lay-filter="sreach" type="submit">
                            <i class="layui-icon">
                                &#xe615;
                            </i>
                        </button>
                    </form>
                    <button class="layui-btn col-lg-offset-11" id="addNew">新增</button>
                </div>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>收货人</th>
                        <th>收货人电话号码</th>
                        <th>收货地址</th>
                        <th>用户id</th>
                        <th>用户名</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list }" var="address">
                        <tr>
                            <th>${address.id }</th>
                            <th>${address.consignee }</th>
                            <th>${address.consignee_tel }</th>
                            <th>${address.address }</th>
                            <th>${address.user_id}</th>
                            <th>${address.user.user_name}</th>
                            <th>${address.create_time }</th>
                            <th>
                                <button class="btn btn-primary btn-sm  edit-btn" onclick="onclicks('${address.id}')">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm  delete-btn" onclick="delClick('${address.id}')">
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
                                <li><a href="${pageContext.request.contextPath }/rest/address/Alladdress?pn=1">首页</a></li>
                                <c:if test="${pageInfo.hasPreviousPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest/address/Alladdress?pn=${pageInfo.pageNum-1}"
                                           aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                    </a></li>
                                </c:if>


                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                        <li class="active"><a href="#">${page_Num }</a></li>
                                    </c:if>
                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                        <li><a href="${pageContext.request.contextPath }/rest/address/Alladdress?pn=${page_Num }">${page_Num }</a></li>
                                    </c:if>

                                </c:forEach>
                                <c:if test="${pageInfo.hasNextPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest/address/Alladdress?pn=${pageInfo.pageNum+1 }"
                                           aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                    </a></li>
                                </c:if>
                                <li><a href="${pageContext.request.contextPath }/rest/address/Alladdress?pn=${pageInfo.pages}">末页</a></li>
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
                <h4 class="modal-title" id="myModalLabel">地址新增</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputconsignee" class="col-sm-2 control-label">收货人</label>
                        <div class="col-sm-10">
                            <input type="text" name="consignee" class="form-control" id="inputconsignee" placeholder="consignee">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputconsignee_tel" class="col-sm-2 control-label">收货人电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="consignee_tel" class="form-control" id="inputconsignee_tel" placeholder="consignee_tel">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputaddress" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="address" class="form-control" id="inputaddress" placeholder="address">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户id</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="user_id">
                            </select>
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
                <h4 class="modal-title" id="myModalLabel1">地址新增</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="updateconsignee" class="col-sm-2 control-label">收货人</label>
                        <div class="col-sm-10">
                            <input type="text" name="consignee" class="form-control" id="updateconsignee" placeholder="consignee">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateconsignee_tel" class="col-sm-2 control-label">收货人电话</label>
                        <div class="col-sm-10">
                            <input type="text" name="consignee_tel" class="form-control" id="updateconsignee_tel" placeholder="consignee_tel">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateaddress" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="address" class="form-control" id="updateaddress" placeholder="address">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户id</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="user_id">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="Address_Update1" >保存</button>
            </div>
        </div>
    </div>
</div>

<script>

    $("#addNew").click(function (){

        getUserID("#registerModal select")
        $("#registerModal form")[0].reset();
        $("#registerModal").modal({
            backdrop:"static",
        });
    });

    function getUserID(ele){
        $(ele).empty();
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/user/queryAll",
            type:"GET",
            success:function(result){
                $.each(result.extend.Alluser,function(){

                    var optionEle = $("<option></option>").append(this.user_name).attr("value",this.id);
                    console.log(optionEle);
                    optionEle.appendTo(ele);
                });
            }
        });

    }

    $("#User_Save1").click(function (){
        /*  /!*  alert($("#registerModal form").serialize());*!/*/
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/address/register",
            type:"POST",
            data:$("#registerModal form").serialize(),
            success:function (result){
                $('#registerModal').modal('hide');
                alert(result.msg);
            }
        })
    });

    function  onclicks(id){
        $("#Address_Update1").attr("edit_id",id);
        getUserID("#UpdateModal select");
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/address/selectbyId",
            type:"GET",
            data:{id:id},
            success:function (result) {
                console.log(result);
                var userDate=result.extend.user;
                $("#updateconsignee").val(userDate.consignee);

                $("#updateconsignee_tel").val(userDate.consignee_tel);

                $("#updateaddress").val(userDate.address);

                $("#UpdateModal select").val([userDate.user_id]);
            }
        });
        $("#UpdateModal form")[0].reset();
        $("#UpdateModal").modal({
            backdrop:"static",
        });
    }


    $("#Address_Update1").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/address/editAddress?id="+$(this).attr("edit_id"),
            type:"POST",
            data:$("#UpdateModal form").serialize(),
            success:function (result){
                $('#UpdateModal').modal('hide');
                alert(result.msg);
            }
        })
    });



    function  delClick(id){
        if(confirm("是否删除")){

            $.ajax({
                    url:"${pageContext.request.contextPath}/rest/address/deleteAddress",
                    type:"GET",
                    data:{id:id},
                    success:function (result) {
                        alert(result.msg);
                    }
                }
            )};
    }

</script>