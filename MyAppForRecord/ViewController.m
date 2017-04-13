//
//  ViewController.m
//  MyAppForRecord
//
//  Created by 文清 on 2017/4/10.
//  Copyright © 2017年 文清. All rights reserved.
//

#import "ViewController.h"
#import "PopoverViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIAdaptivePresentationControllerDelegate,UIPopoverPresentationControllerDelegate>
@property (nonatomic,assign)BOOL isPopoverAlready;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(popover:)];
    self.navigationItem.rightBarButtonItem = barItem;
    self.navigationItem.title = @"present";
    UITableView *tableV = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableV.tableFooterView = [[UIView alloc]init];
    tableV.delegate = self;
    tableV.dataSource = self;
    [self.view addSubview:tableV];
    _isPopoverAlready = NO;
}

-(void)popover:(id)sender{
    
    //使用popover
    PopoverViewController *popOverVC = [[PopoverViewController alloc]init];
    popOverVC.modalPresentationStyle = UIModalPresentationPopover;
    UIPopoverPresentationController *popoverC = [popOverVC popoverPresentationController];
    popoverC.barButtonItem = sender;
    popoverC.delegate = self;
    //popOverVC弹出箭头的方向
//    popoverC.permittedArrowDirections = UIPopoverArrowDirectionUp;
    //指定箭头所指区域的矩形框范围，以sourceView的左上角为坐标原点
//    popoverC.sourceRect = CGRectMake(0, 0, 200, 300);
    //sourcerect以此view的左上角为原点
//    popoverC.sourceView = sender;
    //展示view的大小
    popOverVC.preferredContentSize = CGSizeMake(200, 200);
    [self presentViewController:popOverVC animated:YES
                     completion:nil];
    
}
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    //默认是UIModalPresentationFullScreen，导致popover时候黑屏
    return UIModalPresentationNone;
}
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;   //no点击蒙版popover不消失， 默认yes,点击蒙层dismiss
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     static NSString *identifier = @"identifier";
     UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"alert";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //箭头提示
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
