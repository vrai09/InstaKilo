//
//  Photo.h
//  InstaKilo
//
//  Created by Livleen Rai on 2017-08-09.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property UIImage *image;
@property NSString *location;
@property NSString *subject;

- (instancetype)initWithImage:(UIImage*)image location:(NSString*)location subject:(NSString*)subject;

@end
