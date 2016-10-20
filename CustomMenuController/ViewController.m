//
//  ViewController.m
//  CustomMenuController
//
//  Created by 云之君兮鹏 on 2016/10/16.
//  Copyright © 2016年 小超人. All rights reserved.
//

#import "ViewController.h"
#import "PP_MenuView.h"
#import "PP_TableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    PP_MenuView *menu = [[PP_MenuView alloc] initWithFrame:(CGRectMake(100, 100, 200, 50))];
    
    menu.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:menu];
    
    [self.tableView registerClass:[PP_TableViewCell class] forCellReuseIdentifier:@"cell"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PP_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
