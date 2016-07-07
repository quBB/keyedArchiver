//
//  ViewController.m
//  keyedArchiver
//
//  Created by beginner on 16/7/7.
//  Copyright © 2016年 beginner. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSDictionary *dict = @{
						   @"sex"  : @"man",
						   @"name" : @"ben",
						   @"password"   : @"12345678",
						   @"telNumber" : @"12345678910"
						   };
	
	
	UserModel *model = [[UserModel alloc]initWithDictionary:dict];
//	[model saveUserModelInLocationPath];
	
	
	UserModel *otherModel = [model getUserModelInLocationPath];
	NSLog(@"otherModel = %@",otherModel.name);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
