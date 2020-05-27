@extends('admin.common.main')
@section('html')
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span> 用户中心
        <span class="c-gray en">&gt;</span> 添加权限
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <article class="page-container">
        <form action="{{ route('admin.node.store') }}" method="post" class="form form-horizontal"
              @submit.prevent="dopost">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否顶级：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <span class="select-box">
                        <select name="pid" class="select" @change="changePid"s>
                            <option value="0">==顶级==</option>
                            @foreach($data as $item)
                                <option value="{{ $item->id }}">{{ $item->name }}</option>
                            @endforeach
                        </select>
				    </span>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>权限名称：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <!-- lazy 延时绑定 -->
                    <input type="text" class="input-text" value="" placeholder="" name="name" v-model.lazy="info.name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">路由别名：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" name="router_name"
                           v-model="info.route_name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否菜单：</label>
                <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                    <div class="radio-box">
                        <input type="radio" value="1" name="is_menu" v-model="info.is_menu">
                        <label for="sex-1">是</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" value="0" name="is_menu" v-model="info.is_menu">
                        <label for="sex-2">否</label>
                    </div>
                </div>
            </div>
            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                    <input class="btn btn-primary radius" type="submit" value="添加权限">
                </div>
            </div>
        </form>
    </article>
@endsection
@section('js')
    <script src="/js/vue.js"></script>
    <script>
        new Vue({
            el: '.page-container',
            data: {
                info: {
                    _token: "{{ csrf_token() }}",
                    pid: 0,
                    name: '',
                    route_name: '',
                    is_menu: 1
                }
            },
            methods: {
                // dopost(evt) {
                //     // console.log(evt.target.action);
                //     // console.log(evt.target.getAttribute('action'));
                //     let url = evt.target.action;
                //     $.post(url,this.info).then(ret=>{
                //         console.log(ret);
                //     })
                // }
                // 异步变同步 es7 async await
                async dopost(evt) {
                    let url = evt.target.action;
                    let {status,msg} = await $.post(url, this.info);
                    if(status === 0){
                        location.href="{{ route('admin.node.index') }}";
                    }else{
                        layser.msg(msg,{icon:2,time:1000});
                    }
                },
                // 下拉
                changePid(evt){
                    // 下拉的值
                    this.info.pid = evt.target.value || 0;
                }
            }


        })


    </script>
@endsection


