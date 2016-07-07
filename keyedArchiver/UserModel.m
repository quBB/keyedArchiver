//
//  UserModel.m
//  keyedArchiver
//
//  Created by beginner on 16/7/7.
//  Copyright © 2016年 beginner. All rights reserved.
//

#import "UserModel.h"

@interface UserModel ()
@property (nonatomic , strong) NSString *locationPath;
@end

@implementation UserModel

- (UserModel *)initWithDictionary:(NSDictionary *)dic {
	self = [super init];
	if (self) {
		self.sex = dic[@"sex"];
		self.name = dic[@"name"];
		self.password = dic[@"password"];
		self.telNumber = dic[@"telNumber"];
	}
	return self;
}

- (void)saveUserModelInLocationPath {
	[NSKeyedArchiver archiveRootObject:self toFile:self.locationPath];
}

- (UserModel *)getUserModelInLocationPath {
	return [NSKeyedUnarchiver unarchiveObjectWithFile:self.locationPath];
}

#pragma mark get set 
- (NSString *)locationPath {
	NSArray *domains = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, (NSUserDomainMask), YES);
	return [domains.firstObject stringByAppendingPathComponent:@"user.data"];
}

@end
