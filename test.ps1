Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

.".\DrawingPointCalculator.ps1"

$form = New-Object System.Windows.Forms.Form -Property @{
    Size = New-Object System.Drawing.Size(1200, 400)
    Font = New-Object Drawing.Font('Meiryo UI', 12)
    Text = "DrawingPointCalculator test"
}

############################################################
# 1. basic usage(vertically add)
############################################################

# init(x,y margin = 10)
$dpc = New-Object DrawingPointCalculator(10, 10)

$title = New-Object System.Windows.Forms.Label -Property @{
    # get location point
    Location = New-Object System.Drawing.Point($dpc.getX(), $dpc.getY())
    Font = New-Object Drawing.Font('Meiryo UI', 16)
    Text = "This is title label"
    AutoSize = $true
}
$form.Controls.Add($title)
$dpc.addObjV($title.Width, $title.Height)   # add objects vertically

############################################################
# 2. horizontally add
############################################################

$button1 = New-Object System.Windows.Forms.Button -Property @{
    Location = New-Object Drawing.Point($dpc.getX(), $dpc.getY())
    Text = "button1"
    AutoSize = $true
}
$form.Controls.Add($button1)
$dpc.addObjH($button1.Width, $button1.Height)   # add objects horizontally

$button2 = New-Object System.Windows.Forms.Button -Property @{
    Location = New-Object Drawing.Point($dpc.getX(), $dpc.getY())
    Text = "button2"
    AutoSize = $true
}
$form.Controls.Add($button2)
$dpc.addObjH($button2.Width, $button2.Height)

$button3 = New-Object System.Windows.Forms.Button -Property @{
    Location = New-Object Drawing.Point($dpc.getX(), $dpc.getY())
    Text = "button3"
    AutoSize = $true
}
$form.Controls.Add($button3)
$dpc.addObjH($button3.Width, $button3.Height)

$dpc.newLine()  # new line

############################################################
# 3. Wrapper
############################################################

$dpc.beginWrapper() # set wrapper

$textbox1 = New-Object System.Windows.Forms.TextBox -Property @{
    Location = New-Object Drawing.Point($dpc.getX(), $dpc.getY())
    Width = 500
}
$form.Controls.Add($textbox1)
$dpc.addObjV($textbox1.Width, $textbox1.Height)

$textbox2 = New-Object System.Windows.Forms.TextBox -Property @{
    Location = New-Object Drawing.Point($dpc.getX(), $dpc.getY())
    Width = 500
}
$form.Controls.Add($textbox2)
$dpc.addObjV($textbox2.Width, $textbox2.Height)

$textbox3 = New-Object System.Windows.Forms.TextBox -Property @{
    Location = New-Object Drawing.Point($dpc.getX(), $dpc.getY())
    Width = 500
}
$form.Controls.Add($textbox3)
$dpc.addObjV($textbox3.Width, $textbox3.Height)

$dpc.endWrapper() # end wrapper

$textbox4 = New-Object System.Windows.Forms.TextBox -Property @{
    Location = New-Object Drawing.Point($dpc.getX(), $dpc.getY())
    Multiline = $true
    Width = 500
    Height = 150
}
$form.Controls.Add($textbox4)
$dpc.addObjV($textbox4.Width, $textbox4.Height)

$dpc.newLine()

$label1 = New-Object System.Windows.Forms.Label -Property @{
    # get location point
    Location = New-Object System.Drawing.Point($dpc.getX(), $dpc.getY())
    Text = "text text text text text text text text text text text text text text text text"
    AutoSize = $true
}
$form.Controls.Add($label1)
$dpc.addObjV($label1.Width, $label1.Height)   # add objects vertically

# show
$form.Add_Shown({$form.Activate()})
$form.ShowDialog()