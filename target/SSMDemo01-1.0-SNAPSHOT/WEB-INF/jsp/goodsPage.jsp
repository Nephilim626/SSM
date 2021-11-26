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
                    <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath }/rest/goods/findByName" method="get">
                        <input type="text" name="name" placeholder="请输入商品名" autocomplete="off" class="layui-input" value="${param.name }">
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
                        <th>商品名字</th>
                        <th>价格</th>
                        <th>描述</th>
                        <th>数量</th>
                        <th>图片</th>
                        <th>生产商</th>
                        <th>二级标签id</th>
                        <th>创建时间</th>
                        <th>状态</th>
                        <th>评分</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list }" var="goods">
                        <tr>
                            <th>${goods.id }</th>
                            <th>${goods.goods_name }</th>
                            <th>${goods.price }</th>
                            <th>${goods.describtion}</th>
                            <th>${goods.num }</th>
                            <th>${goods.picture }</th>
                            <th>${goods.manufacturer }</th>
                            <th>${goods.small_type_id }</th>
                            <th>${goods.create_time }</th>
                            <th>${goods.states }</th>
                            <th>${goods.score }</th>
                            <th>
                                <button class="btn btn-primary btn-sm  edit-btn" onclick="onclicks('${goods.id}')">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm  delete-btn" onclick="delClick('${goods.id}')">
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
                                <li><a href="${pageContext.request.contextPath }/rest/goods/allGoods?pn=1">首页</a></li>
                                <c:if test="${pageInfo.hasPreviousPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest/goods/allGoods?pn=${pageInfo.pageNum-1}"
                                           aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                    </a></li>
                                </c:if>


                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                        <li class="active"><a href="#">${page_Num }</a></li>
                                    </c:if>
                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                        <li><a href="${pageContext.request.contextPath }/rest/goods/allGoods?pn=${page_Num }">${page_Num }</a></li>
                                    </c:if>

                                </c:forEach>
                                <c:if test="${pageInfo.hasNextPage }">
                                    <li><a href="${pageContext.request.contextPath }/rest/goods/allGoods?pn=${pageInfo.pageNum+1 }"
                                           aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                    </a></li>
                                </c:if>
                                <li><a href="${pageContext.request.contextPath }/rest/goods/allGoods?pn=${pageInfo.pages}">末页</a></li>
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
                <h4 class="modal-title" id="myModalLabel">商品新增</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal" id="registerModal1">
                    <div class="form-group">
                        <label for="inputGoodsName" class="col-sm-2 control-label">商品名</label>
                        <div class="col-sm-10">
                            <input type="text" name="goods_name" class="form-control" id="inputGoodsName" placeholder="Goods_name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPrice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="inputPrice" placeholder="Price">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputdescribtion" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10">
                            <input type="text" name="describtion" class="form-control" id="inputdescribtion" placeholder="Describtion">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputNum" class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-10">
                            <input type="text" name="num" class="form-control" id="inputNum" placeholder="Num">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputpicture" class="col-sm-2 control-label">照片</label>
                        <div class="col-sm-10">
                            <input type="text" name="picture" class="form-control" id="inputpicture" placeholder="picture" value="${fileName}">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputManufacturer" class="col-sm-2 control-label">生产商</label>
                        <div class="col-sm-10">
                            <input type="text" name="manufacturer" class="form-control" id="inputManufacturer" placeholder="manufacturer">
                            <span class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputstates" class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-10">
                       <%--     <input type="text" name="states" class="form-control" id="inputstates" placeholder="states">
                            <span class="help-block"></span>--%>
                           <select class="form-control" name="states" id="inputstates">
                               <option value="0">上架</option>
                               <option value="1">下架</option>
                           </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputscore" class="col-sm-2 control-label">评分</label>
                        <div class="col-sm-10">
                            <input type="text" name="score" class="form-control" id="inputscore" placeholder="score">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">二级标签id</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="small_type_id" id="small_type_id1">
                            </select>
                        </div>
                    </div>
                </form>
                    <form id="pictureForm" class="form-horizontal"<%-- action="${pageContext.request.contextPath }/rest/goods/fileUpload" method="post" enctype="multipart/form-data--%>">
                        <div class="form-group">
                            <label for="inputGoodsName" class="col-sm-2 control-label">选择文件</label>
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


