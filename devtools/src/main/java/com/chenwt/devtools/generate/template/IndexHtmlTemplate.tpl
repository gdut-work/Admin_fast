<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
      xmlns:mo="https://gitee.com/chenwt/Admin_fast">
<head th:replace="/common/template :: header(~{::title},~{::link},~{::style})">
</head>
<body class="admin-layout-page">
    <div class="layui-card">
        <div class="layui-card-header admin-card-header">
            <span><i class="fa fa-bars"></i> #{title}管理</span>
            <i class="layui-icon layui-icon-refresh refresh-btn"></i>
        </div>
        <div class="layui-card-body">
            <div class="layui-row admin-card-screen">
                <div class="pull-left layui-form-pane admin-search-box">
                    <div class="layui-inline">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block admin-search-status">
                            <select class="admin-search-select" name="status" mo:dict="SEARCH_STATUS" mo-selected="${param.status}"></select>
                        </div>
                    </div>
                    <div jsoup="search" class="layui-inline">
                        <label class="layui-form-label">#{search.title}</label>
                        <div class="layui-input-block">
                            <input type="text" name="#{search.name}" th:value="${param.#{search.name}}" placeholder="请输入#{search.title}" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <button class="layui-btn admin-search-btn">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <div class="pull-right screen-btn-group">
                    <button jsoup="add" class="layui-btn open-popup" data-title="添加#{title}" th:attr="data-url=@{#{baseUrl}/add}" data-size="auto">
                        <i class="fa fa-plus"></i> 添加</button>
                    <div class="btn-group">
                        <button class="layui-btn">操作<span class="caret"></span></button>
                        <dl class="layui-nav-child layui-anim layui-anim-upbit">
                            <dd><a class="ajax-status" th:href="@{#{baseUrl}/status/ok}">启用</a></dd>
                            <dd><a class="ajax-status" th:href="@{#{baseUrl}/status/freezed}">冻结</a></dd>
                            <dd><a class="ajax-status" th:href="@{#{baseUrl}/status/delete}">删除</a></dd>
                        </dl>
                    </div>
                </div>
            </div>
            <div class="admin-table-wrap">
                <table class="layui-table admin-table">
                    <thead>
                    <tr>
                        <th class="admin-table-checkbox">
                            <label class="admin-checkbox"><input type="checkbox">
                                <i class="layui-icon layui-icon-ok"></i></label>
                        </th>
                        <th jsoup="table-th">表格标题</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr th:each="item:${list}">
                        <td><label class="admin-checkbox"><input type="checkbox" th:value="${item.id}">
                            <i class="layui-icon layui-icon-ok"></i></label></td>
                        <td jsoup="table-list"></td>
                        <td>
                            <a jsoup="edit" class="open-popup" data-title="编辑#{title}" th:attr="data-url=@{'#{baseUrl}/edit/'+${item.id}}" data-size="auto" href="#">编辑</a>
                            <a jsoup="detail" class="open-popup" data-title="详细信息" th:attr="data-url=@{'#{baseUrl}/detail/'+${item.id}}" data-size="800,600" href="#">详细</a>
                            <a class="ajax-get" data-msg="您是否确认删除" th:href="@{#{baseUrl}/status/delete(ids=${item.id})}">删除</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div th:replace="/common/fragment :: page"></div>
        </div>
    </div>
<script th:replace="/common/template :: script"></script>
</body>
</html>