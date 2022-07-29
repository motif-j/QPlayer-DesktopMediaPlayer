import QtQuick 2.0
import Felgo 3.0
import QtQuick.Layouts 1.3
import com.afriktek.qplayer 1.0
import "../pages"


Item {

    property string globalPlaylistTitle: ""


    Rectangle{
        anchors.fill: parent

        radius: dp(5)

        color: JColors.backgroundColor
        anchors.leftMargin: dp(2)
        anchors.rightMargin: dp(2)


        //Children of the Main Page
        //set margins >=5 to cater for the 5dp radius


        Navigation{
            navigationMode: fixDrawer()?navigationModeDrawer:navigationModeTabs
            drawerFixed: fixDrawer()
            drawerMinifyEnabled: fixDrawer()?true:false
            headerView: Rectangle{
                height: dp(100)


            }



            NavigationItem{
                title:"Home"
                icon: IconType.home

                NavigationStack{
                    id:centerNavStack


                    MainPage{
                        anchors.fill: parent
                        onNavigateUp:(pageTitle)=> {
                                         globalPlaylistTitle=pageTitle

                                         centerNavStack.push(playlistPage)


                                     }

                    }

                    Component{
                        id:playlistPage
                        PlaylistPage{
                            playlistTitle: globalPlaylistTitle



                        }


                    }


                }


            }


            NavigationItem{
                title:"Tracks"
                icon: IconType.music

                NavigationStack{


                    TracksPage{
                        anchors.fill: parent

                    }
                }

            }
            NavigationItem{
                title:"Search"
                icon: IconType.search

                NavigationStack{

                    SearchPage{
                        anchors.fill: parent

                    }
                }

            }
            NavigationItem{
                title:"Playlists"
                icon: IconType.list

                NavigationStack{

                    FavoriteTracksPage{
                        anchors.fill: parent

                    }
                }

            }

            NavigationItem{
                title:"Settings"
                icon: IconType.gear

                NavigationStack{

                    FavoriteTracksPage{
                        anchors.fill: parent

                    }
                }

            }
        }

    }



    function fixDrawer(){
        let isDesktop=Theme.isDesktop
        let isPotrait=Theme.isPortrait

        if(isPotrait){
            return false
        }else{

            if(isDesktop){
                return true
            }else{
                return false

            }
        }



    }
}



