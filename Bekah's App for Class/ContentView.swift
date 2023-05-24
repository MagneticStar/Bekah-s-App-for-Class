//
//  ContentView.swift
//  Bekah's App for Class
//
//  Created by Joey Banowetz on 5/19/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    
    @State private var viewController: String = "Map"
    @State private var destination: String = ""
    @State private var contact: String = "911"
    private let font: Font = .system(size: 80)
    private func map() -> Void {
        self.viewController = "Map"
    }
    private func callEmergency() -> Void {
        self.viewController = "Emergency"
    }
    private func order() -> Void {
        self.viewController = "Order"
    }
    private func setContact() -> Void {
        self.viewController = "Contact"
    }
    private func one() -> Void {
        contact+="1"
    }
    private func two() -> Void {
        contact+="2"
    }
    private func three() -> Void {
        contact+="3"
    }
    private func four() -> Void {
        contact+="4"
    }
    private func five() -> Void {
        contact+="5"
    }
    private func six() -> Void {
        contact+="6"
    }
    private func seven() -> Void {
        contact+="7"
    }
    private func eight() -> Void {
        contact+="8"
    }
    private func nine() -> Void {
        contact+="9"
    }
    private func zero() -> Void {
        contact+="0"
    }
    private func delete() -> Void {
        if (contact.count > 0) {
            contact = String(contact[contact.startIndex..<contact.index(contact.endIndex, offsetBy: -1)])
        }
    }
    var body: some View {
        switch viewController {
        case "Emergency":
            VStack() {
                Text(verbatim: "calling \(contact)...")
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(Color.white)
            .background(Color.black)
            .onTapGesture {
                viewController = "Map"
            }
        case "Map":
            VStack() {
                Button("Emergency Services", role: .destructive, action: callEmergency)
                    .foregroundColor(Color.red)
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.bordered)
                MapView()
                HStack() {
                    Button("Order", action: order)
                        .buttonBorderShape(.roundedRectangle)
                        .buttonStyle(.bordered)
                    Button("Set Emergency Contact", action: setContact)
                        .buttonBorderShape(.roundedRectangle)
                        .buttonStyle(.bordered)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(Color.white)
            .background(Color.black)
        case "Order":
            VStack() {
                Text(verbatim: "Rides")
                TextField("Enter Destination", text: $destination)
                    .textFieldStyle(.roundedBorder)
                MapView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(Color.white)
            .background(Color.black)
            .overlay(alignment: .topTrailing, content: {
                Button("Back", action: map)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .font(.system(size: 10))
                    .padding(.trailing, 20)
            } )
        case "Contact":
            VStack() {
                Text(verbatim: contact)
                Spacer()
                    .frame(height: 30)
                HStack() {
                    Button("1", action: one)
                    Button("2", action: two)
                    Button("3", action: three)
                }
                HStack() {
                    Button("4", action: four)
                    Button("5", action: five)
                    Button("6", action: six)
                }
                HStack() {
                    Button("7", action: seven)
                    Button("8", action: eight)
                    Button("9", action: nine)
                }
                HStack() {
                    Button("0", action: zero)
                    Button("-", action: delete)                }
               
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(Color.white)
            .background(Color.black)
            .font(.system(size: 80))
            .buttonBorderShape(.roundedRectangle)
            .buttonStyle(.bordered)
            .overlay(alignment: .topTrailing, content: {
                Button("Back", action: map)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .font(.system(size: 10))
                    .padding(20)
            } )
        default:
            Text(verbatim: "error").onTapGesture {
                viewController = "Map"
            }
        }
    }
}
struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let Map = MKMapView()
        let coordinate = CLLocationCoordinate2D(latitude: 41.9779, longitude: -91.6656)
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        Map.setRegion(region, animated: false)
//        Map.isUserInteractionEnabled = false
        class DangerPoint: NSObject,MKAnnotation{
            init(lat: CGFloat, long: CGFloat) {
                self.coordinate = CLLocationCoordinate2D(latitude: lat,longitude: long)
            }
            var coordinate: CLLocationCoordinate2D
            var title: String? = "Incident"
        }
        Map.addAnnotation(DangerPoint(lat: 41.98,long: -91.64))
        Map.addAnnotation(DangerPoint(lat: 41.95,long: -91.67))
        Map.addAnnotation(DangerPoint(lat: 42.00,long: -91.69))
        return Map
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
