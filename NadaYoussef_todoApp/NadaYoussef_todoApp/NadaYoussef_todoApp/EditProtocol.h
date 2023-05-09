//
//  EditProtocol.h
//  NadaYoussef_todoApp
//
//  Created by Nada youssef on 30/04/2023.
//
#import "Task.h"
#ifndef EditProtocol_h
#define EditProtocol_h


@protocol EditProtocol
-(void) editTask:(Task *) task;
-(void) updateHomeScreen:(Task*) oldTask andTheNewTaskIs:(Task*)new;
@end
#endif /* EditProtocol_h */
