//
//  EditViewController.h
//  NadaYoussef_todoApp
//
//  Created by Nada youssef on 30/04/2023.
//

#import <UIKit/UIKit.h>
#import "EditProtocol.h"
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *descText;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateText;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerEdit;

- (IBAction)saveEdit:(UIButton *)sender;

@property NSArray *options;
@property NSArray *progress;
@property Task *taskEdit;
@property Task *oldTask;
@property id<EditProtocol> editVC;
-(void) saveChanges;
@end

NS_ASSUME_NONNULL_END
