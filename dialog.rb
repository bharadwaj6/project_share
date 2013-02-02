=begin
** Form generated from reading ui file 'dialog.ui'
**
** Created: Mon Apr 16 23:21:16 2012
**      by: Qt User Interface Compiler version 4.6.1
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_Dialog
    attr_reader :verticalLayout
    attr_reader :tabWidget
    attr_reader :tab
    attr_reader :layoutWidget
    attr_reader :horizontalLayout
    attr_reader :label
    attr_reader :lineEdit
    attr_reader :layoutWidget1
    attr_reader :horizontalLayout_2
    attr_reader :label_2
    attr_reader :lineEdit_2
    attr_reader :layoutWidget2
    attr_reader :horizontalLayout_3
    attr_reader :pushButton
    attr_reader :pushButton_2
    attr_reader :tab_2
    attr_reader :verticalLayout_4
    attr_reader :verticalLayout_2
    attr_reader :label_3
    attr_reader :horizontalLayout_4
    attr_reader :lineEdit_3
    attr_reader :pushButton_3
    attr_reader :pushButton_7
    attr_reader :verticalLayout_3
    attr_reader :label_4
    attr_reader :treeWidget
    attr_reader :horizontalLayout_5
    attr_reader :lineEdit_4
    attr_reader :pushButton_4
    attr_reader :horizontalLayout_6
    attr_reader :horizontalSpacer
    attr_reader :pushButton_5
    attr_reader :pushButton_6
	attr_accessor :treeWidgetItem

    def setupUi(dialog)
    if dialog.objectName.nil?
        dialog.objectName = "dialog"
    end
    dialog.resize(529, 371)
    dialog.modal = true
    @verticalLayout = Qt::VBoxLayout.new(dialog)
    @verticalLayout.objectName = "verticalLayout"
    @tabWidget = Qt::TabWidget.new(dialog)
    @tabWidget.objectName = "tabWidget"
    @tab = Qt::Widget.new()
    @tab.objectName = "tab"
    @layoutWidget = Qt::Widget.new(@tab)
    @layoutWidget.objectName = "layoutWidget"
    @layoutWidget.geometry = Qt::Rect.new(30, 50, 321, 22)
    @horizontalLayout = Qt::HBoxLayout.new(@layoutWidget)
    @horizontalLayout.objectName = "horizontalLayout"
    @horizontalLayout.setContentsMargins(0, 0, 0, 0)
    @label = Qt::Label.new(@layoutWidget)
    @label.objectName = "label"
    @font = Qt::Font.new
    @font.family = "Tahoma"
    @font.pointSize = 10
    @label.font = @font

    @horizontalLayout.addWidget(@label)

    @lineEdit = Qt::LineEdit.new(@layoutWidget)
    @lineEdit.objectName = "lineEdit"

    @horizontalLayout.addWidget(@lineEdit)

    @layoutWidget1 = Qt::Widget.new(@tab)
    @layoutWidget1.objectName = "layoutWidget1"
    @layoutWidget1.geometry = Qt::Rect.new(30, 100, 321, 22)
    @horizontalLayout_2 = Qt::HBoxLayout.new(@layoutWidget1)
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @horizontalLayout_2.setContentsMargins(0, 0, 0, 0)
    @label_2 = Qt::Label.new(@layoutWidget1)
    @label_2.objectName = "label_2"
    @label_2.font = @font

    @horizontalLayout_2.addWidget(@label_2)

    @lineEdit_2 = Qt::LineEdit.new(@layoutWidget1)
    @lineEdit_2.objectName = "lineEdit_2"

    @horizontalLayout_2.addWidget(@lineEdit_2)
	contents = File.readlines('./userinfo.txt')
	if(contents[0]!=nil)
		@lineEdit.setText(contents[0].chomp!)
		@lineEdit_2.setText(contents[1].chomp!)
	end
    @layoutWidget2 = Qt::Widget.new(@tab)
    @layoutWidget2.objectName = "layoutWidget2"
    @layoutWidget2.geometry = Qt::Rect.new(170, 190, 158, 25)
    @horizontalLayout_3 = Qt::HBoxLayout.new(@layoutWidget2)
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @horizontalLayout_3.setContentsMargins(0, 0, 0, 0)
    @pushButton = Qt::PushButton.new(@layoutWidget2)
    @pushButton.objectName = "pushButton"

    @horizontalLayout_3.addWidget(@pushButton)

    @pushButton_2 = Qt::PushButton.new(@layoutWidget2)
    @pushButton_2.objectName = "pushButton_2"

    @horizontalLayout_3.addWidget(@pushButton_2)

    @tabWidget.addTab(@tab, Qt::Application.translate("Dialog", "UserSettings", nil, Qt::Application::UnicodeUTF8))
    @tab_2 = Qt::Widget.new()
    @tab_2.objectName = "tab_2"
    @verticalLayout_4 = Qt::VBoxLayout.new(@tab_2)
    @verticalLayout_4.objectName = "verticalLayout_4"
    @verticalLayout_2 = Qt::VBoxLayout.new()
    @verticalLayout_2.objectName = "verticalLayout_2"
    @label_3 = Qt::Label.new(@tab_2)
    @label_3.objectName = "label_3"

    @verticalLayout_2.addWidget(@label_3)

    @horizontalLayout_4 = Qt::HBoxLayout.new()
    @horizontalLayout_4.objectName = "horizontalLayout_4"
    @lineEdit_3 = Qt::LineEdit.new(@tab_2)
    @lineEdit_3.objectName = "lineEdit_3"

    @horizontalLayout_4.addWidget(@lineEdit_3)

    @pushButton_3 = Qt::PushButton.new(@tab_2)
    @pushButton_3.objectName = "pushButton_3"

    @horizontalLayout_4.addWidget(@pushButton_3)

    @pushButton_7 = Qt::PushButton.new(@tab_2)
    @pushButton_7.objectName = "pushButton_7"

    @horizontalLayout_4.addWidget(@pushButton_7)


    @verticalLayout_2.addLayout(@horizontalLayout_4)


    @verticalLayout_4.addLayout(@verticalLayout_2)

    @verticalLayout_3 = Qt::VBoxLayout.new()
    @verticalLayout_3.objectName = "verticalLayout_3"
    @label_4 = Qt::Label.new(@tab_2)
    @label_4.objectName = "label_4"

    @verticalLayout_3.addWidget(@label_4)

    @treeWidget = Qt::TreeWidget.new(@tab_2)
    @treeWidget.objectName = "treeWidget"

    @verticalLayout_3.addWidget(@treeWidget)
	p filecontents = File.readlines('./files.text')
	
	if(filecontents[0]!=nil)
	i=0
	filecontents.each do |path|
	test= path.chomp!
	@treeWidgetItem = Qt::TreeWidgetItem.new(@treeWidget)
	@treeWidgetItem.setText(0,File.basename(path))
	@treeWidgetItem.setText(1,path)
	@treeWidget.addTopLevelItem(@treeWidgetItem)
	#Dir["#{path.chomp!}/*"]
	
	dirContents = Dir["#{test}/*"]
		dirContents.each do |some|
			#file.puts(some)
			addChildren(@treeWidgetItem,some)
			end	
	end
	end
    @horizontalLayout_5 = Qt::HBoxLayout.new()
    @horizontalLayout_5.objectName = "horizontalLayout_5"
    @lineEdit_4 = Qt::LineEdit.new(@tab_2)
    @lineEdit_4.objectName = "lineEdit_4"

    @horizontalLayout_5.addWidget(@lineEdit_4)

    @pushButton_4 = Qt::PushButton.new(@tab_2)
    @pushButton_4.objectName = "pushButton_4"

    @horizontalLayout_5.addWidget(@pushButton_4)


    @verticalLayout_3.addLayout(@horizontalLayout_5)


    @verticalLayout_4.addLayout(@verticalLayout_3)

    @horizontalLayout_6 = Qt::HBoxLayout.new()
    @horizontalLayout_6.objectName = "horizontalLayout_6"
    @horizontalSpacer = Qt::SpacerItem.new(40, 20, Qt::SizePolicy::Expanding, Qt::SizePolicy::Minimum)

    @horizontalLayout_6.addItem(@horizontalSpacer)

    @pushButton_5 = Qt::PushButton.new(@tab_2)
    @pushButton_5.objectName = "pushButton_5"

    @horizontalLayout_6.addWidget(@pushButton_5)

    @pushButton_6 = Qt::PushButton.new(@tab_2)
    @pushButton_6.objectName = "pushButton_6"

    @horizontalLayout_6.addWidget(@pushButton_6)


    @verticalLayout_4.addLayout(@horizontalLayout_6)

    @tabWidget.addTab(@tab_2, Qt::Application.translate("Dialog", "Download Settings", nil, Qt::Application::UnicodeUTF8))

    @verticalLayout.addWidget(@tabWidget)


    retranslateUi(dialog)
    Qt::Object.connect(@pushButton_2, SIGNAL('clicked()'), dialog, SLOT('reject()'))
    Qt::Object.connect(@pushButton_6, SIGNAL('clicked()'), dialog, SLOT('reject()'))
    Qt::Object.connect(@pushButton, SIGNAL('clicked()'), dialog, SLOT('accept()'))

    @tabWidget.setCurrentIndex(0)


    Qt::MetaObject.connectSlotsByName(dialog)
    end # setupUi
	
	def addChildren(item,path)
	child = Qt::TreeWidgetItem.new()
	child.setText(0,File.basename(path))
	child.setText(1,path)
	if(File.directory?(path)) then
	dirContents = Dir["#{path}/*"]
	item.addChild(child)
	dirContents.each do |some|
		
		addChildren(child,some)
	end
	else		
	item.addChild(child)			
	end
	end
    def setup_ui(dialog)
        setupUi(dialog)
    end

    def retranslateUi(dialog)
    dialog.windowTitle = Qt::Application.translate("Dialog", "Preferences", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("Dialog", "Name", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("Dialog", "Email Address", nil, Qt::Application::UnicodeUTF8)
    @pushButton.text = Qt::Application.translate("Dialog", "Save", nil, Qt::Application::UnicodeUTF8)
    @pushButton_2.text = Qt::Application.translate("Dialog", "Cancel", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab), Qt::Application.translate("Dialog", "UserSettings", nil, Qt::Application::UnicodeUTF8))
    @label_3.text = Qt::Application.translate("Dialog", "Select Folders to Share", nil, Qt::Application::UnicodeUTF8)
    @pushButton_3.text = Qt::Application.translate("Dialog", "Browse", nil, Qt::Application::UnicodeUTF8)
    @pushButton_7.text = Qt::Application.translate("Dialog", "Add", nil, Qt::Application::UnicodeUTF8)
    @label_4.text = Qt::Application.translate("Dialog", "Select Default Download location", nil, Qt::Application::UnicodeUTF8)
    @treeWidget.headerItem.setText(0, Qt::Application.translate("Dialog", "Folder", nil, Qt::Application::UnicodeUTF8))
    @treeWidget.headerItem.setText(1, Qt::Application.translate("Dialog", "Path", nil, Qt::Application::UnicodeUTF8))
    @treeWidget.headerItem.setText(2, Qt::Application.translate("Dialog", "Size", nil, Qt::Application::UnicodeUTF8))
    @pushButton_4.text = Qt::Application.translate("Dialog", "Browse", nil, Qt::Application::UnicodeUTF8)
    @pushButton_5.text = Qt::Application.translate("Dialog", "Save", nil, Qt::Application::UnicodeUTF8)
    @pushButton_6.text = Qt::Application.translate("Dialog", "Cancel", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@tab_2), Qt::Application.translate("Dialog", "Download Settings", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def retranslate_ui(dialog)
        retranslateUi(dialog)
    end

end

module Ui
    class Dialog < Ui_Dialog
    end
end  # module Ui

