#tag WindowBegin Window wndAbout   BackColor       =   &hFFFFFF   Backdrop        =   ""   BalloonHelp     =   ""   CloseButton     =   "True"   Composite       =   "True"   Frame           =   0   FullScreen      =   "False"   HasBackColor    =   "False"   Height          =   300   ImplicitInstance=   "True"   LiveResize      =   "True"   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   "False"   MaxWidth        =   32000   MenuBar         =   ""   MenuBarVisible  =   "True"   MinHeight       =   64   MinimizeButton  =   "True"   MinWidth        =   64   Placement       =   2   Resizeable      =   "False"   Title           =   "Untitled"   Visible         =   "True"   Width           =   276   Begin Timer Timer1      Height          =   32      Index           =   -2147483648      InitialParent   =   ""      Left            =   366      Mode            =   2      Period          =   50      Scope           =   0      TabPanelIndex   =   0      Top             =   2      Width           =   32      BehaviorIndex   =   0   End   Begin Canvas cnvAboutText      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   ""      Enabled         =   True      EraseBackground =   "True"      Height          =   193      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   20      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      Top             =   87      UseFocusRing    =   "True"      Visible         =   True      Width           =   236      BehaviorIndex   =   1   End   Begin Canvas Canvas1      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   "True"      Backdrop        =   1638712966      Enabled         =   True      EraseBackground =   "True"      Height          =   64      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   106      LockBottom      =   ""      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   2      TabPanelIndex   =   0      Top             =   11      UseFocusRing    =   "False"      Visible         =   True      Width           =   64      BehaviorIndex   =   2   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Open()		  yScroll = cnvAboutText.height + 20		End Sub	#tag EndEvent#tag MenuHandler		Function FileClose() As Boolean Handles FileClose.Action			me.close			Return True					End Function#tag EndMenuHandler	#tag Property, Flags = &h0		yScroll As Integer = 0	#tag EndProperty	#tag Constant, Name = kAboutBoxContents, Type = String, Dynamic = True, Default = \"XAddonManager v${1} Copyright \xC2\xA92008 Austin Goudge (austin@goudges.com)\r\rMany thanks go to:\r\rSergio Santagada for allowing the icon to be based on his X-Plane\xC2\xAE icon artwork\r\rFabian for the Spanish translation\r\rOlivier Faivre for the French translation\r\rNicola Altafini for the Italian translation\r\rEp\xC3\xADleg for the Catalan translation\r\rspasm_dtc for the German translation\r\r\rThis software uses Thomas Tempelmann\'s Zip Package (www.tempel.org) and Kevin Ballard\'s XMLDictionary module (www.tildesoft.com)", Scope = Public	#tag EndConstant#tag EndWindowCode#tag Events Timer1	#tag Event		Sub Action()		  yScroll = yScroll - 1		  		  if yScroll <= -300 then		    yScroll = cnvAboutText.height + 20		  end if		  		  cnvAboutText.refresh		  		End Sub	#tag EndEvent#tag EndEvents#tag Events cnvAboutText	#tag Event		Sub Paint(g As Graphics)		  g.textSize = 9		  if Window(0) <> wndAbout then		    g.foreColor = &c888888		  end if		  		  dim parameters() as string = array(App.shortVersion)		  g.drawString(App.processParameterizedString(kAboutBoxContents, parameters), 0, yScroll, me.width)		End Sub	#tag EndEvent#tag EndEvents