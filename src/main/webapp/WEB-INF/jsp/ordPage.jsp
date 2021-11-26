<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/4
  Time: 19:47
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
                    <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath }/rest/ord/findByName" method="get">
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
                        <th>商品名</th>
                        <th>用户名</th>
                        <th>收货地址</th>
                        <th>收货人</th>
                        <th>数量</th>
                        <th>库存总量</th>
                        <th>总价</th>
                        <th>订单号</th>
                        <th>订单状态</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list }" var="list">
                        <tr>
                            <th>${list.id }</th>
                            <th>${list.goods.goods_name }</th>
                            <th>${list.user.user_name }</th>
                            <th>${list.address.address }</th>
                            <th>${list.address.consignee}</th>
                            <th>${list.num }</th>
                            <th>${list.goods.num }</th>
                            <th>${list.price }</th>
                            <th>${list.ord_no }</th>
                            <th>${list.ord_state }</th>
                            <th>${list.create_time }</th>
                            <th>
                                <button class="btn btn-danger btn-sm  delete-btn" onclick="delClick('${list.id}')">
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
                                <li><a href="${pageContext.request.contextPath }/rest/ord/AllOrd?pn=1">首页</a></li>
                                <c:if test="${pageInfo.hasPreviousPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest/ord/AllOrd?pn=${pageInfo.pageNum-1}"
                                           aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                    </a></li>
                                </c:if>


                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                        <li class="active"><a href="#">${page_Num }</a></li>
                                    </c:if>
                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                        <li><a href="${pageContext.request.contextPath }/rest/ord/AllOrd?pn=${page_Num }">${page_Num }</a></li>
                                    </c:if>

                                </c:forEach>
                                <c:if test="${pageInfo.hasNextPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest/ord/AllOrd?pn=${pageInfo.pageNum+1 }"
                                           aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                    </a></li>
                                </c:if>
                                <li><a href="${pageContext.request.contextPath }/rest/ord/AllOrd?pn=${pageInfo.pages}">末页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--新增模态框--%>
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog modal-lg" role="document" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增订单</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="goods_id" id="goods_id">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="user_id" id="user_id">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="address_id" id="address_id">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputnum" class="col-sm-2 control-label">货物数量</label>
                        <div class="col-sm-10">
                            <input type="text" name="num" class="form-control" id="inputnum" placeholder="num">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputprice" class="col-sm-2 control-label">货物总价</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="inputprice" placeholder="price">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputord_no" class="col-sm-2 control-label">订单编号</label>
                        <div class="col-sm-10">
                            <input type="text" name="ord_no" class="form-control" id="inputord_no" placeholder="ord_no">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputord_state" class="col-sm-2 control-label">订单状态</label>
                        <div class="col-sm-10">
                        <%--    <input type="text" name="ord_state" class="form-control" id="inputord_state" placeholder="ord_state">
                            <span class="help-block"></span>--%>
                            <select class="form-control" name="ord_state" id="inputord_state">
                                <option value="0">未付款</option>
                                <option value="1">已支付</option>
                                <option value="2">已发货</option>
                                <option value="3">已到货</option>
                                <option value="4">已签收</option>
                                <option value="5">结束订单</option>
                                <option value="6">退货中</option>
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



<script>

    $("#addNew").click(function (){

        getGoodsID("#registerModal #goods_id");
        getUserID("#registerModal #user_id");
        getAddressID("#registerModal #address_id");



        $("#registerModal form")[0].reset();
        $("#registerModal").modal({
            backdrop:"static",
        });

    });


    function getGoodsID(ele){
        $(ele).empty();
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/goods/queryAll",
            type:"GET",
            success:function(result){
                $.each(result.extend.AllGoods,function(){

                    var optionEle = $("<option></option>").append(this.goods_name).attr("value",this.id);
                    console.log(optionEle);
                    optionEle.appendTo(ele);
                });
            }
        });

    }
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

    function getAddressID(ele){
        $(ele).empty();
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/address/queryAll",
            type:"GET",
            success:function(result){
                $.each(result.extend.AllAddress,function(){

                    var optionEle = $("<option></option>").append(this.address).attr("value",this.id);
                    console.log(optionEle);
                    optionEle.appendTo(ele);
                });
            }
        });
    }


    $("#inputnum").change(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/goods/selectbyId",
            type:"GET",
            data:{id:$("#registerModal #goods_id").val()},
            success:function (result){
                /*console.log(result);*/
                $("#User_Save1").attr("Allnum",result.extend.user.num);
                $("#inputprice").attr("value",result.extend.user.price*$("#inputnum").val());
            }
        });



    });


    $("#User_Save1").click(function (){
   if($("#User_Save1").attr("Allnum")>$("#registerModal #inputnum").val()){
     $.ajax({
            url:"${pageContext.request.contextPath}/rest/ord/register",
            type:"POST",
            data:$("#registerModal form").serialize(),
            success:function (result){
                console.log(result.extend.num);
                console.log($("#goods_id").val());
                $.ajax({
                    url:"${pageContext.request.contextPath}/rest/goods/updateNumById",
                    type:"GET",
                    data:{ id: $("#goods_id").val(),
                            num: result.extend.num},
                    success:function (result) {
                        $('#registerModal').modal('hide');
                    }
                })
                alert(result.msg);
            }
        })
    }else {
          $('#registerModal').modal('hide');
          alert("库存不足");
     }
    });


    function delClick(id) {
        if(confirm("是否删除")){
            $.ajax({
                    url:"${pageContext.request.contextPath}/rest/ord/deleteOrd",
                    type:"GET",
                    data:{id:id},
                    success:function (result) {
                        alert(result.msg);
                    }
                }
            )};
    }

</script>