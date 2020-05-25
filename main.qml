import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import io.qt.examples.backend 1.0
import QtQuick 2.9
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    BackEnd {
        id: backend

        onUserNameChanged: {
            textSalida.text = userName
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 2

        TextField {
            id: textFieldInput
            text: "hello world using the property"
            placeholderText: qsTr("User name")
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            text: "Using the property"
            Layout.alignment: Qt.AlignHCenter

            onClicked: {
                backend.userName = textFieldInput.text
                textSalida.text = backend.userName
            }
        }

        Button {
            text: "Using the function"
            Layout.alignment: Qt.AlignHCenter

            onClicked: {
                backend.setUserName("hello world using the function")
            }
        }

        Text {
            id: textSalida
            text: backend.userName
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
