NKPinterestActivity
===================

![UIActivityViewController](https://github.com/neilkimmett/NKPinterestActivity/raw/master/Screenshots/both.jpg)

## Installation

#### Using [CocoaPods](http://cocoapods.org/)
* Add `pod 'NKPinterestActivity', '~> 1.0'` to your `Podfile`
* Run `pod install` to add the required files to your workspace.

## How to use

Example usage can be found in the demo project. If you're using CocoaPods 0.29 (or more recent) you can `pod try NKPinterestActivity` to check out the project temporarily and have a play.

``` objective-c
NSURL *imageURL = [NSURL URLWithString:@"http://placekitten.com/200/300"];
NSURL *sourceURL = [NSURL URLWithString:@"http://placekitten.com/"];

NKPinterestActivity *pinterestActivity = [[NKPinterestActivity alloc] initWithClientId:@"YOURCLIENTIDHERE" imageURL:imageURL];

UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[sourceURL, @"Look at the lovely kittens!"]
                                                                         applicationActivities:@[pinterestActivity]];
[self presentViewController:activityVC animated:YES completion:nil];
```

Note that `imageURL` is required.

## ARC
`NKPinterestActivity` uses ARC. If your project does not use ARC add the `-fobjc-arc` compiler flag to all the files from this project (in your project settings click "Build Phases" at the top, then expand the "Compile Sources" section)

## Contact

Find me on Twitter [@neilkimmett](http://www.twitter.com/neilkimmett), or drop me an email at [neil@kimmett.me](neil@kimmett.me)

## License

Copyright (c) 2014 Neil Kimmett

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
