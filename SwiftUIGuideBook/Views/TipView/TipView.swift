import SwiftUI

struct Component {
    let name: String
    let code: String
    let URL: String

    static func all() -> [Component] {
        return [
            Component(name: "Alert", code: "Code", URL: "URL"),
            Component(name: "Action Sheet", code: "Code", URL: "URL"),
            Component(name: "Activity View", code: "Code", URL: "URL"),
            Component(name: "Sheet", code: "Code", URL: "URL"),
            Component(name: "FullScreenCover", code: "Code", URL: "URL"),
        ]
    }
}

struct TipView: View {
    let componentList: [Component]
    @State private var testBoolian: Bool = false
    var body: some View {
        GeometryReader { geomotry in
            VStack {
                ForEach(componentList, id: \.name) { value in
                    HStack(alignment: .center) {
                        Button(action: {

                        }, label: {
                            HStack {
                                Image(systemName: "play.fill")
                                    .foregroundColor(.white)
                                Text("Play")
                                .foregroundColor(.white)
                            }
                            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .background(RoundedRectangle(cornerRadius: 20).fill(.blue))
                            .frame(width: geomotry.size.width * 0.3, alignment: .center)
                            })
                        
                        Image(systemName: "curlybraces.square.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.blue)
                            .frame(width: geomotry.size.width * 0.3, alignment: .center)
                        
                        Image(systemName: "doc.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.blue)
                            .frame(width: geomotry.size.width * 0.3, alignment: .center)
                    }
                }
            }
        }
        
    }

//    func selectComponent(name: String, isActive1: Bool) -> some View {
//        switch name {
//        case "abc":
//            return Button("abc") {}
////            return Text("abc")
//        default:
//            return Button("\(isActive1)") {}
//        }
////        return Text(name)
//    }

    private var switchValue: some View {
        HStack {

        }
    }
}

struct TipView_Previews: PreviewProvider {
    static var previews: some View {
        TipView(componentList: [
            Component(name: "Alert", code: "Code", URL: "URL"),
            Component(name: "Action Sheet", code: "Code", URL: "URL"),
            Component(name: "Activity View", code: "Code", URL: "URL"),
            Component(name: "Sheet", code: "Code", URL: "URL"),
            Component(name: "FullScreenCover", code: "Code", URL: "URL"),
            ])
    }
}
