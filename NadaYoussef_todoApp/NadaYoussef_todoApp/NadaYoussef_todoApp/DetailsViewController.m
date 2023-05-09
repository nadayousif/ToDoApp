//
//  DetailsViewController.m
//  NadaYoussef_todoApp
//
//  Created by Nada youssef on 30/04/2023.
//

#import "DetailsViewController.h"
#import "EditViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameTask.text= _task.name;
    self.descLabel.text=_task.description;
    self.progressLabel.text= _task.status;
    self.dateText.text= _task.storedDate;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)editBtn:(UIButton *)sender {
    EditViewController *editTaskVC=[self.storyboard instantiateViewControllerWithIdentifier:@"editTask"];
    editTaskVC.editVC = self;
    editTaskVC.oldTask=self.task;
    [self.navigationController pushViewController:editTaskVC animated:YES];
}


-(void) editTask:(Task *) task{
    self.nameTask.text= task.name;
    self.descLabel.text=task.description;
    NSLog(@"%@",task.name);
   
}
-(void) updateHomeScreen:(Task*) oldTask andTheNewTaskIs:(Task*)new{
    [_editVC replaceTask:oldTask andTheNewTaskIs: new];
}


@end
