# iOS Developer Must know tips
This Repository is composed of different tips that all IOS developers must know. ⛺️     SwiftUi ARKit, Metal ,SceneKit Etc.🌟
 
 ## 1. Implement Map in SwiftUI
 
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
