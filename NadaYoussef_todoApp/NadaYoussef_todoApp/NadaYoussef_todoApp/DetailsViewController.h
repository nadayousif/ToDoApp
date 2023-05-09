//
//  DetailsViewController.h
//  NadaYoussef_todoApp
//
//  Created by Nada youssef on 30/04/2023.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "EditProtocol.h"
#import "AddProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController<EditProtocol>
@property (weak, nonatomic) IBOutlet UILabel *nameTask;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateText;
- (IBAction)editBtn:(UIButton *)sender;
@property Task *task;

@property id<AddProtocol> editVC;

@end

NS_ASSUME_NONNULL_END