<%--修改模态框--%>
<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog modal-lg" role="document" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">商品新增</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="updateGoodsName" class="col-sm-2 control-label">商品名</label>
                        <div class="col-sm-10">
                            <input type="text" name="goods_name" class="form-control" id="updateGoodsName" placeholder="Goods_name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updatePrice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="updatePrice" placeholder="Price">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updatedescribtion" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10">
                            <input type="text" name="describtion" class="form-control" id="updatedescribtion" placeholder="Describtion">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateNum" class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-10">
                            <input type="text" name="num" class="form-control" id="updateNum" placeholder="Num">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updatepicture" class="col-sm-2 control-label">照片</label>
                        <div class="col-sm-10">
                            <input type="text" name="picture" class="form-control" id="updatepicture" placeholder="picture">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="updateManufacturer" class="col-sm-2 control-label">生产商</label>
                        <div class="col-sm-10">
                            <input type="text" name="manufacturer" class="form-control" id="updateManufacturer" placeholder="manufacturer">
                            <span class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="updatestates" class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-10">
                           <%-- <input type="text" name="states" class="form-control" id="updatestates" placeholder="states">
                            <span class="help-block"></span>--%>
                            <select class="form-control" name="states" id="updatestates">
                                <option value="0">上架</option>
                                <option value="1">下架</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updatescore" class="col-sm-2 control-label">评分</label>
                        <div class="col-sm-10">
                            <input type="text" name="score" class="form-control" id="updatescore" placeholder="score">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">二级标签id</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="small_type_id" id="small_type_id">
                            </select>
                        </div>
                    </div>
                </form>
                    <form id="pictureForm" class="form-horizontal" action="${pageContext.request.contextPath }/rest/goods/fileUpload" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="inputGoodsName" class="col-sm-2 control-label">选择文件</label>
                            <div class="col-sm-10">
                                <input type="file" name="file" class="form-control" id="pictureFile1">
                                <input type="button" id="pictureSubmit1" value="上传图片">
                            </div>
                        </div>
                    </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="Goods_edit" >保存</button>
            </div>
        </div>
    </div>
</div>

<script>
        $("#addNew").click(function (){
        getSmallTypeID("#registerModal #small_type_id1")
        $("#registerModal form")[0].reset();
          /*  $("#registerModal form")[1].reset();*/
        $("#registerModal").modal({
        backdrop:"static",
    });
    });


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



        function getSmallTypeID(ele){
            $(ele).empty();
            $.ajax({
                url:"${pageContext.request.contextPath}/rest/smallType/queryAll",
                type:"GET",
                success:function(result){
                    $.each(result.extend.smallType,function(){

                        var optionEle = $("<option></option>").append(this.type_name).attr("value",this.id);
                        console.log(optionEle);
                        optionEle.appendTo(ele);
                    });
                }
            });

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

        $("#inputGoodsName").change(function () {
            var goods_name=this.value;
            $.ajax({
                url:"${pageContext.request.contextPath}/rest/goods/checkGoodsName",
                data:"goods_name="+goods_name,
                type: "POST",
                success:function (result) {
                    if(result.code==100){
                        show_validate("#inputGoodsName","success","用户名可用");
                        $("#User_Save1").attr("ajax","success");
                    }
                    else {
                        show_validate("#inputGoodsName","error","用户名不可用");
                        $("#User_Save1").attr("ajax","error");
                    }
                }
            });
        });

        $("#User_Save1").click(function (){
            /*  /!*  alert($("#registerModal form").serialize());*!/*/
            if ( $(this).attr("ajax")=="error"){
                return false;
            }

            $.ajax({
                url:"${pageContext.request.contextPath}/rest/goods/register",
                type:"POST",
                data:$("#registerModal1 ").serialize(),
                success:function (result){
                    $('#registerModal').modal('hide');
                    alert(result.msg);
                }
            })
        });

      function  onclicks(id){
          $("#Goods_edit").attr("edit_id",id);
          getSmallTypeID("#UpdateModal #small_type_id");
          $.ajax({
              url:"${pageContext.request.contextPath}/rest/goods/selectbyId",
              type:"GET",
              data:{id:id},
              success:function (result) {
                  console.log(result);
                 var userDate=result.extend.user;
                  $("#updateGoodsName").val(userDate.goods_name);

                  $("#updatePrice").val(userDate.price);

                  $("#updatedescribtion").val(userDate.describtion);

                  $("#updateNum").val(userDate.num);

                  $("#updatepicture").val(userDate.picture);
                  $("#updateManufacturer").val(userDate.manufacturer);

                  $("#updatestates").val(userDate.states);
                  $("#updatescore").val(userDate.score);
                  $("#UpdateModal select").val([userDate.small_type_id]);
              }
          });
          $("#UpdateModal form")[0].reset();
          $("#UpdateModal").modal({
              backdrop:"static",
          });

        }

        $("#Goods_edit").click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/rest/goods/editGoods?id="+$(this).attr("edit_id"),
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
                    url:"${pageContext.request.contextPath}/rest/goods/deleteGoods",
                    type:"GET",
                    data:{id:id},
                    success:function (result) {
                        alert(result.msg);
                    }
                }
            )};
         }
</script>