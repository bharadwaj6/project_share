=begin
** Form generated from reading ui file 'tabwidget.ui'
**
** Created: Tue Apr 17 21:50:56 2012
**      by: Qt User Interface Compiler version 4.6.1
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_TabWidget
    attr_reader :tab
    attr_reader :verticalLayout
    attr_reader :treeWidget

    def setupUi(tabWidget)
    if tabWidget.objectName.nil?
        tabWidget.objectName = "tabWidget"
    end
    tabWidget.resize(400, 300)
    @tab = Qt::Widget.new()
    @tab.objectName = "tab"
    @verticalLayout = Qt::VBoxLayout.new(@tab)
    @verticalLayout.objectName = "verticalLayout"
    @treeWidget = Qt::TreeWidget.new(@tab)
    @treeWidget.objectName = "treeWidget"

    @verticalLayout.addWidget(@treeWidget)

    tabWidget.addTab(@tab, Qt::Application.translate("TabWidget", "Tab 1", nil, Qt::Application::UnicodeUTF8))

    retranslateUi(tabWidget)

    tabWidget.setCurrentIndex(0)


    Qt::MetaObject.connectSlotsByName(tabWidget)
    end # setupUi

    def setup_ui(tabWidget)
        setupUi(tabWidget)
    end

    def retranslateUi(tabWidget)
    tabWidget.windowTitle = Qt::Application.translate("TabWidget", "TabWidget", nil, Qt::Application::UnicodeUTF8)
    @treeWidget.headerItem.setText(0, Qt::Application.translate("TabWidget", "Folder", nil, Qt::Application::UnicodeUTF8))
    @treeWidget.headerItem.setText(1, Qt::Application.translate("TabWidget", "Size", nil, Qt::Application::UnicodeUTF8))
    tabWidget.setTabText(tabWidget.indexOf(@tab), Qt::Application.translate("TabWidget", "Tab 1", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def retranslate_ui(tabWidget)
        retranslateUi(tabWidget)
    end

end

module Ui
    class TabWidget < Ui_TabWidget
    end
end  # module Ui

