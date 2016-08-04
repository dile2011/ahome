//
//  HZAreaPickerView.m
//  areapicker
//
//  Created by Cloud Dai on 12-9-9.
//  Copyright (c) 2012年 clouddai.com. All rights reserved.
//

#import "HZAreaPickerView.h"
#import <QuartzCore/QuartzCore.h>
#import "ASiWeiArea.h"
#import "ARegionServer.h"

#define kDuration 0.3


@implementation HZAreaPickerView

@synthesize delegate=_delegate;
@synthesize pickerStyle=_pickerStyle;
@synthesize locate=_locate;
@synthesize locatePicker = _locatePicker;

- (void)dealloc {
    [_locate release];
    [_locatePicker release];
    [_provinces release];
    [super dealloc];
}

-(HZLocation *)locate {
    if (_locate == nil) {
        _locate = [[HZLocation alloc] init];
    }
    
    return _locate;
}

- (id)initWithStyle:(HZAreaPickerStyle)pickerStyle delegate:(id<HZAreaPickerDelegate>)delegate {
    
    self = [[[[NSBundle mainBundle] loadNibNamed:@"HZAreaPickerView" owner:self options:nil] objectAtIndex:0] retain];
    if (self) {
        self.delegate = delegate;
        self.pickerStyle = pickerStyle;
        self.locatePicker.dataSource = self;
        self.locatePicker.delegate = self;

        self.locatePicker.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        self.locatePicker.showsSelectionIndicator = YES;
        
        self.provinces = [[AServerFactory getServerInstance:@"ARegionServer"]selectAreaDataByLevel:1];
        
        self.cities = [self getCityDataByArea:[_provinces objectAtIndex:0]];
        self.locate.state = ((ASiWeiArea*)[_provinces objectAtIndex:0]).regionName;
        self.locate.city = ((ASiWeiArea*)[_cities objectAtIndex:0]).regionName;
        self.locate.cityCode = ((ASiWeiArea*)[_cities objectAtIndex:0]).regionCode;
        
        self.areas = [self getAreaDataByArea:[_cities objectAtIndex:0]];
        if (_areas.count > 0) {
            self.locate.district = ((ASiWeiArea*)[_areas objectAtIndex:0]).regionName;
            self.locate.districtCode = ((ASiWeiArea*)[_areas objectAtIndex:0]).regionCode;
        } else{
            self.locate.district = @"";
        }
    }
    
    return self;
}

- (NSArray*)getCityDataByArea:(ASiWeiArea*)area {
    NSArray *citys = area.child;
    
    if (area.child == nil && area.child.count == 0) {
        citys = [[AUtilities sharedInstance]getCityDatas:area];
        area.child = citys;
    }
    
    return citys;
}

- (NSArray*)getAreaDataByArea:(ASiWeiArea*)area {
    NSArray *areas_ = area.child;
    
    if (area.child == nil && area.child.count == 0) {
        areas_ = [[AUtilities sharedInstance]getAreaDatas:area];
        area.child = areas_;
    }
    
    return areas_;
}



