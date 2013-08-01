
class Ui_MainWindow
    attr_reader :actionSettings
    attr_reader :actionExit
    attr_reader :actionPreferences
    attr_reader :centralwidget
    attr_reader :verticalLayout_3
    attr_reader :tabWidget
    attr_reader :tab
    attr_reader :verticalLayout_4
    attr_reader :horizontalLayout
    attr_reader :horizontalSpacer
    attr_reader :label_3
    attr_reader :lineEdit
    attr_reader :splitter_2
    attr_reader :splitter
    attr_reader :layoutWidget
    attr_reader :verticalLayout_2
    attr_reader :label_2
    attr_reader :textBrowser
    attr_reader :layoutWidget1
    attr_reader :verticalLayout
    attr_reader :label
    attr_reader :treeWidget
    attr_reader :tabWidget_2
    attr_reader :tab_3
    attr_reader :verticalLayout_6
    attr_reader :treeWidget_2
    attr_reader :tab_4
    attr_reader :verticalLayout_5
    attr_reader :treeWidget_3
    attr_reader :tab_2
    attr_reader :verticalLayout_7
    attr_reader :treeWidget_4
    attr_reader :menubar
    attr_reader :menuFile
    attr_reader :menuTools
    attr_reader :statusbar
    attr_reader :toolBar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(800, 600)
    @actionSettings = Qt::Action.new(mainWindow)
    @actionSettings.objectName = "actionSettings"
    @actionExit = Qt::Action.new(mainWindow)
    @actionExit.objectName = "actionExit"
    @actionPreferences = Qt::Action.new(mainWindow)
    @actionPreferences.objectName = "actionPreferences"
    icon = Qt::Icon.new
    icon.addPixmap(Qt::Pixmap.new("./281252091900762326.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionPreferences.icon = icon
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @verticalLayout_3 = Qt::VBoxLayout.new(@centralwidget)
    @verticalLayout_3.objectName = "verticalLayout_3"
    @tabWidget = Qt::TabWidget.new(@centralwidget)
    @tabWidget.objectName = "tabWidget"
    @tabWidget.documentMode = true
    @tabWidget.tabsClosable = true
    @tab = Qt::Widget.new()
    @tab.objectName = "tab"
    @verticalLayout_4 = Qt::VBoxLayout.new(@tab)
    @verticalLayout_4.objectName = "verticalLayout_4"
    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @horizontalSpacer = Qt::SpacerItem.new(490, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @horizontalLayout.addItem(@horizontalSpacer)

    @label_3 = Qt::Label.new(@tab)
    @label_3.objectName = "label_3"

    @horizontalLayout.addWidget(@label_3)

    @lineEdit = Qt::LineEdit.new(@tab)
    @lineEdit.objectName = "lineEdit"

    @horizontalLayout.addWidget(@lineEdit)


    @verticalLayout_4.addLayout(@horizontalLayout)

    @splitter_2 = Qt::Splitter.new(@tab)
    @splitter_2.objectName = "splitter_2"
    @splitter_2.orientation = Qt::Vertical
    @splitter = Qt::Splitter.new(@splitter_2)
    @splitter.objectName = "splitter"
    @splitter.orientation = Qt::Horizontal
    @layoutWidget = Qt::Widget.new(@splitter)
    @layoutWidget.objectName = "layoutWidget"
    @verticalLayout_2 = Qt::VBoxLayout.new(@layoutWidget)
    @verticalLayout_2.objectName = "verticalLayout_2"
    @verticalLayout_2.setContentsMargins(0, 0, 0, 0)
    @label_2 = Qt::Label.new(@layoutWidget)
    @label_2.objectName = "label_2"

    @verticalLayout_2.addWidget(@label_2)

    @textBrowser = Qt::TextBrowser.new(@layoutWidget)
    @textBrowser.objectName = "textBrowser"

    @verticalLayout_2.addWidget(@textBrowser)

    @splitter.addWidget(@layoutWidget)
    @layoutWidget1 = Qt::Widget.new(@splitter)
    @layoutWidget1.objectName = "layoutWidget1"
    @verticalLayout = Qt::VBoxLayout.new(@layoutWidget1)
    @verticalLayout.objectName = "verticalLayout"
    @verticalLayout.setContentsMargins(0, 0, 0, 0)
    @label = Qt::Label.new(@layoutWidget1)
    @label.objectName = "label"

    @verticalLayout.addWidget(@label)

    @treeWidget = Qt::TreeWidget.new(@layoutWidget1)
    @treeWidget.objectName = "treeWidget"

    @verticalLayout.addWidget(@treeWidget)

    @splitter.addWidget(@layoutWidget1)
    @splitter_2.addWidget(@splitter)
    @tabWidget_2 = Qt::TabWidget.new(@splitter_2)
    @tabWidget_2.objectName = "tabWidget_2"
    @tab_3 = Qt::Widget.new()
    @tab_3.objectName = "tab_3"
    @verticalLayout_6 = Qt::VBoxLayout.new(@tab_3)
    @verticalLayout_6.objectName = "verticalLayout_6"
    @treeWidget_2 = Qt::TreeWidget.new(@tab_3)
    @treeWidget_2.objectName = "treeWidget_2"

    @verticalLayout_6.addWidget(@treeWidget_2)

    @tabWidget_2.addTab(@tab_3, Qt::Application.translate("MainWindow", "Connections", nil, Qt::Application::UnicodeUTF8))
    @tab_4 = Qt::Widget.new()
    @tab_4.objectName = "tab_4"
    @verticalLayout_5 = Qt::VBoxLayout.new(@tab_4)
    @verticalLayout_5.objectName = "verticalLayout_5"
    @treeWidget_3 = Qt::TreeWidget.new(@tab_4)
    @treeWidget_3.objectName = "treeWidget_3"

    @verticalLayout_5.addWidget(@treeWidget_3)

    @tabWidget_2.addTab(@tab_4, Qt::Application.translate("MainWindow", "Downloads", nil, Qt::Application::UnicodeUTF8))
    @splitter_2.addWidget(@tabWidget_2)

    @verticalLayout_4.addWidget(@splitter_2)

    @tabWidget.addTab(@tab, Qt::Application.translate("MainWindow", "Main", nil, Qt::Application::UnicodeUTF8))
    @tab_2 = Qt::Widget.new()
    @tab_2.objectName = "tab_2"
    @verticalLayout_7 = Qt::VBoxLayout.new(@tab_2)
    @verticalLayout_7.objectName = "verticalLayout_7"
    @treeWidget_4 = Qt::TreeWidget.new(@tab_2)
    @treeWidget_4.objectName = "treeWidget_4"

    @verticalLayout_7.addWidget(@treeWidget_4)

    @tabWidget.addTab(@tab_2, Qt::Application.translate("MainWindow", "Page", nil, Qt::Application::UnicodeUTF8))

    @verticalLayout_3.addWidget(@tabWidget)

    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 800, 21)
    @menuFile = Qt::Menu.new(@menubar)
    @menuFile.objectName = "menuFile"
    @menuTools = Qt::Menu.new(@menubar)
    @menuTools.objectName = "menuTools"
    mainWindow.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar
    @toolBar = Qt::ToolBar.new(mainWindow)
    @toolBar.objectName = "toolBar"
    mainWindow.addToolBar(Qt::TopToolBarArea, @toolBar)

    @menubar.addAction(@menuFile.menuAction())
    @menubar.addAction(@menuTools.menuAction())
    @menuFile.addAction(@actionExit)
    @menuTools.addAction(@actionPreferences)
    @toolBar.addAction(@actionPreferences)

    retranslateUi(mainWindow)

    @tabWidget.setCurrentIndex(1)
    @tabWidget_2.setCurrentIndex(0)


    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "Project Share", nil, Qt::Application::UnicodeUTF8)
    @actionSettings.text = Qt::Application.translate("MainWindow", "Settings", nil, Qt::Application::UnicodeUTF8)
    @actionExit.text = Qt::Application.translate("MainWindow", "Exit", nil, Qt::Application::UnicodeUTF8)
    @actionExit.shortcut = Qt::Application.translate("MainWindow", "Ctrl+Q", nil, Qt::Application::UnicodeUTF8)
    @actionPreferences.text = Qt::Application.translate("MainWindow", "Preferences", nil, Qt::Application::UnicodeUTF8)
    @actionPreferences.shortcut = Qt::Application.translate("MainWindow", "Ctrl+P", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("MainWindow", "Search", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("MainWindow", "System Log", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("MainWindow", "Users Online", nil, Qt::Application::UnicodeUTF8)
    @treeWidget.headerItem.setText(0, Qt::Application.translate("MainWindow", "User Name", nil, Qt::Application::UnicodeUTF8))
    @treeWidget.headerItem.setText(1, Qt::Application.translate("MainWindow", "Email", nil, Qt::Application::UnicodeUTF8))
    @treeWidget.headerItem.setText(2, Qt::Application.translate("MainWindow", "Guid", nil, Qt::Application::UnicodeUTF8))
    @treeWidget.headerItem.setText(3, Qt::Application.translate("MainWindow", "IpAddress", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_2.headerItem.setText(0, Qt::Application.translate("MainWindow", "User Name", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_2.headerItem.setText(1, Qt::Application.translate("MainWindow", "Status", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_2.headerItem.setText(2, Qt::Application.translate("MainWindow", "Speed", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_2.headerItem.setText(3, Qt::Application.translate("MainWindow", "Ip", nil, Qt::Application::UnicodeUTF8))
    @tabWidget_2.setTabText(@tabWidget_2.indexOf(@tab_3), Qt::Application.translate("MainWindow", "Connections", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_3.headerItem.setText(0, Qt::Application.translate("MainWindow", "File Name", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_3.headerItem.setText(1, Qt::Application.translate("MainWindow", "Path", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_3.headerItem.setText(2, Qt::Application.translate("MainWindow", "Status", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_3.headerItem.setText(3, Qt::Application.translate("MainWindow", "Time Left", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_3.headerItem.setText(4, Qt::Application.translate("MainWindow", "Speed", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_3.headerItem.setText(5, Qt::Application.translate("MainWindow", "Done", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_3.headerItem.setText(6, Qt::Application.translate("MainWindow", "Size", nil, Qt::Application::UnicodeUTF8))
    @tabWidget_2.setTabText(@tabWidget_2.indexOf(@tab_4), Qt::Application.translate("MainWindow", "Downloads", nil, Qt::Application::UnicodeUTF8))
    @tabWidget.setTabText(@tabWidget.indexOf(@tab), Qt::Application.translate("MainWindow", "Main", nil, Qt::Application::UnicodeUTF8))
    @treeWidget_4.headerItem.setText(0, Qt::Application.translate("MainWindow", "1", nil, Qt::Application::UnicodeUTF8))
    @tabWidget.setTabText(@tabWidget.indexOf(@tab_2), Qt::Application.translate("MainWindow", "Page", nil, Qt::Application::UnicodeUTF8))
    @menuFile.title = Qt::Application.translate("MainWindow", "File", nil, Qt::Application::UnicodeUTF8)
    @menuTools.title = Qt::Application.translate("MainWindow", "Tools", nil, Qt::Application::UnicodeUTF8)
    @toolBar.windowTitle = Qt::Application.translate("MainWindow", "toolBar", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

