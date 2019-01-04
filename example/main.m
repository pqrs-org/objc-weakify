#include <pqrs/weakify.h>

int main(void) {
  // string1

  NSMutableString* string1 = [NSMutableString new];
  [string1 appendString:@"Type control-c to quit"];

  @weakify(string1);

  dispatch_async(
      dispatch_get_main_queue(),
      ^{
        @strongify(string1);
        if (!string1) {
          return;
        }

        NSLog(@"%@", string1);
      });

  // string2

  NSMutableString* string2 = [NSMutableString new];
  [string2 appendString:@"string2 == nil"];

  @weakify(string2);

  string2 = nil;

  dispatch_async(
      dispatch_get_main_queue(),
      ^{
        @strongify(string2);
        if (!string2) {
          return;
        }

        NSLog(@"%@", string2);
      });

  // run

  CFRunLoopRun();

  return 0;
}
