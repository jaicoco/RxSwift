import Foundation
import RxSwift

example(of: "never") {
    
    let disposeBag = DisposeBag()
    
    let observable = Observable<Any>.never()
  
    observable
        .do(onSubscribed: {
            print("Subscribed")
        })
        .subscribe(
            onNext: { element in
                print(element)
            },
            onCompleted: {
                print("Completed")
            },
            onDisposed: {
                print("Never이지만 DisposeBag에 추가하면 출력도 할 수 있다.")
                print("Disposed")
            }
        ).disposed(by: disposeBag)
    
    let observable2 = Observable<Int>.of(1,2,3)
    observable2
        .do(onSubscribed: {
            print("I am onSubscribed")
        })
        .subscribe(
            onNext: { element in
                print(element)
            },
            onDisposed: {
                print("Disposed!!!")
            }
        ).disposed(by: disposeBag)
}



/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.
