//
//  AddTaskViewController.m
//  NadaYoussef_todoApp
//
//  Created by Nada youssef on 30/04/2023.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _priorityAdd.dataSource = self;
    _priorityAdd.delegate = self;
    _taskAdd = [Task new];
    
    _options = [[NSArray alloc] initWithObjects:@"Easy",@"Medium",@"Hard", nil];
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
        _taskAdd.priority = _options[row];
       
    }else{
        _taskAdd.status = _progress[row];
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

- (IBAction)saveTask:(UIButton *)sender {
    
    _taskAdd.name = self.nameAdd.text;
    _taskAdd.description = self.descText.text;
    if(_taskAdd.priority == NULL){
        _taskAdd.priority =@"high";
    }
    if(_taskAdd.priority ==NULL){
        _taskAdd.status = @"To do";
    }
    [_mainVC addTask:_taskAdd];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
