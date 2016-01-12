//
//  main.m
//  AssignmentJan11
//
//  Created by Anthony Tulai on 2016-01-11.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        char inputChars[255];
        char option[255];
        
    while (true) {
        
        
        printf("Please input one of the following options: \n");
        printf("1: Capitalize my input.\n");
        printf("2: Lowercase my input.\n");
        printf("3: Print back whatever integer I type and yell at me if it's not a number.\n");
        printf("4: Make my input Canadian.\n");
        printf("5: Ask me a question? or yell at me!\n");
        printf("6: Replace my spaces with dashes.\n");
        printf("7: Quit.\n");
        
        //scanf("%[^\n]s", option);
        fgets(option, 255, stdin);
        
        NSString *nsOption = [NSString stringWithUTF8String:option];
        printf("Enter a valid string for your option: \n");
        
        fgets(inputChars, 255, stdin);
        //scanf("%[^\n]s", inputChars);
        
        if ([nsOption hasPrefix: @"1"]) {

            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            inputString = [inputString uppercaseString];
            NSLog(@"uppercase of your string is: %@", inputString);
        }
        else if ([nsOption hasPrefix: @"2"]) {
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            inputString = [inputString lowercaseString];
            NSLog(@"lowercase of your string is: %@", inputString);
        }
        else if ([nsOption hasPrefix: @"3"]) {
            
            int inputInteger;
            
            NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];

            NSString *canadianString = [NSString stringWithUTF8String:inputChars];
            
           canadianString = [canadianString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        
            if ([canadianString rangeOfCharacterFromSet:nonNumberSet].location != NSNotFound) {
                NSLog(@"This string has non numbers");
            }
            else {
                inputInteger = atoi(inputChars);
                NSLog(@"You typed in the number %d", inputInteger);
            }
        }
        else if ([nsOption hasPrefix: @"4"]) {

            NSString *canadianString = [NSString stringWithUTF8String:inputChars];
            canadianString = [canadianString stringByAppendingString: @" eh?"];
            NSLog(@"The canadian version of your input is %@", canadianString);
        }
        else if ([nsOption hasPrefix: @"5"]){
            NSString *canadianString = [NSString stringWithUTF8String:inputChars];
             canadianString = [canadianString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            if ([[canadianString substringFromIndex:[canadianString length] - 1] isEqual: @"?"]) {
                NSLog(@"I don't know.");
                
            }
            
            else if ([canadianString hasSuffix:@"!"]) {
                NSLog(@"Whoa, Calm down!");
                
            }
        }
        else if ([nsOption hasPrefix: @"6"]){
            NSString *canadianString = [NSString stringWithUTF8String:inputChars];
            NSString *stringWithNoSpaces = @"";

            
            for (int i = 0; i < [canadianString length]; i++) {
                NSRange index;
                index.location = i;
                index.length = 1;
                NSString *stringToAppend = [canadianString substringWithRange: index];
                if ([stringToAppend isEqual: @" "]) {
                    stringWithNoSpaces = [stringWithNoSpaces stringByAppendingString: @"-"];
                }
                else {
                    stringWithNoSpaces = [stringWithNoSpaces stringByAppendingString:stringToAppend];
                }
            }
            NSLog(@"Your string with no spaces is %@", stringWithNoSpaces);
        }
        else return (false);
    }
   

    }
    return 0;
}
