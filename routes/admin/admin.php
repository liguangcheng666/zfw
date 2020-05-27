<?php
// 后台路由
// 路由分组
Route::group(['prefix' => 'admin', 'namespace' => 'Admin'], function () {

    // 登录显示 name 给路由起一个别名
    Route::get('login', 'LoginController@index')->name('admin.login');
    // 登录处理
    Route::post('login', 'LoginController@login')->name('admin.login');

    // 后台需要验证才能通过
    Route::group(['middleware' => ['ckadmin'], 'as' => 'admin.'], function () {
        // 后台首页显示
        Route::get('index', 'IndexController@index')->name('index');
        // 欢迎页面显示  绑定路由中间件
        // Route::get('welcome','IndexController@welcome')->name('welcome')->middleware(['ckadmin']);
        Route::get('welcome', 'IndexController@welcome')->name('welcome');

        // 退出
        Route::get('logout', 'IndexController@logout')->name('logout');

        // 用户管理--------------------------
        // 用户列表
        Route::get('user/index', 'UserController@index')->name('user.index');
        // 添加用户显示
        Route::get('user/add', 'UserController@create')->name('user.create');
        // 添加用户处理
        Route::post('user/add', 'UserController@store')->name('user.store');

        // 发送邮件
        Route::get('user/email', function () {

            // 发送文本邮件
//            \Mail::raw('测试一下发邮件', function (Illuminate\Mail\Message $message) {
//                // 获取回调方法中的形式参数
////                dump(func_get_args());
//                // 发给谁
//                $message->to('1042561833@qq.com');
//                // 主题
//                $message->subject('测试邮件');
//            });

            // 发送富文本邮件
            // 参数1 模板视图
            // 参数2 传给视图数据
            $arr = array(
                'http://pic1.win4000.com/wallpaper/b/5208799834572.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3021984307,3554163551&fm=26&gp=0.jpg',
                'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=709522064,2170184463&fm=11&gp=0.jpg',
                'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=536118925,403124337&fm=11&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1080907229,4229742829&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=266220772,3400734622&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4280817545,429708859&fm=26&gp=0.jpg',
                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=348624053,1414411911&fm=11&gp=0.jpg',
                'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=184995458,693310406&fm=26&gp=0.jpg',
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=662424584,3224635930&fm=11&gp=0.jpg'
            );
            $id = rand(0, count($arr) - 1);
            $str = $arr[$id];
            \Mail::send('mail.adduser', ['user' => '周冬雨', 'src' => $str], function (Illuminate\Mail\Message $message) {
                // 发给谁
                $message->to('2277896881@qq.com');
                $sub = "美图";
//              // 主题
                $message->subject($sub);
            });
        });

        // 删除用户
        Route::delete('user/del/{id}', 'UserController@del')->name('user.del');
        // 还原
        Route::get('user/restore/{id}', 'UserController@restore')->name('user.restore');
        // 全选删除
        Route::delete('user/delall', 'UserController@delall')->name('user.delall');

        // 修改用户 显示
        Route::get('user/edit/{id}', 'UserController@edit')->name('user.edit');
        // 修改用户处理
        Route::put('user/edit/{id}', 'UserController@update')->name('user.edit');

        // 给用户分配角色
        Route::match(['get','post'],'user/role/{user}','UserController@role')->name('user.role');

        // 角色管理
        // 分配权限
        Route::get('role/node/{role}','RoleController@node')-> name('role.node');
        Route::post('role/node/{role}','RoleController@nodeSave')-> name('role.node');
        // 资源路由     /admin/role/xxx
        Route::resource('role', 'RoleController');

        // 节点管理
        Route::resource('node', 'NodeController');

        // 文章管理 admin/article/upfile
        Route::post('article/upfile','ArticleController@upfile')->name('article.upfile');
        // 资源路由
        Route::resource('article','ArticleController');
    });
});

// 富文本邮件显示
Route::get('mail', 'Admin\UserController@mail')->name('mail');
