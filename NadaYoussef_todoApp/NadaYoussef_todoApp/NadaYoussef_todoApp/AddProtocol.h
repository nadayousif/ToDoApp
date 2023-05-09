//
//  AddProtocol.h
//  NadaYoussef_todoApp
//
//  Created by Nada youssef on 30/04/2023.
//
#import "Task.h"
#ifndef AddProtocol_h
#define AddProtocol_h
@protocol AddProtocol
-(void) addTask:(Task *) task;
-(void) replaceTask:(Task*) oldTask andTheNewTaskIs:(Task*)new;
@end

#endif /* AddProtocol_h */
