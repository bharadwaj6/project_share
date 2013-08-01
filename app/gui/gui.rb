require 'rubygems'
require 'qt4' 
require 'mainwindow.rb'
require 'dialog.rb'
require 'FileUtils'
require 'peer.rb'

class Gui < Qt::MainWindow
	attr_accessor :gui_Uname, :gui_Email, :globalpos, :menu, :actCustom1, :testtab,:actCustom2, :item, :treeWidget, :layout, :peer, :test
	$i=0 		# a Global variable for testing purposes
	slots 'on_actionSettings_triggered(),','closeTab(int)','ShowPopUP(QPoint)','addObject()','addchat()'		# prototype of Event Listeners

	def initialize 
		super
		@ui = Ui::MainWindow.new
		@ui.setup_ui(self)
		@peer = Peer.new
		Qt::Object.connect(@ui.tabWidget,SIGNAL('tabCloseRequested(int)'),self,SLOT('closeTab(int)'))
		@ui.treeWidget.setContextMenuPolicy(Qt::CustomContextMenu)
		Qt::Object.connect(@ui.treeWidget, SIGNAL( 'customContextMenuRequested(QPoint)'),self, SLOT('ShowPopUP(QPoint)'))
		Qt::Object.connect(@ui.actionPreferences, SIGNAL('triggered()'),self, SLOT('on_actionSettings_triggered()')) 	#This Signals an event 
		Qt::Object.connect(@ui.actionExit, SIGNAL('triggered()'),self, SLOT('close()'))
		@ui.tabWidget.removeTab(1)
	end
	
	def closeTab(int)
		if(int!=0) then
		@ui.tabWidget.removeTab(int)
		end
	end
	def add_peer(test)
	item = Qt::TreeWidgetItem.new(@ui.treeWidget)
	  ctr = 0                                        #ip, email, uname, guid

        test.each("\n") do |part|
                if (ctr == 0) then
					part.chomp!
					item.setText(3,part)
                elsif (ctr == 1) then
					part.chomp!
					item.setText(1,part)
                elsif (ctr == 2) then
					part.chomp!
					item.setText(0,part)
                elsif (ctr == 3) then
					part.chomp!	
					item.setText(2,part)
                end
                ctr = ctr+1
        end
		@ui.treeWidget.addTopLevelItem(item)
	end
	def ShowPopUP(point)
	#puts "in func"
	#@globalpos = Qt::Point.new
	@item = @ui.treeWidget.itemAt(point)
	if (!@item) then
	else
	
	#@globalpos = @ui.treeWidget.viewport.mapToGlobal(point)
	@menu = Qt::Menu.new(@ui.treeWidget)
	@actCustom1 = Qt::Action.new("Get File List", @menu)
	Qt::Object.connect(@actCustom1, SIGNAL('triggered()'), self, SLOT('addObject()'))
	@actCustom2 = Qt::Action.new("Send Private Message",@menu)
	Qt::Object.connect(@actCustom2, SIGNAL('triggered()'), self, SLOT('addchat()'))
	@menu.addAction(@actCustom1)
	@menu.addAction(@actCustom2)
	selecteditem = menu.exec(@ui.treeWidget.viewport.mapToGlobal(point))

	end
	end
	def invoke(msg)
	@peer.invoke(msg)
	end
	def addObject
	
	#invoke("get file list")
	log("#{Time.now}: You are trying to download from yourself")
	
	invoke("get file list\n#{@item.text(3)}")
	count= @ui.tabWidget.count
	test = []
	temp = 0
	while (count!=0) 
	test << @ui.tabWidget.tabText(count-1)	
	if(@ui.tabWidget.tabText(count)=="#{@item.text(0)}-File List") then
	temp = count
	end
	count=count-1
	end
	
	if(test.include?("#{@item.text(0)}-File List")) then
	puts "in object1"
	@ui.tabWidget.setCurrentIndex(temp)
	else
	@testtab = 	@ui.tab_2.new()	
	#puts "in else object1"	
	@treeWidget = @ui.treeWidget_4.new(@testtab)
	@treeWidget.setColumnCount(2)
	@treeWidget.headerItem.setText(0,"File/Folder")
    @treeWidget.headerItem.setText(1,"Path")
	@treeWidget.headerItem.setText(2,"size")
	@layout = Qt::VBoxLayout.new(@testtab)
	@layout.addWidget(@treeWidget)
	@ui.tabWidget.addTab(@testtab, Qt::Application.translate("MainWindow", "#{@item.text(0)}-File List", nil, Qt::Application::UnicodeUTF8))

	end
	
	end
		def add(dirs,files,file,fileitem,basenames)
		if dirs.include?(file) then
		files.each_with_index do |item,index|
		#puts "#{item} and its index #{index}"
		if (dirs[index] == file) then
		#fileitem2 = "something"
		fileitem2 = Qt::TreeWidgetItem.new(fileitem)
		fileitem2.setText(0,basenames[index])
		fileitem2.setText(1,files[index])
		fileitem.addChild(fileitem2)
		add(dirs,files,item,fileitem2,basenames) 
		end
		end
	end
	end	
	def notify
	puts "in notify"
	contents1 = File.read("./#{@item.text(0)}-filesandfolders.txt")
	contents2 = File.readlines("./#{@item.text(0)}-files.text")
 	if(contents2.nil?) then
	else
	files = []
	dirs = []
	basenames = []
	ctr = 0
	contents1.each("\n") do |line|
	
		line.each("\n"){|name|	
		#p name.chomp!
		if(ctr%5 == 2) then 
		dirs << name.chomp!
		
		elsif(ctr%5 == 4)then
		basenames << name.chomp!
		
		elsif(ctr%5 == 0) then
		files << name.chomp!
		end
		ctr =ctr+1
		}
	
	end
	p contents2
	arr = []
	
	contents2.each do |part| 	#user selected folders
		arr << part.chomp!
		end
		p arr
	#	sub = []
	arr.each do |part| 	
	test1 = Qt::TreeWidgetItem.new(@treeWidget)
	test1.setText(0,part) 		#created top level items for those folders
	@treeWidget.addTopLevelItem(test1)	
		add(dirs,files,part,test1,basenames) 



	end
	end
	
	
	end
	def addchat
	if(@item.text(0)==@peer.get_name) then 
	log("#{Time.now}: You are trying to Chat with yourself")
	else
	invoke("start chat")
	puts "in object1"
	count= @ui.tabWidget.count
	test = []
	temp = 0
	while (count!=0) 
	p test << @ui.tabWidget.tabText(count-1)	
	if(@ui.tabWidget.tabText(count)=="#{@item.text(0)}-chat") then
	temp = count
	end
	count=count-1
	end
	puts "in object1"
	if(test.include?("#{@item.text(0)}-chat")) then
	@ui.tabWidget.setCurrentIndex(temp)
	else
	@testtab = Qt::Widget.new(@ui.tabWidget)
	@ui.tabWidget.addTab(@testtab, Qt::Application.translate("MainWindow", "#{@item.text(0)}-chat", nil, Qt::Application::UnicodeUTF8))
	@ui.tabWidget.setCurrentIndex(@ui.tabWidget.indexOf(@testtab))
	p @ui.tabWidget.children
	end
	end
	end
	def on_actionSettings_triggered()
		pref = PreferenceDialog.new(self) 	#shows the preference dialog
		pref.setModal(true)		
		pref.exec
		p @gui_Uname=pref.username
		p @gui_Email=pref.email
		log("#{Time.now} :#{pref.message}")
		notify_change
		$i=$i+1		
		puts "test#{$i}" 		# command line output for testing purposes
	end
	def notify_change
		puts "change has occoured"
	end		
	def log(text)
	@ui.textBrowser.append(text)		#prints the text into log
	end
	
