import QtQuick 2.9

Item {
    Item {
        focus: true
        Keys.onPressed: {
            console.log("Loaded item captured:", event.text);
            event.accepted = true;
        }
    }
}
