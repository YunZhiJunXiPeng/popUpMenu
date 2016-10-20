//
//  PP_TableViewCell.m
//  CustomMenuController
//
//  Created by 云之君兮鹏 on 2016/10/16.
//  Copyright © 2016年 小超人. All rights reserved.
//

#import "PP_TableViewCell.h"

@interface PP_TableViewCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation PP_TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _label = [[UILabel alloc] initWithFrame:(CGRectMake(0, 0, 40, 40))];
        _label.backgroundColor = [UIColor redColor];
        self.backgroundColor = [UIColor yellowColor];
        [self addSubview:_label];
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
        UIMenuItem *menuItem1 = [[UIMenuItem alloc] initWithTitle:@"①Item" action:@selector(firstItemAction:)];
        UIMenuItem *menuItem2 = [[UIMenuItem alloc] initWithTitle:@"②Item" action:@selector(secondItemAction:)];
        
        // 设置菜单显示 每条 Item
        menu.menuItems = @[menuItem1,menuItem2];
        // 展示的位置
        [menu setTargetRect:self.label.bounds inView:self.label.superview];
        
        // 显示
        [menu setMenuVisible:YES animated:YES];
        
    }
}

// ①Item 的点击方法 实现
- (void)firstItemAction:(UIMenuItem *)item
{
    NSLog(@"%s--->%@",__func__,item);
    
}
- (void)secondItemAction:(UIMenuItem *)item
{
    NSLog(@"%s--->%@",__func__,item);
}

// 是自己能成为第一响应者
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
// 能处理 Action 事件
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(firstItemAction:) || action == @selector(secondItemAction:) )
    {
        return YES;
    }
    
    return [super canPerformAction:action withSender:sender];
}


- (void)layoutSubviews
{
    //_label.frame = CGRectMake(0, 0, 40, 40);
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
