//
//  PurchasedTickets.h
//  AirplaneTicketApp
//
//  Created by user243757 on 10/2/23.
//

#import <Foundation/Foundation.h>
#import "Ticket.h"
NS_ASSUME_NONNULL_BEGIN

@interface PurchasedTickets : Ticket
- (instancetype)initWithItems:(NSString *)ticketType andQnt:(int)qnt;

@end

NS_ASSUME_NONNULL_END
