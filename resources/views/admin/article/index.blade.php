@extends('admin.common.main')
@section('html')

    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span> 文章管理
        <span class="c-gray en">&gt;</span> 文章列表
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>

    {{-- 消息提示 --}}
    @include('admin.common.msg')

    <div class="page-container">
        <form method="get" class="text-c" onsubmit="return dopost()">
            日期范围：
            <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin"
                   class="input-text Wdate" style="width:120px;">
            -
            <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax"
                   class="input-text Wdate" style="width:120px;">
            文章标题：
            <input type="text" class="input-text" style="width:250px" placeholder="标题" id="title"
                   value="{{ request()->get('title') }}" autocomplete="off">
            <button type="submit" class="btn btn-success radius"><i class="Hui-iconfont">&#xe665;</i> 搜索文章
            </button>
        </form>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a
                href="{{ route('admin.article.create') }}" class="btn btn-primary radius"><i
                    class="Hui-iconfont">&#xe600;</i> 添加文章
            </a>
        </span>
        </div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-hover table-bg table-sort">
                <thead>
                <tr class="text-c">
                    <th>ID</th>
                    <th>职位</th>
                    <th>加入时间</th>
                    <th>操作</th>
                </tr>
            </table>
        </div>
    </div>

@endsection
@section('js')
    <script>
        // 生成一个token crsf
        const _token = "{{ csrf_token() }}"
        // 给删除按钮绑定事件
        $('.delbtn').click(function (evt) {
            // 得到请求的url地址
            let url = $(this).attr('href');

            $.ajax({
                url,
                data: {_token},
                type: 'DELETE',
                dataType: 'json'
            }).then(({status, msg}) => {
                if (status == 0) {
                    // 提示插件
                    layer.msg(msg, {time: 2000, icon: 1}, () => {
                        // 删除当前行
                        $(this).parents('tr').remove();
                    });
                }
            });

            // jquery取消默认事件
            return false;
        });

        // 全选删除
        const deleteAll = () => {

            layer.confirm('您是真的要删除选中的用户吗？', {
                btn: ['确认删除', '思考一下']
            }, () => {
                // 选中的用户
                let ids = $('input[name="id[]"]:checked');
                // 删除的ID
                let id = [];
                // 循环
                $.each(ids, (key, val) => {
                    // dom对象 转为 jquery对象 $(dom对象)
                    // id.push($(val).val());
                    id.push(val.value);
                });
                if (id.length > 0) {
                    // 发起ajax
                    $.ajax({
                        url: "{{ route('admin.user.delall') }}",
                        data: {id, _token},
                        type: 'DELETE'
                    }).then(ret => {
                        if (ret.status == 0) {
                            layer.msg(ret.msg, {time: 2000, icon: 1}, () => {
                                location.reload();
                            })
                        }
                    })
                }
            });


        }

    </script>

    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css"
          href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
    <!-- DataTables -->
    <script type="text/javascript" charset="utf8"
            src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script>
        // 列表显示
        var dataTable = $('.table-sort').DataTable({

            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            // 下拉的分页数据
            lengthMenu: [5, 10, 15, 20, 100],
            // 隐藏搜索
            searching: false,
            columnDefs: [
                // 索引第3列，不进行排序
                {targets: [3], orderable: false}
            ],
            // 开启服务器端分页
            serverSide: true,
            ajax: {
                // 请求地址
                url: '{{ route('admin.article.index') }}',
                // 请求方式
                type: 'get',
                // 参数 动态获取表单数据
                data: function (ret) {
                    ret.datemin = $('#datemin').val();
                    ret.datemax = $('#datemax').val();
                    ret.title = $.trim($('#title').val());
                }
            },
            // 指定每一列显示的数据
            columns: [
                // {'data':'字段名称1',"defaultContent": "默认值",'className':'类名'},
                {data: 'id', className: 'text-c'},
                {data: 'title'},
                {data: 'created_at'},
                {data: 'action', defaultContent: '默认值'}
            ],
            // 回调方法
            // row 当前行的dom对象
            // 当前行的数据
            // 当前行的数据索引
            // createdRow: function (row, data, dataIndex) {
            //     // console.log($(row).find('td:last-child').html());
            //     // 当前id
            //     var id = data.id;
            //     // 行的最后一列
            //     var td = $(row).find('td:last-child');
            //     // 显示html内容
            //     var html ='<a href="/admin/article/${id}/edit" class="label label-secondary radius">修改</a>&emsp;' +
            //         '<a href="/admin/article/${id}" class="label label-danger radius delbtn">删除</a>';
            //     // html添加到td中
            //     td.html(html);
            // }
        });

        // 表单提交
        function dopost() {
            // 手动调用一次dataTable插件请求
            dataTable.ajax.reload();
            // 取消表单默认行为
            return false;
        }
    </script>
@endsection

