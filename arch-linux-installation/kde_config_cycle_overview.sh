
#!/bin/bash

kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,,invokeShortcut,Cycle Overview"
qdbus org.kde.KWin /KWin reconfigure