end



class PreferenceDialog < Qt::Dialog
	slots 'Save_clicked()','browse1_clicked()','browse2_clicked()','Add_clicked()','Test(QPoint)'
	
	attr_accessor :username
	attr_accessor :email
	attr_accessor :message 
	attr_accessor :menu 
	@message = "Click 'Save' to save the Settings\nnow restart the application"
	
	def initialize (parent=nil)
		super(parent)
		@ui = Ui::Dialog.new			# creates Preferences Dialog
		@ui.setup_ui(self)
		p @message
		@ui.treeWidget.setContextMenuPolicy(Qt::CustomContextMenu)
		Qt::Object.connect(@ui.treeWidget, SIGNAL( 'customContextMenuRequested(QPoint)'),self, SLOT('Test(QPoint)'))
		Qt::Object.connect(@ui.pushButton, SIGNAL('clicked()'),self, SLOT('Save_clicked()'))
		Qt::Object.connect(@ui.pushButton_7, SIGNAL('clicked()'),self, SLOT('Add_clicked()'))
		Qt::Object.connect(@ui.pushButton_3, SIGNAL('clicked()'), self, SLOT('browse1_clicked()')) 
		Qt::Object.connect(@ui.pushButton_4, SIGNAL('clicked()'), self, SLOT('browse2_clicked()')) 
		self.show
	end
		def Test(point)
	#puts "in func"
	#@globalpos = Qt::Point.new
	item = @ui.treeWidget.itemAt(point)
	#item.removeItemWidget()
	if (!item) then
	else
	
	#@globalpos = @ui.treeWidget.viewport.mapToGlobal(point)
	@menu = Qt::Menu.new(@ui.treeWidget)
	@actCustom1 = Qt::Action.new("Delete", @menu)
	#@actCustom2 = Qt::Action.new("Send Private Message",@menu)
	@menu.addAction(@actCustom1)
	#@menu.addAction(@actCustom2)
	selecteditem = @menu.exec(@ui.treeWidget.viewport.mapToGlobal(point))
	if(selecteditem) then
	#@ui.treeWidget.removeItemWidget(item)
	#@testtab = Qt::Widget.new(@ui.tabWidget)
	#@ui.tabWidget.addTab(@testtab, Qt::Application.translate("MainWindow", "test", nil, Qt::Application::UnicodeUTF8))
	
	#Qt::Object.connect(actCustom, SIGNAL('triggered()'), self, SLOT('addObject()'))
	end
	end
	end
	def Add_clicked()
		if (@ui.lineEdit_3.text !="" && File.directory?(@ui.lineEdit_3.text)) then
			files =[]
			dirs = []
			path = @ui.lineEdit_3.text
			#dir = Qt::Dir.new(path)
			file = File.new('./filelistinfo.txt', 'a+')
			mainfiles = File.readlines('./files.text')
			childfiles = File.readlines('./filelistinfo.txt')
			file1 = File.new('./files.text','a+')
			file2 = File.new('./filesandfolders.txt','a+')
			if (mainfiles.include?("#{path}\n") || childfiles.include?("#{path}\n")) then
			@ui.lineEdit_3.setText("")
			puts "in if"
			else
			puts "in else"
			item = Qt::TreeWidgetItem.new(@ui.treeWidget)
			p dirContents = Dir["#{path}/*"]
			p path
			item.setText(0,File.basename(path))
			item.setText(1,path)
			@ui.treeWidget.addTopLevelItem(item)			
			file.puts(path)
			file1.puts(path)			
			dirContents.each do |some|
			if (childfiles.include?("#{some}\n")) then
			else			
			file.puts(some)
			file2.puts("#{some}\nPARENT\n#{File.dirname(some)}\nBASENAME\n#{File.basename(some)}")
			addChildren(item,some,file,file2)
			end
			end			
			@ui.lineEdit_3.setText("")
			file.close
			file1.close
		#	puts dirs
		#	puts files
			end
		end
	end
	def addChildren(item,path,file,file2)
	child = Qt::TreeWidgetItem.new()
	child.setText(0,File.basename(path))
	child.setText(1,path)
	if(File.directory?(path)) then
	#dirs << path
	dirContents = Dir["#{path}/*"]
	item.addChild(child)
	dirContents.each do |some|
	file2.puts("#{some}\nPARENT\n#{File.dirname(some)}\nBASENAME\n#{File.basename(some)}")
		file.puts(some)
		addChildren(child,some,file,file2)
			end	
	else
	#puts "its a dir"
	#else
	#file2.puts("#{path}\nPARENT\n#{File.dirname(path)}\nBASENAME\n#{File.basename(path)}")
	#file.puts(path)
	
	item.addChild(child)
	end
	end
	#child.setText(0,File.basename(path))
	#child.setText(1,path)
	#item.addChild(child)
	
	#Dir.glob(){ |folder| child.setText(0,File.basename(folder)) item.addChild(child) }
	#end
	def Save_clicked()
		@username = @ui.lineEdit.text 
		@email = @ui.lineEdit_2.text
		file = File.new('./userinfo.txt', 'w')
		
		file.puts(@username)
		file.puts(@email)
		peer = Peer.new
		peer.set_name(@username)
		peer.set_email(@email)	
		@message = "Settings have been saved\n now restart the application to continue with the username"
		file.close
	end
	
	
	def browse1_clicked()
	path =  Qt::FileDialog::getExistingDirectory(self, tr("Choose Directory"),"C:\\", Qt::FileDialog::ShowDirsOnly| Qt::FileDialog::DontResolveSymlinks)
	@ui.lineEdit_3.setText(path)
	end
	def browse2_clicked()
	path =  Qt::FileDialog::getExistingDirectory(self, tr("Choose Directory"),"C:\\", Qt::FileDialog::ShowDirsOnly| Qt::FileDialog::DontResolveSymlinks)
	@ui.lineEdit_4.setText(path)
	end
		
	
end
