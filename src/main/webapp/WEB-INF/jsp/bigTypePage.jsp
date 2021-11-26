<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/6
  Time: 15:28
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
                    <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath }/rest/bigtype/findByName" method="get">
                        <input type="text" name="name" placeholder="请输入标签名" autocomplete="off" class="layui-input" value="${param.name }">
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
                        <th>标签名</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list }" var="list">
                        <tr>
                            <th>${list.id }</th>
                            <th>${list.big_type_name }</th>
                            <th>${list.create_time }</th>
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
                                <li><a href="${pageContext.request.contextPath }/rest//bigtype/AllBigType?pn=1">首页</a></li>
                                <c:if test="${pageInfo.hasPreviousPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest//bigtype/AllBigType?pn=${pageInfo.pageNum-1}"
                                           aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                    </a></li>
                                </c:if>


                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                        <li class="active"><a href="#">${page_Num }</a></li>
                                    </c:if>
                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                        <li><a href="${pageContext.request.contextPath }/rest//bigtype/AllBigType?pn=${page_Num }">${page_Num }</a></li>
                                    </c:if>

                                </c:forEach>
                                <c:if test="${pageInfo.hasNextPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest//bigtype/AllBigType?pn=${pageInfo.pageNum+1 }"
                                           aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                    </a></li>
                                </c:if>
                                <li><a href="${pageContext.request.contextPath }/rest//bigtype/AllBigType?pn=${pageInfo.pages}">末页</a></li>
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
                <h4 class="modal-title" id="myModalLabel">二级标签新增</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputbig_type_name" class="col-sm-2 control-label">标签名</label>
                        <div class="col-sm-10">
                            <input type="text" name="big_type_name" class="form-control" id="inputbig_type_name" placeholder="big_type_name">
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


<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog modal-lg" role="document" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">一级标签修改</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="updatebig_type_name" class="col-sm-2 control-label">标签名</label>
                        <div class="col-sm-10">
                            <input type="text" name="big_type_name" class="form-control" id="updatebig_type_name" placeholder="big_type_name">
                            <span class="help-block"></span>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="BigType_Save1" >保存</button>
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


    $("#User_Save1").click(function (){
        /*  /!*  alert($("#registerModal form").serialize());*!/*/
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/bigtype/register",
            type:"POST",
            data:$("#registerModal form").serialize(),
            success:function (result){
                $('#registerModal').modal('hide');
                alert(result.msg);
            }
        })
    });

    function onclicks(id){
        $("#BigType_Save1").attr("edit_id",id);
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/bigtype/selectbyId",
            type:"GET",
            data:{id:id},
            success:function (result) {
                var userDate=result.extend.user;
                $("#updatebig_type_name").val(userDate.big_type_name);
            }
        })
        $("#UpdateModal").modal({
            backdrop:"static",
        });
    };

    $("#BigType_Save1").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/rest/bigtype/editBigType?id="+$(this).attr("edit_id"),
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
                    url:"${pageContext.request.contextPath}/rest/smallType/checkSmallTypeExist",
                    type:"GET",
                    data:{big_type_id:id},
                    success:function (result) {
                        console.log(result);
                        if(result.code==100){
                          $.ajax({
                                    url:"${pageContext.request.contextPath}/rest/bigtype/deleteBigType",
                                    type:"GET",
                                    data:{id:id},
                                    success:function (result) {
                                        alert(result.msg);
                                    }
                                }
                            )
                        }else {
                            alert("无法删除,仍存在该标签下的次级标签")
                        }
                    }
                }
            )
        };
    }


</script>