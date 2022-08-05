import QtQuick 2.9
import QtQuick.Layouts 1.3
import Felgo 3.0
import QtQuick.Controls 2.5
import com.afriktek.qplayer 1.0




Rectangle{

    height: dp(70)
    width: parent.width
    color: "#00000000"
    property string trackName: ""
    property string artistName: ""
    property string albumName: ""
    property string duration: "13 : 12"
    property int  trackId: 0
    property bool isFavorite: false

    property color thumbnailColor: Qt.rgba(Math.random(255),Math.random(255),Math.random(255),1)
    property color thumbnailColor2: Qt.rgba(Math.random(255),Math.random(255),Math.random(255),1)
    property color thumbnailColor3: Qt.rgba(Math.random(155),Math.random(200),Math.random(55),1)
    id:rootRect

    signal clicked()

    RowLayout{
        anchors.fill: parent
        id:root

        spacing: dp(5)



        Row{
            Layout.preferredHeight: dp(65)
            Layout.margins: dp(5)

            Rectangle{

                height: dp(60)
                width: dp(60)
                radius: dp(5)
                gradient:Gradient{


                    GradientStop{
                        position: 0.0
                        color: thumbnailColor
                    }

                    GradientStop{
                        position: 1.0
                        color: thumbnailColor2
                    }

                }

                //                RoundedImage{
                //                    property int thumbnailSize:dp(60)
                //                    height: thumbnailSize
                //                    width: thumbnailSize
                //                    source: "qrc:/assets/qt.png"
                //                    fillMode: Image.Stretch
                //                    Layout.alignment: Qt.AlignHCenter


                //                }
            }


            Rectangle{
                width: dp(5)
            }

            Column{
                width: dp(100)
                height: dp(65)
                spacing: dp(5)
                leftPadding: dp(5)


                AppText{
                    text:trackName
                    font.bold: true
                    fontSize: 14
                    topPadding: dp(5)
                    maximumLineCount: 1
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere


                }
                AppText{
                    text:artistName
                    bottomPadding: dp(5)
                    fontSize: 12
                    color: Theme.secondaryTextColor
                    maximumLineCount: 1
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                }
            }
        }




        AppText{
            text:albumName
            visible: root.width>410
            fontSize: 14

            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: dp(80)
            Layout.preferredWidth: dp(80)
            maximumLineCount: 1
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        }


        AppText{
            text:duration

            fontSize: 16
            font.family: Constants.lcdFont.name
            font.letterSpacing: dp(2)
            font.bold: true


            Layout.alignment: Qt.AlignHCenter
            Layout.maximumWidth: dp(100)
            Layout.preferredWidth: dp(80)
            maximumLineCount: 1
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere

        }

        IconButton{
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: dp(40)
            Layout.preferredHeight: dp(40)
            icon: isFavorite? IconType.heart:IconType.hearto


        }



    }
    RippleMouseArea{
        anchors.fill:rootRect
        acceptedButtons: Qt.RightButton | Qt.LeftButton
        onClicked: {

            if(mouse.button===Qt.RightButton){
                menu.popup()
            }

            rootRect.clicked()

        }
        onDoubleClicked: {
            //playing track
            jmusicLogic.trackPlayed(trackId)

        }
        onPressAndHold: {
            rootRect.clicked()
            menu.popup()
        }

        Menu{
            Action{
                text: "Play"
                onTriggered: {
                    jmusicLogic.trackPlayed(trackId)
                }
            }
            Action{text: "Add to Queue"}
            Action{text: "Add to Playlist"}

            id:menu
            background: Rectangle{
                implicitWidth: dp(200)
                implicitHeight: dp(220)
                radius: dp(5)
                clip: true
                border.color: Theme.secondaryBackgroundColor
                color: Theme.backgroundColor

            }
            delegate:MenuItem{
                width:menu.width
                id:m_item

                contentItem: AppText{
                    fontSize: 14
                    color: Theme.textColor
                    text: m_item.text
                    font.bold: true
                    padding: dp(5)

                }
                background:Rectangle{
                    width:menu.width
                    radius: dp(5)
                    color: m_item.highlighted? Theme.tintColor:Theme.backgroundColor
                }



            }
        }
    }


}


