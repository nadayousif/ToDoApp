//
//  EditViewController.m
//  NadaYoussef_todoApp
//
//  Created by Nada youssef on 30/04/2023.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameText.text = _taskEdit.name;
    self.descText.text = _taskEdit.description;
    _pickerEdit.dataSource = self;
    _pickerEdit.delegate = self;
    _taskEdit = [Task new];
    _options = [[NSArray alloc] initWithObjects:@"Easy",@"Meduim",@"Hard", nil];
    _progress = [[NSArray alloc] initWithObjects:@"To do",@"In progress",@"Done", nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(component ==0){
        return _options.count;
    }else{
        return _progress.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component ==0){
        return _options[row];
    }else{
        return _progress[row];
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(component ==0){
        _taskEdit.priority = _options[row];
       
    }else{
        _taskEdit.status = _progress[row];
    }
    NSString *selectedItem = _options[row];
    NSLog(@"Selected option: %@", selectedItem);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)saveEdit:(UIButton *)sender {
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"nada" message:@"alert message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionOk=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        NSLog(@"ok action");
        [self saveChanges];
    }];
    UIAlertAction *actionCancel=[UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){
        NSLog(@"cancel action");
    }];
    [alert addAction:actionOk];
    [alert addAction:actionCancel];
    [self presentViewController:alert animated:YES completion:nil];
  
}
-(void) saveChanges{
    _taskEdit.description = self.descText.text;
    _taskEdit.name= self.nameText.text;
    
    if(_taskEdit.priority == NULL){
        _taskEdit.priority =@"high";
    }
    if(_taskEdit.priority ==NULL){
        _taskEdit.status = @"to do";
    }
    [_editVC editTask:_taskEdit];
    [_editVC updateHomeScreen:_oldTask andTheNewTaskIs:_taskEdit];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
