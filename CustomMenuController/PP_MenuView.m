//
//  PP_MenuView.m
//  CustomMenuController
//
//  Created by 云之君兮鹏 on 2016/10/16.
//  Copyright © 2016年 小超人. All rights reserved.
//

#import "PP_MenuView.h"

@implementation PP_MenuView
/*
 UIPasteboard: 这个类是用来管理粘贴板的，粘贴板就是用来存放我们复制、剪切内容的，大体上可分为两个级别的粘贴板 
    ①整个系统级别的，在整个硬件设备（手机）上共享
    只要APP 向系统的粘贴板写入了数据，那么就可以在其他任何可以访问粘贴板地方使用，同时不会再去管从哪里来的数据了，即使复制数据源 APP 删除了也不影响使用。
    ②应用级别的，数据在属于自己的应用内部共享；
 
 
 //获取系统级别的剪切板
 + (UIPasteboard *)generalPasteboard;
 //获取一个自定义的剪切板 name参数为此剪切板的名称 create参数用于设置当这个剪切板不存在时 是否进行创建
 + (nullable UIPasteboard *)pasteboardWithName:(NSString *)pasteboardName create:(BOOL)create;
 //获取一个应用内可用的剪切板（默认名字 nil，用于应用内部，等价第二个方法）默认是不进行数据持久化的，及当应用程序退出后，剪切板中内容将别抹去。若要实现持久化，需要设置persistent属性为YES。
 + (UIPasteboard *)pasteboardWithUniqueName;
 
 在iOS的UI系统中，有3个控件自带剪切板操作，分别是UITextField、UITextView与UIWebView。在这些控件的文字交互处进行长按手势可以在屏幕视图上唤出系统的剪切板控件，用户可以进行复制、粘贴，剪切等操作，
 
 常用的属性和方法
   // 剪切板的名称
 @property(readonly,nonatomic) NSString *name;
 //根据名称删除一个剪切板
 + (void)removePasteboardWithName:(NSString *)pasteboardName;
 //是否进行持久化
 @property(getter=isPersistent,nonatomic) BOOL persistent;
 //此剪切板的改变次数 系统级别的剪切板只有当设备重新启动时 这个值才会清零
 @property(readonly,nonatomic) NSInteger changeCount;
 
 */

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.userInteractionEnabled = YES;
        UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longAction:)];
        [self addGestureRecognizer:longGesture];
    }
    return self;
}

- (void)longAction:(UILongPressGestureRecognizer *)senser
{
    if (senser.state == UIGestureRecognizerStateBegan)
    {
        NSLog(@"------------->手势已经触发了");
        self.userInteractionEnabled = YES;
        [self becomeFirstResponder];
        // 创建 菜单控制器
        UIMenuController *menu = [UIMenuController sharedMenuController];
        // 创建一条 Item
        UIMenuItem *menuItem1 = [[UIMenuItem alloc] initWithTitle:@"①Item复制" action:@selector(firstItemAction:)];
        UIMenuItem *menuItem2 = [[UIMenuItem alloc] initWithTitle:@"②Item粘贴" action:@selector(secondItemAction:)];
        UIMenuItem *menuItem3 = [[UIMenuItem alloc] initWithTitle:@"③Item删除" action:@selector(thirdItemAction:)];
        
        // 设置菜单显示 每条 Item
        menu.menuItems = @[menuItem1,menuItem2,menuItem3];
        // 展示的位置
        [menu setTargetRect:CGRectMake(self.bounds.size.width / 2 , self.bounds.size.height / 2, 0, 0) inView:self];
        
        // 显示
        [menu setMenuVisible:YES animated:YES];
        
    }
}

// ①Item 的点击方法 实现 复制
- (void)firstItemAction:(UIMenuItem *)item
{
     NSLog(@"%s--->%@",__func__,item);
    
    [UIPasteboard generalPasteboard].string = @"我就是复制的内容";
    
}
// 第二个处理粘贴
- (void)secondItemAction:(UIMenuItem *)item
{
    NSLog(@"%s--->%@",__func__,item);
   
    NSString *str = [UIPasteboard generalPasteboard].string;
    if (str)
    {
        self.text = str;
    }
    
}
// 第三个处理删除
- (void)thirdItemAction:(UIMenuItem *)item
{
    NSLog(@"%s--->%@",__func__,item);
     self.text = @"";
}

// 是自己能成为第一响应者
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
// 能处理 Action 事件
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(firstItemAction:) || action == @selector(secondItemAction:))
    {
        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}

@end
