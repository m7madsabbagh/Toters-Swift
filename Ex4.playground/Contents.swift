import Foundation

protocol DataStream
{
    var isActive: Bool {get}
    mutating func startStream()
    func stopStream()

}

extension DataStream
{
    func stopStream()
    {
        print("Streaming has stopped")
    }
    mutating func restartStream()
    {
        print("Restarting...")
        stopStream()
        startStream()
    }
}

protocol DataProcessor
{
    associatedtype ProcessedData
    func process() -> ProcessedData
}

struct FileStream: DataStream
{


    var filename: String
    var isStreaming = false
    var isActive: Bool
    {
        return isStreaming
    }
    mutating func startStream()
    {
        print("Streaming has started \(filename)")
        isStreaming = true
    }
    func stopStream()
    {
        print("Streaming has stopped \(filename)")
    }

}

struct NetworkStream: DataStream
{
    var serverURL: URL
    var isStreaming = false
    var isActive: Bool
    {
        return isStreaming
    }
    mutating func startStream()
    {
        print("Streaming has started \(serverURL)")
        isStreaming = true
    }
    func stopStream()
    {
        print("Streaming has stopped \(serverURL)")
    }
    func handleNetworkError(){}

}

extension FileStream: DataProcessor
{
    func process() -> String
    {
        return ("Processed file \(filename)")
    }

}
var file = FileStream(filename: "report.txt")

file.startStream()
print("Is streaming active? \(file.isActive)")
print(file.process())
file.restartStream()


print("\n🔹 NETWORK STREAM TESTING")
var network = NetworkStream(serverURL: URL(string: "https://example.com")!)

network.startStream()
print("Is Active? \(network.isActive)")
network.handleNetworkError()
network.stopStream()
network.restartStream()
