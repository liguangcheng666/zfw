@extends('admin.common.main') 
<!-- webupload上传样式 -->
<link rel="stylesheet" type="text/css" href="/webuploader/webuploader.css">
@section('html')
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span> 文章管理
        <span class="c-gray en">&gt;</span> 添加文章
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    {{--    引用验证    --}}
    @include('admin.common.validate')
    <article class="page-container">
        <form action="{{ route('admin.article.store') }}" method="post" class="form form-horizontal">
           @csrf
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">* </span>文章标题：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" name="title">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">* </span>文章描述：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" name="desn">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">* </span>文章封面：</label>
                <div class="formControls col-xs-4 col-sm-5">
                    <!-- 表单提交时的封面地址 -->
                    <input type="hidden" id="pic" name="pic" value="{{ config('up.pic') }}">

                    <div id="picker">上传文章封面</div>
                </div>
                <div class="formControls col-xs-4 col-sm-4">
                    <img id="img">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">* </span>文章内容：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <textarea name="body" id="body" cols="30" rows="10"></textarea>
                </div>
            </div>

            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                    <input class="btn btn-primary radius" type="submit" value="添加文章">
                </div>
            </div>
        </form>
    </article>
@endsection
@section('js')
    <!-- 配置文件 -->
    <script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
    <!-- webupload上传js -->
    <script type="text/javascript" src="/webuploader/webuploader.js"></script>
     <!-- 实例化编辑器 -->
    <script type="text/javascript">
        // 富文本编辑器
        var ue = UE.getEditor('body',{
            initialFrameWidth:1200,
            initialFrameHeight:500
        });

        // 初始化 Web Uploadervar 
        uploader = WebUploader.create({
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf: '/webuploader/Uploader.swf',
            // 文件接收服务端 上传PHP的代码
            server: '{{ route('admin.article.upfile') }}',
            // 文件上传时携带参数
            formData:{
                _token:'{{csrf_token()}}'
            },
            // 文件上传的表单名称
            fileVal:'file',
            // 选择文件的按钮
            pick: {
               id:'#picker',
               // 是否开启选择多个文件的能力
               multiple:false,
            },
            // 压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: true
        });
        // 上传成功时的回调方法
        uploader.on( 'uploadSuccess', function( file,ret ) {
            // 图片路径
            let src = ret.url;
            // 给表单添加value值
            $('#pic').val(src);
            // 给图片添加src
            $('#img').attr('src',src);
        });
    </script>
@endsection