#pragma mark - PickerView lifecycle

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [_provinces count];
            break;
            
        case 1:
            return [_cities count];
            break;
            
        case 2:
            return [_areas count];
            break;
            
        default:
            return 0;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
        switch (component) {
            case 0:
                return ((ASiWeiArea*)[_provinces objectAtIndex:row]).regionName;
                break;
            case 1:
                return ((ASiWeiArea*)[_cities objectAtIndex:row]).regionName;
                break;
            case 2:
                if ([_areas count] > 0) {
                    return ((ASiWeiArea*)[_areas objectAtIndex:row]).regionName;;
                    break;
                }
            default:
                return  @"";
                break;
        }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
            
            self.locate.state = ((ASiWeiArea*)[_provinces objectAtIndex:row]).regionName;
            self.cities = [self getCityDataByArea:[_provinces objectAtIndex:row]];
            [self.locatePicker selectRow:0 inComponent:1 animated:YES];
            [self.locatePicker reloadComponent:1];
            
            if (_cities.count > 0) {
                _areas = [self getAreaDataByArea:[_cities objectAtIndex:0]];
                self.locate.city = ((ASiWeiArea*)[_cities objectAtIndex:0]).regionName;
                self.locate.cityCode = ((ASiWeiArea*)[_cities objectAtIndex:0]).regionCode;
            } else {
                self.locate.city = @"";
                _areas = [NSArray array];
            }
            [self.locatePicker selectRow:0 inComponent:2 animated:YES];
            [self.locatePicker reloadComponent:2];
            
            
            if ([_areas count] > 0) {
                self.locate.district = ((ASiWeiArea*)[_areas objectAtIndex:0]).regionName;
                self.locate.districtCode = ((ASiWeiArea*)[_areas objectAtIndex:0]).regionCode;
                
            } else{
                self.locate.district = @"";
            }
            
            break;
        case 1:
            if (_cities.count > 0) {
                self.areas = [self getAreaDataByArea:[_cities objectAtIndex:row]];
                [self.locatePicker selectRow:0 inComponent:2 animated:YES];
                [self.locatePicker reloadComponent:2];
                
                self.locate.city = ((ASiWeiArea*)[_cities objectAtIndex:row]).regionName;;
                self.locate.cityCode = ((ASiWeiArea*)[_cities objectAtIndex:row]).regionCode;
            } else {
                self.locate.city = @"";
                _areas = [NSArray array];
            }
            
            if ([_areas count] > 0) {
                self.locate.district = ((ASiWeiArea*)[_areas objectAtIndex:0]).regionName;
                self.locate.districtCode = ((ASiWeiArea*)[_areas objectAtIndex:0]).regionCode;
            } else{
                self.locate.district = @"";
            }
            
            break;
        case 2:
            if ([_areas count] > 0) {
                self.locate.district = ((ASiWeiArea*)[_areas objectAtIndex:row]).regionName;
                self.locate.districtCode = ((ASiWeiArea*)[_areas objectAtIndex:row]).regionCode;
            } else{
                self.locate.district = @"";
            }
            break;
        default:
            break;
    }
    
    if([self.delegate respondsToSelector:@selector(pickerDidChaneStatus:)]) {
        [self.delegate pickerDidChaneStatus:self];
    }

}


#pragma mark - animation

- (void)showInView:(UIView *) view
{
    self.frame = CGRectMake(0, view.frame.size.height, self.frame.size.width, self.frame.size.height);
    [view addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, view.frame.size.height - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    }];
    
}

- (void)cancelPicker
{
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.frame = CGRectMake(0, self.frame.origin.y+self.frame.size.height, self.frame.size.width, self.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                         
                     }];
    
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *myView = nil;
    
    if (component == 0) {
        myView = [[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 30)] autorelease];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = ((ASiWeiArea*)[_provinces objectAtIndex:row]).regionName;
        if(myView.text.length >= 8) {
            myView.font = [UIFont systemFontOfSize:12];
        } else if(myView.text.length >= 6){
            myView.font = [UIFont systemFontOfSize:14];
        } else {
            myView.font = [UIFont systemFontOfSize:17];
        }
        myView.backgroundColor = [UIColor clearColor];
        
    }else if(component == 1){
        myView = [[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 180, 30)] autorelease];
        myView.text = ((ASiWeiArea*)[_cities objectAtIndex:row]).regionName;
        myView.textAlignment = NSTextAlignmentCenter;
        if(myView.text.length >= 8) {
            myView.font = [UIFont systemFontOfSize:12];
        } else if(myView.text.length >= 6){
            myView.font = [UIFont systemFontOfSize:14];
        } else {
            myView.font = [UIFont systemFontOfSize:17];
        }
        myView.backgroundColor = [UIColor clearColor];
    }else if(component == 2){
        myView = [[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 180, 30)] autorelease];
        myView.text = ((ASiWeiArea*)[_areas objectAtIndex:row]).regionName;
        myView.textAlignment = NSTextAlignmentCenter;
        if(myView.text.length >= 8) {
            myView.font = [UIFont systemFontOfSize:12];
        } else if(myView.text.length >= 6){
            myView.font = [UIFont systemFontOfSize:14];
        } else {
            myView.font = [UIFont systemFontOfSize:17];
        }
        myView.backgroundColor = [UIColor clearColor];
    }
    
    return myView;
    
}



@end
