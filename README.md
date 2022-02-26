# iOS Developer Must Know Tips
This Repository is composed of different tips that all IOS developers must know. ⛺️     SwiftUi ARKit, Metal ,SceneKit Etc.🌟
 
- [Implement Map in SwiftUi ](#implement-map)
- [State management](#stateview)
- [Scrolling Pages](#scrolling-pages)

 
 
 ## 1.Implement Map 

>To Implement a Map in SwiftUI it is relatively easy. Just import MapKit first. 
 
```swift
import MapKit
import SwiftUI
```


> Then cretate a view. In our case **MapKitView**. After that, set up a MKCoordinateRegion that 
> will take a **center** (lat and long) and a **span** value.

```swift
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
  ><img  width="537" alt="Screen Shot 2022-01-16 at 17 16 14" src="https://user-images.githubusercontent.com/49708438/150695665-1a073427-b9d1-4a74-870c-d840e619752e.jpeg">

## 2.StateView 

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

## 3.ScrollingPages 

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
 
  ><img  width="305" height="620" alt="Screen Shot 2022-01-16 at 17 16 14" src="https://user-images.githubusercontent.com/49708438/150696299-1d7cd6f8-1165-43c6-b8e2-650c8da6d8d1.gif">


## 4. GameScene and SpriteKit
**SwiftUi offers a handy tool to set up gameScene environment.**

### a. Implement SpriteKit along with SwiftUI

```swift
import SpriteKit
import SwiftUI
```

### b. Create a GameScene class which implements the SKScene protocol

>The SKScene protocol requires 2 overriden functions: **didMove** and **touchesBegan**
>the first function didMove is called everytime the character objects moves around the scene. In our case a red Box. Then touchesBegan takes care of first recording the coordinate of the first touch on the screen. After that create a red box (OBJECT) in the GameScene.

```swift
class GameScene : SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        
        addChild(box)

    }
}

```


### c. Create the SpriteKitView
> The final step is to create a new instance of our gameScene class. We will then attribut a constant size using CGSize.
> The new instance of the GameScene will be then called in the body view with the necessary parameters.


```swift
struct SpriteKitView: View {
    
    var scene : SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene).frame(width: 300, height: 400)
    }
}

struct SpriteKitView_Previews: PreviewProvider {
    static var previews: some View {
        SpriteKitView()
    }
}

```
><img  width="305" height="620" alt="GameScene_SpriteKit" src="https://user-images.githubusercontent.com/49708438/150698032-15249cf7-a154-453e-8d55-a80653a26644.gif">

## 5. ColorPicker and Date Picker View
**SwiftUi offers a handy tool to easily pick up colors.**

### Color Picker 
> First import SwiftUi

```swift
import SwiftUI
```

>Secondly just create a state variable that will have the initial value. **bgColor** Call the ColorPicker Component. **Don't forget to add frame and 
>padding** 

```swift

struct ColorPickerView: View {
    @State private var bgColor = Color.white
    
    var body: some View {
        ColorPicker("Set the background color", selection: $bgColor).frame(height:200).padding(.horizontal)
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}

```
### Date Picker

>Similarly for DatePicker we need to create a state variable **date**. We then call DatePicker in a VStack
> We should also add a **.datePickerStyle(GraphicalDatePickerStyle())**

```swift
struct DatePickerView: View {
    @State private var date = Date()
    
    var body: some View {
        //1.We create the datepicker we have to set labelsHidden() to hide the title
        VStack {
            Text("Enter your birthday").font(.title)
            DatePicker("Enter your birthday",selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
                .frame(maxHeight:400)
        }
        
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
```

## 6.File Document
**SwiftUi allow users to create pdf and textFile.**

> 1. import UniformTypeIdentifiers

```swift
import SwiftUI
import UniformTypeIdentifiers
```

>Create the struct TextFile and extend it using |**FileDocument** protocol
>This function takes care of the logic of saving and then writing the written plain text.

```swift

struct TextFile: FileDocument {
    ///3. set up the type of the document
    var text: String

       init(text: String = "This is a brand new document! 📃") {
           self.text = text
       }

       // A
    static var readableContentTypes: [UTType] { [UTType.plainText] }

       // B
       init(configuration: ReadConfiguration) throws {
           guard let data = configuration.file.regularFileContents,
               let string = String(data: data, encoding: .utf8)
           else {
               throw CocoaError(.fileReadCorruptFile)
           }
           text = string
       }

       // C
       func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
           let data = text.data(using: .utf8)!
           return .init(regularFileWithContents: data)
       }
}

```
### File Document View

>Then we create the File document View. We need to set a **@Binding** Variable of type TextFile.
>Finally we need to add the document variable to the TextEditor component.

```swift
struct FileDocumentView: View {
    @Binding var document: TextFile
    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct FileDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        FileDocumentView(document: .constant(TextFile()))
    }
}
```
