//
//  AAreaPickViewElementView.m
//  AtHomeApp
//
//  Created by dilei liu on 14-10-3.
//  Copyright (c) 2014年 ushome. All rights reserved.
//

#import "AAreaPickViewElementView.h"

HZAreaPickerView *AREA_GLOBAL_PICKER;

@implementation AAreaPickViewElementView

- (AAreaPickViewElementView *)init {
    self = [self initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"QuickformDateTimeInlineElement"];
    if (self!=nil){
        [self createSubviews];
		self.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    return self;
}

+ (HZAreaPickerView*)getPickerForDate {
    AREA_GLOBAL_PICKER = [[HZAreaPickerView alloc] init];
    return AREA_GLOBAL_PICKER;
}

- (void)createSubviews {
    [super createSubviews];
    _textField.hidden = YES;
    
    self.centeredLabel = [[UILabel alloc] init];
    self.centeredLabel.highlightedTextColor = [UIColor whiteColor];
    self.centeredLabel.font = [UIFont systemFontOfSize:15];
    self.centeredLabel.textAlignment = NSTextAlignmentRight;
	self.centeredLabel.backgroundColor = [UIColor clearColor];
    self.centeredLabel.frame = CGRectMake(10, 10, SCREEN_WIDTH-20, self.contentView.frame.size.height-20);
    [self.contentView addSubview:self.centeredLabel];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    QDateTimeInlineElement *const element = ((QDateTimeInlineElement *) _entryElement);
    
    QAppearance *appearance = element.appearance;
    self.centeredLabel.textColor = element.enabled ? appearance.entryTextColorEnabled : appearance.entryTextColorDisabled;

    _areaPicker = [[HZAreaPickerView alloc] initWithStyle:HZAreaPickerWithStateAndCityAndDistrict delegate:self];
    _textField.inputView = _areaPicker;
    [super textFieldDidBeginEditing:textField];
    self.selected = NO;
}

-(void)pickerDidChaneStatus:(HZAreaPickerView *)picker {
    NSString *areaValue = [NSString stringWithFormat:@"%@ %@ %@", picker.locate.state, picker.locate.city, picker.locate.district];
    [self.centeredLabel setText:areaValue];
    
    self.cityCode = picker.locate.cityCode;
    self.districtCode = picker.locate.districtCode;
    
}



@end
