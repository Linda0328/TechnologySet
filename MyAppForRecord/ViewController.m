//
//  ViewController.m
//  MyAppForRecord
//
//  Created by 文清 on 2017/4/10.
//  Copyright © 2017年 文清. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(popover:)];
    self.navigationItem.leftBarButtonItem = barItem;
    
}

-(void)popover:(id)sender{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
