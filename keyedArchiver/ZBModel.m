//
//  ZBModel.m
//  keyedArchiver
//
//  Created by beginner on 16/7/7.
//  Copyright © 2016年 beginner. All rights reserved.
//

#import "ZBModel.h"
#import <objc/runtime.h>
@implementation ZBModel

//编码
- (void)encodeWithCoder:(NSCoder *)aCoder {
	for (id key in self.ivarList) {
		id object = [self valueForKey:key];
		[aCoder encodeObject:object forKey:key];
	}
}

//解码
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = super.init;
	if (self) {
		for (id key in self.ivarList) {
			id object = [aDecoder decodeObjectForKey:key];
			[self setValue:object forKeyPath:key];
		}
	}
	return self;
}

- (NSArray *)ivarList {
	unsigned int outConut = 0;
	//获取这个类的变量数组 outConut返回有几个属性
	Ivar *ivars = class_copyIvarList(self.class, &outConut);
	NSMutableArray *ivarList = NSMutableArray.array;
	for (unsigned int i = 0; i < outConut; i++) {
		//遍历变量
		Ivar ivar = ivars[i];
		//获取变量名
		const char *propertyName = ivar_getName(ivar);
		[ivarList addObject:[NSString stringWithUTF8String:propertyName]];
	}
	if (ivars) {
		//malloc分配内存 free释放内存
		free(ivars);
	}
	return ivarList;
}
@end
