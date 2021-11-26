<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/9
  Time: 8:20
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
                    <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath }/rest/evaluate/findByName" method="get">
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
                        <th>商品id</th>
                        <th>商品名</th>
                        <th>用户id</th>
                        <th>用户名</th>
                        <th>评论</th>
                        <th>图片</th>
                        <th>等级</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list }" var="list">
                        <tr>
                            <th>${list.id }</th>
                            <th>${list.goods_id }</th>
                            <th>${list.goods.goods_name }</th>
                            <th>${list.user_id }</th>
                            <th>${list.user.user_name }</th>
                            <th>${list.content }</th>
                            <th>${list.picture }</th>
                            <th>${list.level }</th>
                            <th>
                                <button class="btn btn-primary btn-sm  edit-btn" onclick="onclicks('${list.id}')">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
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
                                <li><a href="${pageContext.request.contextPath }/rest/evaluate/AllGoodsEvaluate?pn=1">首页</a></li>
                                <c:if test="${pageInfo.hasPreviousPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest/evaluate/AllGoodsEvaluate?pn=${pageInfo.pageNum-1}"
                                           aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                    </a></li>
                                </c:if>


                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                        <li class="active"><a href="#">${page_Num }</a></li>
                                    </c:if>
                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                        <li><a href="${pageContext.request.contextPath }/rest/evaluate/AllGoodsEvaluate?pn=${page_Num }">${page_Num }</a></li>
                                    </c:if>

                                </c:forEach>
                                <c:if test="${pageInfo.hasNextPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest/evaluate/AllGoodsEvaluate?pn=${pageInfo.pageNum+1 }"
                                           aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                    </a></li>
                                </c:if>
                                <li><a href="${pageContext.request.contextPath }/rest/evaluate/AllGoodsEvaluate?pn=${pageInfo.pages}">末页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog modal-lg" role="document" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">商品评论新增</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal" id="registerModal1">


                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品名</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="goods_id" id="goods_id">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="user_id" id="user_id">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputcontent" class="col-sm-2 control-label">评价内容</label>
                        <div class="col-sm-10">
                            <textarea  type="text" name="content" class="form-control" id="inputcontent" placeholder="content"> </textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputpicture" class="col-sm-2 control-label">照片</label>
                        <div class="col-sm-10">
                            <input type="text" name="picture" class="form-control" id="inputpicture" placeholder="picture">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputlevel" class="col-sm-2 control-label">等级</label>
                        <div class="col-sm-10">
                        <select class="form-control" name="level" id="inputlevel">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                        </div>
                    </div>
                </form>

                    <form id="pictureForm" class="form-horizontal"<%-- action="${pageContext.request.contextPath }/rest/goods/fileUpload" method="post" enctype="multipart/form-data--%>">
                    <div class="form-group">
                        <label for="pictureFile" class="col-sm-2 control-label">选择文件</label>
                        <div class="col-sm-10">
                            <input type="file" name="file" class="form-control" id="pictureFile">
                            <input type="button" id="pictureSubmit" value="上传图片">
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
<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog modal-lg" role="document" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">商品评论新增</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal" id="registerModal1">

                    <div class="form-group">
                        <label for="updatecontent" class="col-sm-2 control-label">评价内容</label>
                        <div class="col-sm-10">
                            <textarea  type="text" name="content" class="form-control" id="updatecontent" placeholder="content"> </textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updatepicture" class="col-sm-2 control-label">照片</label>
                        <div class="col-sm-10">
                            <input type="text" name="picture" class="form-control" id="updatepicture" placeholder="picture">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updatelevel" class="col-sm-2 control-label">等级</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="level" id="updatelevel">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                    </div>
                </form>
                <form id="pictureForm" class="form-horizontal"<%-- action="${pageContext.request.contextPath }/rest/goods/fileUpload" method="post" enctype="multipart/form-data--%>">
                <div class="form-group">
                    <label for="pictureFile1" class="col-sm-2 control-label">选择文件</label>
                    <div class="col-sm-10">
                        <input type="file" name="file" class="form-control" id="pictureFile1">
                        <input type="button" id="pictureSubmit1" value="上传图片">
                    </div>
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="Evaluate_edit" >保存</button>
            </div>
        </div>
    </div>
</div>
<script>
    $("#addNew").click(function (){

        getGoodsID("#registerModal #goods_id");
        getUserID("#registerModal #user_id");
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
    $("#pictureSubmit").click(function () {
        var fromData= new FormData();
        var img=document.getElementById("pictureFile");
        var fileObj=img.files[0];
        fromData.append("file",fileObj);
        console.log(fromData);
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/goods/fileUpload",
            type:"POST",
            async:false,
            processData: false,
            contentType: false,
            data:fromData,
            success:function (result){
                $("#inputpicture").attr("value",result.extend.file);
            }
        });
    });

    $("#pictureSubmit1").click(function () {
        var fromData= new FormData();
        var img=document.getElementById("pictureFile1");
        var fileObj=img.files[0];
        fromData.append("file",fileObj);
        console.log(fromData);
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/goods/fileUpload",
            type:"POST",
            async:false,
            processData: false,
            contentType: false,
            data:fromData,
            success:function (result){
                console.log(result.extend.file);
                $("#updatepicture").val(result.extend.file);
            }
        });
    });

    $("#User_Save1").click(function (){
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/evaluate/register",
            type:"POST",
            data:$("#registerModal1 ").serialize(),
            success:function (result){
                $('#registerModal').modal('hide');
                alert(result.msg);
            }
        })
    });

    function  onclicks(id){
        $("#Evaluate_edit").attr("edit_id",id);

        $.ajax({
            url:"${pageContext.request.contextPath}/rest/evaluate/selectbyId",
            type:"GET",
            data:{id:id},
            success:function (result) {
                console.log(result);
                var userDate=result.extend.user;
                $("#updatecontent").val(userDate.content);

                $("#updatepicture").val(userDate.picture);

                $("#UpdateModal select").val([userDate.level]);
            }
        });
        $("#UpdateModal form")[0].reset();
        $("#UpdateModal form")[1].reset();
        $("#UpdateModal").modal({
            backdrop:"static",
        });
    }


    $("#Evaluate_edit").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/evaluate/editEvaluate?id="+$(this).attr("edit_id"),
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
                    url:"${pageContext.request.contextPath}/rest/evaluate/deleteEvaluate",
                    type:"GET",
                    data:{id:id},
                    success:function (result) {
                        alert(result.msg);
                    }
                }
            )};
    }


</script>