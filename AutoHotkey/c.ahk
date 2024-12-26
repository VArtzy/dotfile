SetTimer(CenterRunDialog, 100)
CenterRunDialog() {
RunDialog := WinExist("ahk_class #32770")
if RunDialog {
WinMove(475, 270, 415, 210, RunDialog)
}
}