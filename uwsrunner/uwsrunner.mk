##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=uwsrunner
ConfigurationName      :=Debug
WorkspacePath          :=/home/al/Documents/WebSocketTest
ProjectPath            :=/home/al/Documents/WebSocketTest/uwsrunner
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Al
Date                   :=22/05/17
CodeLitePath           :=/home/al/.codelite
LinkerName             :=/usr/bin/g++
SharedObjectLinkerName :=/usr/bin/g++ -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="uwsrunner.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -luWS -lpthread -luWS -lssl -lcrypto -lz  -lsqlite3
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)/usr/include/ $(IncludeSwitch)/usr/include/uWs/ $(IncludeSwitch)/home/al/repos/JsonBox/include/ 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -g -O0 -std=c++14 -std=c++11 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Convert.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Escaper.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_IndentCanceller.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Indenter.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonParsingError.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonWritingError.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_SolidusEscaper.cpp$(ObjectSuffix) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Value.cpp$(ObjectSuffix) $(IntermediateDirectory)/SQL.cpp$(ObjectSuffix) \
	



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main.cpp$(ObjectSuffix): main.cpp $(IntermediateDirectory)/main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/al/Documents/WebSocketTest/uwsrunner/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.cpp$(DependSuffix): main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/main.cpp$(DependSuffix) -MM main.cpp

$(IntermediateDirectory)/main.cpp$(PreprocessSuffix): main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.cpp$(PreprocessSuffix) main.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Convert.cpp$(ObjectSuffix): ../../../repos/JsonBox/src/Convert.cpp $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Convert.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/al/repos/JsonBox/src/Convert.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Convert.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Convert.cpp$(DependSuffix): ../../../repos/JsonBox/src/Convert.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Convert.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Convert.cpp$(DependSuffix) -MM ../../../repos/JsonBox/src/Convert.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Convert.cpp$(PreprocessSuffix): ../../../repos/JsonBox/src/Convert.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Convert.cpp$(PreprocessSuffix) ../../../repos/JsonBox/src/Convert.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Escaper.cpp$(ObjectSuffix): ../../../repos/JsonBox/src/Escaper.cpp $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Escaper.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/al/repos/JsonBox/src/Escaper.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Escaper.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Escaper.cpp$(DependSuffix): ../../../repos/JsonBox/src/Escaper.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Escaper.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Escaper.cpp$(DependSuffix) -MM ../../../repos/JsonBox/src/Escaper.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Escaper.cpp$(PreprocessSuffix): ../../../repos/JsonBox/src/Escaper.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Escaper.cpp$(PreprocessSuffix) ../../../repos/JsonBox/src/Escaper.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_IndentCanceller.cpp$(ObjectSuffix): ../../../repos/JsonBox/src/IndentCanceller.cpp $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_IndentCanceller.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/al/repos/JsonBox/src/IndentCanceller.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_IndentCanceller.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_IndentCanceller.cpp$(DependSuffix): ../../../repos/JsonBox/src/IndentCanceller.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_IndentCanceller.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_IndentCanceller.cpp$(DependSuffix) -MM ../../../repos/JsonBox/src/IndentCanceller.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_IndentCanceller.cpp$(PreprocessSuffix): ../../../repos/JsonBox/src/IndentCanceller.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_IndentCanceller.cpp$(PreprocessSuffix) ../../../repos/JsonBox/src/IndentCanceller.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Indenter.cpp$(ObjectSuffix): ../../../repos/JsonBox/src/Indenter.cpp $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Indenter.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/al/repos/JsonBox/src/Indenter.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Indenter.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Indenter.cpp$(DependSuffix): ../../../repos/JsonBox/src/Indenter.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Indenter.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Indenter.cpp$(DependSuffix) -MM ../../../repos/JsonBox/src/Indenter.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Indenter.cpp$(PreprocessSuffix): ../../../repos/JsonBox/src/Indenter.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Indenter.cpp$(PreprocessSuffix) ../../../repos/JsonBox/src/Indenter.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonParsingError.cpp$(ObjectSuffix): ../../../repos/JsonBox/src/JsonParsingError.cpp $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonParsingError.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/al/repos/JsonBox/src/JsonParsingError.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonParsingError.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonParsingError.cpp$(DependSuffix): ../../../repos/JsonBox/src/JsonParsingError.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonParsingError.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonParsingError.cpp$(DependSuffix) -MM ../../../repos/JsonBox/src/JsonParsingError.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonParsingError.cpp$(PreprocessSuffix): ../../../repos/JsonBox/src/JsonParsingError.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonParsingError.cpp$(PreprocessSuffix) ../../../repos/JsonBox/src/JsonParsingError.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonWritingError.cpp$(ObjectSuffix): ../../../repos/JsonBox/src/JsonWritingError.cpp $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonWritingError.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/al/repos/JsonBox/src/JsonWritingError.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonWritingError.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonWritingError.cpp$(DependSuffix): ../../../repos/JsonBox/src/JsonWritingError.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonWritingError.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonWritingError.cpp$(DependSuffix) -MM ../../../repos/JsonBox/src/JsonWritingError.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonWritingError.cpp$(PreprocessSuffix): ../../../repos/JsonBox/src/JsonWritingError.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_JsonWritingError.cpp$(PreprocessSuffix) ../../../repos/JsonBox/src/JsonWritingError.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_SolidusEscaper.cpp$(ObjectSuffix): ../../../repos/JsonBox/src/SolidusEscaper.cpp $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_SolidusEscaper.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/al/repos/JsonBox/src/SolidusEscaper.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_SolidusEscaper.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_SolidusEscaper.cpp$(DependSuffix): ../../../repos/JsonBox/src/SolidusEscaper.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_SolidusEscaper.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_SolidusEscaper.cpp$(DependSuffix) -MM ../../../repos/JsonBox/src/SolidusEscaper.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_SolidusEscaper.cpp$(PreprocessSuffix): ../../../repos/JsonBox/src/SolidusEscaper.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_SolidusEscaper.cpp$(PreprocessSuffix) ../../../repos/JsonBox/src/SolidusEscaper.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Value.cpp$(ObjectSuffix): ../../../repos/JsonBox/src/Value.cpp $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Value.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/al/repos/JsonBox/src/Value.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Value.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Value.cpp$(DependSuffix): ../../../repos/JsonBox/src/Value.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Value.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Value.cpp$(DependSuffix) -MM ../../../repos/JsonBox/src/Value.cpp

$(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Value.cpp$(PreprocessSuffix): ../../../repos/JsonBox/src/Value.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/up_up_up_repos_JsonBox_src_Value.cpp$(PreprocessSuffix) ../../../repos/JsonBox/src/Value.cpp

$(IntermediateDirectory)/SQL.cpp$(ObjectSuffix): SQL.cpp $(IntermediateDirectory)/SQL.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/al/Documents/WebSocketTest/uwsrunner/SQL.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/SQL.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/SQL.cpp$(DependSuffix): SQL.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/SQL.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/SQL.cpp$(DependSuffix) -MM SQL.cpp

$(IntermediateDirectory)/SQL.cpp$(PreprocessSuffix): SQL.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/SQL.cpp$(PreprocessSuffix) SQL.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


