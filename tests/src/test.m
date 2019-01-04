#include <pqrs/weakify.h>

int main(void) {
  NSMutableString* string = [NSMutableString new];
  [string appendString:@"hello"];

  {
    CFIndex count = CFGetRetainCount((CFTypeRef)string);
    if (count != 1) {
      NSLog(@"string.count error (count:%lu)", count);
      abort();
    }
  }

  @weakify(string)

  {
    @strongify(string);
    if (!string) {
      NSLog(@"@strongify error (string == nil)");
      abort();
    }

    {
      CFIndex count = CFGetRetainCount((CFTypeRef)string);
      if (count != 2) {
        NSLog(@"string.count error (count:%lu)", count);
        abort();
      }
    }

    if (![string isEqualToString:@"hello"]) {
      NSLog(@"string.isEqualToString error (string: %@)", string);
      abort();
    }
  }

  return 0;
}
