//
//  AddTaskViewController.h
//  NadaYoussef_todoApp
//
//  Created by Nada youssef on 30/04/2023.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "ViewController.h"
#import "AddProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddTaskViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *descText;
@property (weak, nonatomic) IBOutlet UITextField *nameAdd;
- (IBAction)saveTask:(UIButton *)sender;
@property Task *taskAdd;
@property id<AddProtocol> mainVC;
@property (weak, nonatomic) IBOutlet UIPickerView *priorityAdd;

@property (weak, nonatomic) IBOutlet UIDatePicker *dateAdd;
@property NSArray *options;
@property NSArray *progress;
@end

NS_ASSUME_NONNULL_END
