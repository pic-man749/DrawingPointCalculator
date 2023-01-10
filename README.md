# DrawingPointCalculator

Powershell用オブジェクト座標管理クラス。.NET Frameworkを使ったWindowsフォームアプリケーションをPowershellで作る場合を想定して座標管理を簡易化します。

# 使い方

## include, initialize

`.`で`DrawingPointCalculator.ps1`を読み込ませてください。コンストラクタにはx, y方向のマージンを指定してください。

```
.".\DrawingPointCalculator.ps1"

[int] $margin = 10

$dpc = New-Object DrawingPointCalculator($margin, $margin)
```

## 座標取得

`getX()`, `getY()`で次にオブジェクトを設置する座標を取得できます。


## オブジェクト追加

オブジェクトの追加方法は2種類あります。引数はそれぞれ追加したオブジェクトのwidth, heightです。

- addObjV(w, h)：垂直方向へオブジェクトを追加する
- addObjH(w, h)：水平方向にオブジェクトを追加する

`addObjH()`で水平方向にオブジェクトを追加した場合、`newLine()`を呼ぶことで改行できます。

## wrapper

`beginWrapper()`でラッパーを設置すると、その地点のY座標が記録されます。
`endWrapper()`を呼ぶと記録したY座標に戻ります。その際、X座標は`すでにオブジェクトが設置されているX座標の最大値 + $marginX`となります。

また、Wrapperは入れ子構造（beginWrapper()を呼んだ後、endWrapper()を呼ばすにbeginWrapper()を再度呼ぶ）にすることが可能です。

# 概念図

```
┌────────────────────────────────────────────────────► X
│                ▲
│                │ marginY
│  (x, y)        ▼
│     ┌───────────────────────────┐    .
│◄───►│                        ▲  │    ▲
│  ▲  │                  height│  │    │
│  │  │◄───────────────────────┼─►│    │
│  │  │   width                │  │  after addObjH(w, h)
│  │  │                        ▼  │
│  │  └───────────────────────────┘
│  └─ marginX
│
│     .                                .
│     ▲                     (reservedX, reservedY)
│     │
│     │
│    after addObjV(w, h)
│
▼
Y




┌────────────────────────────────────────────────────► X
│
│
│   beginWrapper()
│       ┌───────┐               . ◄───────┐
│       │       │                         │
│       │       │                         │
│       │       │                         │
│       └───────┘                      after endWrapper()
│
│
│       ┌─────────────┐
│       │             │
│       │             │
│       │             │
│       └─────────────┘
│
│
│       ┌───────────────────┐
│       │                   │
│       │                   │
│       │                   │
│       └───────────────────┘
│   endWrapper()
│
▼
Y
```
