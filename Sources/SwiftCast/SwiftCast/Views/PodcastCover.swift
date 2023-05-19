import SwiftUI

struct PodcastCover: View {
    var podcast: Podcast
    
    @State private var backgroundColor: Color = .clear
    
    private var plusButton: some View {
        HStack(alignment: .bottom, spacing: 0) {
            LinearGradient(
                gradient: Gradient(colors: [backgroundColor.opacity(0), backgroundColor.opacity(1)]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(width: 40, height: 20)
            
            Button(action: {}) {
                Text("PLUS")
                    .font(.headline)
            }
            .padding(.leading, 10)
            .background(backgroundColor)
        }
        .padding(.bottom, 12)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    Image(podcast.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(7)
                        .shadow(color: .black.opacity(0.4), radius: 8)
                        .frame(width: geo.size.width * 0.55)
                        .frame(width: geo.size.width)
                        
                    
                    Text(podcast.title)
                        .font(.title2)
                        .bold()
                        .padding(.top, 14)
                        .padding(.bottom, 6)
                    
                    Label("\(podcast.author) >", systemImage: "tv")
                        .font(.body)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .padding(.bottom, 20)
                    
                    GeometryReader { geo in
                        VStack(alignment: .leading, spacing: 0) {
                            Button(action: {}) {
                                Label("Dernier épisode", systemImage: "play.fill")
                                    .bold()
                                    .padding(7)
                                    .frame(width: geo.size.width * 0.65)
                                
                            }
                            .frame(width: geo.size.width * 0.7)
                            .frame(width: geo.size.width)
                            .buttonStyle(.bordered)
                            .tint(.black)
                            .cornerRadius(12)
                            
                            ZStack {
                                Text("**\(formatDate(date: podcast.episodes.first!.date)): \(podcast.episodes.first?.title ?? "")**: \(podcast.episodes.first?.script ?? "")")
                                    .lineLimit(3)
                                    .padding(.top, 16)
                                    .padding(.bottom, 12)
                                    .overlay(plusButton, alignment: .bottomTrailing)
                                
                            }
                            
                            
                            HStack(alignment: .center, spacing: 0) {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14)
                                    .padding(.trailing, 4)
                                Text("**\(podcast.rating, specifier: "%.1f")** (\(podcast.numberOfReviews))・\(podcast.category)・Chaque semaine")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
        }
        .background(backgroundColor)
        .onAppear {
            loadBackgroundColor()
        }
    }
    
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        guard let currentWeek = Calendar.isDayInCurrentWeek(date: podcast.episodes.first!.date) else {
            return formatter.string(from: date)
        }
        if currentWeek {
            formatter.dateFormat = "EEEE"
            return formatter.string(from: date)
        }
        guard let currentYear = Calendar.isDayInCurrentYear(date: podcast.episodes.first!.date) else {
            return formatter.string(from: date)
        }
        if currentYear {
            formatter.dateFormat = "dd MMM"
        }
        else {
            formatter.dateFormat = "yyyy"
        }
        return formatter.string(from: date)
    }
    
    private func loadBackgroundColor() {
        let uiColor = UIImage(named: podcast.imageName)?.averageColor ?? .clear
        backgroundColor = Color(uiColor)
    }
}

struct PodcastCover_Previews: PreviewProvider {
    static var previews: some View {
        var stub = Stub()
        let podcasts = stub.loadPodcasts()
        Group {
            PodcastCover(podcast: podcasts[0])
            PodcastCover(podcast: podcasts[0]).preferredColorScheme(.dark)
        }
    }
}
