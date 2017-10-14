//
//  LineSegmentData.h
//  FingerPaint
//
//  Created by Mar Koss on 2017-10-13.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface LineSegmentDataModel : NSObject

@property (nonatomic, readonly) CGPoint firstPoint;
@property (nonatomic, readonly) CGPoint secondPoint;

- (instancetype)initWithFirstPoint:(CGPoint)firstPoint secondPoint:(CGPoint)secondPoint;


@end
