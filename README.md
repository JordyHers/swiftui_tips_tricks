# iOS Developer Must know tips
This Repository is composed of different tips that all IOS developers must know. ⛺️     SwiftUi ARKit, Metal ,SceneKit Etc.🌟
 
 ## 1. Implement Map in SwiftUI
 
 ><img  width="537" alt="Screen Shot 2022-01-16 at 17 16 14" src="https://user-images.githubusercontent.com/49708438/150695665-1a073427-b9d1-4a74-870c-d840e619752e.jpeg">

 
```swift
import MapKit
import SwiftUI

struct MapkitView: View {
    @State private var region =
    
    MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.856820, longitude: -98.052448), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    var body: some View {
      Map(coordinateRegion: $region)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapkitView()
    }
} 
```

## 2. StateView in SwiftUI

> In SwiftUi the state of a page is handled by creating **@State** variables.


```swift
import SwiftUI


struct StateView: View {
    
    @State private var isOn: Bool = false
    
    var body: some View {
        
        VStack {
        
            Toggle(isOn: $isOn) {
                Text("")
            }.labelsHidden()
        
            Text(self.isOn ? "🌞" : "🌙").font(.custom("Arial", size: 100))
            
        }.frame(width: 800, height: 800)
        .background(self.isOn ? Color.white : Color.black)
        
    }
}
struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}

```

## 3. ScrollingPages in SwiftUI

**In swiftUI it is relatively easy to create tabView Pages. The first step is to create two struct [Widgets] Home Page - Second Page**
Then we just need to call The distinct pages in the Main Function using a WINDOW GROUP -> TabView
Don't forget we can also use the extensions 
>.tabViewStyle(PageTabViewStyle()).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

### Main Function

```swift
import SwiftUI

@main
struct iosAppTutorialsApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomePage()
                SecondPage()
              
            }.tabViewStyle(PageTabViewStyle()).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))


        }
    }
}

```

### TabView Pages


```swift

import SwiftUI

struct HomePage: View {
    var body: some View {
        Text("Home Page")
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity )
            .background(Color.black)
    }
}

struct SecondPage: View {
    var body: some View {
        Text("Second Page")
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity )
            .background(Color.white)
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

 ```
 
  ><img  width="307" height="600" alt="Screen Shot 2022-01-16 at 17 16 14" src="https://user-images.githubusercontent.com/49708438/150696299-1d7cd6f8-1165-43c6-b8e2-650c8da6d8d1.gif">
