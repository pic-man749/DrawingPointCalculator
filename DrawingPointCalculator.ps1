class DrawingPointCalculator{

    [int] $x = 0
    [int] $y = 0
    [int] $reservedX = 0
    [int] $reservedY = 0

    [int] $marginX = 0
    [int] $marginY = 0

    [array] $wrapperY = @()

    DrawingPointCalculator([int] $marginX, [int] $marginY){
        $this.marginX = $marginX
        $this.marginY = $marginY
        $this.x = $this.marginX
        $this.y = $this.marginY
        $this.reservedX = $this.x
        $this.reservedY = $this.y
    }

    [int] getX(){
        return $this.x
    }

    [int] getY(){
        return $this.y
    }

    [void] addObjV([int] $objW, [int] $objH){

        if($this.reservedX -lt ($this.x + $objW + $this.marginX)){
            $this.reservedX = $this.x + $objW + $this.marginX
        }
        if($this.reservedY -lt ($this.y + $objH + $this.marginY)){
            $this.reservedY = $this.y + $objH + $this.marginY
        }
        # $this.x = $this.x
        $this.y = $this.y + $objH + $this.marginY
    }

    [void] addObjH([int] $objW, [int] $objH){
        if($this.reservedX -lt ($this.x + $objW + $this.marginX)){
            $this.reservedX = $this.x + $objW + $this.marginX
        }
        if($this.reservedY -lt ($this.y + $objH + $this.marginY)){
            $this.reservedY = $this.y + $objH + $this.marginY
        }
        $this.x = $this.x + $objW + $this.marginX
        # $this.y = $this.y
    }

    [void] newLine(){
        $this.x = $this.marginX
        $this.y = $this.reservedY
    } 

    [void] beginWrapper(){
        $this.wrapperY += $this.y
    }

    [void] endWrapper(){
        [int] $len = $this.wrapperY.Length
        if($len -eq 0){
            throw "there is no Wrapper"
        }
        $this.x = $this.reservedX
        $this.y = $this.wrapperY[$len - 1]
        $this.wrapperY[0..($len - 2)]
    }
}