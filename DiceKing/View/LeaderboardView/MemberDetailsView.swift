import SwiftUI

struct MemberDetailsView: View {
    
    @EnvironmentObject var appVM: ApplicationViewModel 
    @EnvironmentObject var dbVM: DatabaseViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("yellow").opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // CLOSE BUTTON
                HStack {
                    Spacer()
                    Button {
                        appVM.resetSelectedUser()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.title)
                    }
                }
                
                // USER NAME
                Text(appVM.getSelectedUser()?.name ?? NSLocalizedString("unknown", bundle: .main, comment: ""))
                    .font(.title)
                    .bold()
                    .padding()
                
                // EXP & LEVEL
                HStack {
                    Text(appVM.getUserExpLabel(db: dbVM, exp: appVM.getSelectedUser()?.exp ?? 0))
                        .fontWeight(.semibold)

                    Spacer()
                    Text(appVM.getUserLevelLabel(db: dbVM, exp: appVM.getSelectedUser()?.exp ?? 0))
                        .font(.title2)
                        .bold()
                }
                .padding(.bottom, 4)

                // Divider
                Rectangle()
                    .fill(Color("blue").opacity(0.5))
                    .frame(width: 280, height: 2)
                    .padding(.vertical, 10)
                
                // BADGES
                VStack(alignment: .leading) {
                    Text(NSLocalizedString("badges", bundle: .main, comment: ""))
                        .font(.title2)
                        .bold()
                    
                    LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem(), GridItem(), GridItem()], spacing: 10) {
                        ForEach(dbVM.getBadges(), id: \.name) { badge in
                            Image(badge.image)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(.horizontal, 5)
                                .opacity(appVM.getSelectedUser()?.badges.contains(badge.id) ?? false ? 1 : 0.3)
                        }
                    }
                }

                // Divider
                Rectangle()
                    .fill(Color("blue").opacity(0.5))
                    .frame(width: 280, height: 2)
                    .padding(.vertical, 10)
                
                // GAMES PLAYED
                Text("\(NSLocalizedString("games_played", bundle: .main, comment: "")): \(dbVM.getUserTotalGames(name: appVM.getSelectedUser()?.name))")
                
                // WIN PERCENTAGE   
                Text("\(NSLocalizedString("win_rate", bundle: .main, comment: "")): \(dbVM.getUserWinrateLabel(name: appVM.getSelectedUser()?.name))")
                    .padding(.bottom)
            }
            .font(.title3)
            .foregroundColor(Color("blue"))
            .padding()
            
        }
        .frame(width: 350, height: 420)
        .cornerRadius(20)
        
    }
    
}
