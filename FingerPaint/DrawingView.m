//
//  DrawingView.m
//  FingerPaint
//
//  Created by Mar Koss on 2017-10-13.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import "DrawingView.h"
#import "LineSegmentDataModel.h"

@interface DrawingView ()

@property (nonatomic) NSMutableArray<LineSegmentDataModel *> *line;

@end

@implementation DrawingView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _line = [NSMutableArray new];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];

    LineSegmentDataModel *segment = [[LineSegmentDataModel alloc] initWithFirstPoint:first
                                                                         secondPoint:first];
    [self.line addObject:segment];

    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    CGPoint second = [touch locationInView:self];
    LineSegmentDataModel *segment = [[LineSegmentDataModel alloc] initWithFirstPoint:first
                                                                         secondPoint:second];
    [self.line addObject:segment];
    NSLog(@"%@, %@", NSStringFromCGPoint(segment.firstPoint), NSStringFromCGPoint(segment.secondPoint));
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
   
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = 5.0;
        path.lineCapStyle = kCGLineCapRound;
        UIColor *gray = [UIColor grayColor];
        [gray setStroke];
        
        for (LineSegmentDataModel *segment in self.line) {
            if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)) {

                [path moveToPoint:segment.firstPoint];
                continue;
            }
            [path addLineToPoint:segment.firstPoint];
            [path addLineToPoint:segment.secondPoint];
        }
        [path stroke];
    }
    
}

- (void)clear {
    [self.line removeAllObjects];
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
