//
//  PurchasedTickets.m
//  AirplaneTicketApp
//
//  Created by user243757 on 10/2/23.
//

#import "PurchasedTickets.h"

@implementation PurchasedTickets
- (instancetype)initWithItems:(NSString *)ticketType andQnt:(int)qnt
{
    self = [super init];
    if (self) {
        self.ticketType = ticketType;
        self.qnt=qnt;
    }
    return self;
}

@end
