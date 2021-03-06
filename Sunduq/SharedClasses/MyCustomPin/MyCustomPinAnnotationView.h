//
//  MyCustomPinAnnotationView.h
//  MyCustomPinProject
//
//  Created by Thomas Lextrait on 1/4/16.
//  Copyright © 2016 com.tlextrait. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "MyCustomPointAnnotation.h"

@interface MyCustomPinAnnotationView : MKAnnotationView

@property NSString* Name;
@property UIImage* imgName;


- (instancetype)initWithAnnotation:(id<MKAnnotation>)annotation;

@end
