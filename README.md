# popUpMenu
弹出菜单和粘贴板简单总结
[个人博客](http://www.jianshu.com/users/3efd78affaff/latest_articles)
![枝上柳绵吹又少，天涯何处无芳草！<暖暖猪>](http://upload-images.jianshu.io/upload_images/1523603-1dad49ae92bd1e15.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
---------
>- ##### UIPasteboard简单介绍
 <u>这个类是用来管理粘贴板的，粘贴板就是用来存放我们复制、剪切内容的，iOS 中有3 个控件自带剪切板操作UITextField、UITextView、UIWebView长按手势就可以展现出系统剪切板，然后就可以进行复制、粘贴，剪切等操作。大体上可分为两个级别的粘贴板 </u>
   -  整个系统级别的，在整个硬件设备（手机）上共享 
     - (只要APP 向系统的粘贴板写入了数据，那么就可以在其他任何可以访问粘贴板地方使用，同时不会再去管从哪里来的数据了，即使复制数据源 APP 删除了也不影响使用。)    

  >  -   应用级别的，数据在属于自己的应用内部共享；
    - (默认情况下是不会把数据写进沙盒的，也就是说（复制、剪切）粘贴内容会因为应用的退出而销毁掉，我们可以设置相关属性`persistent值为 YES`让其进行数据的持久化存储起来)

|创建方法，获取对象|方法|
|:---:|---|
|得到系统粘贴板|`+ (UIPasteboard *)generalPasteboard;`|
|自定义的粘贴板 |`+ (nullable UIPasteboard *)pasteboardWithName:(NSString *)pasteboardName create:(BOOL)create;`|
|获取应用内的粘贴板| `+ (UIPasteboard *)pasteboardWithUniqueName;`
Ps：方法2 中参数 Name为粘贴板的名字（我们就可以依照名字得到到想要的对象），参数create 为 YES 时候表示粘贴板不存在时候，就去创建一个以此为名粘贴板；方法3是应用内的粘贴板与方法2一样只是名字为空，只能在同一个应用里面使用；
- ###### 观察`UIPasteboard`属性我们可以轻松知道它可以直接传递的数据类型有四类


|直接可以进行内容转移的数据类型|
|:---:|
|`NSString *string `和`NSArray<NSString *> *strings`|
|`NSURL *URL`和`NSArray<NSURL *> *URLs`|
|` UIImage *image`和`NSArray<UIImage *> *images`|
|`UIColor *color`和`NSArray<UIColor *> *colors`|

Ps：其他的一些属性，我们可以点进去观察一下基本可以理解例如`persistent 是否进行数据持久化`还有`changeCount 改变次数（剪切板）系统重启方才重新计数`

------------------
>- ##### UIMenuController简单介绍
<u>弹出菜单栏，是UIKit中的基础控件，主要是为了方便交互后弹出一个选择的菜单。比如：我们长按发送的QQ消息弹出的一些操作选项的菜单，也可给某个控件添加一些操作选项 ，比如点击图片弹出菜单选择放大、裁剪、缩小等选项都是可以</u>



![UIMenuController实际效果展示](http://upload-images.jianshu.io/upload_images/1523603-e57fd53bbd7c3cf7.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- ###### 展示弹出菜单需要的相关方法

|展示弹出菜单栏的控件或者控制器方法|代码|
|:---|---|
|必须调用方法|`- becomeFirstResponder`
|必须实现的方法|`- (BOOL)canBecomeFirstResponder`//返回 YES 成为第一响应者|
|必须实现的方法|`- (BOOL)canPerformAction:(SEL)action withSender:(id)sender`// 根据 Action 判断，显示还是隐藏响应的 item|
-------
